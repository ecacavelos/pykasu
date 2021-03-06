package py.com.roshka.pykasu.web.actions;

import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.PaymentFormInterface;
import py.com.roshka.pykasu.interfaces.RaffleTicketManager;
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;

/**
 * @author Pablo
 * 
 * @struts.action
 *  path = "/showraffleticketlist"
 *  validate = "false";
 *  
 *  @struts.action-forward
 *     name = "success"
 *     path = "/raffleList.jsp"  
 *     
 */

public class ShowRaffleTicketsAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
		
//		if(!user.getPaymentAvaliable().booleanValue()){
//			return mapping.findForward("info");
//		}
		
		InitialContext ic = new InitialContext();
		RaffleTicketManager rtm =  (RaffleTicketManager) ic.lookup("pykasu/RaffleTicketManager/local");

		List list = rtm.getAll(user);
		request.setAttribute("raffleTickets", list);
		return mapping.findForward("success");
	}
	
}
