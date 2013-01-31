package py.com.cbi.pykasu.web.ws.debitos;

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
 *         &lt;element name="Sdt_tri_li" type="{services}sdt_tri_liq_in"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "sdtTriLi" })
@XmlRootElement(name = "ws_tri_liq.Execute")
public class WsTriLiqExecute {

	@XmlElement(name = "Sdt_tri_li", required = true)
	protected SdtTriLiqIn sdtTriLi;

	/**
	 * Gets the value of the sdtTriLi property.
	 * 
	 * @return possible object is {@link SdtTriLiqIn }
	 * 
	 */
	public SdtTriLiqIn getSdtTriLi() {
		return sdtTriLi;
	}

	/**
	 * Sets the value of the sdtTriLi property.
	 * 
	 * @param value
	 *            allowed object is {@link SdtTriLiqIn }
	 * 
	 */
	public void setSdtTriLi(SdtTriLiqIn value) {
		this.sdtTriLi = value;
	}

}
