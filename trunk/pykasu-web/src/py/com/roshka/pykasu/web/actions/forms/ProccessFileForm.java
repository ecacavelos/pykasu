package py.com.roshka.pykasu.web.actions.forms;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.ContextFactory;
import org.mozilla.javascript.Scriptable;

import py.com.roshka.pykasu.exceptions.PykasuParsingException;
import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.persistence.forms.GenericForm;
import py.com.roshka.pykasu.ui.form.Cell;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;
import py.com.roshka.pykasu.ui.form.Trigger;
import py.com.roshka.pykasu.web.forms.UploadForm;


/**
 * 
 * @author Pablo
 *
 * @struts.action
 * 		path = "/proccessfileform"
 * 		name = "UploadForm"
 * 
 * @struts.action-forward
 *     name = "success"
 *     path = "/uploadFileForm.jsp?" 			
 *
 *
 */
public class ProccessFileForm extends Action {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(ProccessFileForm.class);
	
	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		UploadForm myForm = (UploadForm)form;
        FormFile myFile = myForm.getTheFile();
        String contentType = myFile.getContentType();
        String fileName    = myFile.getFileName();
        int fileSize       = myFile.getFileSize();

        logger.debug("contentType: " + contentType);
        logger.debug("File Name: " + fileName);
        logger.debug("File Size: " + fileSize);

        InitialContext ic = new InitialContext();

        SimpleForm simpleForm = 
        	py.com.roshka.pykasu.xml.Parser.parseUploadFileForm(myFile.getInputStream());

        try{
        	saveFile(myFile.getInputStream(), new File(getFileName(myFile.getFileName())));
        }catch(IOException e){
        	logger.error("Error al guardar el archivo " + fileName,e);
        }
        
        simpleForm.setXmlFile(getFileName(myFile.getFileName()));
        
        logger.debug("Try to load simple form \n" + simpleForm);

        logger.debug("Getting Form Manager");
        FormManager formManager = (FormManager) ic.lookup("pykasu/FormManager/local");
        
        logger.debug("Getting Generic Form");
        GenericFormManager genericForm = formManager.getFormManager(simpleForm.getId());
    	

    	Form emptyForm = genericForm.getEmptyForm();
    	    	
    	StringBuffer sb = new StringBuffer();
    	//logger.debug(simpleForm);
    	for(Cell c : emptyForm.getCells()){
    		if(simpleForm.getCell(c.getId())!=null){
    			sb.append("var "+c.getId() +" = "+ simpleForm.getCell(c.getId()).getData().toString() +"; \n");
    		}else if(!c.isOpaque()){
    			sb.append("var "+c.getId() +" = 0; \n");
    		}
    	}
    	
    	
    	simpleForm.setTriggers(emptyForm.getTriggers());
    	
    	
    	
    	//Trigger trigger = (Trigger) simpleForm.getTriggers().get("TRGS1L1");    	
    //	String s = "var c19="+simpleForm.getCell("C19").getData().toString()+"; var c10="+simpleForm.getCell("C10").getData().toString()+"; "+ trigger.getCell() + " - " + trigger.getFormula() + " == 0";

    	Context cx = Context.enter();
         try {
        	 Scriptable scope = cx.initStandardObjects();
        	 cx.evaluateString(scope, sb.toString(), "<cmd>", 1, null);        	 
        	 logger.debug("RHINO >>>>>>>>>>" + sb.toString());
        	 
             String s = "";
             //Collection<Trigger> trigges = (Collection<Trigger>) simpleForm.getTriggers().values();
             
             List <Trigger>triggers = new ArrayList<Trigger>();
             triggers.addAll((Collection<Trigger>) simpleForm.getTriggers().values());
             Collections.sort(triggers);
             
             for(Trigger trigger : triggers){
            	 s =  "Math.abs(" +trigger.getCell() + " - (" + trigger.getFormula() + ")) < 1;";
            	 
            	 if(trigger.getCondition()!= null && !trigger.getCondition().trim().equalsIgnoreCase("")){
            		 s = "if("+trigger.getCondition().trim()+"){"+s+"}else{true;}";
            	 }            	 
                 Object result = cx.evaluateString(scope, s, "<cmd>", 1, null);
                 logger.debug("RHINO >>>>>>>>>>" + s + " : " + Context.toString(result));
                 
                 if((result instanceof Boolean)) {
					if(!((Boolean)result).booleanValue()){
						throw new PykasuParsingException("El valor de la celda " + trigger.getCell().toUpperCase() + " no cumple con la regla de validacion: " + trigger.getCell().toUpperCase() + " = "+ trigger.getFormula().toUpperCase());
					}
				 }else{
					 logger.warn("RHINO >>>>>>> La sentencia " + s + " no se evaluo a un valor booleano");
				 }
                 s = "";
             }

         } finally {
             Context.exit();
         } 
    	
         String formId = genericForm.uploadForm(simpleForm);
	    //System.out.println(simpleForm);
	    request.setAttribute("message", "El formulario se ha procesado exitósamente. El identificador del formulario en el sistema es: " + formId);
        return mapping.findForward("success");
	}
	
	private String getFileName(String fileName){
		Calendar c = Calendar.getInstance();
		c.setTime(new java.util.Date(System.currentTimeMillis()));		
		
		String path = "/tmp/"; //default path
		fileName = fileName.replace(" ", "_");
		fileName = fileName.replace("/", "_");
		fileName = fileName.replace("\\", "_");
		fileName = fileName.replace("|", "_");
		
		ClassLoader cl = getClass().getClassLoader();
		Properties properties = new Properties();
		try {
//			properties.load(cl.getResourceAsStream(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES));
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());;
			
			path = properties.getProperty(py.com.roshka.pykasu.util.Globals.UPLOAD_FILE_FOLDER);
		} catch (IOException e) {
			logger.warn("Error al recuperar el archivo de propiedades para obtener el valor de " + py.com.roshka.pykasu.util.Globals.UPLOAD_FILE_FOLDER + ". Se utilizara el valor por omision: "+ path,e);
		
		};

		return path+fileName+c.get(Calendar.YEAR)+"_"+c.get(Calendar.MONTH)+"_"+c.get(Calendar.DATE)+"__"+c.get(Calendar.HOUR)+"_"+c.get(Calendar.MINUTE)+"_"+c.get(Calendar.SECOND)+"_"+c.get(Calendar.MILLISECOND);
	}
	
	public void saveFile(InputStream is, File file) throws IOException{
		logger.debug("Save to File : " + file.getName());
		DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)));

		byte[] buf = new byte[1024];
        int len;
        while ((len = is.read(buf)) > 0) {
            out.write(buf, 0, len);
        }	      
        out.close();
        
	}
	
}
