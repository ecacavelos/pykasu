package py.com.roshka.pykasu.persistence.forms;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Cell;
import py.com.roshka.pykasu.ui.form.SimpleForm;
import py.com.roshka.pykasu.util.Utils;


@MappedSuperclass
public abstract class TaxForm extends GenericForm implements Serializable{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(TaxForm.class);
	
/*
	Pasos para crear un nuevo formulario
	------------------------------------
	

	1. crear el formxxx.xml
	2. crear el Formxxx.java
	3. -- en esta clase --
		agregar una entrada para: public static final String FORM_TYPE_xxx  = "xxx";
		agregar una entrada para: public static final String FORM_xxx_CLASS_NAME  = "Formxxx";
	4. Agragar la entrada en el Menú: menu.xml
 */

	public static final String FORM_STATUS_PROCESS 		= "PROCESO";
	public static final String FORM_STATUS_TOSEND  		= "PARA ENVIAR";
	public static final String FORM_STATUS_SENDED  		= "CONFIRMADO";
	public static final String FORM_STATUS_PAYED   		= "PRESENTADO";
	public static final String FORM_STATUS_REJECTED		= "RECHAZADO";
	//--
	public static final String FORM_STATUS_VALID		= "VALIDADO";
	public static final String FORM_STATUS_PRINT_CLIENT	= "IMPRESO_CLIENTE";
	public static final String FORM_STATUS_PRINT_SET	= "IMPRESO_SET";
	public static final String FORM_STATUS_ERROR		= "ERROR";

	
	
	
	public static final String FORM_DECLARATION_TYPE_ORIGINAL   = "| 1 | ORIGINAL";
	public static final String FORM_DECLARATION_TYPE_RECTIFICATIVA   = "| 2 | RECTIFICATIVA";

	public static final String FORM_PAYDMENTMODE_CASH   = "EFECTIVO";
	public static final String FORM_PAYDMENTMODE_CHECK  = "CHEQUE";
	public static final String FORM_PAYDMENTMODE_OTHER  = "OTRO";
	
	
	public static final String FORM_TYPE_850  = "850";
	public static final String FORM_TYPE_800  = "800";
	public static final String FORM_TYPE_801  = "801";
	public static final String FORM_TYPE_120  = "120";	

	public static final String FORM_TYPE_101  = "101";	
	public static final String FORM_TYPE_123  = "123";	
	public static final String FORM_TYPE_125  = "125";

	public static final String FORM_TYPE_110  = "110";
	public static final String FORM_TYPE_117  = "117";
	public static final String FORM_TYPE_122  = "122";
	public static final String FORM_TYPE_804  = "804";
	public static final String FORM_TYPE_118  = "118";
	public static final String FORM_TYPE_109  = "109";
	public static final String FORM_TYPE_108  = "108";
	public static final String FORM_TYPE_106  = "106";
	public static final String FORM_TYPE_104  = "104";
	public static final String FORM_TYPE_105  = "105";
	public static final String FORM_TYPE_130  = "130";
	public static final String FORM_TYPE_848  = "848";
	public static final String FORM_TYPE_90  = "90";
	//--
	public static final String FORM_TYPE_124  = "124";
	public static final String FORM_TYPE_90v2  = "90v2";
	public static final String FORM_TYPE_120v2  = "120v2";
	public static final String FORM_TYPE_103v2  = "103v2";
	public static final String FORM_TYPE_107v2  = "107v2";
	public static final String FORM_TYPE_111  = "111";
	public static final String FORM_TYPE_110v2  = "110v2"; // Agregado por Esteban Cacavelos 18-12-2012
	public static final String FORM_TYPE_105v2  = "105v2"; // Agregado por Esteban Cacavelos 19-12-2012
	public static final String FORM_TYPE_112  = "112"; // Agregado por Esteban Cacavelos 19-12-2012
	
	
	//--
	public static final String FORM_TYPE_112  = "112";
	
	public static final String FORM_850_CLASS_NAME  = "Form850";
	public static final String FORM_800_CLASS_NAME  = "Form800";
	public static final String FORM_801_CLASS_NAME  = "Form801";
	public static final String FORM_120_CLASS_NAME  = "Form120";
	public static final String FORM_101_CLASS_NAME  = "Form101";
	public static final String FORM_123_CLASS_NAME  = "Form123";
	public static final String FORM_110_CLASS_NAME  = "Form110";
	public static final String FORM_110v2_CLASS_NAME  = "Form110v2"; // Agregado por Esteban Cacavelos 19-12-2012
	public static final String FORM_105v2_CLASS_NAME  = "Form105v2"; // Agregado por Esteban Cacavelos 19-12-2012
	public static final String FORM_112_CLASS_NAME  = "Form112";	 // Agregado por Esteban Cacavelos 19-12-2012
	public static final String FORM_117_CLASS_NAME  = "Form117";
	public static final String FORM_122_CLASS_NAME  = "Form122";
	public static final String FORM_804_CLASS_NAME  = "Form804";
	public static final String FORM_118_CLASS_NAME  = "Form118";	
	public static final String FORM_109_CLASS_NAME  = "Form109";
	public static final String FORM_108_CLASS_NAME  = "Form108";
	public static final String FORM_106_CLASS_NAME  = "Form106";
	public static final String FORM_104_CLASS_NAME  = "Form104";
	public static final String FORM_105_CLASS_NAME  = "Form105";
	public static final String FORM_125_CLASS_NAME  = "Form125";	
	public static final String FORM_130_CLASS_NAME  = "Form130";
	public static final String FORM_848_CLASS_NAME  = "Form848";
	public static final String FORM_90_CLASS_NAME  = "Form90";
	//--
	public static final String FORM_124_CLASS_NAME    = "Form124";
	public static final String FORM_90v2_CLASS_NAME   = "Form90v2";
	public static final String FORM_120v2_CLASS_NAME  = "Form120v2";
	public static final String FORM_103v2_CLASS_NAME  = "Form103v2";
	public static final String FORM_107v2_CLASS_NAME  = "Form107v2";
	public static final String FORM_111_CLASS_NAME  = "Form111";
	//--
	public static final String FORM_112_CLASS_NAME  = "Form112";
	
	
	
	private Integer id;
	private Date createdDate;
	private User createdBy;
	private String status =  TaxForm.FORM_STATUS_PROCESS; 
	private Boolean active = false;
	private BusinessCompany businessCompany;
	private Date paymentDate;	

	private String prePrintedNumber;

	private String ruc;
	private Integer dv; 
	private String firstName;
	private String middleName;
	private String firstLastName;
	private String secondLastName;

	
	private String declarationType = TaxForm.FORM_DECLARATION_TYPE_ORIGINAL; 
	private String rectificativePPN;
	private Boolean clausureType;
	private Integer fiscalPeriodMounth;
	private Integer fiscalPeriodYear;
	private String recipNumber;
	private String paymentMode;
	private Double totalAmount;	

	private Integer orderNumber;
	private Date presentationDate;
	
	private String messageInfo;

	protected TaxForm(){
		this.active = true;
		this.status = TaxForm.FORM_STATUS_PROCESS;
		this.createdDate = new Date(System.currentTimeMillis());
		setClausureType(false);		
	}
		
	public TaxForm(User userCreator){
		this();
		this.createdBy = userCreator;
		this.businessCompany = userCreator.getBusinessCompany();
	}

	
	@Column(name="is_active")
	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	@ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="bcompany_iid", nullable=false)
	public BusinessCompany getBusinessCompany() {
		return businessCompany;
	}

	public void setBusinessCompany(BusinessCompany businessCompany) {
		this.businessCompany = businessCompany;
	}

	//@ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@ManyToOne(optional=false)
	@JoinColumn(name="user_iid", nullable=false, updatable=false)
	public User getCreatedBy() {
		return createdBy;
		
	}
	
	@Id @Column (name="form_iid")
	//@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_form120")
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getDeclarationType() {
		return declarationType;
	}

	public void setDeclarationType(String declarationType) {
		this.declarationType = declarationType;
	}

	public Integer getDv() {
		return dv;
	}

	public void setDv(Integer dv) {
		this.dv = dv;
	}

	public String getFirstLastName() {
		return firstLastName;
	}
	
	@Column(nullable=false)	
	public void setFirstLastName(String firstLastName) {
		this.firstLastName = firstLastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public Integer getFiscalPeriodMounth() {
		return fiscalPeriodMounth;
	}

	public void setFiscalPeriodMounth(Integer fiscalPeriodMounth) {
//		if(fiscalPeriodMounth < 1 && fiscalPeriodMounth > 12){
//			throw new PykasuGenericException("Mes no aplicable");
//		}
		this.fiscalPeriodMounth = fiscalPeriodMounth;
	}

	public Integer getFiscalPeriodYear() {
		return fiscalPeriodYear;
	}

	public void setFiscalPeriodYear(Integer fiscalPeriodYear) {
		this.fiscalPeriodYear = fiscalPeriodYear;
	}


	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	@Column (unique = true, nullable=false)
	public String getPrePrintedNumber() {
		return prePrintedNumber;
	}

	public void setPrePrintedNumber(String prePrintedNumber) {
		this.prePrintedNumber = prePrintedNumber;
	}

	public String getRecipNumber() {
		return recipNumber;
	}

	public void setRecipNumber(String recipNumber) {
		this.recipNumber = recipNumber;
	}

	public String getRectificativePPN() {
		return rectificativePPN;
	}

	public void setRectificativePPN(String rectificativePPN) {
		this.rectificativePPN = rectificativePPN;
	}

	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public String getSecondLastName() {
		return secondLastName;
	}

	public void setSecondLastName(String secondLastName) {
		this.secondLastName = secondLastName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
		if(status.equalsIgnoreCase(FORM_STATUS_SENDED)){
			setCreatedDate(new Date(System.currentTimeMillis()));
		}
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Boolean getClausureType() {
		return clausureType;
	}

	public void setClausureType(Boolean clausureType) {
		this.clausureType = clausureType;
	}

	@Column (name="Ordernumber")
	public Integer getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}

	@Column (name="Presentationdate")
	public Date getPresentationDate() {
		return presentationDate;
	}

	public void setPresentationDate(Date presentationDate) {
		this.presentationDate = presentationDate;
	}
	
	@Column (name="msg_info")	
	public String getMessageInfo() {
		return messageInfo;
	}

	public void setMessageInfo(String messageInfo) {
		this.messageInfo = messageInfo;
	}

	@Transient
	public String getFiscalPeriod(){
		String fp = (""+getFiscalPeriodYear());
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(2);
		nf.setMaximumIntegerDigits(2);
		try{
			fp = fp.concat(nf.format(""+getFiscalPeriodMounth()));
		}catch (Exception e){
			logger.error("Error al formatear el campo de mes de: " + getPrePrintedNumber(),e);
		}
		return fp;
	}
	//public abstract String getType();
	
	public void loadHeader(SimpleForm simpleForm) throws PykasuGenericException {

		setDv(Integer.parseInt(simpleForm.getDv()));		
		setRuc(simpleForm.getRuc());
		logger.info("Antes de consultar el cierre");
		if(!Utils.afterCloseHour()){
			setPresentationDate(new java.util.Date(System.currentTimeMillis()));
			setPaymentDate(new java.util.Date(System.currentTimeMillis()));
		}else{//paso la hora del cierre, debería de computarse como el día siguiente.
			Calendar c = Calendar.getInstance();
			c.setTime(new java.util.Date(System.currentTimeMillis()));
			c.add(Calendar.DATE, 1);
			setPresentationDate(c.getTime());
			setPaymentDate(c.getTime());			
		}
		
		setStatus(FORM_STATUS_SENDED);
		
		
	}
		
}

