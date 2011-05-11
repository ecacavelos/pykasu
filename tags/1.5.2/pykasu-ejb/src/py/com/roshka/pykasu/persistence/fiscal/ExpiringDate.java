package py.com.roshka.pykasu.persistence.fiscal;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import py.com.roshka.pykasu.exceptions.InvalidExpiringDateException;

@Entity
@Table (name = "expiring_date")
//@SequenceGenerator (name = "seq_expiring_date", sequenceName="seq_expiring_date")
public class ExpiringDate implements Serializable{
	private Integer id;
	private FiscalPeriod fiscalPeriod;
	private Date date; 
	private String charFrom;  
	private String charTo;
	private Integer formType;
	private Boolean active;
	
	public static final Integer FORM_850 = 850;
	public static final Integer FORM_800 = 800;
	public static final Integer FORM_801 = 801;
	
	protected ExpiringDate(){
	}
	
	public ExpiringDate(Integer formType, FiscalPeriod fiscalPeriod, Date date, 
						String charFrom, String charTo)
		throws InvalidExpiringDateException {
		
		this.formType = formType;
		
		this.fiscalPeriod = fiscalPeriod;

		this.date = date;

		if(charFrom.length() != 1){
			throw new InvalidExpiringDateException("Invalid initial char " + charFrom);
		}
		this.charFrom = charFrom;
		
		if(charTo.length() != 1){
			throw new InvalidExpiringDateException("Invalid final char " + charTo);
		}
		this.charTo = charTo;
		
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

	@Column(name="expiring_date", nullable=false)
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="fiscal_period_iid", nullable=false)
	public FiscalPeriod getFiscalPeriod() {
		return fiscalPeriod;
	}

	public void setFiscalPeriod(FiscalPeriod fiscalPeriod) {
		this.fiscalPeriod = fiscalPeriod;
	}

	@Id	@Column(name="expiring_date_iid")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_expiring_date")
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="form_type", nullable=false)
	public Integer getFormType() {
		return formType;
	}

	public void setFormType(Integer formType) {
		this.formType = formType;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}
	
	public String toString(){
		return "ID: " + getId() + " Form Type: " + getFormType() + " Date" + getDate();
	}
}
