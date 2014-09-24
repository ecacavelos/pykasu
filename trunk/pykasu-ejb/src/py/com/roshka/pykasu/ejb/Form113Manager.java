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
import py.com.roshka.pykasu.exceptions.FormDeleteException;
import py.com.roshka.pykasu.exceptions.FormNotFoundException;
import py.com.roshka.pykasu.exceptions.UpdateFormException;
import py.com.roshka.pykasu.interfaces.Contributor;
import py.com.roshka.pykasu.interfaces.Form113ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form113;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;

@Stateless
@Local ({Form113ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form113Manager/local")
@Remote ({Form113ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form113Manager/remote")
public class Form113Manager extends GenericFormManagerEJB implements
		Form113ManagerInterface {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form113Manager.class);
	
	public static final String FILE_Form113_XML = "form113.xml"; 

	@EJB protected UserManager userManager;
	@EJB protected Contributor contributor;	

	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;
	
	
	@Override
	public Form getForm(String id) throws FormNotFoundException {
		logger.info("get Form 113 whith pre pinted number " + id);

		try{
			Form113 Form113;
			Form113 = findByPrePrintedNumber(id);
			Form form = null;
			form = Form113.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}

	}

	@Override
	public String addForm(Form form) throws AddFormException {
    	logger.info("------------> Adding a new Form 113");
    	try {
        	logger.info("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form113 Form113 = new Form113(user);
    		
        	Form113.fillForm(form);    		
	    	em.persist(Form113);
	    	Form113.setPrePrintedNumber(Form113.getId().toString());
	    	
	    	return Form113.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
	}

	@Override
	public void updateForm(Form form) throws UpdateFormException {
		try {
			Form113 Form113 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());

			Form113.fillForm(form);
			em.persist(Form113);

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
    		Form113 Form113 = findByPrePrintedNumber(id);
			em.remove(Form113);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}

	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_113_CLASS_NAME;
	}

	@Override
	protected String getXmlFormRepresentation() {
		return FILE_Form113_XML;
	}

	protected Form113 findByPrePrintedNumber(String prePrintedNumber)
	throws FormNotFoundException{

	try{
		logger.info("Find Form whit PPN : " + prePrintedNumber);
		
		User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
		
		
		Form113 Form113 = (Form113) em.createQuery("from Form113 where prePrintedNumber like :ppn and businessCompany = :bc")
										.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
										.setParameter("bc",user.getBusinessCompany())
										.getSingleResult();
		return Form113;
	}catch (Exception e) {
		logger.error(e);
		throw new FormNotFoundException(e.getClass().getName());
	}
}	
	
}

