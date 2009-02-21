/*
 * Created on Jul 2, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.forms;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import py.com.roshka.pykasu.ui.form.Cell;
import py.com.roshka.pykasu.util.Utils;
/**
 * 
 * 
 * @struts.form
 *  name = "GenericForm"
 *  
 * 
 */
public class GenericForm extends ActionForm{
    
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(GenericForm.class);
    private String formName;
    private String submitAction;
    private HashMap fields;
    private String newInstance = "false";

    public HashMap getFields() {
        return fields;
    }

    public String getFormName() {
        System.out.println("get formName");
        return formName;
    }

    public void setFormName(String formName) {
        System.out.println("set formName");
        this.formName = formName;
    }


    public void setFields(HashMap fields) {
        this.fields = fields;
    }
    @Override
    public void reset(ActionMapping arg0, HttpServletRequest arg1) {
        fields = new HashMap();
    }

    @SuppressWarnings("unchecked")
	public void setField(String key,String value){
    	logger.debug("Setting a field Key:" + key + " Value: " + value );
        fields.put(key,value);
    }
    public String getField(String key){
        if (fields.get(key) != null)
            return (String) fields.get(key);
        return "0";
    }

    public String getSubmitAction() {
        return submitAction;
    }

    public void setSubmitAction(String submitAction) {
        this.submitAction = submitAction;
    }

    public String getNewInstance() {
        return newInstance;
    }

    public void setNewInstance(String newInstance) {
        this.newInstance = newInstance;
    }

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		String presentationDate = getField("paymentDate");
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		ActionErrors errors = new ActionErrors();
		System.out.println("Genericform.VALIDATE");
		logger.info("Presentation Date Validation.");
		try {
			Date presentation = sdf.parse(presentationDate);
			Date actual = new Date(System.currentTimeMillis());
			Integer diff = Utils.DateDiff(actual, presentation);
			if(diff.intValue() < 0 ){
				logger.info("Presentation Date is not valid!." + presentationDate);
				errors.add("error.fecha.incorrecta",new ActionError("genericform.fecha.incorrecta"));
			}
			
			
		} catch (ParseException e) {			
			e.printStackTrace();
			errors.add("error.fecha.incorrecta",new ActionError("genericform.fecha.incorrecta"));
		} 
		 
		return errors;
	}
    
        
}
