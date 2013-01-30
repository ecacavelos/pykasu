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

import py.com.roshka.pykasu.interfaces.PaymentFormInterface;
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;

/**
 * @author Pablo
 * 
 * @struts.action
 *  path = "/showpaymentlist"
 *  validate = "false";
 *  
 *  @struts.action-forward
 *     name = "success"
 *     path = "/paydmentList.jsp"  
 *     
 * @struts.action-forward
 *     name = "info"
 *     path = "/paydmentInfo.jsp" 	     
 */

public class ShowPaymentsAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
		
		
		InitialContext ic = new InitialContext();
		PaymentFormInterface pfi =  (PaymentFormInterface) ic.lookup("pykasu/PaymentFormManager/local");

		List<PaymentForm> list = pfi.getAll(user);
		//voy a filtrar aca simplemente para que no pierda la semantica del getAll
		List<PaymentForm> availPaymentForms = new ArrayList<PaymentForm>();
		for(PaymentForm pf : list){
			// se muestran solo los pagos que no están en estado de ERROR
			if(!PaymentFormInterface.PAYMENT_FORM_ERROR.equalsIgnoreCase(pf.getStatus()))
				availPaymentForms.add(pf);
		}
		//--
		request.setAttribute("payments", availPaymentForms);
		return mapping.findForward("success");
	}
	
}
