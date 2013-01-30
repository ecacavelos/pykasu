package py.com.roshka.pykasu.web.forms;

import org.apache.struts.action.ActionForm;

/**
 * 
 * @author Pablo
 *	
 *	@struts.form  
 *		name="PaymentFormWeb"
 *		
 */
public class PaymentFormWeb extends ActionForm {

	private String id;
    private String ruc;
    private String dv;
    private String firstLastName;
    private String obligationTax;
    private String resolutionNr;
    private Integer month;
    private Integer year;
    private String savingAccountNr;
    private Integer amount;
    private String value;
   // private String years;
    
   // private String send;
    
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getDv() {
		return dv;
	}
	public void setDv(String dv) {
		this.dv = dv;
	}
	public String getFirstLastName() {
		return firstLastName;
	}
	public void setFirstLastName(String firstLastName) {
		this.firstLastName = firstLastName;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public String getObligationTax() {
		return obligationTax;
	}
	public void setObligationTax(String obligationTax) {
		this.obligationTax = obligationTax;
	}
	public String getResolutionNr() {
		return resolutionNr;
	}
	public void setResolutionNr(String resolutionNr) {
		this.resolutionNr = resolutionNr;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	public String getSavingAccountNr() {
		return savingAccountNr;
	}
	public void setSavingAccountNr(String savingAccountNr) {
		this.savingAccountNr = savingAccountNr;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}

	public String toString(){
		return
		"\n id : " + id +
		 "\nruc : " + ruc +
		 "\ndv : " + dv +
		 "\nfirstLastName : " + firstLastName +
		 "\nobligationTax : " + obligationTax +
		 "\nresolutionNr : " + resolutionNr +
		 "\nmonth : " + month +
		 "\nyear : " + year +
		 "\nsavingAccountNr : " + savingAccountNr +
		 "\namount : " + amount +
		 "\nvalue : " + value;
	}
       
}
