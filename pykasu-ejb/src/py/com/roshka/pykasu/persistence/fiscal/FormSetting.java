package py.com.roshka.pykasu.persistence.fiscal;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table (name="formularios")
public class FormSetting implements Serializable {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(FormSetting.class);
	
	public static final String FORM_ACTIVE = "N"; 
	public static final String FORM_INACTIVE = "V"; 

	public static final String FORM_FREQUENCY_MONTHY = "M"; 
	public static final String FORM_FREQUENCY_ANNUAL = "A"; 	
	public static final String FORM_FREQUENCY_FOURMONTHY = "C";
	public static final String FORM_FREQUENCY_SIXMONTHY = "S";	
	public static final String FORM_FREQUENCY_OCCASSIONALY = "O";
	public static final String FORM_FREQUENCY_THREEMONTHY = "T";
	public static final String FORM_FREQUENCY_ANNUAL_RURAL= "R"; 	
	
	
	private String formType;
	private String state;
	private String period;
	private String valid;
	private Date periodBegin;
	private Date periodEnd;
	private String frequency;
	
	protected FormSetting(){		
	}
	
	@Id @Column(name = "pyk_codigo")
	public String getFormType() {
		return formType;
	}
	public void setFormType(String formType) {
		this.formType = formType;
	}

	@Column(name = "ejercicio")
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}

	@Column(name = "period_ini")	
	public Date getPeriodBegin() {
		return periodBegin;
	}
	public void setPeriodBegin(Date periodBegin) {
		this.periodBegin = periodBegin;
	}

	@Column(name = "period_fin")
	public Date getPeriodEnd() {
		return periodEnd;
	}
	public void setPeriodEnd(Date periodEnd) {
		this.periodEnd = periodEnd;
	}
	
	@Column(name = "estado_formulario")
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	

	@Column(name = "tipo_form")	
	public String getValid() {
		return valid;
	}
	
	public void setValid(String valid) {
		this.valid = valid;
	}	
	
	
	@Column(name = "periodicidad")
	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	@Transient
	public Boolean isActive(){
		logger.info("Evaluate if " + getValid() + " is active or not!");
		return new Boolean(getValid().equals(FORM_ACTIVE));
	}

	@Transient
	public Boolean isMonthy(){
		return new Boolean(getFrequency().equals(FORM_FREQUENCY_MONTHY));
	}
	
	@Transient
	public Boolean isAnnual(){
		return new Boolean(getFrequency().equals(FORM_FREQUENCY_ANNUAL));
	}
	
	@Transient
	public Boolean isAnnualRural(){
		return new Boolean(getFrequency().equals(FORM_FREQUENCY_ANNUAL_RURAL));
	}
	
	@Transient
	public Boolean isThreeMonthy(){
		return new Boolean(getFrequency().equals(FORM_FREQUENCY_THREEMONTHY));
	}	
	
	@Transient
	public Boolean isFourMonthy(){
		return new Boolean(getFrequency().equals(FORM_FREQUENCY_FOURMONTHY));
	}	

	@Transient
	public Boolean isSixMonthy(){
		return new Boolean(getFrequency().equals(FORM_FREQUENCY_SIXMONTHY));
	}	
	
	@Transient
	public Boolean isOccassionaly(){
		return new Boolean(getFrequency().equals(FORM_FREQUENCY_OCCASSIONALY));
	}

}
