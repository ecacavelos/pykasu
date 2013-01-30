package py.com.roshka.pykasu.persistence.payment;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;

//@Entity(name="Account")
//@Table(name="account")
public class Account implements Serializable {

//	private Integer id;
//	private String number;
//	private BusinessCompany businessCompany;
//	private User createdBy;
//	private Boolean active;
//	protected Account(){
//	}
//	
//	public Account(User createdBy){
//		this.createdBy = createdBy; 
//		this.active = Boolean.TRUE;
//	}
//
//	public Boolean getActive() {
//		return active;
//	}
//
//	public void setActive(Boolean active) {
//		this.active = active;
//	}
//
//	@ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
//	@JoinColumn(name="bcompany_iid", nullable=false)
//	public BusinessCompany getBusinessCompany() {
//		return businessCompany;
//	}
//
//	public void setBusinessCompany(BusinessCompany businessCompany) {
//		this.businessCompany = businessCompany;
//	}
//
//	@ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
//	@JoinColumn(name="user_iid", nullable=false)	
//	public User getCreatedBy() {
//		return createdBy;
//	}
//
//	public void setCreatedBy(User createdBy) {
//		this.createdBy = createdBy;
//	}
//
//	@Id @Column (name="account_iid")
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	public Integer getId() {
//		return id;
//	}
//
//	public void setId(Integer id) {
//		this.id = id;
//	}
//
//	public String getNumber() {
//		return number;
//	}
//
//	public void setNumber(String number) {
//		this.number = number;
//	}
//
	
}
