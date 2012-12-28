package py.com.roshka.pykasu.web.actions;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.PaymentFormInterface;
import py.com.roshka.pykasu.interfaces.TaxManager;
import py.com.roshka.pykasu.persistence.fiscal.Taxes;
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;

/**
 * 
 * @author Pablo
 *
 * @struts.action
 *  path = "/printpaymentform"
 *  validate = "false";
 *  
 * @struts.action-forward
 *   name = "success"
 *   path = "/paydmentPrint.jsp"   
 *
 */

public class PrintPaymentFormAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		InitialContext ic = new InitialContext();
		PaymentFormInterface pfi =  (PaymentFormInterface) ic.lookup("pykasu/PaymentFormManager/local");
        TaxManager taxMgr = (TaxManager) ic.lookup("pykasu/TaxesManager/local");   
		
		User user = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
		PaymentForm pf = pfi.getPaymentForm(Integer.parseInt(request.getParameter("id")), user);
		request.setAttribute("payment", pf);

		Taxes tax = taxMgr.getTax(Integer.parseInt(pf.getObligation()));
		request.setAttribute("tax", tax);
		
		
		return mapping.findForward("success");
	}
	
}
