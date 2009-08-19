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
import py.com.roshka.pykasu.interfaces.Form117ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form120ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form101;
import py.com.roshka.pykasu.persistence.forms.Form117;
import py.com.roshka.pykasu.persistence.forms.Form120;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.ruc.Ruc;
import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;

@Stateless
@Local ({Form117ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form117Manager/local")
@Remote ({Form117ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form117Manager/remote")
public class Form117Manager extends GenericFormManagerEJB implements
		Form117ManagerInterface {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form117Manager.class);
	
	public static final String FILE_FORM117_XML = "form117.xml"; 

	@EJB protected UserManager userManager;
	@EJB protected Contributor contributor;	

	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;
	
	
	@Override
	public Form getForm(String id) throws FormNotFoundException {
		logger.info("get Form 117 whith pre pinted number " + id);

		try{
			Form117 form117;
			form117 = findByPrePrintedNumber(id);
			Form form = null;
			form = form117.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}

	}

	@Override
	public String addForm(Form form) throws AddFormException {
    	logger.info("------------> Adding a new Form 117");
    	try {
        	logger.debug("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form117 form117 = new Form117(user);
    		
        	form117.fillForm(form);    		
	    	em.persist(form117);
	    	form117.setPrePrintedNumber(form117.getId().toString());
	    	
	    	return form117.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
	}

	@Override
	public void updateForm(Form form) throws UpdateFormException {
		try {
			Form117 form117 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());

			form117.fillForm(form);
			em.persist(form117);

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
    		Form117 form117 = findByPrePrintedNumber(id);
			em.remove(form117);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}

	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_117_CLASS_NAME;
	}

	@Override
	protected String getXmlFormRepresentation() {
		return FILE_FORM117_XML;
	}

	protected Form117 findByPrePrintedNumber(String prePrintedNumber)
		throws FormNotFoundException{
	
		try{
			logger.info("Find Form whit PPN : " + prePrintedNumber);
			
			User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			
			
			Form117 form117 = (Form117) em.createQuery("from Form117 where prePrintedNumber like :ppn and businessCompany = :bc")
											.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
											.setParameter("bc",user.getBusinessCompany())
											.getSingleResult();
			return form117;
		}catch (Exception e) {
			logger.error(e);
			throw new FormNotFoundException(e.getClass().getName());
		}
	}	

	@SuppressWarnings("unchecked")
	@Override
	public String uploadForm(SimpleForm simpleForm) throws PykasuGenericException {
    	User user = null;
    	logger.debug("Session Context ~ User < cualquiera > Principal: " + sc.getCallerPrincipal());
    	try {
    		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
		
    		Form117 form117 = new Form117(user);
			form117.fillForm(simpleForm);
			
			form117.loadHeader(simpleForm);
		    	
			Ruc thisRuc = contributor.getInfo(form117.getRuc());
	    	
			form117.setFirstLastName(thisRuc.getContributorName());
			
	    	logger.debug("~~~~ Saving from Simple Form");
	    	em.persist(form117);
	    	form117.setPrePrintedNumber(form117.getId().toString());
	    	logger.info("~~~~ Saving from Simple Form - New form id = " + form117.getId().toString());

	    	logger.info("Registrando entrada en updates_forms");
	    	UploadForm uf = new UploadForm(form117, "117", simpleForm.getXmlFile());
	    	em.persist(uf);
	    	logger.info("~~~~ Saving Upload Form - New form id = " + uf.getUploadFormId());
	    	
	    	return form117.getPrePrintedNumber();
	    	
    	} catch (FillFormException e) {
    		logger.error("Problemas al cargar el formlulario: \n " + simpleForm, e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FindingException e) {
	  		logger.error("Imposible to retrieve principal user.", e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
		
	}	
	
}

