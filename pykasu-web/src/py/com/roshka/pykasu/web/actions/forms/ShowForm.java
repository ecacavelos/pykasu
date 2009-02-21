/*
 * Created on 26/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions.forms;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.SimpleFormatter;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.CalendarManager;
import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.interfaces.UIManager;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.web.Globals;

/**
 * 
 * @struts.action path = "/showForm"
 * 
 * @struts.action-forward path = "/forms/genericform.jsp" name = "form"
 * 
 * 
 */
public class ShowForm extends Action {
    static org.apache.log4j.Logger logger = org.apache.log4j.Logger
            .getLogger(ShowForm.class);

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        if(request.getSession(false).getAttribute("PYKASU.LOGIN.USER")==null){
            request.setAttribute(Globals.MESSAGE,"El Usuario no tiene sesion");
            return mapping.findForward("index");
        }
        
        InitialContext ic = new InitialContext();
        FormManager formManager = null;
        CalendarManager calendarManager = null;
        
        
        logger.info("edit Form ...  " );
        
        if ((request.getParameter("FORM") != null)
                 || (request.getAttribute(Globals.FORM_BEAN)!= null)){
        
        	String formName = request.getParameter("FORM");
        	
        	if(formName == null){
        		formName = (String)request.getAttribute(Globals.FORM_NAME);
        	}
        	
            Form formBean = null;
            
            if (request.getAttribute(Globals.FORM_BEAN)==null){
                //formBean = formManager.getNewForm800();
                formManager = (FormManager) ic.lookup("pykasu/FormManager/local");
                GenericFormManager genericForm = formManager.getFormManager(request.getParameter("FORM"));
            	formBean = genericForm.getEmptyForm();
                request.setAttribute(Globals.FORM_NEW_INSTANCE,"true");
            }else{
                formBean = (Form) request.getAttribute(Globals.FORM_BEAN);
                request.setAttribute(Globals.FORM_NEW_INSTANCE,"false");
            }
            formBean.setName("Formulario "+formName);
            
            if (formBean == null){
                request.setAttribute(Globals.ERROR,"Error al buscar el formulario");
                return mapping.findForward("index");
            }
            request.setAttribute(Globals.FORM_BEAN, formBean);
            request.setAttribute(Globals.FORM_NAME, formName);
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");            
            request.setAttribute("serverActualDate", sdf.format(new Date(System.currentTimeMillis())));
            //suggested payment date
        	calendarManager = (CalendarManager) ic.lookup("pykasu/CalendarManager/local");
        	request.setAttribute("suggestedPaymentDate", sdf.format(calendarManager.getSuggestedPaymentDate(new Date(System.currentTimeMillis()))));
            
            if(request.getAttribute(Globals.FORM_STATUS) == null){
            	request.setAttribute(Globals.FORM_STATUS, "insert_mode");
            }
            
            return mapping.findForward("form");
        }
        return mapping.findForward("index");
    }

}
