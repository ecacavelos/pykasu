package py.com.roshka.pykasu.ejb;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.GetContributorInfoException;
import py.com.roshka.pykasu.interfaces.Contributor;
import py.com.roshka.pykasu.persistence.ruc.Ruc;

@Stateless
@Local ({Contributor.class})
@LocalBinding (jndiBinding="pykasu/Contributor/local")
@Remote ({Contributor.class})
@RemoteBinding (jndiBinding="pykasu/Contributor/remote")


public class ContributorEJB implements Contributor{

	@PersistenceContext(unitName = "tributos")
	EntityManager em;
	

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(ContributorEJB.class);

	
	public Ruc getInfo(String ruc) throws GetContributorInfoException {

		String columnRucName = "";
		
		logger.info("Examine ruc " + ruc +" to know if new or old format");
		try{
			logger.info("Examine portion ruc: " + ruc.trim().substring(0,1)) ;
			Integer.parseInt(ruc.trim().substring(0,1));
			logger.info("Ruc is new format!");
			columnRucName = "newRuc";
		}catch (NumberFormatException e) {
			logger.info("Ruc is old format!");
			columnRucName = "oldRuc";			
		}

		try{
			//tengo que saber si hay que buscar en la columna de RUC Nuevo, o en la de RUC viejo.
			//voy a examinar el ruc para determiar cual ruc es.
			
			
			Ruc r = (Ruc) em.createQuery("select rucs from Ruc rucs " +
					" where rucs."+columnRucName+" = :ruc")
					.setParameter("ruc",ruc)
					.getSingleResult();
			return r;
		}catch(NoResultException e){
			throw new GetContributorInfoException(e.getMessage());
		}
	}
	
		
}
