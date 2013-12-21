package py.com.roshka.pykasu.web.actions;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.FiscalRulesManager;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.forms.FiscalPeriodSearch;


/**
 * 
 * @author pwelti
 * 
 * @struts.action path = "/fiscalPeriodSearch" 
 *      name = "fiscalPeriodSearch" 
 *      validate = "false"
 *      input = "/fiscalPeriodSearch.jsp"
 *      
 * @struts.action-forward 
 *      name = "success" 
 *      path = "/expiringDateCalendar.jsp"
 *
 * @struts.action-forward 
 *      name = "error" 
 *      path = "/fiscalPeriodSearch.jsp"
 */

public class FiscalPeriodSearchAction extends Action {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(FiscalPeriodSearchAction.class);
	
	@SuppressWarnings({"unchecked","unchecked"})
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		FiscalPeriodSearch fps = (FiscalPeriodSearch) form;

		InitialContext ic = new InitialContext();		
		FiscalRulesManager frm = (FiscalRulesManager) ic.lookup("pykasu/FiscalRulesManager/local");
		
		try{
			Map expiringDates = new HashMap();
			
			List list = frm.getExpiringDatesFromFiscalPeriod(fps.getMonth(), fps.getYear());
			
			Iterator it = list.iterator();
			
			py.com.roshka.pykasu.persistence.fiscal.ExpiringDate ed = null;
			py.com.roshka.pykasu.web.util.ExpiringDate edw = null;
			
			Integer i = new Integer(0);
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			while(it.hasNext()){
				ed = (py.com.roshka.pykasu.persistence.fiscal.ExpiringDate) it.next();
				edw = new py.com.roshka.pykasu.web.util.ExpiringDate();
				
				edw.setId(ed.getId());
				edw.setDate(sdf.format(ed.getDate()));
				edw.setCharFrom(ed.getCharFrom());
				edw.setCharTo(ed.getCharTo());
				edw.setFormType(ed.getFormType());
				
				
				expiringDates.put(i.toString(), edw);
				
				i = new Integer(i.intValue() + 1);
			}
			logger.info("Cantidad de detalles en la búsqueda : " + expiringDates.values());
			//request.setAttribute("details",list);
			request.setAttribute("month",fps.getMonth());
			request.setAttribute("year",fps.getYear());

			request.setAttribute("expiringDates",expiringDates);
//			request.setAttribute("RESULT.OK", true);
			
			return mapping.findForward("success");
			
		}catch(NoResultException e){
        	request.setAttribute(Globals.MESSAGE,"No se encontraron datos.");
    		return mapping.findForward("error");
		}
		

	} 
	
}
