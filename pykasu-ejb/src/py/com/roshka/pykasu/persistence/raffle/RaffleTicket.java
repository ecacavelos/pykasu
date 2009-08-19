package py.com.roshka.pykasu.persistence.raffle;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;

import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;

@Entity
@Table(name="raffle")
//@SequenceGenerator( name="SEQ_RAFFLE",
//					sequenceName="SEQ_RAFFLE",
//					initialValue=1, allocationSize=1)
public class RaffleTicket {

	public static final String OPERATION_TYPE_PAID 		   = "PAGO";
	public static final String OPERATION_TYPE_PREESTATION  = "PRESENTACION";
	
	@Id
	@Column(name = "raffle_iid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
    @ManyToOne
    @JoinColumn(name="user_iid", referencedColumnName="user_iid")
	private User user;
    @ManyToOne
    @JoinColumn(name="bcompany_iid",referencedColumnName="bcompany_iid")    
	private BusinessCompany businessCompany;
	private String formId;
	private String formType;
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
	private java.util.Date arrivalTime;
    private String operationType;
    private Boolean active;
	
	public RaffleTicket(){
		arrivalTime =  new java.util.Date(System.currentTimeMillis());
		active = Boolean.TRUE;
	}
	
	public RaffleTicket(User user){
		this();
		this.user = user;
		this.businessCompany = user.getBusinessCompany();		
	}

	public java.util.Date getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(java.util.Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public BusinessCompany getBusinessCompany() {
		return businessCompany;
	}

	public void setBusinessCompany(BusinessCompany businessCompany) {
		this.businessCompany = businessCompany;
	}

	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getOperationType() {
		return operationType;
	}

	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}

	public Boolean isActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}
	
	
}
