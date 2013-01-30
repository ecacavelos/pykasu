package py.com.roshka.pykasu.web.actions;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.AdmissionManager;
import py.com.roshka.pykasu.persistence.admission.Admission;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.forms.AdmissionForm;


/**
 * 
 * @author pwelti
 * 
 * @struts.action 
 * 		path = "/admissionform"
 * 		input = "/admissionForm.jsp" 
 *      name = "AdmissionForm" 
 *      validate = "true"
 *      
 *  validate = "true";   *      
 *      
 *  @struts.action-forward
 *      name = "success"
 *      path = "/index.jsp"
 *      
 *  @struts.action-forward
 *      name = "admission"
 *      path = "/admissionForm.jsp"
      
 */
public class AdmissionAction extends Action {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(AdmissionAction.class);

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		if(request.getParameter("type")!=null){
			request.setAttribute("type", request.getParameter("type"));
		}
		
		if((""+request.getParameter("loaded")).equalsIgnoreCase("true")){ //hay datos cargados
			InitialContext ic = new InitialContext();
			AdmissionManager am =  (AdmissionManager) ic.lookup("pykasu/AdmissionManager/local");
			try{	
				AdmissionForm af = (AdmissionForm) form;
				
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date date = sdf.parse(af.getConstitution());
				
				Admission ads = new Admission(
											af.getCompanyName(),
											af.getFname(), 
											af.getLname(), 
											af.getType(), 
											af.getMainActivity(), 
											af.getRuc(), 
											af.getDv(), 
											af.getContactPerson(), 
											af.getCiContactPerson(),
											af.getAddress(),
											af.getLocality(),
											af.getOffice(),
											af.getPhone(),
											af.getFax(),
											date,
											af.getMail());
				
				ads.setLegacyUsers(af.getLegacyUsers());
				
				am.addAdmission(ads);
				
				request.getSession().setAttribute(Globals.MESSAGE, "Solicitud de Admisión ingresado correctamente.<br/>Se enviará un correo a: " + af.getMail() + " con las instrucciones necesarias para activar esta solicitud de adminisón.");
				return mapping.findForward("success");
				
			}catch (Exception e) {
				request.getSession().setAttribute(Globals.ERROR_MESSAGE, "Ocurrió un error al registrar su solicitud.");
				return mapping.findForward("admission");
			}
		}
		
		return mapping.findForward("admission");
	}
	
	
}
