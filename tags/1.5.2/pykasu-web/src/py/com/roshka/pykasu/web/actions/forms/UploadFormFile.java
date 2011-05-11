package py.com.roshka.pykasu.web.actions.forms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.util.Utils;

/**
 * 
 * @author Pablo
 *
 * @struts.action
 * 		path = "/uploadfileform"
 * 
 * @struts.action-forward
 *     name = "success"
 *     path = "/uploadFileForm.jsp" 			
 *
 *
 */

public class UploadFormFile extends Action {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(UploadFormFile.class);

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("isAfterCloseHours", Utils.afterCloseHour());
		return mapping.findForward("success");
	}
	
	
}
