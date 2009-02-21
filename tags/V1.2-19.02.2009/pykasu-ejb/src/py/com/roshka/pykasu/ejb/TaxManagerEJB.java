package py.com.roshka.pykasu.ejb;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.GetTaxException;
import py.com.roshka.pykasu.interfaces.TaxManager;
import py.com.roshka.pykasu.persistence.fiscal.Fee;
import py.com.roshka.pykasu.persistence.fiscal.Taxes;

@Stateless
@Local ({TaxManager.class})
@LocalBinding (jndiBinding="pykasu/TaxesManager/local")
@Remote ({TaxManager.class})
@RemoteBinding (jndiBinding="pykasu/TaxesManager/remote")
public class TaxManagerEJB implements TaxManager{

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(TaxManagerEJB.class);
	
	@PersistenceContext(unitName = "tributos")
	EntityManager tributos; 
	
	@SuppressWarnings("unchecked")
	public List<Taxes> getAllTaxes() throws GetTaxException {
		
		List<Taxes> taxes = new ArrayList(); 
		taxes = tributos.createQuery("select t from Taxes t where t.taxId not in (0, 451) order by t.taxId").getResultList();
		
		return taxes;
	}

	public Taxes getTax(Integer taxId) throws GetTaxException {
		Taxes tax = (Taxes) tributos
				.createQuery("select t from Taxes t where t.taxId = :taxId")
					.setParameter("taxId",taxId)
					.getSingleResult();
		
		return tax;
	}
	
	public Fee getFee(Integer form, Integer field, Integer month, Integer year)
		throws GetTaxException{
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, month + 1);
		cal.set(Calendar.YEAR, year);
		try{
			Fee f = (Fee)
					tributos.createQuery("select f from Fee f where f.form = :form" +
										 " and f.field = :field " +
										 " and :date between f.init and f.end")
							.setParameter("form", form)
							.setParameter("field", field)
							.setParameter("date", cal.getTime())
							.getSingleResult();
			return f;
			
		}catch(NoResultException e){
			e.printStackTrace();
			logger.error("No hay datos " + e.getMessage());
			throw new GetTaxException(e.getMessage(),e);
		}catch(Exception e){
			e.printStackTrace();
			logger.error("Problema al recuperar Fee " + e.getMessage());
			throw new GetTaxException(e.getMessage(),e);
		}
	}
	
	
}
