package py.com.cbi.pykasu.web.ws.cuentas2;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

import javax.xml.namespace.QName;








public class Test {

	static Properties properties = new Properties();
	/**
	 * @param args
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public static void main(String[] args) throws FileNotFoundException, IOException {
		properties.load(new FileInputStream("/Users/esteban/Desktop/pykasu/jboss-4.0.4.GA/server/default/conf/pykasu-config.properties"));
		URL urlWS = new URL(properties.getProperty("WS_CONSULTA_CUENTAS2"));
		QName serviceName = new QName("services", "ws_tri_sal");
		WsTriSal service = new WsTriSal(urlWS, serviceName);
//		WsTriSal service = new WsTriSal();
		WsTriSalSoapPort portType = service.getWsTriSalSoapPort();
		WsTriSalExecute execute = new WsTriSalExecute();
		SdtTriSalIn parametrosEntrada = new SdtTriSalIn();
		parametrosEntrada.setNroDoc("000000004027322");
		parametrosEntrada.setServicio((byte) 7);
		parametrosEntrada.setTipoConsulta((byte) 1);
		parametrosEntrada.setTipoDoc("CI");
		execute.setSdtIn(parametrosEntrada);
		

		WsTriSalExecuteResponse respuesta = portType.execute(execute);
		

		System.out.println("codigo de respuesta: "
				+ respuesta.getSdtOut().getCodigoRetorno()
				+ "\nmensaje de retorno: "
				+ respuesta.getSdtOut().getMensajeRetorno()
				+ "\nnumero de documento: " + respuesta.getSdtOut().getNroDoc()
				+ "\ntipo documento: " + respuesta.getSdtOut().getTipDoc());

	}

}
