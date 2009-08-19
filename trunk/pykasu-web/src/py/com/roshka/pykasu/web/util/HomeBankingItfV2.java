package py.com.roshka.pykasu.web.util;

import java.io.IOException;
import java.io.Serializable;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.xml.rpc.ServiceException;

import com.sun.org.apache.bcel.internal.generic.ACONST_NULL;

import cc_services.CTACTE_WSExecute;
import cc_services.CTACTE_WSExecuteResponse;
import cc_services.CTACTE_WSLocator;
import cc_services.CTACTE_WSSoapPort;
import cc_services.Ctacta_in;
import cc_services.Ctacte_salExecute;
import cc_services.Ctacte_salExecuteResponse;
import cc_services.Ctacte_salLocator;
import cc_services.Ctacte_salSoapPort;
import cc_services.Serv_sal_in;

import py.com.roshka.pykasu.exceptions.HBGenericException;
import py.com.roshka.pykasu.exceptions.HBQueryException;
import py.com.roshka.pykasu.exceptions.HBUpdateException;
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.users.User;
import services.Liqui_in;
import services.Ser03_in;
import services.Serv_ahorroExecute;
import services.Serv_ahorroExecuteResponse;
import services.Serv_ahorroLocator;
import services.Serv_ahorroSoapPort;
import services.WsliquidacionExecute;
import services.WsliquidacionLocator;
import services.WsliquidacionSoapPort;


public class HomeBankingItfV2 implements Serializable{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(HomeBankingItfV2.class);
	
	private static final int WS_RESPONSE_OK = 0;
	
	private User user;
	
	Properties properties = null;
	
	private URL queryAccountURL = null;
	private URL paymentCheckingAccountURL = null;
	private URL paymentSavingAccountURL = null;
	private URL savePaymentURL = null;
	
	public HomeBankingItfV2(User user) throws HBGenericException {

		this.user = user;		
		logger.info("Creating HomeBankingItfV2");
		logger.debug("User: " + user.getUserName() + " with Document:" + user.getDocumentNumber());	

		try {
			ClassLoader cl = getClass().getClassLoader();
			properties = new Properties();
			//properties.load(cl.getResourceAsStream(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES));;
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());;
			
			queryAccountURL = new URL(properties.getProperty("WS_QUERY_ACCOUNT_URL"));
			logger.info("WS_QUERY_ACCOUNT_URL: " + queryAccountURL.getPath());
			
			paymentSavingAccountURL   = new URL(properties.getProperty("WS_PAYMENT_SAVING_ACCOUNT_URL"));
			logger.info("WS_PAYMENT_SAVING_ACCOUNT_URL: " + paymentSavingAccountURL.getPath());
			
			paymentCheckingAccountURL = new URL(properties.getProperty("WS_PAYMENT_CHECKING_ACCOUNT_URL"));
			logger.info("WS_PAYMENT_CHECKING_ACCOUNT_URL: " + paymentCheckingAccountURL.getPath());

			savePaymentURL = new URL(properties.getProperty("WS_PAYMENT_SAVE_PAYMENT_URL"));
			logger.info("WS_PAYMENT_SAVE_PAYMENT_URL: " + savePaymentURL.getPath());

			logger.debug("End of creating HomeBankingItf");
		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw new HBGenericException(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			throw new HBGenericException(e.getMessage());	
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<HBAccountV2> getAccunts() throws HBQueryException{
		
		logger.info("Attemp to get account to " + user.getUserName() + " with document "+ user.getDocumentNumber());
				
		try {
			List<HBAccountV2> hbAccounts = new ArrayList<HBAccountV2>();
			Ctacte_salLocator queryAccountsLocator = new Ctacte_salLocator();
			Ctacte_salSoapPort queryAccountsPort = queryAccountsLocator.getctacte_salSoapPort(queryAccountURL);
			
			Ctacte_salExecute qryParams = new Ctacte_salExecute();
			Serv_sal_in serviceSalInput = new Serv_sal_in();
			serviceSalInput.setTipo_Doc("CI");
			serviceSalInput.setNumeroDoc(user.getDocumentNumber());
			serviceSalInput.setServicio((byte)1);
			serviceSalInput.setNum_Servicio((byte)7);
			
			qryParams.setSdt_in(serviceSalInput);
			Ctacte_salExecuteResponse queryAccounts = queryAccountsPort.execute(qryParams);
			logger.debug("Amount accounts: " + queryAccounts.getSdt().getItems().length);
			for(int i=0; i< queryAccounts.getSdt().getItems().length; i++ ){
				hbAccounts.add(new HBAccountV2(
						String.valueOf(queryAccounts.getSdt().getItems()[i].getNumero()),
						queryAccounts.getSdt().getItems()[i].getCuenta(),
						queryAccounts.getSdt().getItems()[i].getDisponible(),						
						queryAccounts.getSdt().getItems()[i].getConfirmar(),
						queryAccounts.getSdt().getItems()[i].getSobregiro(),
						queryAccounts.getSdt().getItems()[i].getMoneda()
						
					));
			}
				
			//System.out.println(queryAccounts.getSdt().getItems()[1].getNumero());
			
			return hbAccounts;
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error al consumir el WebServices",e);
			throw new HBQueryException(e.getMessage());
		} 
		
		
		

	}
	 
	public void performPayment(HBAccountV2 account, Double amount, Integer transaccionNumber) throws HBUpdateException{
		logger.info("  VOY A PAGAR: " + account.getNumber() + " - Tipo: "+account.getAccountType() + " la suma de: " + amount.doubleValue());

		
		try {
			if(account.getType() == HBAccountV2.HBAccountV2Type.SAVING_ACCOUNT){
				Serv_ahorroLocator savingLocator = new Serv_ahorroLocator();
				Serv_ahorroSoapPort savingPort =  savingLocator.getserv_ahorroSoapPort(paymentSavingAccountURL);
				Serv_ahorroExecute parameters = new Serv_ahorroExecute();
				Ser03_in saving = new Ser03_in();
				saving.setUsuario(properties.getProperty("WS_USER", "tributos"));
				saving.setCuenta(Integer.parseInt(account.getNumber()));
				saving.setMonto(amount.doubleValue());
				saving.setMovimiento((short) Integer.parseInt(properties.getProperty("WS_SAVING_MOVIMENT", "2001")));
				saving.setComprobante(transaccionNumber);
				saving.setTipMovimiento(properties.getProperty("WS_SAVING_MOVIMENT_TYPE", "D"));
				saving.setOrigen((byte)Integer.parseInt(properties.getProperty("WS_SAVING_ORIGIN", "18")));
				saving.setMoneda(account.getMoneyCode());
				parameters.setSdt_in(saving);
				
				Serv_ahorroExecuteResponse response = savingPort.execute(parameters);
				
				if(response.getSdt_out().getErrorCod() != WS_RESPONSE_OK){
					throw new HBUpdateException(response.getSdt_out().getErrorMensaje());
				}

			}else if(account.getType() == HBAccountV2.HBAccountV2Type.CHECKING_ACCOUNT){
				CTACTE_WSLocator checkingLocator = new CTACTE_WSLocator();
				CTACTE_WSSoapPort  checkingPort  = checkingLocator.getCTACTE_WSSoapPort(paymentCheckingAccountURL);
				CTACTE_WSExecute params = new CTACTE_WSExecute();
				Ctacta_in checking = new Ctacta_in();
				checking.setUsuario(properties.getProperty("WS_USER", "tributos"));
				checking.setCuenta(Integer.parseInt(account.getNumber()));
				checking.setImpEfectivo(amount.doubleValue());
				checking.setImpTotal(amount.doubleValue());
				checking.setMovimiento((short) Integer.parseInt(properties.getProperty("WS_CHECKING_MOVIMENT", "20513")));
				checking.setComprobante(transaccionNumber);
				checking.setFecha(new Date(System.currentTimeMillis()));
				checking.setMoneda(account.getMoneyCode());
				
				params.setCtacte_in(checking);
				CTACTE_WSExecuteResponse response = checkingPort.execute(params);
				if(response.getCtacte_out().getErrorCod() != WS_RESPONSE_OK){
					throw new HBUpdateException(response.getCtacte_out().getMensaje());
				}
			
			}else{
				throw new HBUpdateException("El tipo de cuenta " + account.getType().toString() + " no se puede procesar.");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			logger.error("Error al consumir el WebServices",e);
			throw new HBUpdateException(e.getMessage());
		} catch (RemoteException e) {
			e.printStackTrace();
			logger.error("Error al consumir el WebServices",e);
			throw new HBUpdateException(e.getMessage());
		}

		
	}

	
	public void registerPayment(PaymentForm pf) throws HBUpdateException{
		try {
			logger.info("Realizando pago: " + pf);
			WsliquidacionLocator liqLocator = new WsliquidacionLocator();
			WsliquidacionSoapPort liqPort = liqLocator.getwsliquidacionSoapPort(savePaymentURL);
			
			logger.debug("Creando liquidacion");
			Liqui_in liquidacion = new Liqui_in();
			logger.debug("Asignando usuario: " + properties.getProperty("WS_USER_PAGO_LIQ", "tributos"));
			liquidacion.setUsuario(properties.getProperty("WS_USER_PAGO_LIQ", "tributos"));
			logger.debug("Asignando ruc: " + pf.getRuc());
			liquidacion.setNumero_Ruc(pf.getRuc());
			logger.debug("Asignando monto a pagar: " + pf.getPaymentAmount());			
			liquidacion.setMonto(pf.getPaymentAmount());
			logger.debug("Asignando tipo de importe: " + pf.getObligation());
			if(pf.getObligation() != null){
				liquidacion.setTp_Importe((short)Integer.parseInt(pf.getObligation()));
			}
			logger.debug("Asignando periodo fiscal: " + pf.getFiscalPeriod());			
			liquidacion.setPeriodo(pf.getFiscalPeriod());			
			if(pf.getResolution()!= null){
				logger.debug("Asignando resolucion: " + Integer.parseInt(pf.getResolution()));
				liquidacion.setResolucion(Integer.parseInt(pf.getResolution()));
			}

			logger.debug("Creando y estableciendo parametros");
			WsliquidacionExecute parameters = new WsliquidacionExecute();
			parameters.setLiquidacion(liquidacion);
			logger.debug("Ejecutando pago");
			liqPort.execute(parameters);
			
			logger.info("Finalizo el PAGO");
			
		} catch (ServiceException e) {
			e.printStackTrace();
			logger.error("Error al consumir el WebServices",e);
			throw new HBUpdateException(e.getMessage());
		} catch (RemoteException e) {
			e.printStackTrace();
			logger.error("Error al consumir el WebServices",e);
			throw new HBUpdateException(e.getMessage());
		}
		
	}
	
	
}
