package py.com.roshka.pykasu.persistence.fiscal;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table (name = "contravertion")
//@SequenceGenerator (name = "seq_contravertion", sequenceName="seq_contravertion")
public class FiscalContravertionFee implements Serializable{
	private Integer id;
	private Integer formType;
	private Integer monthFrom;
	private Integer monthTo;
	private Double contravertion;
	private Boolean active;
	
	protected FiscalContravertionFee(){
		active = true;
	}
	
	public FiscalContravertionFee(Integer formType, Integer monthFrom, 
				Integer monthTo, Double contravertion){
		this.formType = formType;
		this.monthTo = monthTo;
		this.monthFrom = monthFrom;
		this.contravertion = contravertion;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Double getContravertion() {
		return contravertion;
	}

	public void setContravertion(Double contravertion) {
		this.contravertion = contravertion;
	}

	@Column(name="form_type")
	public Integer getFormType() {
		return formType;
	}

	public void setFormType(Integer formType) {
		this.formType = formType;
	}

	@Id @Column(name="contravertion_iid")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_contravertion")
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="initial_month")
	public Integer getMonthFrom() {
		return monthFrom;
	}

	public void setMonthFrom(Integer monthFrom) {
		this.monthFrom = monthFrom;
	}

	@Column(name="final_month")
	public Integer getMonthTo() {
		return monthTo;
	}

	public void setMonthTo(Integer monthTo) {
		this.monthTo = monthTo;
	}
	
}
