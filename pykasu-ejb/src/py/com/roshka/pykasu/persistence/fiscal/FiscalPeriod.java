package py.com.roshka.pykasu.persistence.fiscal;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import py.com.roshka.pykasu.exceptions.InvalidFiscalPeriodException;;

@Entity
@Table (name = "fiscal_period")
//@SequenceGenerator (name = "seq_fiscal_period", sequenceName="seq_fiscal_period")
public class FiscalPeriod implements Serializable{
	private Integer id;
//	private Integer advancedNumber = 0;
	private Integer month;
	private Integer year;
//	private Integer clausureMonth = 0;
	private Boolean active;	
	
	protected FiscalPeriod(){
	}
	
	public FiscalPeriod(Integer advancedNumber, Integer month, Integer year)
		throws InvalidFiscalPeriodException{
			//this.advancedNumber = advancedNumber;
			this.month = month;
			this.year = year;		
	}

	public FiscalPeriod(Integer month, Integer year)
		throws InvalidFiscalPeriodException{	
			this(new Integer(0), month, year);
	}

	@Id	@Column(name="fiscal_period_iid")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_fiscal_period")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}
	
	public String toString(){
		return "ID: " + getId() + " Month: " + getMonth() + " Year: " + getYear();
	}

//	@Column(name="advanced_number")
//	public Integer getAdvancedNumber() {
//		return advancedNumber;
//	}
//
//	public void setAdvancedNumber(Integer advancedNumber) {
//		this.advancedNumber = advancedNumber;
//	}
//
//	public Integer getClausureMonth() {
//		return clausureMonth;
//	}
//
//	@Column(name="clausure_month")
//	public void setClausureMonth(Integer clausureMonth) {
//		this.clausureMonth = clausureMonth;
//	}
	
}
