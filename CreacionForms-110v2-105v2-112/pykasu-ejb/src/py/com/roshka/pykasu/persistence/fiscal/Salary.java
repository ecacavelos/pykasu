package py.com.roshka.pykasu.persistence.fiscal;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="salarios")
public class Salary implements Serializable{
	
	private Integer id;
	private Date periodBegin;
	private Date periodEnd;
	private Double amount;
	
	public Salary(){}

	@Column(name="monto")
	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	
	@Id @Column(name="salario_id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="period1")
	public Date getPeriodBegin() {
		return periodBegin;
	}

	public void setPeriodBegin(Date periodBegin) {
		this.periodBegin = periodBegin;
	}

	@Column(name="period2")
	public Date getPeriodEnd() {
		return periodEnd;
	}

	public void setPeriodEnd(Date periodEnd) {
		this.periodEnd = periodEnd;
	}
	
}
