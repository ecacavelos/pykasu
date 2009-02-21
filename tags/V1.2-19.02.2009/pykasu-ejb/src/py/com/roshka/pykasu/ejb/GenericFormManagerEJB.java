package py.com.roshka.pykasu.ejb;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.EJB;
import javax.annotation.Resource;
import javax.ejb.SessionContext;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import py.com.roshka.pykasu.exceptions.AddFormException;
import py.com.roshka.pykasu.exceptions.FindingException;
import py.com.roshka.pykasu.exceptions.FiscalInfoException;
import py.com.roshka.pykasu.exceptions.FormDeleteException;
import py.com.roshka.pykasu.exceptions.FormNotFoundException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.exceptions.UpdateFormException;
import py.com.roshka.pykasu.interfaces.FiscalRulesManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form120;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;
import py.com.roshka.pykasu.ui.util.ResultItem;
import py.com.roshka.pykasu.xml.Parser;

public abstract class GenericFormManagerEJB implements GenericFormManager {

	@EJB protected FiscalRulesManager fiscalRulesManager;	
	@EJB protected UserManager userManager;
	
	@Resource 
	protected SessionContext sc;
	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(GenericFormManagerEJB.class);
	
	abstract public  Form getForm(String id) throws FormNotFoundException;

	abstract public String addForm(Form form) throws AddFormException;

	abstract public void updateForm(Form form) throws UpdateFormException;

	abstract public void deteleForm(String id) throws FormDeleteException;
	
	abstract protected String getFormClassName();
	
	abstract protected String getXmlFormRepresentation();

	@SuppressWarnings("unchecked")
	public List<ResultItem> getForms(Calendar init, Calendar end) {
	  	User user;
    	List<ResultItem> results = new ArrayList<ResultItem>();

    	try {
			user = userManager.findUserByName(sc.getCallerPrincipal().getName());
    	
			logger.info("Recuperando forms en un rango de fechas. init:" + init.getTime() + " ~ end: " + end.getTime());
			List <TaxForm>list = em.createQuery("select f from "+ getFormClassName() +" as f " +
									   " where f.businessCompany = :bc " +
									   " and f.createdDate between :init and :end" +
									   " order by f.createdDate desc")
    				.setParameter("bc",user.getBusinessCompany())
    				.setParameter("init",init.getTime())
    				.setParameter("end",end.getTime())
    				.getResultList();
    	
	    	ResultItem ri = null;
	    	for(TaxForm taxForm : list){
	    		 ri = new ResultItem(); 	
	    	     ri.setId(taxForm.getPrePrintedNumber());
	    	     ri.setDescription("ID:"+taxForm.getPrePrintedNumber() + 
	    	    		                   "<br/>RUC: " + taxForm.getRuc() + 
	    	    		                   "<br/>Periodo: " + taxForm.getFiscalPeriodYear() + "-" + taxForm.getFiscalPeriodMounth()+
	    	    		                   "<br/>" + taxForm.getFirstLastName() + 
	    	    		                   "<br/>" + taxForm.getStatus());
	
	    	     if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_SENDED)){
	    	    	 SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	    	    	 ri.setDescription(ri.getDescription().concat(" - Confirmado el:  " + sdf.format(taxForm.getCreatedDate())));
	    	     }

	    	     if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_PROCESS)){
	    	    	 SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	    	    	 ri.setDescription(ri.getDescription().concat(" - Creado el:  " + sdf.format(taxForm.getCreatedDate())));
	    	     }

	    	     if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_PAYED)){
	    	    	 ri.setDescription(ri.getDescription().concat(" - Numero orden:  " + taxForm.getOrderNumber()) );
	    	     }
	    	     
	    	     if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_PROCESS)){
	    	    	 ri.setDeleteable(true);
	    	    	 ri.setEditable(true);
	    	    	 ri.setShowDetails(true);
	    	     }else if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_TOSEND)){
	    	    	 ri.setDeleteable(false);
	    	    	 ri.setEditable(true);
	    	    	 ri.setShowDetails(true);    	    	 
	    	     }else if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_SENDED) 
	    	    		 	|| taxForm.getStatus().equals(TaxForm.FORM_STATUS_PAYED)
	    	    		 	|| taxForm.getStatus().equals(TaxForm.FORM_STATUS_REJECTED)){
	    	    	 ri.setDeleteable(false);
	    	    	 ri.setEditable(false);
	    	    	 ri.setShowDetails(true);    	    	 
	    	     }else {
	    	    	 ri.setDeleteable(false);
	    	    	 ri.setEditable(false);
	    	    	 ri.setShowDetails(true);    	    	 
	    	     }
	    	     results.add(ri);
	    	}
		} catch (FindingException e) {
			logger.error("Imposible to retrieve forms. ",e);
		}

    	return results;


	}
	
	@SuppressWarnings("unchecked")
	public List<ResultItem> getAll() {
	  	User user;
    	List<ResultItem> results = new ArrayList();

    	try {
			user = userManager.findUserByName(sc.getCallerPrincipal().getName());
    	
			List <TaxForm>list = em.createQuery("select f from "+ getFormClassName() +" as f " +
									   "where f.businessCompany = :bc " +
									   "order by f.createdDate desc")
    				.setParameter("bc",user.getBusinessCompany())
    				.getResultList();
    	
	    	ResultItem ri = null;
	    	for(TaxForm taxForm : list){
	    		 ri = new ResultItem(); 	
	    	     ri.setId(taxForm.getPrePrintedNumber());
	    	     ri.setDescription("ID:"+taxForm.getPrePrintedNumber() + 
	    	    		                   "<br/>RUC: " + taxForm.getRuc() + 
	    	    		                   "<br/>Periodo: " + taxForm.getFiscalPeriodYear() + "-" + taxForm.getFiscalPeriodMounth()+
	    	    		                   "<br/>" + taxForm.getFirstLastName() + 
	    	    		                   "<br/>" + taxForm.getStatus());
	
	    	     if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_SENDED)){
	    	    	 SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	    	    	 ri.setDescription(ri.getDescription().concat(" - Confirmado el:  " + sdf.format(taxForm.getCreatedDate())));
	    	     }

	    	     if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_PROCESS)){
	    	    	 SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	    	    	 ri.setDescription(ri.getDescription().concat(" - Creado el:  " + sdf.format(taxForm.getCreatedDate())));
	    	     }

	    	     if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_PAYED)){
	    	    	 ri.setDescription(ri.getDescription().concat(" - Numero orden:  " + taxForm.getOrderNumber()) );
	    	     }
	    	     
	    	     if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_PROCESS)){
	    	    	 ri.setDeleteable(true);
	    	    	 ri.setEditable(true);
	    	    	 ri.setShowDetails(true);
	    	     }else if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_TOSEND)){
	    	    	 ri.setDeleteable(false);
	    	    	 ri.setEditable(true);
	    	    	 ri.setShowDetails(true);    	    	 
	    	     }else if(taxForm.getStatus().equals(TaxForm.FORM_STATUS_SENDED) 
	    	    		 	|| taxForm.getStatus().equals(TaxForm.FORM_STATUS_PAYED)
	    	    		 	|| taxForm.getStatus().equals(TaxForm.FORM_STATUS_REJECTED)){
	    	    	 ri.setDeleteable(false);
	    	    	 ri.setEditable(false);
	    	    	 ri.setShowDetails(true);    	    	 
	    	     }else {
	    	    	 ri.setDeleteable(false);
	    	    	 ri.setEditable(false);
	    	    	 ri.setShowDetails(true);    	    	 
	    	     }
	    	     results.add(ri);
	    	}
		} catch (FindingException e) {
			logger.error("Imposible to retrieve forms. ",e);
		}

    	return results;


	}

	public Map getFiscalInfo(Map params) throws FiscalInfoException {
		return fiscalRulesManager.getFiscalInfo(params);
	}

	public Form getEmptyForm() {
		Form form = getEmptyFormFromXml();
		return form;
	}

	protected Form getEmptyFormFromXml(){
    	Form form = null;
		ClassLoader cl = getClass().getClassLoader();
		logger.debug("-----> Parsing the xml to retrive a empty form 120");		
		form = Parser.parseForm(cl.getResourceAsStream("forms/"+getXmlFormRepresentation()));
		if (form == null)
			logger.warn("NULL" + getXmlFormRepresentation());
		logger.debug("-----> Finnish to parsing");	
    	return form;
    
	}	

	public String uploadForm(SimpleForm simpleForm) throws PykasuGenericException{
		throw new AddFormException("Not Implemented Yet");
	}
}
