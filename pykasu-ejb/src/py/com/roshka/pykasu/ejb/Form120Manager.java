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
import py.com.roshka.pykasu.interfaces.Form120ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form120;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.ruc.Ruc;
import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;

@Stateless
@Local ({Form120ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form120Manager/local")
@Remote ({Form120ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form120Manager/remote")
public class Form120Manager extends GenericFormManagerEJB implements Form120ManagerInterface{

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form120Manager.class);
	
	public static final String FILE_FORM120_XML = "form120.xml"; 

	@EJB protected UserManager userManager;
	@EJB protected Contributor contributor;	
	//@EJB protected FiscalRulesManager fiscalRulesManager;

	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;
	
	public String addForm(Form form) throws AddFormException {
    	logger.info("------------> Adding a new Form 120");
    	try {
        	logger.debug("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form120 form120 = new Form120(user);
    		
        	form120.fillForm(form);    		
	    	em.persist(form120);
	    	form120.setPrePrintedNumber(form120.getId().toString());
	    	
	    	return form120.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
	}

	public void deteleForm(String id) throws FormDeleteException {
    	try {
    		Form120 form120 = findByPrePrintedNumber(id);
			em.remove(form120);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}

	protected String getXmlFormRepresentation(){
		return FILE_FORM120_XML;
	}	
	
	public Form getForm(String id) throws FormNotFoundException {
		logger.info("get Form 120 whith pre pinted number " + id);

		try{
			Form120 form120;
			form120 = findByPrePrintedNumber(id);
			Form form = null;
			form = form120.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}
	}

	public void updateForm(Form form) throws UpdateFormException {
		try {
			Form120 form120 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());

			form120.fillForm(form);
			//em.persist(form120);

		} catch (FormNotFoundException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FillFormException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		}
	}
	
	protected Form120 findByPrePrintedNumber(String prePrintedNumber)
		throws FormNotFoundException{

		try{
			logger.info("Find Form whit PPN : " + prePrintedNumber);
			
			User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			
			
			Form120 form120 = (Form120) em.createQuery("from Form120 where prePrintedNumber like :ppn and businessCompany = :bc")
											.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
											.setParameter("bc",user.getBusinessCompany())
											.getSingleResult();
			return form120;
		}catch (Exception e) {
			logger.error(e);
			throw new FormNotFoundException(e.getClass().getName());
		}
	}

	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_120_CLASS_NAME;
	}

	
	
	@SuppressWarnings("unchecked")
	@Override
	public String uploadForm(SimpleForm simpleForm) throws PykasuGenericException {
    	User user = null;
    	logger.debug("Session Context ~ User < cualquiera > Principal: " + sc.getCallerPrincipal());
    	try {
    		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
		
    		Form120 form120 = new Form120(user);
			form120.fillForm(simpleForm);
			
			form120.loadHeader(simpleForm);
		    	
			Ruc thisRuc = contributor.getInfo(form120.getRuc());
	    	
			form120.setFirstLastName(thisRuc.getContributorName());
			
	    	logger.debug("~~~~ Saving from Simple Form");
	    	em.persist(form120);
	    	form120.setPrePrintedNumber(form120.getId().toString());
	    	logger.info("~~~~ Saving from Simple Form - New form id = " + form120.getId().toString());

	    	logger.info("Registrando entrada en updates_forms");
	    	UploadForm uf = new UploadForm(form120, "120", simpleForm.getXmlFile());
	    	em.persist(uf);
	    	logger.info("~~~~ Saving Upload Form - New form id = " + uf.getUploadFormId());
	    	
	    	return form120.getPrePrintedNumber();
    	} catch (FillFormException e) {
    		logger.error("Problemas al cargar el formlulario: \n " + simpleForm, e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FindingException e) {
	  		logger.error("Imposible to retrieve principal user.", e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
		
	}

	
}
