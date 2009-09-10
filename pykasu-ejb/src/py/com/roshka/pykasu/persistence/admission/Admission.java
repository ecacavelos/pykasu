package py.com.roshka.pykasu.persistence.admission;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.jboss.annotation.ejb.Clustered;

import py.com.roshka.pykasu.ejb.AdmissionManagerEJB;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;

@Entity
@Table (name="admission")
public class Admission {
	private Integer id;
	private String companyName;
	private String fname;
	private String lname;
	private String type;
	private String mainActivity;
	private String ruc;
	private String dv;
	private String contactPerson;
	private String ciContactPerson;
	private String address;
	private String locality;
	private String office;
	private String phone;
	private String fax;
	private Date constitution;
	private String mail;
	private String status;
	private Integer bcompanyId;
	private String legacyUsers;

	public Admission(){
		this.status = AdmissionManagerEJB.STATUS_REGISTRO;
	}

	public Admission(String companyName, String fname, String lname, String type,
			String mainActivity, String ruc, String dv, String contactPerson,
			String ciContactPerson, String address, String locality, String office,
			String phone, String fax, Date constitution, String mail) {
		super();
		
		this.companyName = companyName;
		this.fname = fname;
		this.lname = lname;
		this.type = type;
		this.mainActivity = mainActivity;
		this.ruc = ruc;
		this.dv = dv;
		this.contactPerson = contactPerson;
		this.ciContactPerson = ciContactPerson;
		this.address = address;
		this.locality = locality;
		this.office = office;
		this.phone = phone;
		this.fax = fax;
		this.constitution = constitution;
		this.mail = mail;
	}



	@Id
	@Column(name = "admission_id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(nullable=false)
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	@Column(nullable=false)
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	@Column(nullable=false)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMainActivity() {
		return mainActivity;
	}
	public void setMainActivity(String mainActivity) {
		this.mainActivity = mainActivity;
	}
	@Column(nullable=false)
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	@Column(nullable=false)
	public String getDv() {
		return dv;
	}
	public void setDv(String dv) {
		this.dv = dv;
	}
	
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	
	@Column(nullable=false)
	public String getCiContactPerson() {
		return ciContactPerson;
	}
	public void setCiContactPerson(String ciContactPerson) {
		this.ciContactPerson = ciContactPerson;
	}
	
	@Column(nullable=false)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getLocality() {
		return locality;
	}	
	public void setLocality(String locality) {
		this.locality = locality;
	}
	@Column(nullable=false)
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	
	public Date getConstitution() {
		return constitution;
	}
	public void setConstitution(Date constitution) {
		this.constitution = constitution;
	}
	
	@Column(nullable=false)
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name="bcompany_id")
	public Integer getBcompanyId() {
		return bcompanyId;
	}

	public void setBcompanyId(Integer bcompanyId) {
		this.bcompanyId = bcompanyId;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}


	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@Column(name="legacy_users")
	public String getLegacyUsers() {
		return legacyUsers;
	}

	public void setLegacyUsers(String legacyUsers) {
		this.legacyUsers = legacyUsers;
	}

	@Transient
	public String getTypeUIName(){
		if( (""+type).equalsIgnoreCase(BusinessCompany.TYPE_MULTI_USER) ){
			return "Cuenta Corporativa";
		}
		if( (""+type).equalsIgnoreCase(BusinessCompany.TYPE_SINGLE_USER) ){
			return "Cuenta Personal";
		}
		return "";
	}
	
	@Transient
	public String getConstitutionStr(){
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return sdf.format(constitution);
	}
}
