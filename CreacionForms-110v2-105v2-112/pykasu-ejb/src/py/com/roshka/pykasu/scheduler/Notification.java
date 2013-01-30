package py.com.roshka.pykasu.scheduler;

import java.util.Date;

public class Notification {

	private int formwfId;
	private int formType;
	private int formId;
	private String ruc;
	private String dv;
	private int month;
	private int year;
	private String contributor;
	private Double amount;	
	private String status;
	private String mail;
	private Date arrivalTime;
	private String message;
	
	protected Notification(){}
	
	public Notification(int formwfId, int formType, int formId, String ruc,
			String dv, int month, int year, String contributor, Double amount,
			String status, String mail, Date arrivalTime, String message) {
		super();
		this.formwfId = formwfId;
		this.formType = formType;
		this.formId = formId;
		this.ruc = ruc;
		this.dv = dv;
		this.month = month;
		this.year = year;
		this.contributor = contributor;
		this.amount = amount;
		this.status = status;
		this.mail = mail;
		this.arrivalTime = arrivalTime;
		this.message = message;
	}
	
	public int getFormwfId() {
		return formwfId;
	}
	public void setFormwfId(int formwfId) {
		this.formwfId = formwfId;
	}
	public int getFormType() {
		return formType;
	}
	public void setFormType(int formType) {
		this.formType = formType;
	}
	public int getFormId() {
		return formId;
	}
	public void setFormId(int formId) {
		this.formId = formId;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	public String getDv() {
		return dv;
	}
	public void setDv(String dv) {
		this.dv = dv;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getContributor() {
		return contributor;
	}
	public void setContributor(String contributor) {
		this.contributor = contributor;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public Date getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
