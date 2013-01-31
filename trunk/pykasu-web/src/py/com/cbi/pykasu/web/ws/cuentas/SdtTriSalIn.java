package py.com.cbi.pykasu.web.ws.cuentas;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for Sdt_tri_sal_in complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="Sdt_tri_sal_in">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element name="Tipo_Doc" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Nro_Doc" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Tipo_Consulta" type="{http://www.w3.org/2001/XMLSchema}byte"/>
 *         &lt;element name="Servicio" type="{http://www.w3.org/2001/XMLSchema}byte"/>
 *       &lt;/all>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Sdt_tri_sal_in", propOrder = {

})
public class SdtTriSalIn {

	@XmlElement(name = "Tipo_Doc", required = true)
	protected String tipoDoc;
	@XmlElement(name = "Nro_Doc", required = true)
	protected String nroDoc;
	@XmlElement(name = "Tipo_Consulta")
	protected byte tipoConsulta;
	@XmlElement(name = "Servicio")
	protected byte servicio;

	/**
	 * Gets the value of the tipoDoc property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getTipoDoc() {
		return tipoDoc;
	}

	/**
	 * Sets the value of the tipoDoc property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setTipoDoc(String value) {
		this.tipoDoc = value;
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
	 * Gets the value of the tipoConsulta property.
	 * 
	 */
	public byte getTipoConsulta() {
		return tipoConsulta;
	}

	/**
	 * Sets the value of the tipoConsulta property.
	 * 
	 */
	public void setTipoConsulta(byte value) {
		this.tipoConsulta = value;
	}

	/**
	 * Gets the value of the servicio property.
	 * 
	 */
	public byte getServicio() {
		return servicio;
	}

	/**
	 * Sets the value of the servicio property.
	 * 
	 */
	public void setServicio(byte value) {
		this.servicio = value;
	}

}
