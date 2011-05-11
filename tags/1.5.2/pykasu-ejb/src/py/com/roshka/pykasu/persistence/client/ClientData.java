package py.com.roshka.pykasu.persistence.client;

import java.io.Serializable;
import java.sql.Date;

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

import py.com.roshka.pykasu.persistence.forms.GenericForm;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;


@Entity
@Table (name = "client_data")
//@SequenceGenerator (name = "seq_client_data", sequenceName="seq_client_data")
public class ClientData extends GenericForm implements Serializable {

	private Integer id;
	private BusinessCompany businessCompany;	
	private Boolean active;
	private String ruc;
	private String address;
	private String phoneNumber1;
	private String phoneNumber2;
	private String phoneNumber3;
	private String phoneNumber4;
	private Date birthDay;
	private String status; //estado civil
	private String businessName;
	private String email;


	protected ClientData(){
	}
	

	public ClientData(User userCreator){
		this();
		this.businessCompany = userCreator.getBusinessCompany();
	}
	
	@Column(name="is_active")
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	public String getBusinessName() {
		return businessName.toUpperCase().trim();
	}
	public void setBusinessName(String businessName) {
		if(businessName != null)
			this.businessName = businessName.toUpperCase().trim();
		else 
			this.businessName = businessName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		if(email != null)
			this.email = email.toLowerCase().trim();
		else 
			this.email = email;
	}
	
	@Id @Column(name="client_data_iid")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_client_data")
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPhoneNumber1() {
		return phoneNumber1;
	}
	public void setPhoneNumber1(String phoneNumber1) {
		this.phoneNumber1 = phoneNumber1;
	}
	public String getPhoneNumber2() {
		return phoneNumber2;
	}
	public void setPhoneNumber2(String phoneNumber2) {
		this.phoneNumber2 = phoneNumber2;
	}
	public String getPhoneNumber3() {
		return phoneNumber3;
	}
	public void setPhoneNumber3(String phoneNumber3) {
		this.phoneNumber3 = phoneNumber3;
	}
	public String getPhoneNumber4() {
		return phoneNumber4;
	}
	public void setPhoneNumber4(String phoneNumber4) {
		this.phoneNumber4 = phoneNumber4;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		if(ruc != null)
			this.ruc = ruc.toUpperCase().trim();
		else
			this.ruc = ruc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

//	@Override
//	public String retrievePrePrintedNumber() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public String retrieveFormType() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		if(address != null)
			this.address = address.toUpperCase().trim();
		else
			this.address = address;
	}

	@ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="bcompany_iid", nullable=false)
	public BusinessCompany getBusinessCompany() {
		return businessCompany;
	}

	public void setBusinessCompany(BusinessCompany businessCompany) {
		this.businessCompany = businessCompany;
	}
	
}
