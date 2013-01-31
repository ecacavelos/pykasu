package py.com.cbi.pykasu.web.ws.cuentas2;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for anonymous complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Sdt_out" type="{services}Sdt_tri_sal_out"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "sdtOut" })
@XmlRootElement(name = "ws_tri_sal.ExecuteResponse")
public class WsTriSalExecuteResponse {

	@XmlElement(name = "Sdt_out", required = true)
	protected SdtTriSalOut sdtOut;

	/**
	 * Gets the value of the sdtOut property.
	 * 
	 * @return possible object is {@link SdtTriSalOut }
	 * 
	 */
	public SdtTriSalOut getSdtOut() {
		return sdtOut;
	}

	/**
	 * Sets the value of the sdtOut property.
	 * 
	 * @param value
	 *            allowed object is {@link SdtTriSalOut }
	 * 
	 */
	public void setSdtOut(SdtTriSalOut value) {
		this.sdtOut = value;
	}

}
