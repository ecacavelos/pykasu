package py.com.cbi.pykasu.web.ws.debitos;

import javax.xml.bind.annotation.XmlRegistry;

/**
 * This object contains factory methods for each Java content interface and Java
 * element interface generated in the py.com.cbi.pykasu.web.ws.debitos package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the
 * Java representation for XML content. The Java representation of XML content
 * can consist of schema derived interfaces and classes representing the binding
 * of schema type definitions, element declarations and model groups. Factory
 * methods for each of these are provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

	/**
	 * Create a new ObjectFactory that can be used to create new instances of
	 * schema derived classes for package: py.com.cbi.pykasu.web.ws.debitos
	 * 
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link SdtTriLiqInDetalle }
	 * 
	 */
	public SdtTriLiqInDetalle createSdtTriLiqInDetalle() {
		return new SdtTriLiqInDetalle();
	}

	/**
	 * Create an instance of {@link ArrayOfSdtTriLiqInDetalle }
	 * 
	 */
	public ArrayOfSdtTriLiqInDetalle createArrayOfSdtTriLiqInDetalle() {
		return new ArrayOfSdtTriLiqInDetalle();
	}

	/**
	 * Create an instance of {@link WsTriLiqExecuteResponse }
	 * 
	 */
	public WsTriLiqExecuteResponse createWsTriLiqExecuteResponse() {
		return new WsTriLiqExecuteResponse();
	}

	/**
	 * Create an instance of {@link SdtTriLiqOut }
	 * 
	 */
	public SdtTriLiqOut createSdtTriLiqOut() {
		return new SdtTriLiqOut();
	}

	/**
	 * Create an instance of {@link WsTriLiqExecute }
	 * 
	 */
	public WsTriLiqExecute createWsTriLiqExecute() {
		return new WsTriLiqExecute();
	}

	/**
	 * Create an instance of {@link SdtTriLiqIn }
	 * 
	 */
	public SdtTriLiqIn createSdtTriLiqIn() {
		return new SdtTriLiqIn();
	}

}
