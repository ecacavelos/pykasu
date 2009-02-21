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
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.forms.PaymentFormWeb;
import py.com.roshka.pykasu.web.util.HBAccount;
import py.com.roshka.pykasu.web.util.HBAccountV2;
import py.com.roshka.pykasu.web.util.HomeBankingItf;
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
 *     path = "/paydmentSucc.jsp"   
 *
 *  @struts.action-forward
 *     name = "error"
 *     path = "/paydmentError.jsp" 	
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
		 * 2.2.1 Ocurrió un error, por tanto se le avisa al usaurio
		 * 2.2.2 Se pudo hacer la extracción, se guarda en la db el nuevo estado
		 * 
		 */
//		InitialContext ic = new InitialContext();
//		PaymentFormInterface paymentMgr = (PaymentFormInterface) ic.lookup("pykasu/PaymentFormManager/local");   
		try{
			//1.  ESTADO -->BEGIN
//			String paymentId = paymentMgr.savePayment( (PaymentFormWeb) form);
			
			//2.2.2
//			paymentMgr.changeStatus(paymentId,PaymentFormInterface.PAYMENT_FORM_FINNISH);
			
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
			
			pf.setSavingAccountNumber(pfw.getSavingAccountNr());
			pf.setPaymentAmount(new Double(pfw.getAmount()));
			
			pfi.savePayment(pf, user);
			
			
			//descuenta el monto de la cuenta
			if(user.getPaymentAvaliable().booleanValue()){
				HomeBankingItfV2 hbi = (HomeBankingItfV2) request.getSession().getAttribute("homeBanking");
				List<HBAccountV2> hbAccounts = (List<HBAccountV2>) request.getSession().getAttribute("accounts");
				for(HBAccountV2 account : hbAccounts){
					//por cada cuenta, veo si el usuario cargo un monto valido
					String sPaidAmount = request.getParameter("paid_amount_"+ account.getNumber());
					if(sPaidAmount != null && sPaidAmount.length() > 0){
						Double paidAmount = Double.parseDouble(sPaidAmount);						
						hbi.performPayment(account, paidAmount, pf.getId());
					}
				}
//20081119 - pw - se implementara HomeBankingItfV2 
//				HomeBankingItf hbi = (HomeBankingItf) request.getSession().getAttribute("homeBanking");
//				HBAccount hbAccount = hbi.performPayment(pfw.getRuc(),
//														 pfw.getObligationTax(),
//														 pfw.getResolutionNr(),
//														 pfw.getSavingAccountNr(), 
//														 pfw.getAmount(),
//														 pfw.getMonth(),
//														 pfw.getYear());
//				request.setAttribute("account", hbAccount);
			}

			request.setAttribute("showAccount",user.getPaymentAvaliable());
			
			
			
			
			try{
				//pfi.changeStatus(pf.getId(),"FINISHED");
				pf.setStatus("FINISHED");
			}catch(Exception e){
				logger.warn("Payment "+ pf.getId() +" Debitado pero en estado BEGIN todavia" + e.getMessage() + "\n" + e);
				//aca se puede hacer un mapping o enviar un correo a alguien para que vea esto
			}
			
			return mapping.findForward("success");
		
			
		}catch (Exception e){
			logger.error("Error to Save PaymentForm !",e);
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			return mapping.findForward("error");
//			throw new PykasuGenericException(e.getMessage());
		}
        
		
	}
	
	
	
	
	
}
