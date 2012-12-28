package py.com.roshka.pykasu.persistence.ruc;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import py.com.roshka.pykasu.exceptions.InvalidRucException;

@Entity
@Table (name = "ruc")
public class Ruc implements Serializable{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Ruc.class);
	
	private Integer id;
	private String newRuc;
	private String oldRuc;
	private Integer verifiedDigit;
	private String contributorName;
	private Integer modalidadContribuyente; //agregado por Esteban Cacavelos 25/10/2012
	
	protected Ruc(){
	}

	
	
	
//	public static final String RUC_STATUS_ACTIVE  = "ACTIVO";
//	public static final String RUC_STATUS_SUSPENDED = "SUSPENDIDO";
//	public static final String RUC_STATUS_CANCELLED = "CANCELADO";
//	
//	public static final String RUC_TYPE_PERSON  = "FISICO";
//	public static final String RUC_TYPE_COMPANY = "JURIDICO";
//
//
//	private Integer id;
//	private String ruc;
//	private String firstName;
//	private String middleName;
//	private String firstLastName;
//	private String secondLastName;
//	private Boolean active;
//	private String status;
//	private String type;
//	
//	protected Ruc(){
//		status = RUC_STATUS_ACTIVE;
//		active = true;
//	}
//	
//	public Ruc(String ruc, String type){
//		this.ruc = ruc.toUpperCase().trim();
//		this.type = type.toUpperCase().trim();
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
//	public String getFirstLastName() {
//		return firstLastName;
//	}
//
//	public void setFirstLastName(String firstLastName) {
//		this.firstLastName = firstLastName;
//	}
//
//	public String getFirstName() {
//		return firstName;
//	}
//
//	public void setFirstName(String firstName) {
//		this.firstName = firstName;
//	}
//
//	@Id	@Column(name="ruc_iid")
//	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_ruc")	
//	public Integer getId() {
//		return id;
//	}
//
//	public void setId(Integer id) {
//		this.id = id;
//	}
//
//	public String getMiddleName() {
//		return middleName;
//	}
//
//	public void setMiddleName(String middleName) {
//		this.middleName = middleName;
//	}
//
//	@Column(unique=true, nullable=false)
//	public String getRuc() {
//		return ruc;
//	}
//
//	public void setRuc(String ruc) {
//		this.ruc = ruc;
//	}
//
//	public String getSecondLastName() {
//		return secondLastName;
//	}
//
//	public void setSecondLastName(String secondLastName) {
//		this.secondLastName = secondLastName;
//	}
//
//	public String getStatus() {
//		return status;
//	}
//
//	public void setStatus(String status) {
//		this.status = status;
//	}
//
//	@Column(nullable=false)
//	public String getType() {
//		return type;
//	}
//
//	public void setType(String type) {
//		this.type = type;
//	}

//	@Override
//	public boolean equals(Object obj) {
//		Ruc r = (Ruc) obj;
//		return  this.ruc.equals(r.getRuc()) && 
//				this.firstName.equals(r.getFirstName()) && 
//				this.middleName.equals(r.getMiddleName()) && 
//				this.firstLastName.equals(r.getFirstLastName()) && 
//				this.secondLastName.equals(r.getSecondLastName()) && 
//				this.active.equals(r.getActive()) && 
//				this.status.equals(r.getStatus()) && 
//				this.type.equals(r.getType()); 
//
//	}
	@Column (name="nombre_contribuyente")
	public String getContributorName() {
		return contributorName;
	}


	public void setContributorName(String contributorName) {
		this.contributorName = contributorName;
	}

	@Id @Column (name="ruc_id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column (name="ruc_num")
	public String getNewRuc() {
		return newRuc;
	}


	public void setNewRuc(String newRuc) {
		this.newRuc = newRuc;
	}

	@Column (name="ruc_alfanum")
	public String getOldRuc() {
		return oldRuc;
	}


	public void setOldRuc(String oldRuc) {
		this.oldRuc = oldRuc;
	}

	@Column (name="digito_verificador")	
	public Integer getVerifiedDigit() {
		return verifiedDigit;
	}


	public void setVerifiedDigit(Integer verifiedDigit) {
		this.verifiedDigit = verifiedDigit;
	}
	
	//agregado por Esteban Cacavelos 25/10/2012
	@Column (name="modalidad_contribuyente")	
	public Integer getModalidadContribuyente() {
		return modalidadContribuyente;
	}


	public void setModalidadContribuyente(Integer modalidadContribuyente) {
		this.modalidadContribuyente = modalidadContribuyente;
	}
	/////fin modalidad contribuyente.

	public String toString(){
		return "RUC Nuevo: "+getNewRuc() + "RUC Nuevo: "+ getOldRuc() + " First Name" + getContributorName();  
	}
		
}
