package py.com.roshka.pykasu.web.actions;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.interfaces.AdmissionManager;

/**
 * 
 * @author Pablo
 *
 *	@struts.action path = "/activationreg"
 *
 * 	@struts.action-forward
 *      name = "success"
 *      path = "/showAdmissionMsg.jsp"
 *
 */
public class AdmissionActivationAction extends Action {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(AdmissionActivationAction.class);

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		if(request.getParameter("sn") == null){
			request.setAttribute("error", "Número de activación de Solicitud de Regitro inválido.");
		}else{
			InitialContext ic = new InitialContext();
			AdmissionManager am =  (AdmissionManager) ic.lookup("pykasu/AdmissionManager/local");
			try{
				Integer sn = Integer.parseInt(request.getParameter("sn"));			
				am.activateAdmission(sn);
				
				request.setAttribute("success", "La activación de su solicitud de registro se ha realizado con éxito<br/>");
			}catch (PykasuGenericException e) {
				request.setAttribute("error", e.getMessage());	
			}catch (Exception e) {
				request.setAttribute("error", "Ha ocurrido un error.");
			}
		}
		
		return mapping.findForward("success");
	}

	
}
