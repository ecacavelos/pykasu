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
import py.com.roshka.pykasu.interfaces.Form125ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form125;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.ruc.Ruc;
import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;

@Stateless
@Local ({Form125ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form125Manager/local")
@Remote ({Form125ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form125Manager/remote")
public class Form125Manager extends GenericFormManagerEJB implements
		Form125ManagerInterface {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form125Manager.class);
	
	public static final String FILE_FORM125_XML = "form125.xml"; 

	@EJB protected UserManager userManager;
	@EJB protected Contributor contributor;	

	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;
	
	
	@Override
	public Form getForm(String id) throws FormNotFoundException {
		logger.info("get Form 125 whith pre pinted number " + id);

		try{
			Form125 form125;
			form125 = findByPrePrintedNumber(id);
			Form form = null;
			form = form125.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}

	}

	@Override
	public String addForm(Form form) throws AddFormException {
    	logger.info("------------> Adding a new Form 125");
    	try {
        	logger.info("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form125 form125 = new Form125(user);
    		
        	form125.fillForm(form);    		
	    	em.persist(form125);
	    	form125.setPrePrintedNumber(form125.getId().toString());
	    	
	    	return form125.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
	}

	@Override
	public void updateForm(Form form) throws UpdateFormException {
		try {
			Form125 form125 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());

			form125.fillForm(form);
			em.persist(form125);

		} catch (FormNotFoundException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FillFormException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		}

	}

	@Override
	public void deteleForm(String id) throws FormDeleteException {
    	try {
    		Form125 form125 = findByPrePrintedNumber(id);
			em.remove(form125);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}

	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_125_CLASS_NAME;
	}

	@Override
	protected String getXmlFormRepresentation() {
		return FILE_FORM125_XML;
	}

	protected Form125 findByPrePrintedNumber(String prePrintedNumber)
		throws FormNotFoundException{
	
		try{
			logger.info("Find Form whit PPN : " + prePrintedNumber);
			
			User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			
			
			Form125 form125 = (Form125) em.createQuery("from Form125 where prePrintedNumber like :ppn and businessCompany = :bc")
											.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
											.setParameter("bc",user.getBusinessCompany())
											.getSingleResult();
			return form125;
		}catch (Exception e) {
			logger.error(e);
			throw new FormNotFoundException(e.getClass().getName());
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public String uploadForm(SimpleForm simpleForm) throws PykasuGenericException {
    	User user = null;
    	logger.info("Session Context ~ User < cualquiera > Principal: " + sc.getCallerPrincipal());
    	try {
    		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
		
    		Form125 form125 = new Form125(user);
			form125.fillForm(simpleForm);
			
			form125.loadHeader(simpleForm);
		    	
			Ruc thisRuc = contributor.getInfo(form125.getRuc());
	    	
			form125.setFirstLastName(thisRuc.getContributorName());
			
	    	logger.info("~~~~ Saving from Simple Form");
	    	em.persist(form125);
	    	form125.setPrePrintedNumber(form125.getId().toString());
	    	logger.info("~~~~ Saving from Simple Form - New form id = " + form125.getId().toString());

	    	logger.info("Registrando entrada en updates_forms");
	    	UploadForm uf = new UploadForm(form125, "125", simpleForm.getXmlFile());
	    	em.persist(uf);
	    	logger.info("~~~~ Saving Upload Form - New form id = " + uf.getUploadFormId());
	    	
	    	return form125.getPrePrintedNumber();
	    	
    	} catch (FillFormException e) {
    		logger.error("Problemas al cargar el formlulario: \n " + simpleForm, e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FindingException e) {
	  		logger.error("Imposible to retrieve principal user.", e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
		
	}	
	
	
}
