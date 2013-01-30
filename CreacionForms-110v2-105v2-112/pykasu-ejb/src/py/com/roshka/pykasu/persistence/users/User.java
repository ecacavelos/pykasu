package py.com.roshka.pykasu.persistence.users;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/*

/*
 *@author pwelti
 */


@Entity (name = "User")
@Table (name = "users")
//@EntityListeners (py.com.roshka.pykasu.persistence.audit.Audit.class)
//@SequenceGenerator(name = "seq_users", sequenceName = "seq_users")
public class User implements Serializable{
	
	public static final String USER_TYPE_FISICO = "fisico";
	public static final String USER_TYPE_JURIDICO = "juridico";

	private Integer id;
	private String userName;//nombre de usuario (nombre de la cuenta)
	private String fullName;//Nombre completo del usuario (Nombre y Apellido)
	private String phoneNumber;//Nro de tel
	private String ruc;//RUC
	private String dv;//DV
	private String address;
	private String locality;
	private String bornDate;
	private String email;
	private String passwordDigest;
	private String userType;//Tipo: Fisico, Juridico
	private Boolean isActive;
	private String documentNumber; //Número de cédula. Se necesita para el HomeBanking
	private BusinessCompany businessCompany;
    //private Set <Role> roles;
    private List<Role> roles=new ArrayList<Role>();
    private Boolean paymentAvaliable;
	
	@SuppressWarnings("unchecked")
	protected User() {
		//roles = new HashSet();
	}
	@Deprecated
	public User(String userName, String passwordDigest, String fullName, BusinessCompany bCompany) {
		this();
		this.setUserName(userName);
		this.setPasswordDigest(passwordDigest);
		this.setFullName(fullName);
		this.setBusinessCompany(bCompany);
		this.setPaymentAvaliable(false);
		this.setIsActive(true);
	}

	
	public User(String fullName, String passwordDigest, String userName, String userPhoneNumber, 
			String ruc, String dv, String userAddress, String userLocality, String bornDate, 
			String email ,String userType, BusinessCompany bCompany) {
		
		this(userName, passwordDigest, fullName, bCompany);
		this.phoneNumber = userPhoneNumber;
		this.ruc = ruc;
		this.dv = dv;
		this.address = userAddress;
		this.locality = userLocality;
		this.bornDate = bornDate;
		this.email = email;
		this.userType = userType;
		this.setIsActive(true);	
		
	}
	
//	public User(Integer id, String fullName, String passwordDigest, String userName, String userPhoneNumber, 
//			String ruc, String dv, String userAddress, String userLocality, String bornDate, 
//			String email ,String userType, BusinessCompany bCompany) {
//		this(fullName, passwordDigest, userName, userPhoneNumber, 
//				ruc, dv, userAddress, userLocality, bornDate, 
//				email ,userType, bCompany);
//		this.id = id;
//		
//	}
	
	@Id @Column (name="user_iid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	
	protected void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return (this.id);
	}
		
	public void setUserId(Integer userId) {
		this.id = userId;
	}
	
	@Column (unique = true)
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName.trim().toLowerCase();
	}
	

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
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


	public String getPasswordDigest() {
		return passwordDigest;
	}

	public void setPasswordDigest(String passwordDigest) {
		this.passwordDigest = passwordDigest;
	}

	@ManyToOne //(cascade={CascadeType.PERSIST, CascadeType.REMOVE, CascadeType.REFRESH})
	@JoinColumn(name = "bcompany_id")		
	public BusinessCompany getBusinessCompany() {
		return businessCompany;
	}
	
	
	public void setBusinessCompany(BusinessCompany businessCompany) {
		this.businessCompany = businessCompany;
	}	
	
	
	public String toString(){
		String str;
		str = " ID: " + getId().toString()
			+ " userName: " + getUserName()
			+ " FullName: " + getFullName()
			+ " Password: ******";
		if(this.getBusinessCompany() != null){
			str.concat(" BusinessCompany: " + this.getBusinessCompany().getName());
		}
		return str;
	}
	
	public String toAudit(){
		return(this.toString());
	}

	@SuppressWarnings("unchecked")
	@ManyToMany( 
    	targetEntity=py.com.roshka.pykasu.persistence.users.Role.class,
    	cascade={CascadeType.PERSIST},
    	fetch=FetchType.LAZY
    )
    @JoinTable(
    	name="user_roles",
    	joinColumns={@JoinColumn(name="user_iid")},
    	inverseJoinColumns={@JoinColumn(name="role_iid")}
    )
    public List <Role> getRoles() {
        return roles;
    }

	public void setRoles(List<Role> roles) {
        this.roles = roles;
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
	/**
	 * @return Returns the userType.
	 */
	public String getUserType() {
		return userType;
	}
	/**
	 * @param userType The userType to set.
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}
	/**
	 * @return Returns the address.
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address The address to set.
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return Returns the bornDate.
	 */
	public String getBornDate() {
		return bornDate;
	}
	/**
	 * @param bornDate The bornDate to set.
	 */
	public void setBornDate(String bornDate) {
		this.bornDate = bornDate;
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
	/**
	 * @return Returns the phoneNumber.
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}
	/**
	 * @param phoneNumber The phoneNumber to set.
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	/**
	 * @return Returns the ruc.
	 */
	public String getRuc() {
		return ruc;
	}
	/**
	 * @param ruc The ruc to set.
	 */
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	@Column(unique=true)
	public String getDocumentNumber() {
		return documentNumber;
	}
	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}

	@Column(name="payment_available")
	public Boolean getPaymentAvaliable() {
		return paymentAvaliable;
	}
	public void setPaymentAvaliable(Boolean paymentAvaliable) {
		this.paymentAvaliable = paymentAvaliable;
	}
}
