package py.com.roshka.pykasu.web.actions;

import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.exceptions.HBUpdateException;
import py.com.roshka.pykasu.interfaces.PaymentFormInterface;
import py.com.roshka.pykasu.interfaces.RaffleTicketManager;
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.raffle.RaffleTicket;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.util.Utils;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.forms.PaymentFormWeb;
import py.com.roshka.pykasu.web.util.HBAccountV2;
import py.com.roshka.pykasu.web.util.HomeBankingItfV2;

/**
 * 
 * @author Pablo
 *
 * @struts.action
 *  path = "/paydment"
 *  input = "/paydment.jsp"
 *  name = "PaymentFormWeb"
 *  validate = "false";
 *  
 *  @struts.action-forward
 *     name = "success"
 *     path = "/index.jsp"   
 *
 *  @struts.action-forward
 *     name = "error"
 *     path = "/index.jsp" 	
 * 
 * */

public class PaymentFormAction extends Action {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(PaymentFormAction.class);
	
	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * 1. Hay que guardar el formulario
		 * 2. Hay que consultar si tiene saldo.
		 * 2.1 No tiene saldo, se le avisa.
		 * 2.2 Tiene Saldo, entonces se intenta retirar el dinero.
		 * 2.2.1 Ocurri� un error, por tanto se le avisa al usaurio
		 * 2.2.2 Se pudo hacer la extracci�n, se guarda en la db el nuevo estado
		 * 
		 */
		try{
			logger.debug(">>>>>>>>>>  PaymentAccionExecute");
			PaymentFormWeb pfw = (PaymentFormWeb) form;
			//logger.debug("PFW: SavingAccountNr -> " + pfw.getSavingAccountNr());
			logger.debug("\n----- Formulario a guardarse : -----" + pfw + "\n------ FIN Formulario a guardarse -----" );
			//guardar el formulario en DB.
			// "pykasu/PaymentFormManager/local"
			User user = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
			InitialContext ic = new InitialContext();
			PaymentFormInterface pfi =  (PaymentFormInterface) ic.lookup("pykasu/PaymentFormManager/local");
			PaymentForm pf = new PaymentForm();

			pf.setRuc(pfw.getRuc());
			pf.setDv(pfw.getDv());
			pf.setFname(pfw.getFirstLastName());
			
			pf.setFiscalPeriodMonth(pfw.getMonth()); //ImpPdoMes
			pf.setFiscalPeriodYear(pfw.getYear());//ImpPdoAmo
			
			pf.setObligation(pfw.getObligationTax());//ImpTpoImp
			pf.setResolution(pfw.getResolutionNr());//ImpNroRes
			
			pf.setPaymentAmount(new Double(pfw.getAmount()));
			
			pfi.savePayment(pf, user);
			
			//descuenta el monto de la cuenta
			boolean makeEPaid = false;
			Double paymentAmount = Double.parseDouble(pfw.getAmount().toString());
			if(user.getPaymentAvaliable().booleanValue()){
				paymentAmount = 0.0;
				HomeBankingItfV2 hbi = (HomeBankingItfV2) request.getSession().getAttribute("homeBanking");
				List<HBAccountV2> hbAccounts = (List<HBAccountV2>) request.getSession().getAttribute("accounts");
				makeEPaid = true;
				for(HBAccountV2 account : hbAccounts){
					//por cada cuenta, veo si el usuario cargo un monto valido
					String sPaidAmount = request.getParameter("paid_amount_"+ account.getNumber());
					if(sPaidAmount != null && sPaidAmount.length() > 0){
						Double paidAmount = Double.parseDouble(sPaidAmount);
						try{
							hbi.performPayment(account, paidAmount, pf.getId());
							paymentAmount = paymentAmount + paidAmount;
						}catch (HBUpdateException e) {
							logger.error("No se pudo realizar el pago en el WS",e);	
						}
					}
				}
				pf.setPaymentAmount(paymentAmount);
				hbi.registerPayment(pf);
			}

			request.setAttribute("showAccount",user.getPaymentAvaliable());
			
			try{
				pf.setStatus("FINISHED");
			}catch(Exception e){
				logger.warn("Payment "+ pf.getId() +" Debitado pero en estado BEGIN todavia" + e.getMessage() + "\n" + e);
				//aca se puede hacer un mapping o enviar un correo a alguien para que vea esto
			}
			
			String msg = "El PAGO se ha realizado EXITOSAMENTE  por el monto de: " + paymentAmount;
			
			
			//si es cliente y usa pagos electronicos, se le generan los cupones
            RaffleTicketManager raffleTicketManager = null;
            raffleTicketManager = (RaffleTicketManager) ic.lookup("pykasu/RaffleTicketManager/local");

			if(makeEPaid && Utils.isRaffleTime(new java.util.Date(System.currentTimeMillis())) &&  user.getBusinessCompany().getClient().booleanValue()){
				RaffleTicket tkt1 = raffleTicketManager.generateTicket(user);
				RaffleTicket tkt2 = raffleTicketManager.generateTicket(user);
				msg = msg + " - Tiene 2 cupones, cuyos n�meros son: "+tkt1.getId()+ " y "+ tkt2.getId()+", a su nombre para el sorteo electr�nico de 5 notebook con internet movil gratis por 1 a�o.";
			}
			
			request.setAttribute(Globals.MESSAGE,msg);
			return mapping.findForward("success");
		
			
		}catch (Exception e){
			logger.error("Error to Save PaymentForm !",e);
			e.printStackTrace();
			request.getSession().setAttribute("errorMessage", e.getMessage());
			return mapping.findForward("error");
		}
        
		
	}
	
}
