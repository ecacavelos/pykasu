package py.com.roshka.pykasu.web.actions;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.util.Utils;
import py.com.roshka.pykasu.web.Globals;

/**
 * @author Pablo
 *
 * @struts.action  
 * 		path = "/changePassword"
 * 		input = "/changePassword.jsp"
 * 
 * @struts.action-forward 
 * 		name = "changePasswd"
 * 		path = "/changePassword.jsp"
 * 
 * @struts.action-forward 
 * 		name = "success"
 * 		path = "/index.jsp"

 */

public class ChangePasswordAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		if(request.getParameter("change") != null && request.getParameter("change").equalsIgnoreCase("true")){
			//aca se hace el cambio de password y se va a la pagina principal
			
			String actual 		 = request.getParameter("actual");
			String newPasswd 	 = request.getParameter("newpassw");
			String newPasswdConf = request.getParameter("newpasswconf");
			
			actual = Utils.SHA1(actual);
			newPasswd = Utils.SHA1(newPasswd);
			newPasswdConf = Utils.SHA1(newPasswdConf);
			
			if(request.getParameter("firstTime") != null && request.getParameter("firstTime").equalsIgnoreCase("true")){
				request.setAttribute("firstTime", "true");
			}
			
			User user = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
			
			if(!user.getPasswordDigest().equalsIgnoreCase(actual)){
				request.getSession().setAttribute(Globals.ERROR_MESSAGE, "La contraseña provista no coincide con la contraseña del usuario.");
				return mapping.findForward("changePasswd");
			}
			
			if(!newPasswd.equalsIgnoreCase(newPasswdConf)){
				request.getSession().setAttribute(Globals.ERROR_MESSAGE, "La nueva contraseña no coincide con la confirmación de la misma. Sea tan amable de ingresar nuevamente los datos.");
				return mapping.findForward("changePasswd");
			}
			
			InitialContext ic = new InitialContext();			
			UserManager userManager = (UserManager) ic.lookup("pykasu/UserManager/local");
			
			try{
				userManager.changePassword(user.getUserName(), actual, newPasswd);
			}catch (Exception e) {
				request.getSession().setAttribute(Globals.ERROR_MESSAGE, e.getMessage());
				return mapping.findForward("changePasswd");
			}

			user.setPasswordDigest(newPasswd);
			request.getSession().setAttribute(Globals.MESSAGE, "Contraseña establecida correctamente");
			return mapping.findForward("index");	
		}
		return mapping.findForward("changePasswd");
	}

}
