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
import py.com.roshka.pykasu.interfaces.Form112v2ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form112v2;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;

@Stateless
@Local ({Form112v2ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form112v2Manager/local")
@Remote ({Form112v2ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form112v2Manager/remote")
public class Form112v2Manager extends GenericFormManagerEJB implements
	Form112v2ManagerInterface{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form112v2Manager.class);
	
	public static final String FILE_Form112v2_XML = "form112v2.xml"; 

	@EJB protected UserManager userManager;
	@EJB protected Contributor contributor;	

	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;
	
	
	@Override
	public Form getForm(String id) throws FormNotFoundException {
		logger.info("get Form 112v2 whith pre pinted number " + id);

		try{
			Form112v2 Form112v2;
			Form112v2 = findByPrePrintedNumber(id);
			Form form = null;
			form = Form112v2.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}

	}

	@Override
	public String addForm(Form form) throws AddFormException {
    	logger.info("------------> Adding a new Form 112v2");
    	try {
        	logger.info("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form112v2 Form112v2 = new Form112v2(user);
    		
        	Form112v2.fillForm(form);    		
	    	em.persist(Form112v2);
	    	Form112v2.setPrePrintedNumber(Form112v2.getId().toString());
	    	
	    	return Form112v2.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
	}

	@Override
	public void updateForm(Form form) throws UpdateFormException {
		try {
			Form112v2 Form112v2 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());

			Form112v2.fillForm(form);
			em.persist(Form112v2);

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
    		Form112v2 Form112v2 = findByPrePrintedNumber(id);
			em.remove(Form112v2);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}

	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_112v2_CLASS_NAME;
	}

	@Override
	protected String getXmlFormRepresentation() {
		return FILE_Form112v2_XML;
	}

	protected Form112v2 findByPrePrintedNumber(String prePrintedNumber)
	throws FormNotFoundException{

		try{
			logger.info("Find Form whit PPN : " + prePrintedNumber);
			
			User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			
			
			Form112v2 Form112v2 = (Form112v2) em.createQuery("from Form112v2 where prePrintedNumber like :ppn and businessCompany = :bc")
											.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
											.setParameter("bc",user.getBusinessCompany())
											.getSingleResult();
			return Form112v2;
		}catch (Exception e) {
			logger.error(e);
			throw new FormNotFoundException(e.getClass().getName());
		}
	}	
}
