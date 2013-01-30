package py.com.roshka.pykasu.persistence.fiscal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table (name = "percent_overdue")
//@SequenceGenerator (name = "seq_percent_overdue", sequenceName="seq_percent_overdue")
public class FiscalPercentOverdue {
	private Integer id;
	private Integer formType;
	private Integer amountMonth;
	private Double percent;
	private Boolean active;

	public FiscalPercentOverdue(){
		active = true;
	}
	
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}

	@Column(name="monthOverdue",nullable=false) //cantidad de meses
	public Integer getAmountMonth() {
		return amountMonth;
	}
	public void setAmountMonth(Integer amountMonth) {
		this.amountMonth = amountMonth;
	}

	@Column(name="form_type", nullable=false)
	public Integer getFormType() {
		return formType;
	}
	public void setFormType(Integer formType) {
		this.formType = formType;
	}
	
	@Id 
	@Column(name="percent_overdue_iid")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_percent_overdue")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	@Column(nullable=false)
	public Double getPercent() {
		return percent;
	}
	public void setPercent(Double percent) {
		this.percent = percent;
	}
}
