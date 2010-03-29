package py.com.roshka.pykasu.ejb;

import java.util.ArrayList;
import java.util.List;

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
import py.com.roshka.pykasu.exceptions.UpdateFormException;
import py.com.roshka.pykasu.interfaces.PaymentFormInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.users.User;

@Stateless
@Local ({PaymentFormInterface.class})
@LocalBinding (jndiBinding="pykasu/PaymentFormManager/local")
@Remote ({PaymentFormInterface.class})
@RemoteBinding (jndiBinding="pykasu/PaymentFormManager/remote")

public class PaymentFormEJB implements
		PaymentFormInterface {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(PaymentFormEJB.class);
	
	@Resource protected SessionContext sc;
	@EJB protected UserManager userManager;
	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	
	
	
//	public String  
//	   savePayment(py.com.roshka.pykasu.web.forms.PaymentFormWeb webPaymentForm) 
//	   	throws AddFormException{
//
//    	User user = null;
//    	try {
//    		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
//    	} catch (Exception e1) {
//    		logger.error("Imposible to retrieve principal user.", e1);
//			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
//    	}
//    	
//    	py.com.roshka.pykasu.persistence.payment.PaymentForm pf = 
//    		new	py.com.roshka.pykasu.persistence.payment.PaymentForm(user);
//    	
//    	pf.setRuc(webPaymentForm.getRuc());
//       	pf.setFname(webPaymentForm.getFirstLastName());
//       	pf.setDv(webPaymentForm.getDv());
//        
//    	pf.setFiscalPeriodMonth(webPaymentForm.getMonth());
//    	pf.setFiscalPeriodYear(webPaymentForm.getYear());
//
//    	pf.setObligation(webPaymentForm.getObligationTax());
//    	pf.setResolution(webPaymentForm.getResolutionNr());
//    	
//    	pf.setSavingAccountNumber(webPaymentForm.getSavingAccountNr());
//    	pf.setPaymentAmount(new Double(webPaymentForm.getAmount()));
//    	
//    	em.persist(pf);
//    	em.refresh(pf);
//    	
//    	return pf.getId().toString();
//	}
	
	public void savePayment(PaymentForm pf, User user) throws AddFormException {
	    try{
	    	em.refresh(user);
	    	pf.setCreatedBy(user);
	    	pf.setBusinessCompany(user.getBusinessCompany());
	    	em.persist(pf);
	    }catch(Exception e){
	    	throw new AddFormException("Problem to save Payment Form \n" + e.getMessage());
	    }
	}




	public void changeStatus(Integer paymentId, String status) throws UpdateFormException{
		try{
			PaymentForm pf = 
				(PaymentForm ) 
					em.createQuery("select pf from PaymentForm where pf.id = :id")
						.setParameter("id", paymentId)
						.getSingleResult();
			
			pf.setStatus(status);
			
			em.persist(pf);
			
		}catch (Exception e){
			throw new UpdateFormException(e.getMessage());
		}
		
	}

	public List getAll(User user) {
		List list = new ArrayList();
		
		list = em.createQuery("select pf " +
							  "from PaymentForm pf " +
							  "where pf.createdBy = :user")
					.setParameter("user", user)
					//.setParameter("status", "FINISHED")
					.getResultList();
		return list;
	}

	
	public PaymentForm getPaymentForm(Integer id, User user){
		
		PaymentForm pf = (PaymentForm) em.createQuery("select pf " +
				  "from PaymentForm pf " +
				  "where pf.createdBy = :user " +
				  "  and pf.id = :id" )
		.setParameter("user", user)
		.setParameter("id", id)
		.getSingleResult();
		
		return pf;
	}
	
	
}
