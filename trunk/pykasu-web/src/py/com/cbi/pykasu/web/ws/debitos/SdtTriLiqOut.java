package py.com.cbi.pykasu.web.ws.debitos;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for sdt_tri_liq_out complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="sdt_tri_liq_out">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element name="Codigo_Retorno" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Mensaje_Retorno" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/all>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "sdt_tri_liq_out", propOrder = {

})
public class SdtTriLiqOut {

	@XmlElement(name = "Codigo_Retorno", required = true)
	protected String codigoRetorno;
	@XmlElement(name = "Mensaje_Retorno", required = true)
	protected String mensajeRetorno;

	/**
	 * Gets the value of the codigoRetorno property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCodigoRetorno() {
		return codigoRetorno;
	}

	/**
	 * Sets the value of the codigoRetorno property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCodigoRetorno(String value) {
		this.codigoRetorno = value;
	}

	/**
	 * Gets the value of the mensajeRetorno property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getMensajeRetorno() {
		return mensajeRetorno;
	}

	/**
	 * Sets the value of the mensajeRetorno property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setMensajeRetorno(String value) {
		this.mensajeRetorno = value;
	}

}
