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
 *         &lt;element name="Sdt_tri_li_out" type="{services}sdt_tri_liq_out"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "sdtTriLiOut" })
@XmlRootElement(name = "ws_tri_liq.ExecuteResponse")
public class WsTriLiqExecuteResponse {

	@XmlElement(name = "Sdt_tri_li_out", required = true)
	protected SdtTriLiqOut sdtTriLiOut;

	/**
	 * Gets the value of the sdtTriLiOut property.
	 * 
	 * @return possible object is {@link SdtTriLiqOut }
	 * 
	 */
	public SdtTriLiqOut getSdtTriLiOut() {
		return sdtTriLiOut;
	}

	/**
	 * Sets the value of the sdtTriLiOut property.
	 * 
	 * @param value
	 *            allowed object is {@link SdtTriLiqOut }
	 * 
	 */
	public void setSdtTriLiOut(SdtTriLiqOut value) {
		this.sdtTriLiOut = value;
	}

}
