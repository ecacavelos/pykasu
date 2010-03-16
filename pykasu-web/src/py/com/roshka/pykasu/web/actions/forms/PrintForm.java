package py.com.roshka.pykasu.web.actions.forms;

import java.util.Iterator;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.ui.form.Cell;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.web.forms.GenericForm;

/**
 * @struts.action 
 * 		path = "/xsl/formularios/printForm"
 * 		input = "/forms/genericform.jsp"
 * 		scope = "request"
 * 		validate = "false"
 * struts.action-forward
 * 		path = "/forms/printpreview.jsp" name = "printform"
 */

public class PrintForm extends Action {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(PrintForm.class);

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
        InitialContext ic = new InitialContext();
        FormManager formManager = null;
        formManager = (FormManager) ic.lookup("pykasu/FormManager/local");

        logger.info(">>>>>>>>   PrintForm Action! ");
        logger.info(": formType:" + request.getParameter("formType").toString() + "  formId :" + request.getParameter("formId").toString() );
        GenericFormManager genericForm = formManager.getFormManager(request.getParameter("formType").toString());

        //request.setAttribute("printableInfo",genericForm.getPrintableInfo());

        
        
        StringBuffer sb = new StringBuffer();
        sb.append("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>");
        sb.append("<?xml-stylesheet  href='"+request.getParameter("formType").toString()+".xsl' type='text/xsl'?>");
        sb.append("<declaracion formulario=\"" + request.getParameter("formType").toString() + "\" obligacion=\"211\" version=\"1\" fechaDocumento=\"21/12/2006\" formaPresentacion=\"INTSF\">");
        sb.append("<detalle>");

//      response.getWriter().print(genericForm.getPrintableInfo().trim());        
        Form f = genericForm.getForm(request.getParameter("formId").toString());
        Cell cell = null;

        Iterator it = f.getCells().iterator();
        Object obj;
		while(it.hasNext()){
			cell = (Cell) it.next();
			if((cell.getXmlTagName() != null) && (!cell.isNullData())){
				logger.info("PRINT: " + cell.getXmlTagName() + " ::: " + cell.getData());
				sb.append("<" + cell.getXmlTagName()+">");
				obj = cell.getData();
				if(obj instanceof Double){
					Double d = (Double) obj;
					sb.append(String.valueOf(d.longValue()));
				}else{
					sb.append(obj);
				}
				sb.append("</" + cell.getXmlTagName()+">");
			}		
		}
		
		
		//TODO: estoy haciendo estoy de traer celdas particuares y renombrarlas a las correctas en este punto
		//Lo ideal seria tener una clase que traiga las celdas particulares de cada formulario o tener una Interfaz "Printable" 
		//con un metodo getPrintableCell y que esta interfaz sea implementada por los formularios.
		cell = f.getCell("fiscalPeriodYear");
		String period = "";
		if(cell != null && !cell.isNullData()){
			period = cell.getData().toString();
			if(!isAnual(f.getId())){
				cell = f.getCell("fiscalPeriodMounth");
				if(cell != null && !cell.isNullData()){
					if(((Integer)cell.getData()) < 10){
						period = period + "0" + cell.getData().toString();
					}else{
						period = period + cell.getData().toString();
					}
					logger.info(">>>>>>> Periodo: " + period + " : " + period.length());
				}
			}
			if(period.length() == 6 || period.length() == 4){
				sb.append("<periodo>" + period +"</periodo>");
			}
		}
		
		
		cell = f.getCell("declarationType");
		if(cell != null && !cell.isNullData()){
			if(cell.getData().toString().trim().equals("| 1 | ORIGINAL"))
				sb.append("<C1>1</C1>");
			else if(cell.getData().toString().trim().equals("| 2 | RECTIFICATIVA"))
				sb.append("<C2>1</C2>");
			else if(cell.getData().toString().trim().equals("| 5 | CLAUSURA"))
				sb.append("<C5>1</C5>");				
		}
		
        sb.append("</detalle>");
        sb.append("</declaracion>");
		
		
		
		response.setContentType("text/xml");
        response.getWriter().print(sb.toString().trim());
        response.getWriter().flush();
        
		return super.execute(mapping, form, request, response);
//        request.getSession().setAttribute("FORM_TO_PRINT", sb.toString().trim());        
//        return mapping.findForward("printform");
	}
	
	private boolean isAnual(String formType){
		if(formType == null){
			throw new IllegalArgumentException("El tipo de formulario no puede ser nulo.");
		}
		
		int ft =  Integer.parseInt(formType.trim());
		switch (ft) {
			case 101:
			case 105:
			case 106:
			case 108:
			case 110:
			case 804:
			case 848:				
				return true;			
			default:
				return false;
		}
	}
	
}
