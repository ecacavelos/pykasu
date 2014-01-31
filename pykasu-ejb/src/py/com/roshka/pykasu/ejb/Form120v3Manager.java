package py.com.roshka.pykasu.ejb;

import javax.annotation.EJB;
import javax.annotation.Resource;
import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.AddFormException;
import py.com.roshka.pykasu.exceptions.FillFormException;
import py.com.roshka.pykasu.exceptions.FindingException;
import py.com.roshka.pykasu.exceptions.FormDeleteException;
import py.com.roshka.pykasu.exceptions.FormNotFoundException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.exceptions.UpdateFormException;
import py.com.roshka.pykasu.interfaces.Contributor;
import py.com.roshka.pykasu.interfaces.FiscalRulesManager;
import py.com.roshka.pykasu.interfaces.Form120v3ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form120v3ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form120v3;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.ruc.Ruc;
import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;


@Stateless
@Local ({Form120v3ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form120v3Manager/local")
@Remote ({Form120v3ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form120v3Manager/remote")
public class Form120v3Manager extends GenericFormManagerEJB implements Form120v3ManagerInterface{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form120v3Manager.class);
	
	public static final String FILE_FORM120v3_XML = "form120v3.xml"; 

	@EJB protected UserManager userManager;
	@EJB protected Contributor contributor;	
	@EJB protected FiscalRulesManager fiscalRulesManager;

	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;
	
	public String addForm(Form form) throws AddFormException {
    	logger.info("------------> Adding a new Form 120v3");
    	try {
        	logger.info("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form120v3 form120v3 = new Form120v3(user);
    		
        	form120v3.fillForm(form);    		
	    	em.persist(form120v3);
	    	form120v3.setPrePrintedNumber(form120v3.getId().toString());
	    	
	    	return form120v3.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
	}

	public void deteleForm(String id) throws FormDeleteException {
    	try {
    		Form120v3 form120v3 = findByPrePrintedNumber(id);
			em.remove(form120v3);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}

	protected String getXmlFormRepresentation(){
		return FILE_FORM120v3_XML;
	}	
	
	public Form getForm(String id) throws FormNotFoundException {
		logger.info("get Form 120v3 whith pre pinted number " + id);

		try{
			Form120v3 form120v3;
			form120v3 = findByPrePrintedNumber(id);
			Form form = null;
			form = form120v3.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}
	}

	public void updateForm(Form form) throws UpdateFormException {
		try {
			Form120v3 form120v3 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());

			form120v3.fillForm(form);
			//em.persist(form120v3);

		} catch (FormNotFoundException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FillFormException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		}
	}
	
	protected Form120v3 findByPrePrintedNumber(String prePrintedNumber)
		throws FormNotFoundException{

		try{
			logger.info("Find Form whit PPN : " + prePrintedNumber);
			
			User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			
			
			Form120v3 form120v3 = (Form120v3) em.createQuery("from Form120v3 where prePrintedNumber like :ppn and businessCompany = :bc")
											.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
											.setParameter("bc",user.getBusinessCompany())
											.getSingleResult();
			return form120v3;
		}catch (Exception e) {
			logger.error(e);
			throw new FormNotFoundException(e.getClass().getName());
		}
	}

	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_120v3_CLASS_NAME;
	}

	
	
	@SuppressWarnings("unchecked")
	@Override
	public String uploadForm(SimpleForm simpleForm) throws PykasuGenericException {
    	User user = null;
    	logger.info("Session Context ~ User < cualquiera > Principal: " + sc.getCallerPrincipal());
    	try {
    		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
		
    		Form120v3 form120v3 = new Form120v3(user);
			form120v3.fillForm(simpleForm);
			
			form120v3.loadHeader(simpleForm);
		    	
			Ruc thisRuc = contributor.getInfo(form120v3.getRuc());
	    	
			form120v3.setFirstLastName(thisRuc.getContributorName());
			
	    	logger.info("~~~~ Saving from Simple Form");
	    	em.persist(form120v3);
	    	form120v3.setPrePrintedNumber(form120v3.getId().toString());
	    	logger.info("~~~~ Saving from Simple Form - New form id = " + form120v3.getId().toString());

	    	logger.info("Registrando entrada en updates_forms");
	    	UploadForm uf = new UploadForm(form120v3, "120v3", simpleForm.getXmlFile());
	    	em.persist(uf);
	    	logger.info("~~~~ Saving Upload Form - New form id = " + uf.getUploadFormId());
	    	
	    	return form120v3.getPrePrintedNumber();
    	} catch (FillFormException e) {
    		logger.error("Problemas al cargar el formlulario: \n " + simpleForm, e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FindingException e) {
	  		logger.error("Imposible to retrieve principal user.", e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
		
	}
}
