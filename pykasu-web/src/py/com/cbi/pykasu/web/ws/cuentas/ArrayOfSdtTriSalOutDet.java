package py.com.cbi.pykasu.web.ws.cuentas;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for ArrayOfSdt_tri_sal_out_det complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="ArrayOfSdt_tri_sal_out_det">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Sdt_tri_sal_out_det" type="{services}Sdt_tri_sal_out_det" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfSdt_tri_sal_out_det", propOrder = { "sdtTriSalOutDet" })
public class ArrayOfSdtTriSalOutDet {

	@XmlElement(name = "Sdt_tri_sal_out_det")
	protected List<SdtTriSalOutDet> sdtTriSalOutDet;

	/**
	 * Gets the value of the sdtTriSalOutDet property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live list, not a
	 * snapshot. Therefore any modification you make to the returned list will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the sdtTriSalOutDet property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getSdtTriSalOutDet().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the list
	 * {@link SdtTriSalOutDet }
	 * 
	 * 
	 */
	public List<SdtTriSalOutDet> getSdtTriSalOutDet() {
		if (sdtTriSalOutDet == null) {
			sdtTriSalOutDet = new ArrayList<SdtTriSalOutDet>();
		}
		return this.sdtTriSalOutDet;
	}

}
