package py.com.roshka.pykasu.ejb;

import java.util.List;
import java.util.Map;

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
import py.com.roshka.pykasu.exceptions.FiscalInfoException;
import py.com.roshka.pykasu.exceptions.FormDeleteException;
import py.com.roshka.pykasu.exceptions.FormNotFoundException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.exceptions.UpdateFormException;
import py.com.roshka.pykasu.interfaces.Contributor;
import py.com.roshka.pykasu.interfaces.Form120ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form123ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form120;
import py.com.roshka.pykasu.persistence.forms.Form123;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.ruc.Ruc;
import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;
import py.com.roshka.pykasu.ui.util.ResultItem;

@Stateless
@Local ({Form123ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form123Manager/local")
@Remote ({Form123ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form123Manager/remote")
public class Form123Manager extends GenericFormManagerEJB implements Form123ManagerInterface {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(Form123Manager.class);

	public static final String FILE_Form123_XML = "form123.xml"; 

	@EJB protected UserManager userManager;
	@EJB protected Contributor contributor;	
	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;
	
	
	@Override
	public Form getForm(String id) throws FormNotFoundException {
	logger.info("get Form 123 whith pre pinted number " + id);
	
		try{
			Form123 Form123;
			Form123 = findByPrePrintedNumber(id);
			Form form = null;
			form = Form123.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}
	
	}
	
	@Override
	public String addForm(Form form) throws AddFormException {
		logger.info("------------> Adding a new Form 123");
		try {
			logger.debug("Finding principal user");
			
			User user = null;
			try {
				user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			} catch (Exception e1) {
				logger.error("Imposible to retrieve principal user.", e1);
				throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
			}
			
			Form123 Form123 = new Form123(user);
			
			Form123.fillForm(form);    		
			em.persist(Form123);
			Form123.setPrePrintedNumber(Form123.getId().toString());
			
			return Form123.getId().toString();
			
		} catch (FillFormException e) {
			logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
	}
	
	@Override
	public void updateForm(Form form) throws UpdateFormException {
		try {
			Form123 Form123 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());
		
			Form123.fillForm(form);
			em.persist(Form123);
		
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
			Form123 Form123 = findByPrePrintedNumber(id);
			em.remove(Form123);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}
	
	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_123_CLASS_NAME;
	}
	
	@Override
	protected String getXmlFormRepresentation() {
		return FILE_Form123_XML;
	}
	
	protected Form123 findByPrePrintedNumber(String prePrintedNumber)
	throws FormNotFoundException{
	
		try{
			logger.info("Find Form whit PPN : " + prePrintedNumber);
			
			User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			
			
			Form123 Form123 = (Form123) em.createQuery("from Form123 where prePrintedNumber like :ppn and businessCompany = :bc")
											.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
											.setParameter("bc",user.getBusinessCompany())
											.getSingleResult();
			return Form123;
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
		
    		Form123 form123 = new Form123(user);
			form123.fillForm(simpleForm);
			
			form123.loadHeader(simpleForm);
		    	
			Ruc thisRuc = contributor.getInfo(form123.getRuc());
	    	
			form123.setFirstLastName(thisRuc.getContributorName());
			
	    	logger.debug("~~~~ Saving from Simple Form");
	    	em.persist(form123);
	    	form123.setPrePrintedNumber(form123.getId().toString());
	    	logger.info("~~~~ Saving from Simple Form - New form id = " + form123.getId().toString());

	    	logger.info("Registrando entrada en updates_forms");
	    	UploadForm uf = new UploadForm(form123, "123", simpleForm.getXmlFile());
	    	em.persist(uf);
	    	logger.info("~~~~ Saving Upload Form - New form id = " + uf.getUploadFormId());
	    	
	    	return form123.getPrePrintedNumber();
    	} catch (FillFormException e) {
    		logger.error("Problemas al cargar el formlulario: \n " + simpleForm, e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FindingException e) {
	  		logger.error("Imposible to retrieve principal user.", e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
		
	}

	
}
