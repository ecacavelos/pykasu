package py.com.roshka.pykasu.web.actions;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.util.Utils;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.actions.forms.UserEditForm;
/**
* @struts.action
*  path = "/edituser"
*  input = "/editUser.jsp"
*  name = "UserEditForm"
*  validate = "true";  
*  
*  
*  @struts.action-forward
*      name = "success"
*      path = "/index.jsp"
*      
*  @struts.action-forward
*      name = "this"
*      path = "/editUser.jsp"
*      
*  @struts.action-forward
*      name = "logout"
*      path = "/closepykasusession.do"
*      
*/

public class EditUserAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		InitialContext ic = new InitialContext();
		UserManager um = (UserManager) ic.lookup("pykasu/UserManager/local");
		

		if(request.getParameter("save")== null &&  request.getParameter("userId")!= null && request.getParameter("userId").trim().length() > 0){
			User user = um.getUser(request.getParameter("userId"));
			request.setAttribute("editUser", user);
			return mapping.findForward("this");
			
		}else if(request.getParameter("save")!=null && request.getParameter("save").equalsIgnoreCase("true")){
			try{
				User login = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
				
				UserEditForm uef = (UserEditForm) form; 
				
				User newuser = null;
				boolean changePasswd = false;
				if(request.getParameter("userId")!=null && request.getParameter("userId").trim().length()>0){
					newuser = um.getUser(request.getParameter("userId"));
					newuser.setFullName(uef.getFullName());
					newuser.setDocumentNumber(uef.getDocumentNumber());
					newuser.setEmail(uef.getEmail());
					if(uef.getPassword()!=null && uef.getPassword().trim().length()>6 && uef.getPassword().equalsIgnoreCase(uef.getReplyPassword())){
						newuser.setPasswordDigest(Utils.SHA1(uef.getPassword()));
						changePasswd = true;
					}
				}else{
					newuser  = um.createUser(uef.getUserName(),Utils.SHA1(uef.getPassword()), uef.getFullName(), uef.getDocumentNumber(), uef.getEmail() ,login.getBusinessCompany());					
				}
				um.save(newuser);
				
				request.getSession().setAttribute(Globals.MESSAGE, "Usario actualizado exitósamente.");

				if(changePasswd){
					return mapping.findForward("logout");
					
				}

			}catch (Exception e) {
				request.getSession().setAttribute(Globals.ERROR_MESSAGE, "Ocurrio un error al guardar el usuario. " + e.getMessage());
			}
			return mapping.findForward("index");
		}
		
		
		return mapping.findForward("this");
	}
	
	
	
}
