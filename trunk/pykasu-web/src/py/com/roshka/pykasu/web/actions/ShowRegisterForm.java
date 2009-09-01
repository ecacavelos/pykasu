/*
 * Created on 13/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions;

import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.sun.org.apache.commons.beanutils.BeanUtils;

import py.com.roshka.pykasu.interfaces.AdmissionManager;
import py.com.roshka.pykasu.interfaces.SystemRegistration;
import py.com.roshka.pykasu.persistence.admission.Admission;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.forms.RegisterUserForm;
import py.com.roshka.pykasu.web.forms.SelectUserType;
/**
 * 
 * @author jrey
 *
 * @struts.action
 *  path = "/showuserform"
 *
 *  @struts.action-forward
 *      name = "userForm"
 *      path = "/createUserForm.jsp"
 *      
 *  @struts.action-forward
 *      name = "error"
 *      path = "/index.jsp"           
 *                 
 */
public class ShowRegisterForm extends Action{
   
    @Override
    
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	
    	if(request.getParameter("admissionId")==null){
    		request.setAttribute(Globals.ERROR,"La aplicación detectó un parámetro incorrecto en su solicitud");
    		return mapping.findForward("error");
    	}
    	
    	try{
	    	Integer admissionId = Integer.parseInt(request.getParameter("admissionId"));
	    	
			InitialContext ic = new InitialContext();
			AdmissionManager am =  (AdmissionManager) ic.lookup("pykasu/AdmissionManager/local");
			Admission admission = am.getAdmission(admissionId);
	
	    	request.setAttribute("admission", admission);
	    	
	    	request.setAttribute(Globals.USER_FORM_FORM_TYPE, Globals.USER_FORM_REGISTER_USER); 
	    		    	
	        return mapping.findForward("userForm");
	        
    	}catch (Exception e) {
    		request.setAttribute(Globals.ERROR,"La aplicación detectó un parámetro incorrecto en su solicitud");
    		return mapping.findForward("error");
		}
    }
    
	
	/*
	 *   EmployeeService service = new EmployeeService();
		EmployeeForm employeeForm = (EmployeeForm) form;
		EmployeeDTO employeeDTO = new EmployeeDTO();
		BeanUtils.copyProperties( employeeDTO, employeeForm ); 
	 * 
	 * */    
}
