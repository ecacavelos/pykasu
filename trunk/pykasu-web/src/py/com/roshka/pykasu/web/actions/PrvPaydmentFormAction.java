package py.com.roshka.pykasu.web.actions;

import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.exceptions.HBQueryException;
import py.com.roshka.pykasu.interfaces.TaxManager;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;

//import py.com.roshka.pykasu.web.util.HomeBankingItfV3;
import py.com.roshka.pykasu.web.util.HomeBankingItfV2;
import py.com.roshka.pykasu.web.util.LabelValueBean;

/**
 * 
 * @author Pablo
 *
 * @struts.action
 * 		path = "/prvpaydmentform"
 * 
 * @struts.action-forward
 *     name = "success"
 *     path = "/paydment.jsp" 			
 *
 * @struts.action-forward
 *     name = "info"
 *     path = "/paydmentInfo.jsp" 	
 *     		
 *
 */
public class PrvPaydmentFormAction extends Action {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(PrvPaydmentFormAction.class);
	
	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm arg1, HttpServletRequest request, HttpServletResponse arg3) throws Exception {
		
		logger.info("PrvPaydmentFormAction - EXECUTE");
//		HomeBankingItfV3 hbi = null;
		HomeBankingItfV2 hbi = null;
		Properties properties = null;
		try {//TODO:(Mirna)Explicarle a pablo el problema que salia cuando no estaba correcto el n�mero de cedula

			
			properties = new Properties();
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());
			
			InitialContext ic = new InitialContext();
	        TaxManager taxMgr = (TaxManager) ic.lookup("pykasu/TaxesManager/local");   
	
			User user = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
			
	        List taxes = taxMgr.getAllTaxes();
	        request.setAttribute("taxes", taxes);
			
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);	        
	        //int year = 2007; //a pedido de EA segun correo del 06/06/2008  -- 25/07/2008 : EA solicito a trav�s de AW que se indique el a�o actual
			
			ArrayList<LabelValueBean> al = new ArrayList<LabelValueBean>();
			al.add(new LabelValueBean(null, null));
			for(int i=0; i<20; i++,year--){
				al.add(new LabelValueBean(new Integer(year), new Integer(year)));			
			}
			logger.info("years: "+al.size());
			request.setAttribute("years", al);

			if(user.getPaymentAvaliable() == null || !user.getPaymentAvaliable().booleanValue()){
				logger.info("el usuario: "+user.getUserName()+" no tiene tiene habilitado los pagos");
				request.setAttribute("accounts",null);
				//si no tiene habilitada la parte de pagos,
				//entonces se le muestra el procedimiento para que pueda imprimir la boleta
				//la l�gica de esto								
				return mapping.findForward("success");
			}			
			
			if(!Boolean.parseBoolean(properties.getProperty("MODULO_PAGOS", "true"))){
				request.getSession().setAttribute(Globals.MESSAGE_WARNING, "Se ha deshabilitado temporalmente el servicio de Pago de Impuestos utilizando Cuentas Bancarias.");
				return mapping.findForward("success");
			}
			
			if(request.getSession().getAttribute("homeBanking") == null){
				user = (User) request.getSession().getAttribute(Globals.LOGIN_USER);
				
//				hbi = new HomeBankingItfV3(user);
				hbi = new HomeBankingItfV2(user);
				logger.info("Home Bancking Interface created!");
			}else{
//				hbi = (HomeBankingItfV3) request.getSession().getAttribute("homeBanking");
				hbi = (HomeBankingItfV2) request.getSession().getAttribute("homeBanking");
				logger.info("Using existing Home Bancking Interface");
			}
//			if(hbi.getAccounts() != null){
			if(hbi.getAccunts() != null){
//				logger.info("Account is not null!. Size:" + hbi.getAccounts().size());
				logger.info("Account is not null!. Size:" + hbi.getAccunts().size());
//				request.setAttribute("accounts",hbi.getAccounts());
				request.setAttribute("accounts",hbi.getAccunts());
				//coloco en la session la lista de cuentas, de tal manera que a la hora de hacer el pago, se recorran las cuentas y se extraigan los valores de pago ingresados por el usuario
//				request.getSession().setAttribute("accounts",hbi.getAccounts());
				request.getSession().setAttribute("accounts",hbi.getAccunts());
			}else{				
				request.setAttribute("accounts",null);
				logger.warn(">>>>>>>>>>>>>>>>  hbi.getAccunts() is NULL");
			}
	
		} catch(HBQueryException e){
			logger.error(e);
			mapping.findForward("info");
			e.printStackTrace();
		}catch (Exception e) {
			logger.error(e);
			mapping.findForward("info");
			e.printStackTrace();
		}
		logger.info("Putting HomeBankingItf Object in the Session");
		request.getSession().setAttribute("homeBanking",hbi);

		logger.info("Going to mapped 'success'");
		return mapping.findForward("success");
	}
	
	
}
