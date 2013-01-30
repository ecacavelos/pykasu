package py.com.roshka.pykasu.persistence.fiscal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table (name = "mount_overdue")
//@SequenceGenerator (name = "seq_mounth_overdue", sequenceName="seq_mounth_overdue")
public class FiscalMountOverdue {
	private Integer id;
	private Integer monthFrom;
	private Integer monthTo;
	private String  rucType;
	private Integer formType;
	private Double  mount;
	private Boolean active;
	
	private FiscalMountOverdue(){
		active = true;
	}
	
	public FiscalMountOverdue(Integer monthTo, Integer monthFrom, Integer formType, Double mount){
		this.monthTo = monthFrom;
		this.monthFrom = monthFrom;
		this.formType = formType;
		this.mount = mount;
	}

	public Double getMount() {
		return mount;
	}

	public void setMount(Double mount) {
		this.mount = mount;
	}

	@Column(nullable=false)
	protected Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	@Column(name="form_type", nullable=false)
	public Integer getFormType() {
		return formType;
	}

	public void setFormType(Integer formType) {
		this.formType = formType;
	}

	@Id @Column(name="mount_overdue_iid")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_mounth_overdue")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(nullable=false)
	public Integer getMonthFrom() {
		return monthFrom;
	}

	public void setMonthFrom(Integer monthFrom) {
		this.monthFrom = monthFrom;
	}

	@Column(nullable=false)
	public Integer getMonthTo() {
		return monthTo;
	}

	public void setMonthTo(Integer monthTo) {
		this.monthTo = monthTo;
	}

	@Column(nullable=false)
	public String getRucType() {
		return rucType;
	}

	public void setRucType(String rucType) {
		this.rucType = rucType;
	}
}
