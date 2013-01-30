/*
 * Created on Nov 15, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.exceptions.InvalidExpiringDateException;
import py.com.roshka.pykasu.exceptions.InvalidFiscalPeriodException;
import py.com.roshka.pykasu.exceptions.PersistException;
import py.com.roshka.pykasu.interfaces.FiscalRulesManager;
import py.com.roshka.pykasu.persistence.fiscal.FiscalPeriod;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.forms.ExpiringDateCalendar;

/**
 * 
 * @author pwelti
 * 
 * @struts.action path = "/expiringDateCalendar" 
 *      name = "expiringDateCalendar" 
 *      validate = "false"
 *      input = "/expiringDateCalendar.jsp"
 *      
 * @struts.action-forward 
 *      name = "success" 
 *      path = "/index.jsp"

 * @struts.action-forward
 *      name = "error"
 *      path = "/expiringDateCalendar.jsp" *      
 */
public class ExpiringDateCalendarAction extends Action {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(ExpiringDateCalendarAction.class);
	
    @SuppressWarnings("unchecked")
	public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    	
    	List list = new ArrayList();
    	
		InitialContext ic = new InitialContext();
    	ExpiringDateCalendar edc = (ExpiringDateCalendar) form;

    	py.com.roshka.pykasu.web.util.ExpiringDate edw = null;
    	
    	try{
    		FiscalRulesManager frm = (FiscalRulesManager) ic.lookup("pykasu/FiscalRulesManager/local");
    		
    		FiscalPeriod fp = frm.addFiscalPeriod(edc.getMonth(), edc.getYear());
    		
    		list.add(fp);
    		
    		Map details = edc.getExpiringDates();
    		Iterator it = details.keySet().iterator();
    		
    		py.com.roshka.pykasu.persistence.fiscal.ExpiringDate ed;
    		Date date = null;
    		Object o = null;
    		while(it.hasNext()){
    			o = it.next();

    			if(o == null)
    				logger.info("El detalle es nulo");
    			else
    				logger.info(o.getClass() + " --> " + o);
    			
    			edw = (py.com.roshka.pykasu.web.util.ExpiringDate) details.get(o);
    			
    			logger.info(edw);
    			
    			if(edw.getCharFrom() != null || edw.getCharTo() != null || edw.getDate() != null || edw.getFormType() != null){
	    				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    			sdf.setLenient(false);
		    			
		    			date = sdf.parse(edw.getDate()); 
		    			ed = frm.addExpiringDate(edw.getId(), edw.getFormType(),fp, date, edw.getCharFrom(), edw.getCharTo());
		    			list.add(ed);
    			}

    		}
    		
    		frm.save(list);
    		
        	request.setAttribute(Globals.MESSAGE,"Se ha ingreado el calendario impositivo correctamente.");
        	
    	}catch (InvalidFiscalPeriodException e) {
    		logger.error(e);
    		e.printStackTrace();
        	request.setAttribute(Globals.ERROR,"Error al cargar un periodo fiscal");
        	return mapping.findForward("error");
    	}catch(ParseException e){
    		logger.error(e);
    		e.printStackTrace();
        	request.setAttribute(Globals.ERROR,"Fecha invalida: " + edw.getDate());
        	return mapping.findForward("error");    		
    	}catch (InvalidExpiringDateException e) {
    		logger.error(e);
    		e.printStackTrace();
        	request.setAttribute(Globals.ERROR,"Error al cargar la fecha de vencimiento : " + edw);
        	return mapping.findForward("error");
    	}catch (PersistException e) {
    		logger.error(e);
    		e.printStackTrace();
        	request.setAttribute(Globals.ERROR,"Error al Guardar los datos!");
        	return mapping.findForward("error");
    	}catch(Exception e){
    		logger.error(e);
    		e.printStackTrace();
        	request.setAttribute(Globals.ERROR,"Error al cargar un periodo fiscal");
        	return mapping.findForward("error");
    	}
    	

    	return mapping.findForward("success");
    }

}
