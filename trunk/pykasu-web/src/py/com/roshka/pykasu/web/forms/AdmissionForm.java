package py.com.roshka.pykasu.web.forms;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.web.filters.SecurityFilter;

/**
* @struts.form name = "AdmissionForm"
*/ 
public class AdmissionForm extends ActionForm {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(AdmissionForm.class);
	
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
	private String office; //sucursal
	private String phone;
	private String fax;
	private String constitution;
	private String mail;
	
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
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
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getCiContactPerson() {
		return ciContactPerson;
	}
	public void setCiContactPerson(String ciContactPerson) {
		this.ciContactPerson = ciContactPerson;
	}
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
	public String getConstitution() {
		return constitution;
	}
	public void setConstitution(String constitution) {
		this.constitution = constitution;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		
		logger.info("Validate Admission Form");
		if(getType() != null){
			if(getType().equalsIgnoreCase(BusinessCompany.TYPE_MULTI_USER)){
				if(getCompanyName() == null || getCompanyName().trim().length() == 0){
		            errors.add("userform.companyName.mandatory", new ActionError("userform.companyName.mandatory"));
		            logger.info("userform.companyName.mandatory");
				}
			}
			if(getRuc() == null || getRuc().trim().length() == 0){
	            errors.add("userform.ruc.mandatory", new ActionError("userform.ruc.mandatory"));
	            logger.info("userform.ruc.mandatory");				
			}
			if(getDv() == null || getDv().trim().length() == 0){
	            errors.add("userform.dv.mandatory", new ActionError("userform.dv.mandatory"));
	            logger.info("userform.dv.mandatory");				
			}
			if(getAddress() == null || getAddress().trim().length() == 0){
	            errors.add("userform.address.mandatory", new ActionError("userform.address.mandatory"));
	            logger.info("userform.address.mandatory");				
			}
			if(getPhone() == null || getPhone().trim().length() == 0){
	            errors.add("userform.phone.mandatory", new ActionError("userform.phone.mandatory"));
	            logger.info("userform.phone.mandatory");				
			}			
			if(getCiContactPerson() == null || getCiContactPerson().trim().length() == 0){
	            errors.add("userform.ci.mandatory", new ActionError("userform.ci.mandatory"));
	            logger.info("userform.ci.mandatory");				
			}			
			if(getConstitution() == null || getConstitution().trim().length() == 0){
	            errors.add("userform.date.mandatory", new ActionError("userform.date.mandatory"));
	            logger.info("userform.date.mandatory");				
			}
			if(getFname() == null || getFname().trim().length() == 0){
	            errors.add("userform.name.mandatory", new ActionError("userform.name.mandatory"));
	            logger.info("userform.name.mandatory");				
			}
			if(getLname() == null || getLname().trim().length() == 0){
	            errors.add("userform.lastName.mandatory", new ActionError("userform.lastName.mandatory"));
	            logger.info("userform.lastName.mandatory");				
			}
			if(getMail() == null || getMail().trim().length() == 0){
	            errors.add("userform.email.mandatory", new ActionError("userform.email.mandatory"));
	            logger.info("userform.email.mandatory");				
			}

		}
		
		return errors;
	}

	
}
