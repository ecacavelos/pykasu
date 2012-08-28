package py.com.roshka.pykasu.persistence.fiscal;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table (name = "fiscal_advanced")
//@SequenceGenerator (name = "seq_fiscal_advanced", sequenceName="seq_fiscal_advanced")
public class FiscalAdvanced implements Serializable {
	private Integer id;
	private Integer formType;
	private Integer advancedNumber;
	private Date expiringDate;
	private Integer clausureMonth;
	private String charFrom;  
	private String charTo;

	protected FiscalAdvanced(){
	}
	
	public FiscalAdvanced(Integer formType, Integer advancedNumber, 
		   Date expiringDate, Integer clausureMonth,
		   String charFrom, String charTo){
		
		this.formType = formType;
		this.advancedNumber = advancedNumber;
		this.expiringDate = expiringDate;
		this.clausureMonth = clausureMonth;
	}
	
	@Column(name="advanced_number")
	public Integer getAdvancedNumber() {
		return advancedNumber;
	}
	public void setAdvancedNumber(Integer advancedNumber) {
		this.advancedNumber = advancedNumber;
	}
	
	@Column(name="clausure_month")
	public Integer getClausureMonth() {
		return clausureMonth;
	}
	public void setClausureMonth(Integer clausureMonth) {
		this.clausureMonth = clausureMonth;
	}
	
	@Column(name="expiring_date")
	public Date getExpiringDate() {
		return expiringDate;
	}
	public void setExpiringDate(Date expiringDate) {
		this.expiringDate = expiringDate;
	}
	
	@Column(name="form_type")
	public Integer getFormType() {
		return formType;
	}
	
	public void setFormType(Integer formType) {
		this.formType = formType;
	}

	@Id @Column(name="fiscal_advanced_iid")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_fiscal_advanced")
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="initial_char")
	public String getCharFrom() {
		return charFrom;
	}

	public void setCharFrom(String charFrom) {
		this.charFrom = charFrom;
	}
	@Column(name="final_char", nullable=false)
	public String getCharTo() {
		return charTo;
	}

	public void setCharTo(String charTo) {
		this.charTo = charTo;
	}	
	
}
