package py.com.roshka.pykasu.interfaces;

import java.util.List;

import javax.persistence.PersistenceException;

import py.com.roshka.pykasu.persistence.raffle.RaffleTicket;
import py.com.roshka.pykasu.persistence.users.User;

public interface RaffleTicketManager {
	
	public RaffleTicket generateTicket(User user) throws PersistenceException;
	
	public List<RaffleTicket> generateTicket(User user, Integer amount) throws PersistenceException;
	
	public List<RaffleTicket> getAll(User user);
}
