package py.com.roshka.pykasu.ejb;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.security.SecurityDomain;

import py.com.roshka.pykasu.exceptions.FindingException;
import py.com.roshka.pykasu.exceptions.LoginFailureException;
import py.com.roshka.pykasu.exceptions.UserNotFoundException;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.util.ResultItem;


@Stateless
@Local ({UserManager.class})
@LocalBinding (jndiBinding="pykasu/UserManager/local")

//@SecurityDomain("PykasuAppPolicy")

public class UserManagerEJB implements UserManager {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(UserManagerEJB.class);
	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@Resource
	protected SessionContext sc;

	/**
	 * Intenta recuperar el usuario de la base de datos
	 * Primer intento, busca el usuario teniendo en cuenta que NO realiza PAGOS
	 * Si no lo encuentra, busca como que SI realiza pagos.
	 * Si realiza pagos asume que el usuario esta cargado en la base de datos con un n�mero en el formato "000000000000000"
	 */
	
	public User getUser(String userName, String passwdDigest)
			throws UserNotFoundException, LoginFailureException {

		logger.info("Get a Query whit the next pattern: userName:" + userName.trim().toLowerCase());
		User user = null;
		try{
			logger.debug("Try to get User without PaymentAvailable");
			user =	(User) em.createQuery("select users from User as users where users.isActive is true and users.userName like :userName and users.paymentAvaliable = :paParam")
						  		 .setParameter("userName",userName.trim().toLowerCase())
						  		 .setParameter("paParam",Boolean.FALSE)
						  		 .getSingleResult();
		}catch(NoResultException e) {
			try{
				logger.debug("User not found. Try now to get User with PaymentAvailable");
				String uname = userName.trim().toLowerCase();
				DecimalFormat df = new DecimalFormat("000000000000000");
				uname = df.format(Double.parseDouble(uname));
				user =	(User) em.createQuery("select users from User as users where users.userName like :userName and users.paymentAvaliable = :paParam")
			  		 .setParameter("userName",uname)
			  		 .setParameter("paParam",Boolean.TRUE)
			  		 .getSingleResult();

			}catch(NoResultException e2){
				logger.error(e2);
				throw new UserNotFoundException("No existe " + userName + " como usuario registrado.");							
			}catch(Exception e2){
				logger.error(e2);
				throw new UserNotFoundException(e2.getMessage());
			}	
		}catch(Exception e){
			logger.error(e);
			throw new UserNotFoundException(e.getMessage());
		}
			
		if(!user.getPasswordDigest().equals(passwdDigest)){
			logger.debug("DB Password:" + user.getPasswordDigest());
			logger.debug("User Password:" + passwdDigest);
			throw new LoginFailureException("La contrase�a provista para autenticar al usuario  " + user.getUserName() + " no corresponde." );
		}

		return user;
	}

//	@RolesAllowed("users")
	public void changePassword(String userName, String oldPassword, String newPassword)
			throws LoginFailureException {
		try{
			User user = getUser(userName, oldPassword);
			user.setPasswordDigest(newPassword);
		}catch (UserNotFoundException userNotFound) {
			throw new LoginFailureException("Usuario " + userName + " no encontrado.");
		}catch (LoginFailureException lfe){
			throw lfe;	
		}

	}

//	@RolesAllowed("users")
	public void updateDataUser(User user) {
		logger.info("Updating user data for " + user.getUserName());
		User savedUser = em.find(User.class,user.getId());
		savedUser.setFullName(user.getFullName());
		savedUser.setPasswordDigest(user.getPasswordDigest());
		em.persist(savedUser);
	}

	@SuppressWarnings("unchecked")
	public List<ResultItem> getAllUsers() {
		
			User loggedUser = null;
			try {
				loggedUser = findUserByName(sc.getCallerPrincipal().getName());
		
		    	List list = em.createQuery("select users from User as users where users.businessCompany = :businessCompany")
		    				.setParameter("businessCompany",loggedUser.getBusinessCompany())
		    				.getResultList();
	
		    	
		    	List<ResultItem> results = new ArrayList();
		    	ResultItem ri = null;
		    	User user = null;
			
		    	Iterator it = list.iterator();
		    	while(it.hasNext()){
		    		user = (User)it.next();
		    		ri = new ResultItem();
		    		ri.setId(user.getId());
		    		ri.setDescription(user.getFullName() + " - Activo: " + user.getIsActive());
		    		ri.setDeleteable(false);
		    		ri.setEditable(true);
		    		results.add(ri);
		    	}
		    	
		    	return results;
			} catch (FindingException e) {
				logger.error("Imposible to retrieve user " ,e);
				return null;
			}
	}
	
	public User findUserByName(String username) 
	   throws FindingException{
		User user = null;
		try{
			logger.debug("-------------> Before perform query.");	

			user= (User)em.createQuery("select users from User users where users.userName = :principalUser")
					.setParameter("principalUser",username.trim().toLowerCase())
					.getSingleResult();

			logger.debug("-------------> After perform query.");	
		}catch(NoResultException e){
			logger.error(e);
			throw new FindingException(e.getMessage());
		}
		return user;
	}

}
