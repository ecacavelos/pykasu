package py.com.roshka.pykasu.persistence.users;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import py.com.roshka.pykasu.exceptions.InvalidRucException;

//TODO Hacer que exista una empresa administradora
//TODO Que no se coloque la fecha de hoy en los anticipos
//TODO Verificar que todos los campos traigan correctamente su valor en 801 y 800
//TODO Datos de los clientes. Corroborar que funcione bien. Que recupere siempre
//TODO Cambio de contraseña

@Entity (name = "BusinessCompany") 
@Table (name = "bcompany")
//@SequenceGenerator (name = "seq_bcompany", sequenceName="seq_bcompany")
public class BusinessCompany implements Serializable {

	private Integer id;
	private String name;//Nombre de la empresa
	private String comercialActivity;//Ramo
	private String ruc;
	private String dv;
    private String contactPerson;//Persona de contacto
    private String ciContactPerson;//C.I. de la persona
	private String address;
	private String locality;
	private String phoneNumber;
	private String faxNumber;
	private String constitutionDate;
	private String email;//EL EMAIL CREO QUE SE GUARDA SOLO EN EL USER
	private Boolean isActive;
	private String activationKey;
	private Boolean isAdministrative;
	private Boolean printFormService;
	private Boolean client;
//	private Set<Account> accounts = new HashSet<Account>();


	protected BusinessCompany(){
		this.client = Boolean.FALSE;
	}
	@Deprecated
	public BusinessCompany(String ruc, String name) 
	   throws InvalidRucException{
	
		this();
		//Ruc.validate(ruc.toUpperCase());
		this.setRuc(ruc.toUpperCase().trim());
		this.setName(name);
		this.setIsActive(true);
	}
	
//	public BusinessCompany(Integer id, String name, String comercialActivity,
//			String ruc, String businessCompanyDv, String contactPerson, 
//			String ciContactPerson, String businessAddress, String businessLocality, 
//			String businessPhoneNumber,String faxNumber, String constitutionDate)
//	   throws InvalidRucException{
//		this(name, comercialActivity,
//				ruc, businessCompanyDv,contactPerson, 
//				ciContactPerson, businessAddress, businessLocality, 
//				businessPhoneNumber,faxNumber, constitutionDate);
//		this.id = id;
//	}
	
	
	public BusinessCompany(String name, String comercialActivity,
			String ruc, String businessCompanyDv, String contactPerson, 
			String ciContactPerson, String businessAddress, String businessLocality, 
			String businessPhoneNumber,String faxNumber, String constitutionDate)
	   throws InvalidRucException{
		this(ruc,name);
		this.dv = businessCompanyDv;
		this.address = businessAddress.trim().toUpperCase();
		this.setIsActive(false);
		this.setIsAdministrative(false);
		Double d = new Double(Math.random() * 10000000);
		Integer i = new Integer(d.intValue());
		this.activationKey = i.toString();
		this.comercialActivity = comercialActivity;
		this.contactPerson = contactPerson;
		this.ciContactPerson = ciContactPerson;
		this.address = businessAddress;
		this.locality = businessLocality;
		this.phoneNumber = businessPhoneNumber.trim().toUpperCase();		
		this.faxNumber = faxNumber.trim().toUpperCase();
		this.constitutionDate = constitutionDate;
		this.client = Boolean.FALSE;
	}

	@Id @Column(name="bcompany_iid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		if(name != null)
			this.name = name.trim().toUpperCase();
		else
			this.name = name;
	}
	
	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		if(ruc != null)
			this.ruc = ruc.trim().toUpperCase();
		else
		  this.ruc = ruc;	
	}

	@Column(name="is_active")	
	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		if(this.isActive == null)
			this.isActive = new Boolean(isActive);
		else
			this.isActive = isActive;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		if(address != null)
		  this.address = address.trim().toUpperCase();
		else
			this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		if(email != null)
			this.email = email.trim();
		else
			this.email = email;
	}

	public String getFaxNumber() {
		return faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getActivationKey() {
		return activationKey;
	}

	public void setActivationKey(String activationKey) {
		this.activationKey = activationKey;
	}

	@Column(name="is_administrative")
	public Boolean getIsAdministrative() {
		return isAdministrative;
	}

	protected void setIsAdministrative(Boolean isAdministrative) {
		if(this.isAdministrative == null)
			this.isAdministrative = new Boolean(isAdministrative);
		else
			this.isAdministrative = isAdministrative;
	}
	/**
	 * @return Returns the comercialActivity.
	 */
	public String getComercialActivity() {
		return comercialActivity;
	}
	/**
	 * @param comercialActivity The comercialActivity to set.
	 */
	public void setComercialActivity(String comercialActivity) {
		this.comercialActivity = comercialActivity;
	}
	/**
	 * @return Returns the ciContactPerson.
	 */
	public String getCiContactPerson() {
		return ciContactPerson;
	}
	/**
	 * @param ciContactPerson The ciContactPerson to set.
	 */
	public void setCiContactPerson(String ciContactPerson) {
		this.ciContactPerson = ciContactPerson;
	}
	/**
	 * @return Returns the contactPerson.
	 */
	public String getContactPerson() {
		return contactPerson;
	}
	/**
	 * @param contactPerson The contactPerson to set.
	 */
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	/**
	 * @return Returns the constitutionDate.
	 */
	public String getConstitutionDate() {
		return constitutionDate;
	}
	/**
	 * @param constitutionDate The constitutionDate to set.
	 */
	public void setConstitutionDate(String constitutionDate) {
		this.constitutionDate = constitutionDate;
	}
	/**
	 * @return Returns the dv.
	 */
	public String getDv() {
		return dv;
	}
	/**
	 * @param dv The dv to set.
	 */
	public void setDv(String dv) {
		this.dv = dv;
	}
	/**
	 * @return Returns the locality.
	 */
	public String getLocality() {
		return locality;
	}
	/**
	 * @param locality The locality to set.
	 */
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public Boolean getPrintFormService() {
		return printFormService;
	}
	public void setPrintFormService(Boolean printFormService) {
		this.printFormService = printFormService;
	}
	
	@Column(name="is_client")
	public Boolean getClient() {
		return client;
	}
	public void setClient(Boolean client) {
		this.client = client;
	}


	
	
	
//	@OneToMany(targetEntity=Account.class,  
//			   fetch = FetchType.EAGER,
//			   cascade = {CascadeType.PERSIST, CascadeType.MERGE},
//			   mappedBy="businessCompany"
//			   )
//	public Set<Account> getAccounts() {
//		return accounts;
//	}
//	
//	public void setAccounts(Set<Account> accounts) {
//		this.accounts = accounts;
//	}
//	
	
	
}
