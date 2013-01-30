package py.com.roshka.pykasu.ejb;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.interfaces.RaffleTicketManager;
import py.com.roshka.pykasu.interfaces.UploadFormManager;
import py.com.roshka.pykasu.persistence.raffle.RaffleTicket;
import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;

@Stateless
@Local ({RaffleTicketManager.class})
@LocalBinding (jndiBinding="pykasu/RaffleTicketManager/local")
@Remote ({RaffleTicketManager.class})
@RemoteBinding (jndiBinding="pykasu/RaffleTicketManager/remote")
public class RaffleTicketManagerEJB implements RaffleTicketManager {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(RaffleTicketManagerEJB.class);

	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;

	public RaffleTicket generateTicket(User user) throws PersistenceException {
		RaffleTicket ticket = new RaffleTicket(user);
		em.persist(ticket);
		return ticket;
	}

	public List<RaffleTicket> generateTicket(User user, Integer amount)
			throws PersistenceException {
		List <RaffleTicket> tickets = new ArrayList<RaffleTicket>();
		for(int i=0; i<amount; i++){
			tickets.add(generateTicket(user));
		}
		return tickets;
	}

	@SuppressWarnings("unchecked")
	public List<RaffleTicket> getAll(User user) {
		List<RaffleTicket> tickets = 
			em.createQuery("select rt from RaffleTicket rt where rt.businessCompany = :bcompany order by rt.arrivalTime desc")
				.setParameter("bcompany", user.getBusinessCompany())
			.getResultList();

		return tickets;
	}

}
