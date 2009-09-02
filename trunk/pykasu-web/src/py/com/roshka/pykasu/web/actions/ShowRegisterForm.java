/*
 * Created on 13/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions;

import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.sun.org.apache.commons.beanutils.BeanUtils;

import py.com.roshka.pykasu.exceptions.FindingException;
import py.com.roshka.pykasu.interfaces.AdmissionManager;
import py.com.roshka.pykasu.interfaces.SystemRegistration;
import py.com.roshka.pykasu.interfaces.UserManager;
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

	    	//pasa sugerir un username valido
	    	List<String> unames = getUserNames(admission.getFname(), admission.getLname());
			UserManager um =  (UserManager) ic.lookup("pykasu/UserManager/local");			
			int value = -1;
			for(int i=0; i<unames.size(); i++){
				try{
					um.findUserByName(unames.get(i));
				}catch(FindingException fe){
					value=i;
					i=unames.size();
				}
			}
	    	
			if(value<0){ //no se encontró nada
				request.setAttribute("userName", admission.getFname().toLowerCase().substring(0,1)+admission.getLname().toLowerCase()+""+admission.getId().toString().substring(admission.getId().toString().length()-3,admission.getId().toString().length()));
			}else{
				request.setAttribute("userName", unames.get(value));
			}
	    	
	    	
	        return mapping.findForward("userForm");
	        
    	}catch (Exception e) {
    		request.setAttribute(Globals.ERROR,"La aplicación detectó un parámetro incorrecto en su solicitud");
    		return mapping.findForward("error");
		}
    }
    
    private List<String> getUserNames(String fname, String lname){
    	List<String> names = new ArrayList<String>();
    	names.add(fname.toLowerCase().substring(0,1)+lname.toLowerCase()); //pwelti
    	names.add(fname.toLowerCase()+lname.toLowerCase()); //pablowelti
    	names.add(fname.toLowerCase()+"."+lname.toLowerCase()); //pablo.welti
    	names.add(fname.toLowerCase()+"_"+lname.toLowerCase()); //pablo_welti
    	names.add(fname.toLowerCase()+"-"+lname.toLowerCase()); //pablo-welti
    	names.add(fname.toLowerCase()); //pablo
    	names.add(lname.toLowerCase()); //welti
    	
    	return names;
    }
}
