package py.com.roshka.pykasu.web.actions;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.ejb.SearchFormsEJB.CriteriaType;
import py.com.roshka.pykasu.interfaces.SearchFormsInterface;
import py.com.roshka.pykasu.persistence.forms.ItemSearch;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;

/**
 * @author Pablo
 * 
 * @struts.action
 *  path = "/searchForms"
 *  validate = "false";
 *  
 *  @struts.action-forward
 *     name = "success"
 *     path = "/searchForms.jsp"  
 *     
 */
public class SearchFormAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getParameter("search")!=null && request.getParameter("search").equalsIgnoreCase("true")){
			User user = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
	
			InitialContext ic = new InitialContext();
			SearchFormsInterface sfi = (SearchFormsInterface) ic.lookup("pykasu/SearchFormManager/local");
			
			Map<CriteriaType, Object> criteria = new HashMap<CriteriaType, Object>();
			//-- formularios
			if(request.getParameter("widgetSelections") != null){
				criteria.put(CriteriaType.FORM, request.getParameter("widgetSelections").split("::"));				
			}
			
			//periodos fiscales
			if((""+request.getParameter("mes")).length() > 0 && !request.getParameter("mes").equalsIgnoreCase("--")){
				criteria.put(CriteriaType.PERIOD_MONTH, Integer.parseInt(request.getParameter("mes")));				
			}

			if((""+request.getParameter("anho")).length() > 0 && !request.getParameter("anho").equalsIgnoreCase("--")){
				criteria.put(CriteriaType.PERIOD_YEAR, Integer.parseInt(request.getParameter("anho")));				
			}
			
			//fechas de presentacion
			if((request.getParameter("presentationDateInit_date")+"").length()>0 && (request.getParameter("presentationDateInit_month")+"").length()>0 && (request.getParameter("presentationDateInit_year")+"").length()>0){
				Calendar c = Calendar.getInstance();
				c.set(Calendar.DATE, Integer.parseInt((request.getParameter("presentationDateInit_date")+"")));
				c.set(Calendar.MONTH, Integer.parseInt((request.getParameter("presentationDateInit_month")+"")));
				c.set(Calendar.YEAR, Integer.parseInt((request.getParameter("presentationDateInit_year")+"")));
				
				criteria.put(CriteriaType.PRESENTATION_DATE_INIT, c.getTime());
			}
			
			if((request.getParameter("presentationDateEnd_date")+"").length()>0 && (request.getParameter("presentationDateEnd_month")+"").length()>0 && (request.getParameter("presentationDateEnd_year")+"").length()>0){
				Calendar c = Calendar.getInstance();
				c.set(Calendar.DATE, Integer.parseInt((request.getParameter("presentationDateEnd_date")+"")));
				c.set(Calendar.MONTH, Integer.parseInt((request.getParameter("presentationDateEnd_month")+"")));
				c.set(Calendar.YEAR, Integer.parseInt((request.getParameter("presentationDateEnd_year")+"")));
				
				criteria.put(CriteriaType.PRESENTATION_DATE_END, c.getTime());
			}
			
			if((request.getParameter("ruc")+"").length()>0){
				criteria.put(CriteriaType.RUC, (request.getParameter("ruc")+""));
			}

			if((request.getParameter("contribuyente")+"").length()>0){
				criteria.put(CriteriaType.NAME, (request.getParameter("contribuyente")+""));
			}
			
			List<ItemSearch> items = sfi.getForms(user, criteria);
			
			request.setAttribute("items",items);
		}
		return mapping.findForward("success");
	}
}
