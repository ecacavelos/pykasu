package py.com.roshka.pykasu.web.actions.forms;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.UploadFormManager;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;
/**
 * 
 * @author Pablo
 *
 * @struts.action
 * 		path = "/showuploadforms"
 * 
 * @struts.action-forward
 *     name = "success"
 *     path = "/showUploadedForms.jsp" 			
 *
 *
 */

public class ShowUploadedForms extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		User user = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
		
		InitialContext ic = new InitialContext();			
		UploadFormManager uploadFormMgr = null;
		uploadFormMgr = (UploadFormManager) ic.lookup("pykasu/UploadFormManager/local");	
		
		Calendar init = Calendar.getInstance();
		Calendar end = Calendar.getInstance();
		init.setTime(new Date(System.currentTimeMillis()));
		end.setTime(new Date(System.currentTimeMillis()));

		init.set(Calendar.HOUR, 0);
		init.set(Calendar.MINUTE, 0);

		end.set(Calendar.HOUR, 23);
		end.set(Calendar.MINUTE, 59);
		
		if(request.getParameter("init_date")!=null && request.getParameter("init_month")!=null && request.getParameter("init_year")!=null){
			init.set(Calendar.DATE, Integer.parseInt(request.getParameter("init_date")));
			init.set(Calendar.MONTH, Integer.parseInt(request.getParameter("init_month"))-1);
			init.set(Calendar.YEAR, Integer.parseInt(request.getParameter("init_year")));
			
			request.setAttribute("init_date", request.getParameter("init_date"));
			request.setAttribute("init_month", request.getParameter("init_month"));
			request.setAttribute("init_year", request.getParameter("init_year"));
		}
		if(request.getParameter("end_date")!=null && request.getParameter("end_month")!=null && request.getParameter("end_year")!=null){
			end.set(Calendar.DATE, Integer.parseInt(request.getParameter("end_date")));
			end.set(Calendar.MONTH, Integer.parseInt(request.getParameter("end_month"))-1);
			end.set(Calendar.YEAR, Integer.parseInt(request.getParameter("end_year")));
		}
		
		List<UploadForm> uploadForms = uploadFormMgr.getUploads(user, init, end);
		
		request.setAttribute("uploadForms", uploadForms);
		
		return mapping.findForward("success");
	}

}
