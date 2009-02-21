package py.com.roshka.pykasu.persistence.uploadForm;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;

@Entity (name = "UploadForm")
@Table (name = "uploads_forms")
public class UploadForm {
	
	public static final String STATUS_ACTIVE   = "ACTIVO";
	public static final String STATUS_REJECTED = "RECHAZADO";
	public static final String STATUS_PROCECED = "PROCESADO";
	
	private Integer uploadFormId;
	private String formId;
	private String formType;
	private Date uploadAt = new Date(System.currentTimeMillis());;
	private String status = STATUS_ACTIVE;
	private String description;
	private Date lastChange = new Date(System.currentTimeMillis());
	private boolean active = true;
	private BusinessCompany bcompany;
	private User user;
	private String file;
	
	private String ruc;	
	private String fiscalPeriod; //YYYYMM
	private String declarationType; //original / rectificativa
	
	protected UploadForm(){}

	
	public UploadForm(TaxForm form, String formType, String file){
		this.formId = form.getPrePrintedNumber();
		this.formType = formType;
		this.bcompany = form.getBusinessCompany();
		this.user = form.getCreatedBy();
		this.ruc = form.getRuc();
		this.fiscalPeriod = form.getFiscalPeriod();
		this.declarationType = form.getDeclarationType();
		this.file = file;		
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(nullable=false)	
	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}
	
	@Column(nullable=false)	
	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}

	public Date getLastChange() {
		return lastChange;
	}

	public void setLastChange(Date lastChange) {
		this.lastChange = lastChange;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

		public Date getUploadAt() {
		return uploadAt;
	}

	public void setUploadAt(Date uploadAt) {
		this.uploadAt = uploadAt;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@Id @Column (name="upload_form_iid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	public Integer getUploadFormId() {
		return uploadFormId;
	}

	public void setUploadFormId(Integer uploadFormId) {
		this.uploadFormId = uploadFormId;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	@ManyToOne(optional=false) 
    @JoinColumn(name="bcompanyid", nullable=false, updatable=false)
	public BusinessCompany getBcompany() {
		return bcompany;
	}


	public void setBcompany(BusinessCompany bcompany) {
		this.bcompany = bcompany;
	}

	@ManyToOne(optional=false) 
    @JoinColumn(name="userid", nullable=false, updatable=false)
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getFiscalPeriod() {
		return fiscalPeriod;
	}


	public void setFiscalPeriod(String fiscalPeriod) {
		this.fiscalPeriod = fiscalPeriod;
	}


	public String getRuc() {
		return ruc;
	}


	public void setRuc(String ruc) {
		this.ruc = ruc;
	}


	public String getDeclarationType() {
		return declarationType;
	}


	public void setDeclarationType(String declarationType) {
		this.declarationType = declarationType;
	}

	
}
