package py.com.cbi.pykasu.web.ws.cuentas2;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for Sdt_tri_sal_out complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="Sdt_tri_sal_out">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element name="Tip_Doc" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Nro_Doc" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Codigo_Retorno" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Mensaje_Retorno" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Detalle" type="{services}ArrayOfSdt_tri_liq_in_detalle"/>
 *       &lt;/all>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Sdt_tri_sal_out", propOrder = {

})
public class SdtTriSalOut {

	@XmlElement(name = "Tip_Doc", required = true)
	protected String tipDoc;
	@XmlElement(name = "Nro_Doc", required = true)
	protected String nroDoc;
	@XmlElement(name = "Codigo_Retorno", required = true)
	protected String codigoRetorno;
	@XmlElement(name = "Mensaje_Retorno", required = true)
	protected String mensajeRetorno;
	@XmlElement(name = "Detalle", required = true)
	protected ArrayOfSdtTriLiqInDetalle detalle;

	/**
	 * Gets the value of the tipDoc property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getTipDoc() {
		return tipDoc;
	}

	/**
	 * Sets the value of the tipDoc property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setTipDoc(String value) {
		this.tipDoc = value;
	}

	/**
	 * Gets the value of the nroDoc property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getNroDoc() {
		return nroDoc;
	}

	/**
	 * Sets the value of the nroDoc property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setNroDoc(String value) {
		this.nroDoc = value;
	}

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

	/**
	 * Gets the value of the detalle property.
	 * 
	 * @return possible object is {@link ArrayOfSdtTriLiqInDetalle }
	 * 
	 */
	public ArrayOfSdtTriLiqInDetalle getDetalle() {
		return detalle;
	}

	/**
	 * Sets the value of the detalle property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfSdtTriLiqInDetalle }
	 * 
	 */
	public void setDetalle(ArrayOfSdtTriLiqInDetalle value) {
		this.detalle = value;
	}

}
