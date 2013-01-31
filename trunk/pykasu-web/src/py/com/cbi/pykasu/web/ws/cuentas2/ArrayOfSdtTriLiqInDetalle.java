package py.com.cbi.pykasu.web.ws.cuentas2;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ArrayOfSdt_tri_liq_in_detalle complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="ArrayOfSdt_tri_liq_in_detalle">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Sdt_tri_liq_in_detalle" type="{services}Sdt_tri_liq_in_detalle" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfSdt_tri_liq_in_detalle", propOrder = { "sdtTriLiqInDetalle" })
public class ArrayOfSdtTriLiqInDetalle {

	@XmlElement(name = "Sdt_tri_liq_in_detalle")
	protected List<SdtTriLiqInDetalle> sdtTriLiqInDetalle;

	/**
	 * Gets the value of the sdtTriLiqInDetalle property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live list, not a
	 * snapshot. Therefore any modification you make to the returned list will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the sdtTriLiqInDetalle property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getSdtTriLiqInDetalle().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the list
	 * {@link SdtTriLiqInDetalle }
	 * 
	 * 
	 */
	public List<SdtTriLiqInDetalle> getSdtTriLiqInDetalle() {
		if (sdtTriLiqInDetalle == null) {
			sdtTriLiqInDetalle = new ArrayList<SdtTriLiqInDetalle>();
		}
		return this.sdtTriLiqInDetalle;
	}

}
