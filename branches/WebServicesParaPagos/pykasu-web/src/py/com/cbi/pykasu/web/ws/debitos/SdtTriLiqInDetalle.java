package py.com.cbi.pykasu.web.ws.debitos;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for Sdt_tri_liq_in_detalle complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="Sdt_tri_liq_in_detalle">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element name="Cuenta" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="Importe" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *       &lt;/all>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Sdt_tri_liq_in_detalle", propOrder = {

})
public class SdtTriLiqInDetalle {

	@XmlElement(name = "Cuenta")
	protected int cuenta;
	@XmlElement(name = "Importe")
	protected double importe;

	/**
	 * Gets the value of the cuenta property.
	 * 
	 */
	public int getCuenta() {
		return cuenta;
	}

	/**
	 * Sets the value of the cuenta property.
	 * 
	 */
	public void setCuenta(int value) {
		this.cuenta = value;
	}

	/**
	 * Gets the value of the importe property.
	 * 
	 */
	public double getImporte() {
		return importe;
	}

	/**
	 * Sets the value of the importe property.
	 * 
	 */
	public void setImporte(double value) {
		this.importe = value;
	}

}
