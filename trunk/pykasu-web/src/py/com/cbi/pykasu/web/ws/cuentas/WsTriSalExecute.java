package py.com.cbi.pykasu.web.ws.cuentas;

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
 *         &lt;element name="Sdt_in" type="{services}Sdt_tri_sal_in"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "sdtIn" })
@XmlRootElement(name = "ws_tri_sal.Execute")
public class WsTriSalExecute {

	@XmlElement(name = "Sdt_in", required = true)
	protected SdtTriSalIn sdtIn;

	/**
	 * Gets the value of the sdtIn property.
	 * 
	 * @return possible object is {@link SdtTriSalIn }
	 * 
	 */
	public SdtTriSalIn getSdtIn() {
		return sdtIn;
	}

	/**
	 * Sets the value of the sdtIn property.
	 * 
	 * @param value
	 *            allowed object is {@link SdtTriSalIn }
	 * 
	 */
	public void setSdtIn(SdtTriSalIn value) {
		this.sdtIn = value;
	}

}
