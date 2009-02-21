package py.com.roshka.pykasu.persistence.fiscal;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import py.com.roshka.pykasu.persistence.users.User;

@Entity
@Table (name="impuestos")
public class Taxes {
	private Integer taxId;
	private String description;
	private String type;
	private String requerePeriod;
	private Date initPeriod;
	private Date finalPeriod;
	
	protected Taxes(){
	}
	
	@Column(name = "des")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "period_hasta")
	public Date getFinalPeriod() {
		return finalPeriod;
	}

	public void setFinalPeriod(Date finalPeriod) {
		this.finalPeriod = finalPeriod;
	}
	
	@Column(name = "period_vigencia")
	public Date getInitPeriod() {
		return initPeriod;
	}

	public void setInitPeriod(Date initPeriod) {
		this.initPeriod = initPeriod;
	}

	@Column(name = "req_period")
	public String getRequerePeriod() {
		return requerePeriod;
	}

	public void setRequerePeriod(String requerePeriod) {
		this.requerePeriod = requerePeriod;
	}
	@Id @Column(name = "impuesto")
	public Integer getTaxId() {
		return taxId;
	}

	public void setTaxId(Integer taxId) {
		this.taxId = taxId;
	}

	@Column(name="tipo_tributo")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Transient
	public String getCompleteDescription(){
		return "| " + getTaxId().toString() + " | " + getDescription().trim();
	}

}
