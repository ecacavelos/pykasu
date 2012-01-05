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
import py.com.roshka.pykasu.interfaces.Form124ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form124;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.ruc.Ruc;
import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;

@Stateless
@Local ({Form124ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form124Manager/local")
@Remote ({Form124ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form124Manager/remote")
public class Form124Manager extends GenericFormManagerEJB implements Form124ManagerInterface{

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form124Manager.class);
	
	public static final String FILE_FORM124_XML = "form124.xml"; 

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
        	logger.info("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form124 form124 = new Form124(user);
    		
        	form124.fillForm(form);    		
	    	em.persist(form124);
	    	form124.setPrePrintedNumber(form124.getId().toString());
	    	
	    	return form124.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
	}

	public void deteleForm(String id) throws FormDeleteException {
    	try {
    		Form124 form124 = findByPrePrintedNumber(id);
			em.remove(form124);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}

	protected String getXmlFormRepresentation(){
		return FILE_FORM124_XML;
	}	
	
	public Form getForm(String id) throws FormNotFoundException {
		logger.info("get Form 124 whith pre pinted number " + id);

		try{
			Form124 form124;
			form124 = findByPrePrintedNumber(id);
			Form form = null;
			form = form124.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}
	}

	public void updateForm(Form form) throws UpdateFormException {
		try {
			Form124 form124 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());

			form124.fillForm(form);
			//em.persist(form120);

		} catch (FormNotFoundException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FillFormException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		}
	}
	
	protected Form124 findByPrePrintedNumber(String prePrintedNumber)
		throws FormNotFoundException{

		try{
			logger.info("Find Form whit PPN : " + prePrintedNumber);
			
			User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			
			
			Form124 form124 = (Form124) em.createQuery("from Form124 where prePrintedNumber like :ppn and businessCompany = :bc")
											.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
											.setParameter("bc",user.getBusinessCompany())
											.getSingleResult();
			return form124;
		}catch (Exception e) {
			logger.error(e);
			throw new FormNotFoundException(e.getClass().getName());
		}
	}

	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_124_CLASS_NAME;
	}

	
	
	@SuppressWarnings("unchecked")
	@Override
	public String uploadForm(SimpleForm simpleForm) throws PykasuGenericException {
    	User user = null;
    	logger.info("Session Context ~ User < cualquiera > Principal: " + sc.getCallerPrincipal());
    	try {
    		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
		
    		Form124 form124 = new Form124(user);
			form124.fillForm(simpleForm);
			
			form124.loadHeader(simpleForm);
		    	
			Ruc thisRuc = contributor.getInfo(form124.getRuc());
	    	
			form124.setFirstLastName(thisRuc.getContributorName());
			
	    	logger.info("~~~~ Saving from Simple Form");
	    	em.persist(form124);
	    	form124.setPrePrintedNumber(form124.getId().toString());
	    	logger.info("~~~~ Saving from Simple Form - New form id = " + form124.getId().toString());

	    	logger.info("Registrando entrada en updates_forms");
	    	UploadForm uf = new UploadForm(form124, "124", simpleForm.getXmlFile());
	    	em.persist(uf);
	    	logger.info("~~~~ Saving Upload Form - New form id = " + uf.getUploadFormId());
	    	
	    	return form124.getPrePrintedNumber();
    	} catch (FillFormException e) {
    		logger.error("Problemas al cargar el formlulario: \n " + simpleForm, e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FindingException e) {
	  		logger.error("Imposible to retrieve principal user.", e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
		
	}

	
}
