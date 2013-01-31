package py.com.cbi.pykasu.web.ws.debitos;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 * <p>
 * Java class for sdt_tri_liq_in complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="sdt_tri_liq_in">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element name="Periodo" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Documento" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Resolucion" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="Impuesto" type="{http://www.w3.org/2001/XMLSchema}short"/>
 *         &lt;element name="Usuario" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="ID_FORMULARIO" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="Comprobante" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="Fecha_Liquidacion" type="{http://www.w3.org/2001/XMLSchema}date"/>
 *         &lt;element name="Importe_Total" type="{http://www.w3.org/2001/XMLSchema}double"/>
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
@XmlType(name = "sdt_tri_liq_in", propOrder = {

})
public class SdtTriLiqIn {

	@XmlElement(name = "Periodo", required = true)
	protected String periodo;
	@XmlElement(name = "Documento", required = true)
	protected String documento;
	@XmlElement(name = "Resolucion")
	protected int resolucion;
	@XmlElement(name = "Impuesto")
	protected short impuesto;
	@XmlElement(name = "Usuario", required = true)
	protected String usuario;
	@XmlElement(name = "ID_FORMULARIO")
	protected long idformulario;
	@XmlElement(name = "Comprobante")
	protected long comprobante;
	@XmlElement(name = "Fecha_Liquidacion", required = true)
	@XmlSchemaType(name = "date")
	protected XMLGregorianCalendar fechaLiquidacion;
	@XmlElement(name = "Importe_Total")
	protected double importeTotal;
	@XmlElement(name = "Detalle", required = true)
	protected ArrayOfSdtTriLiqInDetalle detalle;

	/**
	 * Gets the value of the periodo property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getPeriodo() {
		return periodo;
	}

	/**
	 * Sets the value of the periodo property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setPeriodo(String value) {
		this.periodo = value;
	}

	/**
	 * Gets the value of the documento property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getDocumento() {
		return documento;
	}

	/**
	 * Sets the value of the documento property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setDocumento(String value) {
		this.documento = value;
	}

	/**
	 * Gets the value of the resolucion property.
	 * 
	 */
	public int getResolucion() {
		return resolucion;
	}

	/**
	 * Sets the value of the resolucion property.
	 * 
	 */
	public void setResolucion(int value) {
		this.resolucion = value;
	}

	/**
	 * Gets the value of the impuesto property.
	 * 
	 */
	public short getImpuesto() {
		return impuesto;
	}

	/**
	 * Sets the value of the impuesto property.
	 * 
	 */
	public void setImpuesto(short value) {
		this.impuesto = value;
	}

	/**
	 * Gets the value of the usuario property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getUsuario() {
		return usuario;
	}

	/**
	 * Sets the value of the usuario property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setUsuario(String value) {
		this.usuario = value;
	}

	/**
	 * Gets the value of the idformulario property.
	 * 
	 */
	public long getIDFORMULARIO() {
		return idformulario;
	}

	/**
	 * Sets the value of the idformulario property.
	 * 
	 */
	public void setIDFORMULARIO(long value) {
		this.idformulario = value;
	}

	/**
	 * Gets the value of the comprobante property.
	 * 
	 */
	public long getComprobante() {
		return comprobante;
	}

	/**
	 * Sets the value of the comprobante property.
	 * 
	 */
	public void setComprobante(long value) {
		this.comprobante = value;
	}

	/**
	 * Gets the value of the fechaLiquidacion property.
	 * 
	 * @return possible object is {@link XMLGregorianCalendar }
	 * 
	 */
	public XMLGregorianCalendar getFechaLiquidacion() {
		return fechaLiquidacion;
	}

	/**
	 * Sets the value of the fechaLiquidacion property.
	 * 
	 * @param value
	 *            allowed object is {@link XMLGregorianCalendar }
	 * 
	 */
	public void setFechaLiquidacion(XMLGregorianCalendar value) {
		this.fechaLiquidacion = value;
	}

	/**
	 * Gets the value of the importeTotal property.
	 * 
	 */
	public double getImporteTotal() {
		return importeTotal;
	}

	/**
	 * Sets the value of the importeTotal property.
	 * 
	 */
	public void setImporteTotal(double value) {
		this.importeTotal = value;
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
