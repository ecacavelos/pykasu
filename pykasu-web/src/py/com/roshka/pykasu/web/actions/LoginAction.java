/*
 * Created on 14/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions;

import java.util.List;
import java.util.Set;

import javax.naming.InitialContext;
import javax.security.auth.Subject;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.login.LoginContext;
import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.jboss.security.SimplePrincipal;
import org.jboss.security.auth.callback.SecurityAssociationHandler;

import py.com.roshka.pykasu.exceptions.LoginFailureException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.exceptions.UserNotFoundException;
import py.com.roshka.pykasu.interfaces.UIManager;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.menu.Program;
import py.com.roshka.pykasu.web.Globals;

/**
 * 
 * @author jrey
 * 
 * @struts.action 
 * 		name = "LoginForm" 
 * 		path = "/login"
 * 
 * @struts.action-forward
 *      name = "changePassword"
 *      path = "/changePassword.do"
 * 
 */
public class LoginAction extends Action {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(LoginAction.class);
	
	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = null;
		User pksUser = null;
		try {
			
			DynaActionForm dynaForm = (DynaActionForm) form;
			
			
			username = (String) dynaForm.get("j_username");
			String password = (String) dynaForm.get("j_password");

			
			InitialContext ic = new InitialContext();			
			UserManager userManager = null;
			logger.info("lookup User Manager");
			userManager = (UserManager) ic.lookup("pykasu/UserManager/local");	
					
			pksUser = userManager.getUser(username, password);
			logger.info("User Manager found it!");				
			SecurityAssociationHandler handler = new SecurityAssociationHandler();
			//SimplePrincipal user = new SimplePrincipal(username.trim().toLowerCase());
			SimplePrincipal user = new SimplePrincipal(pksUser.getUserName());
			handler.setSecurityInfo(user, password.toCharArray());
			LoginContext loginContext = new LoginContext("PykasuAppPolicy",	(CallbackHandler) handler);
			loginContext.login();
			Subject subject = loginContext.getSubject();
			Set principals = subject.getPrincipals();
			logger.info("Add Principals to User : " + user);
			
			principals.add(user);

			logger.info("lookup UIManager");
			UIManager uiManager = (UIManager) ic.lookup("pykasu/UIManager/local");
			
			request.getSession(true).setAttribute(Globals.LOGIN_USER,pksUser);
			List<Program> programs = uiManager.getMenu();
			request.getSession().setAttribute(Globals.USER_PROGRAMS,programs);

			
		
		} catch (LoginException e) {			
			logger.error(e);
			throw new PykasuGenericException(e);
		} catch (UserNotFoundException e){
			logger.error(e);			
			request.getSession().setAttribute(Globals.ERROR_MESSAGE,"No se ha encontrado el usuario " + username + " en el sistema.");
		} catch (LoginFailureException e){
			logger.error(e);
			request.getSession().setAttribute(Globals.ERROR_MESSAGE,"La contrasena del usuario " + username + " proveida por usted no corresponde con la almacenada en el sistema.");
		}
		
		if(pksUser.getBusinessCompany().getIsActive().booleanValue() == Boolean.FALSE){
			request.setAttribute("firstTime", "true");
			return mapping.findForward("changePassword");
		}

		return mapping.findForward("index");

	}

}
