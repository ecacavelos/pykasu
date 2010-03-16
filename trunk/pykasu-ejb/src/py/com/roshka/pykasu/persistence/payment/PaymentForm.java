package py.com.roshka.pykasu.persistence.payment;

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
import javax.persistence.Table;
import javax.persistence.Transient;

import py.com.roshka.pykasu.persistence.forms.GenericForm;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;

@Entity (name = "PaymentForm")
@Table (name = "payment")
public class PaymentForm  extends GenericForm implements Serializable{
	
	private Integer id;
	private Date createdDate;
	private User createdBy;
	private String status =  "BEGIN"; 
	private Boolean active = false;
	private BusinessCompany businessCompany;

	private String ruc;
	private String dv;
	private String fname;
	private String lname;
	private String obligation;
	private String resolution;
	private Integer fiscalPeriodMonth;
	private Integer fiscalPeriodYear;
	private String savingAccountNumber;
	private Double paymentAmount;
	
	
	
	public PaymentForm(){
		this.active = Boolean.TRUE;
		//this.createdBy = user;
		this.createdDate = new Date(System.currentTimeMillis());
		//this.setBusinessCompany(user.getBusinessCompany());
	}

	public Boolean getActive() {
		return active;
	}

	@Id @Column (name="payment_iid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	public Integer getId() {
		return id;
	}	
	
	@ManyToOne
	@JoinColumn(name="bcompany_iid", nullable=false)	
	public BusinessCompany getBusinessCompany() {
		return businessCompany;
	}

	@ManyToOne
	@JoinColumn(name="user_iid", nullable=false)	
	public User getCreatedBy() {
		return createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public Integer getFiscalPeriodMonth() {
		return fiscalPeriodMonth;
	}

	public Integer getFiscalPeriodYear() {
		return fiscalPeriodYear;
	}

	public String getFname() {
		return fname;
	}


	public String getLname() {
		return lname;
	}

	public String getObligation() {
		return obligation;
	}

	public Double getPaymentAmount() {
		return paymentAmount;
	}

	public String getResolution() {
		return resolution;
	}

	public String getRuc() {
		return ruc;
	}

	public String getSavingAccountNumber() {
		return savingAccountNumber;
	}

	public String getStatus() {
		return status;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public void setBusinessCompany(BusinessCompany businessCompany) {
		this.businessCompany = businessCompany;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public void setFiscalPeriodMonth(Integer fiscalPeriodMonth) {
		this.fiscalPeriodMonth = fiscalPeriodMonth;
	}

	public void setFiscalPeriodYear(Integer fiscalPeriodYear) {
		this.fiscalPeriodYear = fiscalPeriodYear;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public void setObligation(String obligation) {
		this.obligation = obligation;
	}

	public void setPaymentAmount(Double paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public void setSavingAccountNumber(String savingAccountNumber) {
		this.savingAccountNumber = savingAccountNumber;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDv() {
		return dv;
	}

	public void setDv(String dv) {
		this.dv = dv;
	}

	@Transient
	public String getFiscalPeriod() {

		if(getFiscalPeriodYear() == null || getFiscalPeriodMonth()== null){
			return "";
		}

		
		String cero = "";
		if(this.getFiscalPeriodMonth()!= null && this.getFiscalPeriodMonth()<10){
			cero = "0";
		}

		
		return ""+this.getFiscalPeriodYear()+cero+this.getFiscalPeriodMonth();
	}

	public String toString(){
		return "RUC:"+getRuc() + " Monto:"+getPaymentAmount() + " Periodo:" + getFiscalPeriod(); 
	}
	
}
