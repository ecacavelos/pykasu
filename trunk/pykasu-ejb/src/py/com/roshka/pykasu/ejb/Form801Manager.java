package py.com.roshka.pykasu.ejb;

import java.util.ArrayList;
import java.util.Iterator;
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
import py.com.roshka.pykasu.exceptions.FormSaveException;
import py.com.roshka.pykasu.exceptions.InfoPrintException;
import py.com.roshka.pykasu.exceptions.UpdateFormException;
import py.com.roshka.pykasu.interfaces.Contributor;
import py.com.roshka.pykasu.interfaces.FiscalRulesManager;
import py.com.roshka.pykasu.interfaces.Form801ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form801;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.util.ResultItem;
import py.com.roshka.pykasu.xml.Parser;


@Stateless
@Local ({Form801ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form801Manager/local")
@Remote ({Form801ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form801Manager/remote")
public class Form801Manager extends GenericFormManagerEJB implements Form801ManagerInterface {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form801Manager.class);
	
	public static final String FILE_FORM801_XML = "form801.xml"; 

	
	@EJB protected UserManager userManager;
	
	@EJB protected Contributor contributor;
	
	@EJB protected FiscalRulesManager fiscalRulesManager;

	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;
	
	public String addForm(Form form) throws AddFormException {
    	logger.info("------------> Adding a new Form 801");
    	try {
        	logger.info("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form801 form801 = new Form801(user);
    		
        	form801.fillForm(form);    		
	    	em.persist(form801);
	    	form801.setPrePrintedNumber(form801.getId().toString());
	    	
	    	return form801.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
		
	}

	public void updateForm(Form form) throws UpdateFormException {
		
		try {
			Form801 form801 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());

			form801.fillForm(form);
			em.persist(form801);

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

    		Form801 form801 = findByPrePrintedNumber(prePrintedNumber);
			em.remove(form801);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}

	}


	public Form getForm(String prePrintedNumber) throws FormNotFoundException {
		logger.info("get Form 801 whith pre pinted number " + prePrintedNumber);

		try{
			Form801 form801;
			form801 = findByPrePrintedNumber(prePrintedNumber);
			Form form = null;
			form = form801.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}

	}

	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_801_CLASS_NAME;
	}

	@Override
	protected String getXmlFormRepresentation() {
		return FILE_FORM801_XML;
	}

	
	public Form801 findByPrePrintedNumber(String prePrintedNumber)
		throws FormNotFoundException{

		try{
			logger.info("Find Form whit PPN : " + prePrintedNumber);
			
			User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			
			
			Form801 form801 = (Form801) em.createQuery("from Form801 where prePrintedNumber like :ppn and businessCompany = :bc")
											.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
											.setParameter("bc",user.getBusinessCompany())
											.getSingleResult();
			return form801;
		}catch (Exception e) {
			logger.error(e);
			throw new FormNotFoundException(e.getClass().getName());
		}
	}

	
	
}
