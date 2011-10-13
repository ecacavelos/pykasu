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
import py.com.roshka.pykasu.interfaces.Form850ManagerInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.Form850;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;


@Stateless
@Local ({Form850ManagerInterface.class})
@LocalBinding (jndiBinding="pykasu/Form850Manager/local")
@Remote ({Form850ManagerInterface.class})
@RemoteBinding (jndiBinding="pykasu/Form850Manager/remote")

public class Form850Manager extends GenericFormManagerEJB implements Form850ManagerInterface {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form850Manager.class);
	
	@EJB protected UserManager userManager;
	@EJB protected Contributor contributor;
	@EJB protected FiscalRulesManager fiscalRulesManager;
	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;

	public static final int SECTIONCOUNT = 2;
	
	public static final int FIRSTSECTION = 0;	
	public static final int SECONDSECTION = 1;
	
	public static final String FILE_FORM850_XML = "form850.xml"; 

	
	public Form850Manager(){
	}
    
    public String addForm(Form form) throws AddFormException{    	

    	logger.info("------------> Adding a new Form 850");
    	try {
        	logger.info("Finding principal user");
        	
        	User user = null;
        	try {
        		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
        	} catch (Exception e1) {
        		logger.error("Imposible to retrieve principal user.", e1);
    			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
        	}
    		
    		Form850 form850 = new Form850(user);
    		logger.info(form);
    		
        	form850.fillForm(form);    		
        	em.persist(form850);
	    	form850.setPrePrintedNumber(form850.getId().toString());
	    	//em.persist(form850);

	    	return form850.getId().toString();
	    	
    	} catch (FillFormException e) {
    		logger.error(e);
			throw new AddFormException(e.getClass() + " --> " + e.getMessage());
		}
		
				    	//los siguientes comentarios, son controles que se pueden colocar antes de persistir el objeto, de tal manera a que se realicen ciertos controles
				    	
				//        	Cell c = form.getCell("paydmentDate");
				//        	Date date = (Date) c.getData();
				//
				//        	//dates controls
				//        	Date actualDate = new Date(System.currentTimeMillis());
				//        	Integer diff = Utils.DateDiff(date, actualDate);
				//        	if(diff > 0){ //payment date is less than actual date
				//        		logger.error("Payment date is invalid. PaymentDate= " + date +  " Actual time " + System.currentTimeMillis());
				//        		throw new AddForm850Exception("Invalid payment date!");
				//        	}
				//        	
				//    		Calendar calendar = Calendar.getInstance();
				//    		calendar.setTime(date);
				//    		int month = calendar.get(Calendar.MONTH);
				//    		int year = calendar.get(Calendar.YEAR);
				//    		
				//    		c = form.getCell("fiscalPeriodYear");
				//    		int fpy = ((Integer)c.getData()).intValue(); 
				//
				//    		c = form.getCell("fiscalPeriodMonth");
				//    		int fpm = ((Integer)c.getData()).intValue(); 
				//    		
				//    		if(fpy > year){// fiscal year is greather than actual year
				//        		logger.error("Fiscal Period Year is invalid. FiscalPeriodYear= " + fpy +  " Actual year " + year);
				//        		throw new AddForm850Exception("Invalid Fiscal Period Year!");
				//    		}
				//    		
				//    		if((fpy == year) && (fpm >= month)){ //same year but fiscal month is greather than actual mount
				//        		logger.error("Fiscal Period Month is invalid. FiscalPeriodMonth= " + fpm +  " Actual month " + month);
				//        		throw new AddForm850Exception("Invalid Fiscal Period Month!");    			
				//    		}
				//        	
				//    		// end of date controls

    }
        
    public void updateForm(Form form) 
		throws UpdateFormException{
    	try {
			Form850 form850 = findByPrePrintedNumber(
					(String)form.getCell("prePrintedNumber").getData());
			
			//se encontro el form y hay que actualizar los datos.
			 form850.fillForm(form);
		} catch (FormNotFoundException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		} catch (FillFormException e) {
			logger.error(e);
			throw new UpdateFormException(e.getClass() + " --> " + e.getMessage());
		}

    }
     
	public void deteleForm(String id) throws FormDeleteException {
		try {	
			Form850 form850 = findByPrePrintedNumber(id);
			em.remove(form850);
		} catch (FormNotFoundException e) {
			e.printStackTrace();
			throw new FormDeleteException(e.getMessage());
		}
	}

	public Form getForm(String id) throws FormNotFoundException {
		logger.info("get Form 850 whith pre pinted number " + id);

		try{
			Form850 form850;
			form850 = findByPrePrintedNumber(id);
			Form form = null;
			form = form850.loadForm(this);
			return form;
		}catch (Exception e) {
			throw new FormNotFoundException(e.getClass().getName() + " --> "+ e.getMessage());
		}	
	}

	@Override
	protected String getFormClassName() {
		return TaxForm.FORM_850_CLASS_NAME;
	}

	@Override
	protected String getXmlFormRepresentation() {		
		return FILE_FORM850_XML;
	}

	@SuppressWarnings("unchecked")
    protected Form850 findByPrePrintedNumber(String prePrintedNumber) 
		throws FormNotFoundException{
			try{
				logger.info("Find Form whit PPN : " + prePrintedNumber);
				User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
				
				Form850 form850 = (Form850) em.createQuery("from Form850 where prePrintedNumber like :ppn and businessCompany = :bc")
												.setParameter("ppn",prePrintedNumber.trim().toUpperCase())
												.setParameter("bc",user.getBusinessCompany())
												.getSingleResult();
				return form850;
			}catch (Exception e) {
				logger.error(e);
				throw new FormNotFoundException(e.getClass().getName());
			}
	}
	
	
}
