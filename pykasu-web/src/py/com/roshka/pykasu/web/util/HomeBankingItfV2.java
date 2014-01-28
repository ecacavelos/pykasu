package py.com.roshka.pykasu.web.util;

import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.xml.rpc.ServiceException;

import com.sun.org.apache.bcel.internal.generic.ACONST_NULL;

import py.com.roshka.pykasu.exceptions.HBGenericException;
import py.com.roshka.pykasu.exceptions.HBQueryException;
import py.com.roshka.pykasu.exceptions.HBUpdateException;
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.users.User;
import services.Liqui_in;
import services.WsliquidacionExecute;
import services.WsliquidacionLocator;
import services.WsliquidacionSoapPort;
import wservision.WsimpuestosExecute;
import wservision.WsimpuestosLocator;
import wservision.WsimpuestosSoapPort;
import cc_services.Ctacte_salExecute;
import cc_services.Ctacte_salExecuteResponse;
import cc_services.Ctacte_salLocator;
import cc_services.Ctacte_salSoapPort;
import cc_services.Serv_sal_in;


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
		logger.info("User: " + user.getUserName() + " with Document:" + user.getDocumentNumber());	

		try {
			ClassLoader cl = getClass().getClassLoader();
			properties = new Properties();
			//properties.load(cl.getResourceAsStream(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES));;
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());;
			
			queryAccountURL = new URL(properties.getProperty("WS_QUERY_ACCOUNT_URL"));
			logger.info("WS_QUERY_ACCOUNT_URL: " + queryAccountURL.getPath());
// deprecado por SP desde el 2009-11-23			
//			paymentSavingAccountURL   = new URL(properties.getProperty("WS_PAYMENT_SAVING_ACCOUNT_URL"));
//			logger.info("WS_PAYMENT_SAVING_ACCOUNT_URL: " + paymentSavingAccountURL.getPath());
//			
//			paymentCheckingAccountURL = new URL(properties.getProperty("WS_PAYMENT_CHECKING_ACCOUNT_URL"));
//			logger.info("WS_PAYMENT_CHECKING_ACCOUNT_URL: " + paymentCheckingAccountURL.getPath());
//
			savePaymentURL = new URL(properties.getProperty("WS_PAYMENT_SAVE_PAYMENT_URL"));
			logger.info("WS_PAYMENT_SAVE_PAYMENT_URL: " + savePaymentURL.getPath());

			logger.info("End of creating HomeBankingItf");
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
		Connection conn = null;		
		CallableStatement stmt = null;
		List<HBAccountV2> hbAccounts = new ArrayList<HBAccountV2>();
		try {			
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:PykasuDS");
			conn = ds.getConnection();
			
			String lib = properties.getProperty("SP_OBTENER_CUENTAS_LIB","GXCP003");			
			String sql = "{ CALL "+lib+".Acc_sal(?, ?, ?, ?, ?) } ";
			logger.info("---------------------");			
			logger.info(sql);
			stmt = conn.prepareCall(sql);
			logger.info("---------------------");
			
			logger.info("Parametro 1: CI");
			logger.info("Parametro 2: " + user.getDocumentNumber());
			logger.info("Parametro 3: " + 1);
			logger.info("Parametro 4: " + 7);
			logger.info("Parametro 5:  -- Parametro de Salida");

			stmt.registerOutParameter(1, Types.CHAR);
			stmt.registerOutParameter(2, Types.CHAR);
			stmt.registerOutParameter(3, Types.DECIMAL);
			stmt.registerOutParameter(4, Types.DECIMAL);
			stmt.registerOutParameter(5, Types.CHAR);

			stmt.setString(1, "CI");
			stmt.setString(2, user.getDocumentNumber());
			stmt.setBigDecimal(3, new BigDecimal(1));
			stmt.setBigDecimal(4, new BigDecimal(7));
			stmt.setString(5, "");
			
			stmt.execute();
			
			logger.info("Respuesta del SP: " + stmt.getString(5));
			String respuesta = stmt.getString(5);
//			String respuesta =      "     867360Ahorro a la Vista              0.00            0.00            0.00 6900";
//			respuesta = respuesta + "     867360Ahorro a la Vista              0.00            0.00            0.00 6900";
//			respuesta = respuesta + "     867360Ahorro a la Vista              0.00            0.00            0.00 6900";
//			respuesta = respuesta + "     867360Ahorro a la Vista              0.00            0.00            0.00 6900";
			logger.info("respuesta" + respuesta);
			if(respuesta == null || (respuesta != null && respuesta.length() % 83 != 0)){
				String error = "El mensaje de respuesta no tiene la cantidad correcta de caracteres";
				if(respuesta!= null){
					error = error + " : " + respuesta.length() + " :: " + respuesta;
				}
				logger.error(error);
				throw new HBQueryException("Mensaje mal formado");
			}
			
			int cantCuentas = (int) respuesta.length() / 83; 
			for(int i=0, j=0; i<cantCuentas; i++,j=j+83){
				String datosCuenta = respuesta.substring(j,j+83);
				
				if(datosCuenta == null || datosCuenta.trim() == "" || datosCuenta.trim().length() == 0){
					//ya no vienne m�s datos
					return hbAccounts;
				}
				
				String cuenta 		=  datosCuenta.substring(0 , 11).trim();
				String denominacion =  datosCuenta.substring(11, 30).trim();
				String disponible 	=  datosCuenta.substring(31, 45).trim();
				String sdisponible 	=  datosCuenta.substring(46, 46).trim();
				String confirmar 	=  datosCuenta.substring(47, 61).trim();
				String sconfirmar 	=  datosCuenta.substring(62, 62).trim();
				String sobregiro 	=  datosCuenta.substring(63, 77).trim();
				String ssobregiro 	=  datosCuenta.substring(78, 79).trim();
				String moneda 		=  datosCuenta.substring(79, 83).trim();
				
				logger.info("datosCuenta: " + datosCuenta);
				logger.info("cuenta:" + cuenta);
				logger.info("denominacion:" + denominacion);
				logger.info("disponible:" + disponible);
				logger.info("sdisponible:" + sdisponible);
				logger.info("confirmar:" + confirmar);
				logger.info("sconfirmar:" + sconfirmar);
				logger.info("sobregiro:" + sobregiro);
				logger.info("ssobregiro:" + ssobregiro);
				logger.info("moneda:" + moneda);
				
				Double montoDisponible = Double.parseDouble(sdisponible + disponible); 
				Double montoConfirmar  = Double.parseDouble(sconfirmar + confirmar);
				Double montoSobreGiro  = Double.parseDouble(ssobregiro + sobregiro);
				
				short codigoMoneda = (byte)Integer.parseInt(moneda); 
				
				hbAccounts.add(new HBAccountV2(
						cuenta,
						denominacion,
						montoDisponible,						
						montoConfirmar,
						montoSobreGiro,
						codigoMoneda
					));
				
			}
			return hbAccounts;
			
		} catch (NamingException e) {
			logger.error(e);
			throw new HBQueryException(e.getMessage());
		} catch (SQLException e) {
			logger.error(e);
			throw new HBQueryException(e.getMessage());	
		} catch (HBGenericException e) {
			logger.error(e.getMessage(),e);
			throw new HBQueryException(e.getMessage());
		} finally {
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					logger.error("Error al cerrar la conexion: " , e);					
				}
			}
		}

		

//		logger.info("Attemp to get account to " + user.getUserName() + " with document "+ user.getDocumentNumber());
//				
//		try {
//			List<HBAccountV2> hbAccounts = new ArrayList<HBAccountV2>();
//			
//			Ctacte_salLocator queryAccountsLocator = new Ctacte_salLocator();
//			Ctacte_salSoapPort queryAccountsPort = queryAccountsLocator.getctacte_salSoapPort(queryAccountURL);
//			
//			Ctacte_salExecute qryParams = new Ctacte_salExecute();
//			Serv_sal_in serviceSalInput = new Serv_sal_in();
//			serviceSalInput.setTipo_Doc("CI");
//			serviceSalInput.setNumeroDoc(user.getDocumentNumber());
//			serviceSalInput.setServicio((byte)1);
//			serviceSalInput.setNum_Servicio((byte)7);
//			
//			qryParams.setSdt_in(serviceSalInput);
//			Ctacte_salExecuteResponse queryAccounts = queryAccountsPort.execute(qryParams);
//			logger.info("Amount accounts: " + queryAccounts.getSdt().getItems().length);
//			for(int i=0; i< queryAccounts.getSdt().getItems().length; i++ ){
//				hbAccounts.add(new HBAccountV2(
//						String.valueOf(queryAccounts.getSdt().getItems()[i].getNumero()),
//						queryAccounts.getSdt().getItems()[i].getCuenta(),
//						queryAccounts.getSdt().getItems()[i].getDisponible(),						
//						queryAccounts.getSdt().getItems()[i].getConfirmar(),
//						queryAccounts.getSdt().getItems()[i].getSobregiro(),
//						queryAccounts.getSdt().getItems()[i].getMoneda()
//						
//					));
//			}
//				
//			//System.out.println(queryAccounts.getSdt().getItems()[1].getNumero());
//			
//			return hbAccounts;
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			logger.error("Error al consumir el WebServices",e);
//			throw new HBQueryException(e.getMessage());
//		} 
//		
		
		

	}
	 
	
//	private void paySavingAccount(Connection conn, HBAccountV2 account, Double amount, Integer transaccionNumber) throws HBUpdateException{
	private void paySavingAccount(Connection conn, HBAccountV2 account, Double amount, PaymentForm pf) throws HBUpdateException{
		CallableStatement stmt = null;
		try{
			int d = 0;
			String lib = properties.getProperty("SP_CAJA_AHORRO_LIB","PROTPGM");
			String sql = "{call "+lib+".AHORGP1(?, ?, ?, ?, ?, ?, ?, ?, ?) } ";
			logger.info("---------------------");			
			logger.info(sql);
			stmt = conn.prepareCall(sql);
			logger.info("---------------------");
	
			//logger y yo somos amigos
			logger.info("Parametro 1"+d+": "+ new BigDecimal(account.getNumber()));
			logger.info("Parametro 2"+d+": "+ new BigDecimal(amount.doubleValue()));
			logger.info("Parametro 3"+d+": "+ properties.getProperty("WS_USER", "tributos"));
			logger.info("Parametro 4"+d+": "+ new BigDecimal(6900));
			logger.info("Parametro 5"+d+": "+ new BigDecimal(Integer.parseInt(properties.getProperty("WS_SAVING_ORIGIN", "18"))));
			logger.info("Parametro 6"+d+": "+ new BigDecimal(Integer.parseInt(properties.getProperty("WS_SAVING_MOVIMENT", "2001"))));
			logger.info("Parametro 7"+d+": "+ properties.getProperty("WS_SAVING_MOVIMENT_TYPE", "D"));
			//logger.info("Parametro 8"+d+": "+ new BigDecimal(transaccionNumber));
			logger.info("Parametro 8"+d+": "+ new BigDecimal(pf.getId()));
			logger.info("Parametro 9"+d+": "+ new BigDecimal(0));
			
			//Los parametros del SP son INOUT, por lo que hay 
			stmt.registerOutParameter(1+d, Types.DECIMAL);
			stmt.registerOutParameter(2+d, Types.DECIMAL);
			stmt.registerOutParameter(3+d, Types.CHAR);
			stmt.registerOutParameter(4+d, Types.DECIMAL);
			stmt.registerOutParameter(5+d, Types.DECIMAL);
			stmt.registerOutParameter(6+d, Types.DECIMAL);
			stmt.registerOutParameter(7+d, Types.CHAR);
			stmt.registerOutParameter(8+d, Types.DECIMAL);
			stmt.registerOutParameter(9+d, Types.DECIMAL);
			
			stmt.setBigDecimal(1+d,new BigDecimal(account.getNumber()));//cuenta
			stmt.setBigDecimal(2+d, new BigDecimal(amount.doubleValue())); //importe
			stmt.setString(3+d, properties.getProperty("WS_USER", "tributos")); //usuario
			stmt.setBigDecimal(4+d, new BigDecimal(6900));
			stmt.setBigDecimal(5+d, new BigDecimal(Integer.parseInt(properties.getProperty("WS_SAVING_ORIGIN", "18"))));				
			stmt.setBigDecimal(6+d, new BigDecimal(Integer.parseInt(properties.getProperty("WS_SAVING_MOVIMENT", "2001"))));
			stmt.setString(7+d, properties.getProperty("WS_SAVING_MOVIMENT_TYPE", "D"));
			//stmt.setBigDecimal(8+d, new BigDecimal(transaccionNumber));
			stmt.setBigDecimal(8+d, new BigDecimal(pf.getId()));
			stmt.setBigDecimal(9+d, new BigDecimal(0));
			
			stmt.setQueryTimeout(10);
			
			
			stmt.execute();
			logger.info("El valor de retorno: " + stmt.getBigDecimal(9+d));	
	
			if(stmt.getBigDecimal(9) == null || stmt.getBigDecimal(9).intValue() != 0){				
				throw new HBUpdateException("Codigo de respuesta devuelto: " + stmt.getBigDecimal(9));
			}
			
			registerPayment(conn, pf, Integer.parseInt(account.getNumber()), amount);
			
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
			throw new HBUpdateException(e.getMessage(),e);
		}
		
	}
	
//	private void payChekingAccount(Connection conn, HBAccountV2 account, Double amount, Integer transaccionNumber) throws HBUpdateException{	
	private void payChekingAccount(Connection conn, HBAccountV2 account, Double amount, PaymentForm pf) throws HBUpdateException{
		CallableStatement stmt = null;
		try{
			String lib = properties.getProperty("SP_CUENTA_CORRIENTE_LIB","\"VSAF.LIB\"");			
			String sql = "{ CALL "+lib+".ACCP247B(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) } ";
			logger.info("---------------------");			
			logger.info(sql);
			stmt = conn.prepareCall(sql);
			logger.info("---------------------");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HH:mm:ss");
			Calendar cld = Calendar.getInstance();
			String fechahora = sdf.format(cld.getTime());
			String[] timestamp = fechahora.split("-");

			logger.info("Parametro 1: 0");
			logger.info("Parametro 2: " + new BigDecimal(amount.intValue()));
			logger.info("Parametro 3: NULL");
			logger.info("Parametro 4: " + properties.getProperty("WS_CHECKING_MOVIMENT", "20513"));
			logger.info("Parametro 5: " + account.getNumber());
			logger.info("Parametro 6: 'D'");
			logger.info("Parametro 7: " + properties.getProperty("WS_USER", "tributos"));
			logger.info("Parametro 8: " + properties.getProperty("SP_CAC", "001"));
			logger.info("Parametro 9: " + timestamp[0]);
			logger.info("Parametro 10: " + timestamp[1]);				
			logger.info("Parametro 11: S");
			logger.info("Parametro 12: NULL");
			logger.info("Parametro 13: NULL");
			
			stmt.registerOutParameter(1, Types.DECIMAL);
			stmt.registerOutParameter(2, Types.DECIMAL);
			stmt.registerOutParameter(3, Types.CHAR);
			stmt.registerOutParameter(4, Types.DECIMAL);
			stmt.registerOutParameter(5, Types.DECIMAL);
			stmt.registerOutParameter(6, Types.CHAR);
			stmt.registerOutParameter(7, Types.CHAR);
			stmt.registerOutParameter(8, Types.CHAR);
			stmt.registerOutParameter(9, Types.CHAR);
			stmt.registerOutParameter(10, Types.CHAR);			
			stmt.registerOutParameter(11, Types.CHAR);
			stmt.registerOutParameter(12, Types.CHAR);
			stmt.registerOutParameter(13, Types.CHAR);
			
			stmt.setBigDecimal(1,new BigDecimal(0));//documento
			stmt.setBigDecimal(2, new BigDecimal(amount.intValue())); //importe
			stmt.setString(3,"");//mensaje
			stmt.setBigDecimal(4, new BigDecimal(Integer.parseInt(properties.getProperty("WS_CHECKING_MOVIMENT", "20513"))));//codigo de movimiento
			stmt.setBigDecimal(5, new BigDecimal(Integer.parseInt(account.getNumber()))); //numero de cuenta
			stmt.setString(6, "D");//tipo
			stmt.setString(7, properties.getProperty("WS_USER", "tributos"));
			stmt.setString(8, properties.getProperty("SP_CAC", "001"));
			stmt.setString(9,timestamp[0]);
			stmt.setString(10, timestamp[1]); //hora 18:08:08
			stmt.setString(11, "S");
			stmt.setString(12, "");
			stmt.setString(13, "");
			
			stmt.execute();
			
			logger.info("Respuesta del SP: " + stmt.getString(12));
			String respuesta = stmt.getString(12);
			
			if(respuesta == null || !respuesta.trim().equalsIgnoreCase("00")){
				conn.rollback();
				throw new HBUpdateException("Codigo de respuesta devuelto: " + stmt.getString(12));
			}

			registerPayment(conn, pf, Integer.parseInt(account.getNumber()), amount);
			
			
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
			throw new HBUpdateException(e.getMessage(),e);
		}
		
	}


	
	//public void performPayment(List<HBAccountV2> accounts, Integer transaccionNumber, int accountNbr) throws HBUpdateException{
	public void performPayment(List<HBAccountV2> accounts, PaymentForm pf, int accountNbr) throws HBUpdateException{
		if(accounts == null){
			throw new IllegalArgumentException("La lista de cuentas, no puede ser vacia");
		}
		
		Connection conn = null;		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:PykasuDS");
			conn = ds.getConnection();
			conn.setAutoCommit(false);			
			
			for(HBAccountV2 account : accounts){				
				if(account.getPaymentAmount().intValue() > 0){
					switch (account.getType()) {
						case SAVING_ACCOUNT:
							paySavingAccount(conn, account, account.getPaymentAmount(), pf);
							//paySavingAccount(conn, account, account.getPaymentAmount(), transaccionNumber);
							break;
						case CHECKING_ACCOUNT:
							payChekingAccount(conn, account, account.getPaymentAmount(), pf);
							//payChekingAccount(conn, account, account.getPaymentAmount(), transaccionNumber);
							break;
						default:
							throw new HBUpdateException("El tipo de cuenta " + account.getType().toString() + " no se puede procesar.");
					}
				}
			}
			//registerPayment(conn, pf, accountNbr);
			conn.commit();
			
		} catch (HBUpdateException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				logger.error("Error al realizar el rolback -- ",e1);
				
			}
			throw new HBUpdateException("Ocurrió un error al realizar el pago.", e);
		} catch (NamingException e) {
			logger.error(e);
			throw new HBUpdateException(e.getMessage());
		} catch (SQLException e) {
			logger.error(e);
			throw new HBUpdateException(e.getMessage());	
		} finally {
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					logger.error("Error al cerrar la conexion: " , e);					
				}
			}
		}
		
	}

	@Deprecated
	public void performPayment(HBAccountV2 account, Double amount, Integer transaccionNumber) throws HBUpdateException{
		logger.info("  VOY A PAGAR: " + account.getNumber() + " - Tipo: "+account.getAccountType() + " la suma de: " + amount.doubleValue());

		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:PykasuDS");
			conn = ds.getConnection();
			conn.setAutoCommit(false);			

			switch (account.getType()) {
				case SAVING_ACCOUNT:
//					paySavingAccount(conn, account, account.getPaymentAmount(), transaccionNumber);
					break;
				case CHECKING_ACCOUNT:
//					payChekingAccount(conn, account, account.getPaymentAmount(), transaccionNumber);
					break;
				default:
					throw new HBUpdateException("El tipo de cuenta " + account.getType().toString() + " no se puede procesar.");
			}
			
			
			conn.commit();
			
		} catch (HBUpdateException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				logger.error("Error al realizar el rolback -- ",e1);
				
			}
		} catch (NamingException e) {
			logger.error(e);
			throw new HBUpdateException(e.getMessage());
		} catch (SQLException e) {
			logger.error(e);
			throw new HBUpdateException(e.getMessage());
		} finally {
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					logger.error("Error al cerrar la conexion a base de datos.",e);
				}
			}
		}

		
	}

	private void registerPayment(Connection conn, PaymentForm pf, int account, double amount) throws HBUpdateException{
		CallableStatement stmt = null;
		try{
			int d = 0;
			String lib = properties.getProperty("SP_REGISTRA_DATOS_SET_LIB","PROTPGM");
			String sql = "{call "+lib+". PCAJLI00(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) } ";
//			String sql = "{call "+lib+".ATRILQ00(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) } ";
			logger.info("---------------------");			
			logger.info(sql);
			stmt = conn.prepareCall(sql);
			logger.info("---------------------");

			String resolucion = "0";
			if(pf.getResolution() != null){
				resolucion = pf.getResolution();
			}
			/*Introducido por Esteban Cacavelos. Fecha: 08/03/2013
			 * Problema: Aparente problema con el driver JDBC para db2 en as400
			 * at com.ibm.as400.access.AS400JDBCPreparedStatement.testDataTruncation(AS400JDBCPreparedStatement.java:2890)
	at com.ibm.as400.access.AS400JDBCPreparedStatement.setValue(AS400JDBCPreparedStatement.java:2856)
	at com.ibm.as400.access.AS400JDBCPreparedStatement.setBigDecimal(AS400JDBCPreparedStatement.java:1685)
	at org.jboss.resource.adapter.jdbc.WrappedPreparedStatement.setBigDecimal(WrappedPreparedStatement.java:303)
	at py.com.roshka.pykasu.web.util.HomeBankingItfV2.registerPayment(HomeBankingItfV2.java:572)
			 	OCURRIA CUANDO el nro de resolucion tenia 11 digitos. Se trunco a 10, pero el formulario se guarda igual con los 11 digitos correspondientes
			 	
			 	*/
//			resolucion = resolucion.substring(0, Math.min(resolucion.length(), 10)); 
			

			//logger y yo somos amigos
			String fiscalPeriod = pf.getFiscalPeriod();
			if(fiscalPeriod.equalsIgnoreCase("")){
				fiscalPeriod = "000000";
			}
			
			logger.info("Parametro 1-"+d+": "+ fiscalPeriod);
			logger.info("Parametro 2-"+d+": "+ pf.getRuc());
			logger.info("Parametro 3-"+d+": "+ new BigDecimal(amount));
			if(resolucion != null){
				logger.info("Parametro 4-"+d+": "+ new BigDecimal(resolucion));
			}else{
				resolucion = "";
				logger.info("Parametro 4-"+d+": "+ new BigDecimal(resolucion));
			}
			logger.info("Parametro 5-"+d+": "+ new BigDecimal(pf.getObligation()));
			logger.info("Parametro 6-"+d+": "+ properties.getProperty("WS_USER_PAGO_LIQ", "tributos"));
			logger.info("Parametro 7-"+d+": "+ new BigDecimal(pf.getId()));
			logger.info("Parametro 8-"+d+": "+ new BigDecimal(account));
			logger.info("Parametro 9-"+d+": "+ new BigDecimal(pf.getId()));
			logger.info("Parametro 10-"+d+": -- Parametro de salida ");
			
			//Los parametros del SP son INOUT, por lo que hay 
			stmt.registerOutParameter(1+d, Types.CHAR);
			stmt.registerOutParameter(2+d, Types.CHAR);
			stmt.registerOutParameter(3+d, Types.DECIMAL);
			stmt.registerOutParameter(4+d, Types.DECIMAL);
			stmt.registerOutParameter(5+d, Types.DECIMAL);
			stmt.registerOutParameter(6+d, Types.CHAR);
			stmt.registerOutParameter(7+d, Types.DECIMAL);
			stmt.registerOutParameter(8+d, Types.DECIMAL);
			stmt.registerOutParameter(9+d, Types.DECIMAL);
			stmt.registerOutParameter(10+d, Types.CHAR);
			
			stmt.setString(1+d, fiscalPeriod);//periodo fiscal
			stmt.setString(2+d, pf.getRuc()); //ruc
			stmt.setBigDecimal(3+d, new BigDecimal(amount)); //monto
			stmt.setBigDecimal(4+d, new BigDecimal(resolucion));
			stmt.setBigDecimal(5+d, new BigDecimal(pf.getObligation()));				
			stmt.setString(6+d, properties.getProperty("WS_USER_PAGO_LIQ", "tributos"));
			stmt.setBigDecimal(7+d, new BigDecimal(pf.getId()));
			stmt.setBigDecimal(8+d,  new BigDecimal(account));
			stmt.setBigDecimal(9+d, new BigDecimal(pf.getId()));
			stmt.setString(10+d, "");
			
			stmt.setQueryTimeout(10);
			
			stmt.execute();
//			logger.info("El valor de retorno: " + stmt.getBigDecimal(9+d));	
//	
//			if(stmt.getBigDecimal(9) == null || stmt.getBigDecimal(9).intValue() != 0){				
//				throw new HBUpdateException("Codigo de respuesta devuelto: " + stmt.getBigDecimal(9));
//			}
		}catch (Exception e) {
			logger.error(e.getMessage(),e);			
			throw new HBUpdateException(e.getMessage(),e);
		}
	}
	
	@Deprecated
	public void registerPayment(PaymentForm pf, int account) throws HBUpdateException{
		try {
			logger.info("Realizando pago: " + pf);
			//WsimpuestosLocator liqLocator = new WsimpuestosLocator();
			WsliquidacionLocator liqLocator = new WsliquidacionLocator();
			
			//WsliquidacionLocator liqLocator = new WsliquidacionLocator();
			WsliquidacionSoapPort liqPort =  liqLocator.getwsliquidacionSoapPort(savePaymentURL);
			//WsliquidacionSoapPort liqPort = liqLocator.getwsliquidacionSoapPort(savePaymentURL);
			
			logger.info("Creando liquidacion");
			Liqui_in liquidacion = new Liqui_in();
			
			//Liqui_in liquidacion = new Liqui_in();
			
			
			logger.info("Asignando usuario: " + properties.getProperty("WS_USER_PAGO_LIQ", "tributos"));
			liquidacion.setUsuario(properties.getProperty("WS_USER_PAGO_LIQ", "tributos"));
			logger.info("Asignando ruc: " + pf.getRuc());
			liquidacion.setNumero_Ruc(pf.getRuc());
			logger.info("Asignando monto a pagar: " + pf.getPaymentAmount());			
			liquidacion.setMonto(pf.getPaymentAmount());
			logger.info("Asignando tipo de importe: " + pf.getObligation());
			if(pf.getObligation() != null){
				liquidacion.setTp_Importe((short)Integer.parseInt(pf.getObligation()));
			}
			logger.info("Asignando periodo fiscal: " + pf.getFiscalPeriod());			
			liquidacion.setPeriodo(pf.getFiscalPeriod());			
			if(pf.getResolution()!= null){
				logger.info("Asignando resolucion: " + Integer.parseInt(pf.getResolution()));
				liquidacion.setResolucion(Integer.parseInt(pf.getResolution()));
			}
			logger.info("Asignando FormIID: " + pf.getId());
			liquidacion.setFORM_IID(new Long(pf.getId()));
			logger.info("Asignando Comprobante: " + pf.getId());
			liquidacion.setComprobante(pf.getId());
			logger.info("Asignando Cuenta: " + account);
			liquidacion.setCuenta(account);
			
			
			logger.info("Creando y estableciendo parametros");
			WsliquidacionExecute parameters = new WsliquidacionExecute();
			
			//WsliquidacionExecute parameters = new WsliquidacionExecute();
			
			parameters.setLiquidacion(liquidacion);
			logger.info("Ejecutando pago");
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
