package py.com.roshka.pykasu.web.util;

import java.io.IOException;
import java.io.Serializable;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.text.DecimalFormat;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

import javax.xml.rpc.ServiceException;

import py.com.roshka.pykasu.exceptions.HBGenericException;
import py.com.roshka.pykasu.exceptions.HBQueryException;
import py.com.roshka.pykasu.exceptions.HBUpdateException;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.util.Globals;
import wservision.SdtImpuestosItem;
import wservision.SdtRespuestas;
import wservision.SegVision;
import wservision.WsimpuestosExecute;
import wservision.WsimpuestosExecuteResponse;
import wservision.WsimpuestosLocator;
import wservision.WsimpuestosSoapPort;

@Deprecated
public class HomeBankingItf implements Serializable{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(HomeBankingItf.class);
	
	private User user;
	private WsimpuestosSoapPort wsImpSoapPort;
	private WsimpuestosExecute wsie;
	private WsimpuestosExecuteResponse wsResponse;
	
	public HomeBankingItf(User user) throws HBGenericException {
		//aca se puede / debe manejar toda la parte de auditar y loguear
		//tb se debe crear el SegVision para este usuario.
		this.user = user;		
		logger.info("Creating HomeBankingItf");
		logger.info("User: " + user.getUserName() + " with Document:" + user.getDocumentNumber());	
		
		SegVision segVision = null;
		SdtImpuestosItem[] accounts = null;
		SdtRespuestas responses = null;		

    	URL url = null;
		try {
			//url = new URL("http://10.2.1.39:8080/wservision/servlet/awsimpuestos");
			ClassLoader cl = getClass().getClassLoader();
			Properties properties = new Properties();
			//properties.load(cl.getResourceAsStream(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES));;
			URL urlp = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(urlp.openStream());;

			url = new URL(properties.getProperty("WS_PAYMENT_URL"));
			logger.info("Get locator from url: " + url.toString());			
			WsimpuestosLocator wsImpLocator = new WsimpuestosLocator();
			logger.info("Locator available!");
			
			logger.info("Getting port ");
			wsImpSoapPort =	wsImpLocator.getwsimpuestosSoapPort(url);
			logger.info("Port available!");
			
			segVision = new SegVision();
			segVision.setUsrCod("VISION");//aca se va a poner el usuario "duro"
			segVision.setUsrClv("VISION");
			segVision.setUsrTDoc("CI");
			DecimalFormat df = new DecimalFormat("000000000000000");
			segVision.setUsrDoc(df.format(Double.parseDouble(user.getDocumentNumber())));

			segVision.setUsrServ((short)7); //7 es el numero que identifica a los Formularios Impositivos
			segVision.setUsrIp("");
			segVision.setUsrWrkSt("");

			wsie = new WsimpuestosExecute();
			
			accounts = new SdtImpuestosItem[0];
			
			responses = new SdtRespuestas();
			responses.setRespDesc("");
			responses.setRespObs("");

			
			wsie = new WsimpuestosExecute();

			wsie.setSegvision(segVision);
			wsie.setSdtimpuestos(accounts);
			wsie.setSdtrespuestas(responses);
			
			logger.info("End of creating HomeBankingItf");
		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw new HBGenericException(e.getMessage());
		} catch (ServiceException e) {
			e.printStackTrace();
			throw new HBGenericException(e.getMessage());			
		} catch (IOException e) {
			e.printStackTrace();
			throw new HBGenericException(e.getMessage());	
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public Set<HBAccount> getAccunts() throws HBQueryException{
		
		logger.info("Attemp to get account to " + user.getUserName() + " with document "+ user.getDocumentNumber());
		logger.info("Before to setting UsrTipo to 'C'");
		wsie.getSegvision().setUsrTipo("C");
		wsie.setSdtimpuestos(new SdtImpuestosItem[0]);

		try {
			logger.info("Before to execute wsExcecute");
			wsExcecute();
			logger.info("After to execute wsExcecute");
		} catch (HBGenericException e) {
			e.printStackTrace();
			throw new HBQueryException(e);
		}

		logger.info("Get a response code: " + wsResponse.getSdtrespuestas().getRespCod());
		
		if(wsResponse.getSdtrespuestas().getRespCod() != (short)0){
			logger.error(wsResponse.getSdtrespuestas().getRespDesc() + wsResponse.getSdtrespuestas().getRespObs());
			return null;
		}
		
		Set<HBAccount> hbAccounts = new HashSet();
		for(int i=0; i<wsResponse.getSdtimpuestos().length; i++){
			hbAccounts.add(
					new HBAccount(wsResponse.getSdtimpuestos()[i].getImpCtaNro(), 
						    wsResponse.getSdtimpuestos()[i].getImpCtaSdo())		
			);
		}
		
		return hbAccounts;
	}
	 
	public HBAccount performPayment(String ruc,
									String obligationTax,
									String resolutionNr,
									String accountNr, 
									double amountToPaydment,
									Integer month,
									Integer year)
		throws HBUpdateException
	{ 
		
		
		
		logger.info("Setting segVision UsrTipo to 'A'");
	 	try {
	 		wsResponse.getSegvision().setUsrTipo("A");

	 		int i = getAccount(accountNr);
			wsResponse.getSdtimpuestos()[i].setImpMonto(amountToPaydment);
			wsResponse.getSdtimpuestos()[i].setImpTpoImp(obligationTax);
			if(resolutionNr != null && !resolutionNr.trim().equalsIgnoreCase("")){
				wsResponse.getSdtimpuestos()[i].setImpNroRes(new Long(Integer.parseInt(resolutionNr)));
			}
			wsResponse.getSdtimpuestos()[i].setImpNroDoc(ruc);
			
			if(month != null)
				wsResponse.getSdtimpuestos()[i].setImpPdoMes(month.byteValue());
			
			if(year != null)
				wsResponse.getSdtimpuestos()[i].setImpPdoAmo(year.shortValue());
			
			wsie.setSegvision(wsResponse.getSegvision());
			wsie.setSdtimpuestos(wsResponse.getSdtimpuestos());

			wsExcecute();
			SdtImpuestosItem sii = wsResponse.getSdtimpuestos()[getAccount(accountNr)];
			return new HBAccount(sii.getImpCtaNro(), sii.getImpCtaSdo() - sii.getImpMonto());
	 	} catch (HBGenericException e) {
			e.printStackTrace();
			throw new HBUpdateException();
		} 
	 	
	}
	
	private int getAccount(String accountNr) throws HBGenericException{
		int i = 0;
	 	long account = Long.parseLong(accountNr);
		while(wsResponse.getSdtimpuestos()[i].getImpCtaNro() != account){
			i ++;
		}
		return i;
	}
	
	private void wsExcecute() throws HBGenericException{
		try {
			logger.info(">>>>>>>>> Going to Invoque WS");
			logger.info("segVeision: \n" + wsie.getSegvision());
			for(int i=0; i< wsie.getSdtimpuestos().length; i++){
				logger.info("sdtImpuestos: \n" + wsie.getSdtimpuestos()[i]);
			}
			logger.info("sdtRespuestas: \n" + wsie.getSdtrespuestas());
			
			wsResponse = wsImpSoapPort.execute(wsie);
			
			logger.info(">>>>>>>>> WS Response");
			logger.info("segVeision: \n" + wsResponse.getSegvision());
			for(int i=0; i< wsResponse.getSdtimpuestos().length; i++){
				logger.info("sdtImpuestos: \n" + wsResponse.getSdtimpuestos()[i]);
			}
			logger.info("sdtRespuestas: \n" + wsResponse.getSdtrespuestas());
			logger.info(">>>>>>>>> End of WS Response");

		
		} catch (RemoteException e){
			e.printStackTrace();
			//return null;
			throw new HBGenericException("Error al intentar conectar al Web Service. Verificar la Conexión "+e);	
		}
	}
		
	
}
