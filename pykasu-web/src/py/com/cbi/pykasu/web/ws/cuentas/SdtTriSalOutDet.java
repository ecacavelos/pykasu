package py.com.cbi.pykasu.web.ws.cuentas;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for Sdt_tri_sal_out_det complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="Sdt_tri_sal_out_det">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element name="Cuenta" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="Descripcion" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Saldo_Disponible" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *         &lt;element name="Saldo_Confirmar" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *         &lt;element name="Saldo_Sobregiro" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *         &lt;element name="Moneda" type="{http://www.w3.org/2001/XMLSchema}short"/>
 *       &lt;/all>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Sdt_tri_sal_out_det", propOrder = {

})
public class SdtTriSalOutDet {

	@XmlElement(name = "Cuenta")
	protected int cuenta;
	@XmlElement(name = "Descripcion", required = true)
	protected String descripcion;
	@XmlElement(name = "Saldo_Disponible")
	protected double saldoDisponible;
	@XmlElement(name = "Saldo_Confirmar")
	protected double saldoConfirmar;
	@XmlElement(name = "Saldo_Sobregiro")
	protected double saldoSobregiro;
	@XmlElement(name = "Moneda")
	protected short moneda;

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
	 * Gets the value of the descripcion property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getDescripcion() {
		return descripcion;
	}

	/**
	 * Sets the value of the descripcion property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setDescripcion(String value) {
		this.descripcion = value;
	}

	/**
	 * Gets the value of the saldoDisponible property.
	 * 
	 */
	public double getSaldoDisponible() {
		return saldoDisponible;
	}

	/**
	 * Sets the value of the saldoDisponible property.
	 * 
	 */
	public void setSaldoDisponible(double value) {
		this.saldoDisponible = value;
	}

	/**
	 * Gets the value of the saldoConfirmar property.
	 * 
	 */
	public double getSaldoConfirmar() {
		return saldoConfirmar;
	}

	/**
	 * Sets the value of the saldoConfirmar property.
	 * 
	 */
	public void setSaldoConfirmar(double value) {
		this.saldoConfirmar = value;
	}

	/**
	 * Gets the value of the saldoSobregiro property.
	 * 
	 */
	public double getSaldoSobregiro() {
		return saldoSobregiro;
	}

	/**
	 * Sets the value of the saldoSobregiro property.
	 * 
	 */
	public void setSaldoSobregiro(double value) {
		this.saldoSobregiro = value;
	}

	/**
	 * Gets the value of the moneda property.
	 * 
	 */
	public short getMoneda() {
		return moneda;
	}

	/**
	 * Sets the value of the moneda property.
	 * 
	 */
	public void setMoneda(short value) {
		this.moneda = value;
	}

}
