package py.com.roshka.pykasu.web.actions.forms;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.exceptions.GetTaxException;
import py.com.roshka.pykasu.interfaces.TaxManager;
import py.com.roshka.pykasu.persistence.fiscal.Fee;

/**
 * 
 * @author pwelti
 * @struts.action path = "/getFee" scope = "request"
 * @struts.action-forward name = "success" path = "/xml/fee.jsp"
 * 
 */
public class GetFee extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		InitialContext ic = new InitialContext();
        TaxManager taxMgr = (TaxManager) ic.lookup("pykasu/TaxesManager/local");
        
        Integer form = new Integer(Integer.parseInt(request.getParameter("form")));
        Integer field = new Integer(Integer.parseInt(request.getParameter("field")));
        Integer month = new Integer(Integer.parseInt(request.getParameter("month")));
        Integer year = new Integer(Integer.parseInt(request.getParameter("year")));
        try{
        	Fee f = taxMgr.getFee(form, field, month, year);
        	request.setAttribute("FEE", f);
        }catch(GetTaxException e){
        	request.setAttribute("FEE",null);
        }
		
		return mapping.findForward("success");
	}

}
