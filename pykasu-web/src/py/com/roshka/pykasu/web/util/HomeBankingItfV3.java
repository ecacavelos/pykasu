package py.com.roshka.pykasu.web.util;

import java.io.IOException;
import java.io.Serializable;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeConstants;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.namespace.QName;

import py.com.cbi.pykasu.web.ws.cuentas.SdtTriSalIn;
import py.com.cbi.pykasu.web.ws.cuentas.SdtTriSalOutDet;
import py.com.cbi.pykasu.web.ws.cuentas.WsTriSal;
import py.com.cbi.pykasu.web.ws.cuentas.WsTriSalExecute;
import py.com.cbi.pykasu.web.ws.cuentas.WsTriSalExecuteResponse;
import py.com.cbi.pykasu.web.ws.cuentas.WsTriSalSoapPort;
import py.com.cbi.pykasu.web.ws.debitos.ArrayOfSdtTriLiqInDetalle;
import py.com.cbi.pykasu.web.ws.debitos.SdtTriLiqIn;
import py.com.cbi.pykasu.web.ws.debitos.SdtTriLiqInDetalle;
import py.com.cbi.pykasu.web.ws.debitos.WsTriLiq;
import py.com.cbi.pykasu.web.ws.debitos.WsTriLiqExecute;
import py.com.cbi.pykasu.web.ws.debitos.WsTriLiqExecuteResponse;
import py.com.cbi.pykasu.web.ws.debitos.WsTriLiqSoapPort;
import py.com.roshka.pykasu.exceptions.HBGenericException;
import py.com.roshka.pykasu.exceptions.HBQueryException;
import py.com.roshka.pykasu.exceptions.HBUpdateException;
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.users.User;


public class HomeBankingItfV3 implements Serializable{
	

	private static final long serialVersionUID = 1L;

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(HomeBankingItfV3.class);
	
	private User user;
	
	Properties properties = null;
	
	
	public HomeBankingItfV3(User user) throws HBGenericException {

		this.user = user;		
		logger.info("Creating HomeBankingItfV3");
		logger.info("User: " + user.getUserName() + " with Document:" + user.getDocumentNumber());	

		try {
			properties = new Properties();
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());;

		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw new HBGenericException(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			throw new HBGenericException(e.getMessage());	
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<HBAccountV2> getAccounts() throws HBQueryException{
		
		logger.info("Attemp to get account to " + user.getUserName() + " with document "+ user.getDocumentNumber());
		Properties properties = new Properties();
			
		
		try {
			
			
			 URL url_properties = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			 properties.load(url_properties.openStream());
			 URL urlWS= new URL(properties.getProperty("WS_CONSULTA_CUENTAS"));
			 logger.info("\nURL WS CONSULTA DE CUENTAS: " + urlWS.getPath());
			 List<HBAccountV2> hbAccounts = new ArrayList<HBAccountV2>();
			 logger.info("\n Lista de cuentas creada");
			 
			 QName serviceName = new QName("services", "ws_tri_sal");
			 logger.info("\n Qname creado");
			 WsTriSal service = new WsTriSal(urlWS, serviceName);
			 logger.info("\n WsTriSal Creado");
			 WsTriSalSoapPort portType = service.getWsTriSalSoapPort();
			 logger.info("\n WsTriSalSoapPort creado");
			 WsTriSalExecute execute = new WsTriSalExecute();
			 logger.info("\n  WsTriSalExecute creado"); 
			 SdtTriSalIn parametrosEntrada = new SdtTriSalIn();
			 logger.info("\n  SdtTriSalIn creado"); 
			 
			 // PARAMETROS DE ENTRADA. El dato a partir del cual se obtienen las cuentas es el NUMERO DE CEDULA
			 parametrosEntrada.setNroDoc(this.user.getDocumentNumber()); // Nro_Doc
//			 parametrosEntrada.setNroDoc("000000004027322");
			 parametrosEntrada.setServicio((byte)7); //Servicio -> 7-> TRIBUTOS
			 parametrosEntrada.setTipoConsulta((byte)1);//Tipo_Consulta - 1-> TODOS
			 parametrosEntrada.setTipoDoc("CI"); //Tipo_Doc
			 logger.info("\n\nUser: " + this.user.getDocumentNumber());
			 execute.setSdtIn(parametrosEntrada);
			 logger.info("\n  Se consultara el web service para traer cuentas"); 
			 WsTriSalExecuteResponse respuesta =  portType.execute(execute);
			 logger.info("\n  Se ejecuto web service");
			 
			 /**
			  * Manejo de codigos de respuesta
			  * 
			  * */
			 
			// Manejar cada error. Si la respuesta NO es exitosa se debe arrojar la excepcion HBUpdateException - emulando HomeBankingitfV2.
			 if (respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA000")) {// SIN ERROR                                                                       
					logger.info("codigo de retorno: " + respuesta.getSdtOut().getCodigoRetorno() + "mensaje:" + respuesta.getSdtOut().getMensajeRetorno());
			 }
			 if (respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA001") ||
				 respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA002") ||
				 respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA003") ||
				 respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA004") ||
				 respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA005") ||
				 respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA099")) {// ERROR                                                                
					logger.info("codigo de retorno: " + respuesta.getSdtOut().getCodigoRetorno() + "\tmensaje:" + respuesta.getSdtOut().getMensajeRetorno());
					throw new HBUpdateException("Ocurrio un error al recuperar las cuentas" );
			 }
			 
			 //PRIMERA IMPLEMENTACION - NO SE LLEGO A USAR PORQUE ERA INEFICIENTE Y A PARTE NO ESTABA TERMINADA
//			 if (respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA000")) {// SIN ERROR                                                                       
//				logger.info("codigo de retorno: " + respuesta.getSdtOut().getCodigoRetorno() + "mensaje:" + respuesta.getSdtOut().getMensajeRetorno());
//			} else if (respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA001")){//Sin Datos para mostrar!                                                         
//				logger.info("codigo de retorno: " + respuesta.getSdtOut().getCodigoRetorno() + "mensaje:" + respuesta.getSdtOut().getMensajeRetorno());
//			}
//			else if (respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA002")){//El tipo de Documento es incorrecto CI/RUC!  
//				logger.info("codigo de retorno: " + respuesta.getSdtOut().getCodigoRetorno() + "mensaje:" + respuesta.getSdtOut().getMensajeRetorno());
//			}
//			else if (respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA003")){//El Nro de Documento es incorrecto!                                                                                            
//				logger.info("codigo de retorno: " + respuesta.getSdtOut().getCodigoRetorno() + "mensaje:" + respuesta.getSdtOut().getMensajeRetorno());
//			}
//			else if (respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA004")){//Tipo Consulta invalida 0/1!                                                                                                                                                 
//				logger.info("codigo de retorno: " + respuesta.getSdtOut().getCodigoRetorno() + "mensaje:" + respuesta.getSdtOut().getMensajeRetorno());
//			}
//			else if (respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA005")){//Tipo Servicio invalido!                                                                                                                                                                                                      
//				logger.info("codigo de retorno: " + respuesta.getSdtOut().getCodigoRetorno() + "mensaje:" + respuesta.getSdtOut().getMensajeRetorno());
//			} 
//			else if (respuesta.getSdtOut().getCodigoRetorno().equalsIgnoreCase("TRILISA099")){//Indefinido                                                                                                                                                                                                     
//				logger.info("codigo de retorno: " + respuesta.getSdtOut().getCodigoRetorno() + "mensaje:" + respuesta.getSdtOut().getMensajeRetorno());
//			} 

			 
		    
			List<SdtTriSalOutDet> cuentas =  respuesta.getSdtOut().getDetalle().getSdtTriSalOutDet(); // Lista de cuentas
			int cantCuentas  = cuentas.size(); // Cantidad de cuentas

			if (cantCuentas >= 1){ // Debe haber por lo menos una cuenta habilitada
				for (int i = 0 ; i < cantCuentas; i++) {
					int cuenta = cuentas.get(i).getCuenta();
					double disponible = cuentas.get(i).getSaldoDisponible();
					double confirmar = cuentas.get(i).getSaldoConfirmar();
					double sobregiro = cuentas.get(i).getSaldoSobregiro();
					short moneda = cuentas.get(i).getMoneda();
					
					String descripcion = cuentas.get(i).getDescripcion();
					

					logger.info("datosCuenta: " + cuentas.get(i));
					logger.info("cuenta:" + cuenta);
					logger.info("disponible:" + disponible);
					logger.info("confirmar:" + confirmar);
					logger.info("sobregiro:" + sobregiro);
					logger.info("moneda:" + moneda);
					
					hbAccounts.add(new HBAccountV2(String.valueOf(cuenta),descripcion,new Double(disponible),new Double(confirmar),new Double(sobregiro),moneda));

				}
			}
			else{ // No existe ninguna cuenta. 
				
				logger.error("LISTA DE CUENTAS VACIA");
				throw new HBQueryException();
			}
			 
			 return hbAccounts;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error al consumir el WebServices",e);
			throw new HBQueryException("Ocurrio un error al recuperar las cuentas" + e.getMessage());
		}
	}
	 
	
//	private void paySavingAccount(Connection conn, HBAccountV2 account, Double amount, Integer transaccionNumber) throws HBUpdateException{
//	private void paySavingAccount(Connection conn, HBAccountV2 account, Double amount, PaymentForm pf) throws HBUpdateException{
//		CallableStatement stmt = null;
//		try{
//			int d = 0;
//			String lib = properties.getProperty("SP_CAJA_AHORRO_LIB","PROTPGM");
//			String sql = "{call "+lib+".AHORGP1(?, ?, ?, ?, ?, ?, ?, ?, ?) } ";
//			logger.info("---------------------");			
//			logger.info(sql);
//			stmt = conn.prepareCall(sql);
//			logger.info("---------------------");
//	
//			//logger y yo somos amigos
//			logger.info("Parametro 1"+d+": "+ new BigDecimal(account.getNumber()));
//			logger.info("Parametro 2"+d+": "+ new BigDecimal(amount.doubleValue()));
//			logger.info("Parametro 3"+d+": "+ properties.getProperty("WS_USER", "tributos"));
//			logger.info("Parametro 4"+d+": "+ new BigDecimal(6900));
//			logger.info("Parametro 5"+d+": "+ new BigDecimal(Integer.parseInt(properties.getProperty("WS_SAVING_ORIGIN", "18"))));
//			logger.info("Parametro 6"+d+": "+ new BigDecimal(Integer.parseInt(properties.getProperty("WS_SAVING_MOVIMENT", "2001"))));
//			logger.info("Parametro 7"+d+": "+ properties.getProperty("WS_SAVING_MOVIMENT_TYPE", "D"));
//			//logger.info("Parametro 8"+d+": "+ new BigDecimal(transaccionNumber));
//			logger.info("Parametro 8"+d+": "+ new BigDecimal(pf.getId()));
//			logger.info("Parametro 9"+d+": "+ new BigDecimal(0));
//			
//			//Los parametros del SP son INOUT, por lo que hay 
//			stmt.registerOutParameter(1+d, Types.DECIMAL);
//			stmt.registerOutParameter(2+d, Types.DECIMAL);
//			stmt.registerOutParameter(3+d, Types.CHAR);
//			stmt.registerOutParameter(4+d, Types.DECIMAL);
//			stmt.registerOutParameter(5+d, Types.DECIMAL);
//			stmt.registerOutParameter(6+d, Types.DECIMAL);
//			stmt.registerOutParameter(7+d, Types.CHAR);
//			stmt.registerOutParameter(8+d, Types.DECIMAL);
//			stmt.registerOutParameter(9+d, Types.DECIMAL);
//			
//			stmt.setBigDecimal(1+d,new BigDecimal(account.getNumber()));//cuenta
//			stmt.setBigDecimal(2+d, new BigDecimal(amount.doubleValue())); //importe
//			stmt.setString(3+d, properties.getProperty("WS_USER", "tributos")); //usuario
//			stmt.setBigDecimal(4+d, new BigDecimal(6900));
//			stmt.setBigDecimal(5+d, new BigDecimal(Integer.parseInt(properties.getProperty("WS_SAVING_ORIGIN", "18"))));				
//			stmt.setBigDecimal(6+d, new BigDecimal(Integer.parseInt(properties.getProperty("WS_SAVING_MOVIMENT", "2001"))));
//			stmt.setString(7+d, properties.getProperty("WS_SAVING_MOVIMENT_TYPE", "D"));
//			//stmt.setBigDecimal(8+d, new BigDecimal(transaccionNumber));
//			stmt.setBigDecimal(8+d, new BigDecimal(pf.getId()));
//			stmt.setBigDecimal(9+d, new BigDecimal(0));
//			
//			stmt.setQueryTimeout(10);
//			
//			stmt.execute();
//			logger.info("El valor de retorno: " + stmt.getBigDecimal(9+d));	
//	
//			if(stmt.getBigDecimal(9) == null || stmt.getBigDecimal(9).intValue() != 0){				
//				throw new HBUpdateException("Codigo de respuesta devuelto: " + stmt.getBigDecimal(9));
//			}
//			
//			registerPayment(conn, pf, Integer.parseInt(account.getNumber()), amount);
//			
//		}catch (Exception e) {
//			logger.error(e.getMessage(),e);
//			throw new HBUpdateException(e.getMessage(),e);
//		}
//		
//	}
	
//	private void payChekingAccount(Connection conn, HBAccountV2 account, Double amount, Integer transaccionNumber) throws HBUpdateException{	
//	private void payChekingAccount(Connection conn, HBAccountV2 account, Double amount, PaymentForm pf) throws HBUpdateException{
//		CallableStatement stmt = null;
//		try{
//			String lib = properties.getProperty("SP_CUENTA_CORRIENTE_LIB","\"VSAF.LIB\"");			
//			String sql = "{ CALL "+lib+".ACCP247B(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) } ";
//			logger.info("---------------------");			
//			logger.info(sql);
//			stmt = conn.prepareCall(sql);
//			logger.info("---------------------");
//
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HH:mm:ss");
//			Calendar cld = Calendar.getInstance();
//			String fechahora = sdf.format(cld.getTime());
//			String[] timestamp = fechahora.split("-");
//
//			logger.info("Parametro 1: 0");
//			logger.info("Parametro 2: " + new BigDecimal(amount.intValue()));
//			logger.info("Parametro 3: NULL");
//			logger.info("Parametro 4: " + properties.getProperty("WS_CHECKING_MOVIMENT", "20513"));
//			logger.info("Parametro 5: " + account.getNumber());
//			logger.info("Parametro 6: 'D'");
//			logger.info("Parametro 7: " + properties.getProperty("WS_USER", "tributos"));
//			logger.info("Parametro 8: " + properties.getProperty("SP_CAC", "001"));
//			logger.info("Parametro 9: " + timestamp[0]);
//			logger.info("Parametro 10: " + timestamp[1]);				
//			logger.info("Parametro 11: S");
//			logger.info("Parametro 12: NULL");
//			logger.info("Parametro 13: NULL");
//			
//			stmt.registerOutParameter(1, Types.DECIMAL);
//			stmt.registerOutParameter(2, Types.DECIMAL);
//			stmt.registerOutParameter(3, Types.CHAR);
//			stmt.registerOutParameter(4, Types.DECIMAL);
//			stmt.registerOutParameter(5, Types.DECIMAL);
//			stmt.registerOutParameter(6, Types.CHAR);
//			stmt.registerOutParameter(7, Types.CHAR);
//			stmt.registerOutParameter(8, Types.CHAR);
//			stmt.registerOutParameter(9, Types.CHAR);
//			stmt.registerOutParameter(10, Types.CHAR);			
//			stmt.registerOutParameter(11, Types.CHAR);
//			stmt.registerOutParameter(12, Types.CHAR);
//			stmt.registerOutParameter(13, Types.CHAR);
//			
//			stmt.setBigDecimal(1,new BigDecimal(0));//documento
//			stmt.setBigDecimal(2, new BigDecimal(amount.intValue())); //importe
//			stmt.setString(3,"");//mensaje
//			stmt.setBigDecimal(4, new BigDecimal(Integer.parseInt(properties.getProperty("WS_CHECKING_MOVIMENT", "20513"))));//codigo de movimiento
//			stmt.setBigDecimal(5, new BigDecimal(Integer.parseInt(account.getNumber()))); //numero de cuenta
//			stmt.setString(6, "D");//tipo
//			stmt.setString(7, properties.getProperty("WS_USER", "tributos"));
//			stmt.setString(8, properties.getProperty("SP_CAC", "001"));
//			stmt.setString(9,timestamp[0]);
//			stmt.setString(10, timestamp[1]); //hora 18:08:08
//			stmt.setString(11, "S");
//			stmt.setString(12, "");
//			stmt.setString(13, "");
//			
//			stmt.execute();
//			
//			logger.info("Respuesta del SP: " + stmt.getString(12));
//			String respuesta = stmt.getString(12);
//			
//			if(respuesta == null || !respuesta.trim().equalsIgnoreCase("00")){
//				conn.rollback();
//				throw new HBUpdateException("Codigo de respuesta devuelto: " + stmt.getString(12));
//			}
//
//			registerPayment(conn, pf, Integer.parseInt(account.getNumber()), amount);
//			
//			
//		}catch (Exception e) {
//			logger.error(e.getMessage(),e);
//			throw new HBUpdateException(e.getMessage(),e);
//		}
//		
//	}


	
	//public void performPayment(List<HBAccountV2> accounts, Integer transaccionNumber, int accountNbr) throws HBUpdateException{
	public void performPayment(List<HBAccountV2> accounts, PaymentForm pf, int accountNbr) throws DatatypeConfigurationException, HBUpdateException {
		
		 
		Properties properties = new Properties();
			
		try {
			
			 URL url_properties = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			 properties.load(url_properties.openStream());
			 URL urlWS= new URL(properties.getProperty("WS_PAGO_LIQUIDACION"));
			 
			 QName serviceName = new QName("services", "ws_tri_liq");
			 WsTriLiq service = new WsTriLiq(urlWS, serviceName);
			 WsTriLiqSoapPort portType = service.getWsTriLiqSoapPort();
			 WsTriLiqExecute execute = new WsTriLiqExecute(); 
			 SdtTriLiqIn parametrosEntrada = new SdtTriLiqIn();
		
			if (accounts == null) {
				throw new IllegalArgumentException(
						"La lista de cuentas, no puede ser vacia");
			} else {
				// setear todos los parametros de entrada que son propios
				parametrosEntrada.setDocumento(pf.getRuc()); // DOCUMENTO DEL FORM
				parametrosEntrada.setIDFORMULARIO((long) pf.getId()); // ID
																		// FORMULARIO
				parametrosEntrada.setImporteTotal(pf.getPaymentAmount()); // IMPORTE
																			// TOTAL
				parametrosEntrada.setImpuesto(Short.parseShort(pf
						.getObligation())); // obligacion -
				if (pf.getFiscalPeriod().equals("")){// periodo fiscal - esto puede estar o no.
					 
					parametrosEntrada.setPeriodo("00000");
				}
				else{
					parametrosEntrada.setPeriodo(pf.getFiscalPeriod());
				}
				
				if (pf.getResolution() != null) { // Puede ser que este campo este o no.
					if (pf.getResolution().length() > 11)
						throw new IllegalArgumentException("Resolución mayor a 11 dígitos");
					long resolucion = Long.parseLong(pf.getResolution());
					parametrosEntrada.setResolucion(resolucion); 
																
				} else {
					//parametrosEntrada.setResolucion((int)0); // Puede ser que
																// no este
																// seteado este
																// campo
				}

				parametrosEntrada.setUsuario(properties.getProperty("WS_USER_PAGO_LIQ", "tributos"));
				parametrosEntrada.setComprobante(pf.getId());

				// fecha
				GregorianCalendar gcal = new GregorianCalendar();
				XMLGregorianCalendar fec = null;

				fec = DatatypeFactory.newInstance().newXMLGregorianCalendar(
						gcal);

				Calendar cal = Calendar.getInstance();
				Date date = new Date(); // your date
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				cal.setTime(date);
				fec.setYear(cal.get(Calendar.YEAR));
				fec.setMonth(cal.get(Calendar.MONTH)+1);
				fec.setDay(cal.get(Calendar.DAY_OF_MONTH));
				fec.setHour(cal.get(Calendar.HOUR));
				fec.setMinute(cal.get(Calendar.MINUTE));
				fec.setSecond(cal.get(Calendar.SECOND));
				parametrosEntrada.setFechaLiquidacion(fec);
				// fecha

				
				// Se loguean los datos a ser enviados al WS
				logger.info("\nusuario: " + parametrosEntrada.getUsuario()+
						    "\ndocumento: " + parametrosEntrada.getDocumento()+
						    "\nimporte total: " + parametrosEntrada.getImporteTotal()+
						    "\nimpuesto: " + parametrosEntrada.getImpuesto()+
						    "\nidFormulario: " + parametrosEntrada.getIDFORMULARIO()+
						    "\nresolucion: " + parametrosEntrada.getResolucion()+
						    "\nPeriodo: " + parametrosEntrada.getPeriodo()+
						    "\ncomprobante: " + parametrosEntrada.getComprobante()+
						    "\n fecha: " + parametrosEntrada.getFechaLiquidacion());
				
				// Cuentas
				ArrayOfSdtTriLiqInDetalle detalleCuentas = new ArrayOfSdtTriLiqInDetalle();
				logger.info("\n\nDetalle de cuentas:\n\n");
				for (HBAccountV2 account : accounts) {
					if (account.getPaymentAmount().intValue() > 0) {

						SdtTriLiqInDetalle cuenta = new SdtTriLiqInDetalle();
						cuenta.setCuenta(Integer.parseInt(account.getNumber()));
						cuenta.setImporte(account.getPaymentAmount());
						detalleCuentas.getSdtTriLiqInDetalle().add(cuenta);
						logger.info("\n\n" + "cuenta nro: " + cuenta.getCuenta() + "importe: " + cuenta.getImporte());
					}
				}

				parametrosEntrada.setDetalle(detalleCuentas);
				// Cuentas


				// Enviar request al WS
				execute.setSdtTriLi(parametrosEntrada);

				// =============================================================================================================
				// Setup JAXB
				// =============================================================================================================

				// Create a JAXB context passing in the class of the object we
				// want to marshal/unmarshal
				// JAXBContext context2 = null;
				// try {
				// context2 = JAXBContext.newInstance(WsTriLiqExecute.class);
				//
				// } catch (JAXBException e2) {
				// // TODO Auto-generated catch block
				// e2.printStackTrace();
				// }
				//
				// //
				// =============================================================================================================
				// // Marshalling OBJECT to XML
				// //
				// =============================================================================================================
				//
				// // Create the marshaller, this is the nifty little thing that
				// will actually transform the object into XML
				// Marshaller marshaller2 = null;
				// try {
				// marshaller2 = context2.createMarshaller();
				// } catch (JAXBException e1) {
				// // TODO Auto-generated catch block
				// e1.printStackTrace();
				// }
				//
				// // Create a stringWriter to hold the XML
				// final StringWriter stringWriter2 = new StringWriter();
				//
				//
				//
				// // Marshal the javaObject and write the XML to the
				// stringWriter
				// try {
				// marshaller2.marshal(execute, stringWriter2);
				// } catch (JAXBException e) {
				// // TODO Auto-generated catch block
				// e.printStackTrace();
				// }
				//
				// // Print out the contents of the stringWriter
				// System.out.println(stringWriter2.toString());

				WsTriLiqExecuteResponse respuesta;
				try {
					respuesta = portType.execute(execute);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new HBUpdateException("Hubo un error al procesar el WS :" + e.toString());
				}
				System.out.println("codigo de respuesta: "
						+ respuesta.getSdtTriLiOut().getCodigoRetorno()
						+ " mensaje de retorno:"
						+ respuesta.getSdtTriLiOut().getCodigoRetorno());

				// Manejar cada error. Si la respuesta NO es exitosa se debe arrojar la excepcion HBUpdateException - emulando HomeBankingitfV2.
				if (respuesta.getSdtTriLiOut().getCodigoRetorno()
						.equalsIgnoreCase("TRILIPG000")
						|| respuesta.getSdtTriLiOut().getCodigoRetorno()
								.equalsIgnoreCase("TRILIPG200")) {// SIN ERROR
					logger.info("codigo de retorno (Success): "
							+ respuesta.getSdtTriLiOut().getCodigoRetorno()
							+ "mensaje:"
							+ respuesta.getSdtTriLiOut().getMensajeRetorno());
				} else {
					if (respuesta.getSdtTriLiOut().getCodigoRetorno()
							.equalsIgnoreCase("TRILIPG001")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG002")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG003")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG004")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG005")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG006")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG007")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG008")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG104")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG111")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG199")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG202")
							|| respuesta.getSdtTriLiOut().getCodigoRetorno()
									.equalsIgnoreCase("TRILIPG201")) {// ERROR
						logger.info("codigo de retorno (Error): "
								+ respuesta.getSdtTriLiOut().getCodigoRetorno()
								+ "\tmensaje:"
								+ respuesta.getSdtTriLiOut()
										.getMensajeRetorno());
						throw new HBUpdateException(
								"Web service de pago de liquidicacion devolvio un error");
					}
				}
			}
		} catch (DatatypeConfigurationException eFormatDate) {
			eFormatDate.printStackTrace();
			logger.error("ERROR al formatear la fecha" + eFormatDate);
			throw new HBUpdateException("Ocurrió un error al realizar el pago.-> "+ eFormatDate.getMessage());
		}
		catch (HBUpdateException eHB) {
			eHB.printStackTrace();
			logger.error("ERROR  al consumir el WS de debito->"+eHB.getMessage());
			throw new HBUpdateException("Ocurrió un error al realizar el pago->", eHB);
		}
		catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			throw new HBUpdateException("Ocurrió un error al realizar el pago->"+ e.getMessage());
		}
	
	

	}
}
