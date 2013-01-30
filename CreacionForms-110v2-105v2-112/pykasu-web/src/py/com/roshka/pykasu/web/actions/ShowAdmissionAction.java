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

import py.com.roshka.pykasu.ejb.AdmissionManagerEJB;
import py.com.roshka.pykasu.interfaces.AdmissionManager;
import py.com.roshka.pykasu.persistence.admission.Admission;
/**
 * 
 * @author Pablo
 *	
  *	@struts.action path = "/admissionslist"
 *
 * 	@struts.action-forward
 *      name = "success"
 *      path = "/showAdmissions.jsp"
*
 */
public class ShowAdmissionAction extends Action {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(ShowAdmissionAction.class);

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String status = request.getParameter("status"); 
		if(status==null){
			request.setAttribute("status", AdmissionManagerEJB.STATUS_CONFIRMADO);			
		}else{
			request.setAttribute("status", status);
		}
		Integer admissionId = -1;
		if(request.getParameter("admissionId") != null && request.getParameter("admissionId").trim().length() >0){
			admissionId = Integer.parseInt(request.getParameter("admissionId"));
		}
		
		InitialContext ic = new InitialContext();		
		AdmissionManager am =  (AdmissionManager) ic.lookup("pykasu/AdmissionManager/local");
		if(admissionId > 0){ //se busca por ID
			Admission admission = am.getAdmission(admissionId);
			List<Admission> admissions = new ArrayList<Admission>();
			admissions.add(admission);
			request.setAttribute("admissions", admissions);
			request.setAttribute("admissionId", request.getParameter("admissionId"));			
		}else{
			List<Admission> admissions = am.getAdmissionsByStatus(status);
			request.setAttribute("admissions", admissions);
		}
		return mapping.findForward("success");
	}
	
	
}
