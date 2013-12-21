//package py.com.cbi.pykasu.web.ws.cuentas;
//
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.net.MalformedURLException;
//import java.net.URL;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Properties;
//
//import javax.xml.namespace.QName;
//
//import py.com.roshka.pykasu.web.util.HBAccountV2;
//
//import com.sun.xml.rpc.processor.modeler.j2ee.xml.wsdlMessageMappingType;
//
//public class Test {
//
//	/**
//	 * @param args
//	 * @throws IOException
//	 */
//	public static void main(String[] args) {
//
//		Properties properties = new Properties();
//
//		try {
//					
//			properties.load(new FileInputStream("/Users/esteban/Desktop/pykasu/jboss-4.0.4.GA/server/default/conf/pykasu-config.properties"));
//			URL urlWS = new URL(properties.getProperty("WS_CONSULTA_CUENTAS"));
//			List<HBAccountV2> hbAccounts = new ArrayList<HBAccountV2>();
//
//			QName serviceName = new QName("services", "ws_tri_sal");
////			WsTriSal service = new WsTriSal(urlWS, serviceName);
//			WsTriSal service = new WsTriSal();
//			WsTriSalSoapPort portType = service.getWsTriSalSoapPort();
//			WsTriSalExecute execute = new WsTriSalExecute();
//			SdtTriSalIn parametrosEntrada = new SdtTriSalIn();
////			parametrosEntrada.setNroDoc("000000004027322");000000002907227
//			parametrosEntrada.setNroDoc("000000004027322");
//			parametrosEntrada.setServicio((byte) 7);
//			parametrosEntrada.setTipoConsulta((byte)0);
//			parametrosEntrada.setTipoDoc("CI");
//			execute.setSdtIn(parametrosEntrada);
//			WsTriSalExecuteResponse respuesta = portType.execute(execute);
//
//			System.out.println("codigo de respuesta: "
//					+ respuesta.getSdtOut().codigoRetorno
//					+ "\nmensaje de retorno: "
//					+ respuesta.getSdtOut().mensajeRetorno
//					+ "\nnumero de documento: " + respuesta.getSdtOut().nroDoc
//					+ "\ntipo documento: " + respuesta.getSdtOut().tipDoc);
//
//			ArrayOfSdtTriSalOutDet detalle = respuesta.getSdtOut().getDetalle();
//
//			int cantCuentas = detalle.getSdtTriSalOutDet().size();
//
//			for (int i = 0; i < cantCuentas; i++) {
//
//				System.out.println("cuenta nro:" + i);
//				System.out
//						.println("saldo a confirmar:"
//								+ detalle.getSdtTriSalOutDet().get(i).saldoConfirmar
//								+ "saldo sobre giro"
//								+ detalle.getSdtTriSalOutDet().get(i).saldoSobregiro
//								+ "saldo disponible"
//								+ detalle.getSdtTriSalOutDet().get(i).saldoDisponible
//								+ "cuenta"
//								+ detalle.getSdtTriSalOutDet().get(i).cuenta);
//
//			}
//
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//	}
//
//}
