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
 * @struts.action name = "LoginForm" path = "/login"
 * 
 */
public class LoginAction extends Action {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(LoginAction.class);
	
//	private static String NUMERIC_STRING_REGEX = "[0-9]+";
	
	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = null;
		try {
			
			DynaActionForm dynaForm = (DynaActionForm) form;
			
			
			username = (String) dynaForm.get("j_username");
			String password = (String) dynaForm.get("j_password");

			/*
			 * (Mirna)
			 * Modificacion 26/09/2007 a pedido de Raquel Recalde. xq su programa guarda los nombres 
			 * de usuario con ceros antes pero el usuario no tiene que cargar esto en la pagina de login
			 * 
			 * TODO: Un usuario que se registra mediante la pagina web y pone su nombre de usuario
			 * solo numérico va a tener problemas para loguearse porque aqui siempre se rellena con
			 * ceros para probar contra lo que esta en la base de datos. 
			 */
//			if(username.matches(NUMERIC_STRING_REGEX)){
//				
//				int leng = username.length();
//				int cantCerosFaltan = 15 - leng;
//				char arrayCerosFaltan[] = new char[cantCerosFaltan];
//				
//				for(int i = 0; i < cantCerosFaltan; i++)
//					arrayCerosFaltan[i] = '0';
//				
//				logger.debug("La longitud actual es: "+leng + " tengo que llenar con :" + (15-leng)+" ceros");
//				username = new String(arrayCerosFaltan) + username;
//				
//				logger.debug("UserName:  "+ username);					
//			}
			
			InitialContext ic = new InitialContext();			
			UserManager userManager = null;
			logger.info("lookup User Manager");
			userManager = (UserManager) ic.lookup("pykasu/UserManager/local");	
					
			User pksUser = userManager.getUser(username, password);
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
			e.printStackTrace();
			logger.error(e);
		} catch (UserNotFoundException e){
			logger.error(e);
			e.printStackTrace();
			request.setAttribute(Globals.ERROR,"No se ha encontrado el usuario " + username + " en el sistema.");
		} catch (LoginFailureException e){
			logger.error(e);
			e.printStackTrace();
			request.setAttribute(Globals.ERROR,"La contrasena del usuario " + username + " proveida por usted no corresponde con la almacenada en el sistema.");
		}

		return mapping.findForward("index");

	}

	// @Override
	// public ActionForward execute(ActionMapping mapping, ActionForm form,
	// HttpServletRequest request, HttpServletResponse response)
	// throws Exception {
	// DynaActionForm dynaForm = (DynaActionForm) form;
	// String user = (String) dynaForm.get("j_username");
	// String password = (String) dynaForm.get("j_password");
	//        
	// if (!super.isCancelled(request)) { //si no es cancel
	// InitialContext ic = new InitialContext();
	// UserManager userManager = null;
	// try {
	// logger.info("lookup User Manager");
	// userManager = (UserManager) ic
	// .lookup("pykasu/UserManager/local");
	//
	// User userBean = userManager.getUser(user, password);
	// if (user != null) {
	// request.getSession(true).setAttribute("PYKASU.LOGIN.USER",
	// userBean);
	// request.setAttribute(Globals.MESSAGE, userBean
	// .getFullName()
	// + ": Bienvenido al Sistema");
	//                    
	// logger.info("lookup UIManager");
	// request.getSession().setAttribute("j_username",user);
	// request.getSession().setAttribute("j_password",password);
	// UIManager uiManager = (UIManager) ic.lookup("pykasu/UIManager/local");
	//                    
	// Set<Program> programs = uiManager.getMenu(userBean);
	// request.getSession().setAttribute(Globals.USER_PROGRAMS,programs);
	//                    
	// }
	// } catch (LoginFailureException e) {
	// request.setAttribute(Globals.MESSAGE, e.getMessage());
	// }catch(Exception e){
	// request.setAttribute(Globals.MESSAGE, e.getMessage());
	// }
	//            
	// }
	//
	// return mapping.findForward("index");
	// }

}
