/*
 * Created on 13/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.SystemRegistration;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.forms.RegisterUserForm;
import py.com.roshka.pykasu.web.forms.SelectUserType;
/**
 * 
 * @author jrey
 *
 * @struts.action
 *  path = "/showuserform"
 *  name = "SelectUserType"
 *    
 *  @struts.action-forward
 *      name = "success"
 *      path = "/userform.jsp"
 *  	
 *  @struts.action-forward
 *      name = "selectUserType"
 *      path = "/selectUserType.jsp"
 *      
 *  @struts.action-forward
 *      name = "userForm"
 *      path = "/userform.jsp"
 *
 *  @struts.action-forward
 *      name = "userJuridicoForm"
 *      path = "/userJuridicoform.jsp"           
 */
public class ShowRegisterForm extends Action{
   
    @Override
    
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        //ACA DIFERENCIAR
    	String fwd = "";
    	if(form != null){
    		SelectUserType formu = (SelectUserType) form;
    		
    		String userType = formu.getUserType(); 
        	if(userType != null){//Si no es null, se ve a que tipo de formulario direccionar
        		request.setAttribute(Globals.USER_FORM_FORM_TYPE,Globals.USER_FORM_REGISTER_USER);

        		//VER PA QUE SE PONE ESTO
        		//TODO: PONER DESPUES POR ATRIBUTO TB EL TIPO DE USER
        		if(userType.equalsIgnoreCase("fisico")){
        			formu.setUserType(null);
            		fwd = "userForm";
            	}else{
            		formu.setUserType(null);
            		fwd = "userJuridicoForm";
            	}
        	}else{
        		fwd = "selectUserType";
        	}
    	}else{//Si es null, hay que seleccionar el tipo de persona a registrar
    		fwd = "selectUserType";
    	}
        
        //return mapping.findForward("success");
        return mapping.findForward(fwd);
    }
}
