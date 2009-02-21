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
import py.com.roshka.pykasu.interfaces.FiscalRulesManager;
import py.com.roshka.pykasu.interfaces.Form800ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form800;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;

@Stateless
@Local ({Form800ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form800Manager/local")
@Remote ({Form800ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form800Manager/remote")
public class Form800Manager  extends GenericFormManagerEJB implements Form800ManagerInterface{

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form800Manager.class);

	public static final String FILE_FORM800_XML = "form800.xml"; 

	@EJB protected UserManager userManager;
	@EJB protected Contributor contributor;	
	@EJB protected FiscalRulesManager fiscalRulesManager;

	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;
	
	public Form800Manager(){
	}
	
	public String addForm(Form form) throws AddFormException {
    	logger.info("------------> Adding a new Form 800");
    	try {
        	logger.debug("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form800 form800 = new Form800(user);
    		
        	form800.fillForm(form);    		
	    	em.persist(form800);
	    	form800.setPrePrintedNumber(form800.getId().toString());
	    	
	    	return form800.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
	}

	public void updateForm(Form form) throws UpdateFormException {
		
		try {
			Form800 form800 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());

			form800.fillForm(form);
			em.persist(form800);

		} catch (FormNotFoundException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FillFormException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		}
	}

	public void deteleForm(String prePrintedNumber) throws FormDeleteException {
    	try {

    		Form800 form800 = findByPrePrintedNumber(prePrintedNumber);
			em.remove(form800);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}
	
	public Form getForm(String prePrintedNumber) throws FormNotFoundException {
		logger.info("get Form 800 whith pre pinted number " + prePrintedNumber);

		try{
			Form800 form800;
			form800 = findByPrePrintedNumber(prePrintedNumber);
			Form form = null;
			form = form800.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}

	}


	@Override
	protected String getFormClassName() {		
		return TaxForm.FORM_800_CLASS_NAME;
	}


	@Override
	protected String getXmlFormRepresentation() {		
		return FILE_FORM800_XML;
	}

	public Form800 findByPrePrintedNumber(String prePrintedNumber)
	throws FormNotFoundException{

	try{
		logger.info("Find Form whit PPN : " + prePrintedNumber);
		
		User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
		
		
		Form800 form800 = (Form800) em.createQuery("from Form800 where prePrintedNumber like :ppn and businessCompany = :bc")
										.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
										.setParameter("bc",user.getBusinessCompany())
										.getSingleResult();
		return form800;
	}catch (Exception e) {
		logger.error(e);
		throw new FormNotFoundException(e.getClass().getName());
	}
}

}
