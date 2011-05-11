package py.com.roshka.pykasu.web.actions.admin;

import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.interfaces.SystemRegistration;
import py.com.roshka.pykasu.interfaces.UIManager;
import py.com.roshka.pykasu.ui.menu.Program;
import py.com.roshka.pykasu.web.Globals;
/**
 * 
 * @author jrey
 *
 * @struts.action   
 *  path = "/activationAccount"
 * @struts.action-forward
 *  name = "success"
 *  path = "/index.jsp"
 *  
 */
public class ActivateAccountAction extends Action{
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(ActivateAccountAction.class);
	@Override
	public ActionForward execute(ActionMapping mapping,
			ActionForm form, HttpServletRequest request, 
				HttpServletResponse response) throws Exception {
		if (request.getParameter("accountNumber")!=null){
			try{
			InitialContext ic = new InitialContext();
			SystemRegistration systemRegistration = (SystemRegistration) ic.lookup("pykasu/SystemRegistration/local");
			systemRegistration.activate(request.getParameter("accountNumber")); 
			request.setAttribute(Globals.MESSAGE,"La cuenta ha sido activada exitosamente");
			UIManager uiManager = (UIManager) ic.lookup("pykasu/UIManager/local");
			
			List<Program> programs = uiManager.getMenu();
			request.getSession().setAttribute(Globals.USER_PROGRAMS,programs);
			}
			catch (PykasuGenericException e1){
				request.setAttribute(Globals.ERROR,"Error : "+e1.getMessage());
				logger.error(e1);
			}
			catch (Throwable e2){
				request.setAttribute(Globals.ERROR,"Error al Intentar activar la cuenta ");
				logger.error(e2);
			}
			
		}
				return mapping.findForward("success");
	}
	
}
