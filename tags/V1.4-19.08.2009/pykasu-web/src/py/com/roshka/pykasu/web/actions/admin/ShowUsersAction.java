package py.com.roshka.pykasu.web.actions.admin;

import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;
/**
 * 
 * @author Pablo
 *	@struts.action
 *		path="/showUsers"
 *	@struts.action-forward
 *		name="success"
 *		path="/users.jsp"	
 */
public class ShowUsersAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		InitialContext ic = new InitialContext();
		
		UserManager userManager = null;
		
		userManager = (UserManager) ic.lookup("pykasu/UserManager/local");	
		List users = userManager.getAllUsers();
		
		request.setAttribute(Globals.USER_USERS_LIST,users);
        request.setAttribute(Globals.GLOBAL_TITLE,"Lista de Usuarios");
		
		return mapping.findForward("success");
	}
	
	
}
