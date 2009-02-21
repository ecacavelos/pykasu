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
import py.com.roshka.pykasu.persistence.users.User;
import services.Ser03_in;
import services.Serv_ahorroExecute;
import services.Serv_ahorroExecuteResponse;
import services.Serv_ahorroLocator;
import services.Serv_ahorroSoapPort;


public class HomeBankingItfV2 implements Serializable{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(HomeBankingItfV2.class);
	
	private static final int WS_RESPONSE_OK = 0;
	
	private User user;
	
	Properties properties = null;
	
	private URL queryAccountURL = null;
	private URL paymentCheckingAccountURL = null;
	private URL paymentSavingAccountURL = null;
	
	public HomeBankingItfV2(User user) throws HBGenericException {

		this.user = user;		
		logger.info("Creating HomeBankingItfV2");
		logger.debug("User: " + user.getUserName() + " with Document:" + user.getDocumentNumber());	

		try {
			ClassLoader cl = getClass().getClassLoader();
			properties = new Properties();
			properties.load(cl.getResourceAsStream(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES));;
			
			queryAccountURL = new URL(properties.getProperty("WS_QUERY_ACCOUNT_URL"));
			logger.info("WS_QUERY_ACCOUNT_URL: " + queryAccountURL.getPath());
			
			paymentSavingAccountURL   = new URL(properties.getProperty("WS_PAYMENT_SAVING_ACCOUNT_URL"));
			logger.info("WS_PAYMENT_SAVING_ACCOUNT_URL: " + paymentSavingAccountURL.getPath());
			
			paymentCheckingAccountURL = new URL(properties.getProperty("WS_PAYMENT_CHECKING_ACCOUNT_URL"));
			logger.info("WS_PAYMENT_CHECKING_ACCOUNT_URL: " + paymentCheckingAccountURL.getPath());
			
			
			
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
				throw new HBUpdateException("El tipo de cuenta " + account.getType().toString() + " no es procesable.");
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
//	public HBAccount performPayment(String ruc,
//									String obligationTax,
//									String resolutionNr,
//									String accountNr, 
//									double amountToPaydment,
//									Integer month,
//									Integer year)
//		throws HBUpdateException
//	{ 
//		
//		
//		
//		logger.debug("Setting segVision UsrTipo to 'A'");
//	 	try {
//	 		wsResponse.getSegvision().setUsrTipo("A");
//
//	 		int i = getAccount(accountNr);
//			wsResponse.getSdtimpuestos()[i].setImpMonto(amountToPaydment);
//			wsResponse.getSdtimpuestos()[i].setImpTpoImp(obligationTax);
//			if(resolutionNr != null && !resolutionNr.trim().equalsIgnoreCase("")){
//				wsResponse.getSdtimpuestos()[i].setImpNroRes(new Long(Integer.parseInt(resolutionNr)));
//			}
//			wsResponse.getSdtimpuestos()[i].setImpNroDoc(ruc);
//			
//			if(month != null)
//				wsResponse.getSdtimpuestos()[i].setImpPdoMes(month.byteValue());
//			
//			if(year != null)
//				wsResponse.getSdtimpuestos()[i].setImpPdoAmo(year.shortValue());
//			
//			wsie.setSegvision(wsResponse.getSegvision());
//			wsie.setSdtimpuestos(wsResponse.getSdtimpuestos());
//
//			wsExcecute();
//			SdtImpuestosItem sii = wsResponse.getSdtimpuestos()[getAccount(accountNr)];
//			return new HBAccount(sii.getImpCtaNro(), sii.getImpCtaSdo() - sii.getImpMonto());
//	 	} catch (HBGenericException e) {
//			e.printStackTrace();
//			throw new HBUpdateException();
//		} 
//	 	
//	}
//	
//	private int getAccount(String accountNr) throws HBGenericException{
//		int i = 0;
//	 	long account = Long.parseLong(accountNr);
//		while(wsResponse.getSdtimpuestos()[i].getImpCtaNro() != account){
//			i ++;
//		}
//		return i;
//	}
//	
//	private void wsExcecute() throws HBGenericException{
//		try {
//			logger.debug(">>>>>>>>> Going to Invoque WS");
//			logger.debug("segVeision: \n" + wsie.getSegvision());
//			for(int i=0; i< wsie.getSdtimpuestos().length; i++){
//				logger.debug("sdtImpuestos: \n" + wsie.getSdtimpuestos()[i]);
//			}
//			logger.debug("sdtRespuestas: \n" + wsie.getSdtrespuestas());
//			
//			wsResponse = wsImpSoapPort.execute(wsie);
//			
//			logger.debug(">>>>>>>>> WS Response");
//			logger.debug("segVeision: \n" + wsResponse.getSegvision());
//			for(int i=0; i< wsResponse.getSdtimpuestos().length; i++){
//				logger.debug("sdtImpuestos: \n" + wsResponse.getSdtimpuestos()[i]);
//			}
//			logger.debug("sdtRespuestas: \n" + wsResponse.getSdtrespuestas());
//			logger.debug(">>>>>>>>> End of WS Response");
//
//		
//		} catch (RemoteException e){
//			e.printStackTrace();
//			//return null;
//			throw new HBGenericException("Error al intentar conectar al Web Service. Verificar la Conexión "+e);	
//		}
//	}
		
	
}
