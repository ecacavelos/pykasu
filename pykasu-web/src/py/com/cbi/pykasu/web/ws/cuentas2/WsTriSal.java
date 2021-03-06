package py.com.cbi.pykasu.web.ws.cuentas2;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.3-hudson-390-
 * Generated source version: 2.0
 * <p>
 * An example of how this class may be used:
 * 
 * <pre>
 * ws_tri_sal service = new ws_tri_sal();
 * WsTriSalSoapPort portType = service.getWsTriSalSoapPort();
 * portType.execute(...);
 * </pre>
 * 
 * </p>
 * 
 */
@WebServiceClient(name = "ws_tri_sal", targetNamespace = "services", wsdlLocation = "file:/Users/esteban/Projects/pykasu/trunk/pykasu-web/WSDL%20-%20Pagos%20online/cuentas30-11-2012.wsdl")
public class WsTriSal extends Service {

	private final static URL WSTRISAL_WSDL_LOCATION;
	private final static Logger logger = Logger
			.getLogger(py.com.cbi.pykasu.web.ws.cuentas2.WsTriSal.class
					.getName());

	static {
		URL url = null;
		try {
			URL baseUrl;
			baseUrl = py.com.cbi.pykasu.web.ws.cuentas2.WsTriSal.class
					.getResource(".");
			url = new URL(
					baseUrl,
					"file:/Users/esteban/Projects/pykasu/trunk/pykasu-web/WSDL%20-%20Pagos%20online/cuentas30-11-2012.wsdl");
		} catch (MalformedURLException e) {
			logger.warning("Failed to create URL for the wsdl Location: 'file:/Users/esteban/Projects/pykasu/trunk/pykasu-web/WSDL%20-%20Pagos%20online/cuentas30-11-2012.wsdl', retrying as a local file");
			logger.warning(e.getMessage());
		}
		WSTRISAL_WSDL_LOCATION = url;
	}

	public WsTriSal(URL wsdlLocation, QName serviceName) {
		super(wsdlLocation, serviceName);
	}

	public WsTriSal() {
		super(WSTRISAL_WSDL_LOCATION, new QName("services", "ws_tri_sal"));
	}

	/**
	 * 
	 * @return returns WsTriSalSoapPort
	 */
	@WebEndpoint(name = "ws_tri_salSoapPort")
	public WsTriSalSoapPort getWsTriSalSoapPort() {
		return super.getPort(new QName("services", "ws_tri_salSoapPort"),
				WsTriSalSoapPort.class);
	}

}
