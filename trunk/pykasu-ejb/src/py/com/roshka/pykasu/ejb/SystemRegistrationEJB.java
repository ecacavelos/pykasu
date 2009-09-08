package py.com.roshka.pykasu.ejb;



import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.annotation.EJB;
import javax.annotation.Resource;
import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.ActivateAccountException;
import py.com.roshka.pykasu.exceptions.FindingException;
import py.com.roshka.pykasu.exceptions.InvalidRoleException;
import py.com.roshka.pykasu.exceptions.InvalidRucException;
import py.com.roshka.pykasu.exceptions.InvalidUserNameException;
import py.com.roshka.pykasu.exceptions.MailException;
import py.com.roshka.pykasu.exceptions.PykasuFatalException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.interfaces.SystemRegistration;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.Role;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.util.Globals;
import py.com.roshka.pykasu.util.RoleManager;
import py.com.roshka.pykasu.util.Utils;

import py.com.roshka.util.mail.Mailer;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;


@Stateless
@Local ({SystemRegistration.class})
@LocalBinding (jndiBinding="pykasu/SystemRegistration/local")
@Remote ({SystemRegistration.class})
@RemoteBinding (jndiBinding="pykasu/SystemRegistration/remote")
public class SystemRegistrationEJB implements SystemRegistration{

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(SystemRegistrationEJB.class);
	
	//public static final String MAIL_PROPERTIES = "pykasu-config.properties"; 

	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@EJB
	protected UserManager userManager;
	
	@Resource
	SessionContext sc;
	
	public BusinessCompany addBusinessCompany(String ruc, String name) 
	  throws InvalidRucException{
		BusinessCompany bc = new BusinessCompany(ruc, name);
		em.persist(bc);
		return bc;
	}
	
//	@RolesAllowed("administrator")	
	public User addUser(String userName, String passwordDigest, String fullName, BusinessCompany bc, String documentNumber)
	   throws PykasuFatalException, InvalidUserNameException{
		em.refresh(bc);

		try{
			userManager.findUserByName(userName);
			throw new InvalidUserNameException("El nombre de usuario '" + userName + "' ya existe en el sistema. Favor escoja otro.");
		}catch(FindingException ef){
			//username not exists in DB, so adding user
		
			try {
				passwordDigest = Utils.SHA1(passwordDigest);
			} catch (NoSuchAlgorithmException e1) {
				logger.error(e1);
				throw new PykasuFatalException();
			} catch (UnsupportedEncodingException e1) {
				logger.error(e1);
				throw new PykasuFatalException();
			}
			
			User user = new User(userName,passwordDigest,fullName,bc);
			user.setDocumentNumber(documentNumber);
			RoleManager rm = new RoleManager(em);
			Role role;
			try {
				role = rm.getRole(RoleManager.USERROLENAME);
			} catch (InvalidRoleException e) {
				throw new PykasuFatalException(RoleManager.USERROLENAME + " is not found!");
			}
			user.getRoles().add(role);

			try {
				role = rm.getRole(RoleManager.USERADMINROLENAME);
			} catch (InvalidRoleException e) {
				role = rm.newRole(RoleManager.USERADMINROLENAME,"User Administration role");			
			}
			user.getRoles().add(role);			

			
			em.persist(user);
			return user;
		}

	}

	public User register(			
			String userName,  //administrador 
			String userFullName,  //administrador
			String phoneNumber, 
			String ruc, 
			String dv, 
			String address, 
			String locality,  
			String email,   
			String passwordDigest, 
			String businessCompanyName, //puede ser null 
			String comercialActivity,	
			String contactPerson, 
			String ciContactPerson, 
			String faxNumber, 
			String constitutionDate, 
			String userType,
			String office) 
	throws PykasuGenericException{
		
		
		try{

			User userTmp = null;
			logger.info(">>>>>>>>>>>>>>>>> username :" + userName);
			userTmp = (User) em.createQuery("select u from User u where userName = :userName")
								.setParameter("userName",userName)
								.getSingleResult();
			
			if(userTmp != null){
				throw new InvalidUserNameException(userName + " es un nombre de usuario ya registrado en el sistema.");
			}
		}catch (NoResultException e){
			logger.info("User " + userName + " is not present in the system. Begin to create");
		}
		String clearPasswd = passwordDigest;

		try{
			passwordDigest = Utils.SHA1(passwordDigest);
			
			BusinessCompany bc = new BusinessCompany(
					businessCompanyName, 
					comercialActivity,
					ruc, 
					dv, 
					contactPerson,	
					ciContactPerson, 
					address, 
					locality, 
					phoneNumber, 
					faxNumber,
					constitutionDate);
		
			bc.setEmail(email);
			bc.setOffice(office);
			
			em.persist(bc);
	
			//no se usa addUser porque este método requiere de un rol de Administrador.
			User user = new User(userFullName,passwordDigest,userName, phoneNumber, 
					ruc, dv, address, locality, constitutionDate, email ,userType, bc);
	
			user.setDocumentNumber(ciContactPerson); //le paso la CI para que sea usada por la persona a la hora de hacer pagos
			
			//al no usar el método addUser, se tienen que agregar los roles "a mano"
			RoleManager rm = new RoleManager(em);
			Role role;
			try {
				role = rm.getRole(RoleManager.USERROLENAME);
			} catch (InvalidRoleException e) {
				role = rm.newRole(RoleManager.USERROLENAME,"Users role");			
			}
			user.getRoles().add(role);
	
			try {
				role = rm.getRole(RoleManager.USERADMINROLENAME);
			} catch (InvalidRoleException e) {
				role = rm.newRole(RoleManager.USERADMINROLENAME,"Admins some Users properties");			
			}
			user.getRoles().add(role);
			
			if(userType.equalsIgnoreCase(BusinessCompany.TYPE_MULTI_USER)){
				try {
					role = rm.getRole(RoleManager.ADMNISTRATORROLENAME);
				} catch (InvalidRoleException e) {
					role = rm.newRole(RoleManager.ADMNISTRATORROLENAME,"Administators role");			
				}
				user.getRoles().add(role);
			}

			Properties properties = new Properties();
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());;
			
			//Mail
			Mailer.sendMail(properties.getProperty("SMTP_HOST",  Globals.SMTP_HOST),
					properties.getProperty("MAIL_ACTIVATION_SENDER",Globals.MAIL_ACTIVATION_SENDER),
					user.getEmail(),
					properties.getProperty("MAIL_ACTIVATION_SUBJECT",Globals.MAIL_ACTIVATION_SUBJECT),
					//cuerpo del correo
					properties.getProperty("MAIL_ACTIVATION_BODY",Globals.MAIL_ACTIVATION_BODY) + 
					"\nNombre de usuario:" +	user.getUserName() +
					"\nClave de acceso:"+clearPasswd+
					properties.getProperty("MAIL_TAIL","")
        	);

			em.persist(user);

			return user;
		} catch (IOException e) {
			logger.error(e);
			throw new MailException(e.getMessage());
		} catch (AddressException e) {
			logger.error(e);
			throw new MailException(e.getMessage());
		} catch (MessagingException e) {
			logger.error(e);			
			throw new MailException(e.getMessage());			
		} catch (NoSuchAlgorithmException e) {
			logger.error(e);			
			throw new PykasuGenericException(e);						
		} 

		
	}
	
	@Deprecated
	public User register(
			String userName, 
			String userFullName, 
			String userPhoneNumber, 
			String ruc, 
			String dv, 
			String userAddress, 
			String userLocality, 
			String bornDate, 
			String email,   
			String passwordDigest, 
			String businessCompanyName, 
			String comercialActivity,
			String businessCompanyRuc, 
			String businessCompanyDv, 
			String contactPerson, 
			String ciContactPerson, 
			String businessAddress, 
			String businessLocality, 
			String businessPhoneNumber, 
			String faxNumber, 
			String constitutionDate, 
			String userType)

	throws InvalidRucException, InvalidUserNameException, MailException {
		return null;
//		BusinessCompany bc = new BusinessCompany(businessCompanyName, comercialActivity,
//				businessCompanyRuc, businessCompanyDv, contactPerson, 
//				ciContactPerson, businessAddress, businessLocality, businessPhoneNumber, 
//				faxNumber, constitutionDate);
//				bc.setType(userType);
//
//		try{
//			User userTmp = null;
//			userTmp = (User) em.createQuery("select u from User u where userName = :userName")
//								.setParameter("userName",userName)
//								.getSingleResult();
//			
//			if(userTmp != null){
//				throw new InvalidUserNameException(userName + " es un nombre de usuario ya registrado en el sistema.");
//			}
//		}catch (NoResultException e){
//			logger.info("User " + userName + " is not present in the system. Begin to create");
//		}
//				
//		//no se usa addUser porque este método requiere de un rol de Administrador.
//		User user = new User(userFullName,passwordDigest,userName, userPhoneNumber, 
//				ruc, dv, userAddress, userLocality, bornDate, email ,userType, bc);
//
//		user.setDocumentNumber(ciContactPerson); //le paso la CI para que sea usada por la persona a la hora de hacer pagos
//		
//		//al no usar el método addUser, se tienen que agregar los roles "a mano"
//		RoleManager rm = new RoleManager(em);
//		Role role;
//		try {
//			role = rm.getRole(RoleManager.USERROLENAME);
//		} catch (InvalidRoleException e) {
//			role = rm.newRole(RoleManager.USERROLENAME,"Users role");			
//		}
//		user.getRoles().add(role);
//
//		
//		if(userType != null && userType.equalsIgnoreCase(BusinessCompany.TYPE_MULTI_USER)){
//			try {
//				role = rm.getRole(RoleManager.ADMNISTRATORROLENAME);
//			} catch (InvalidRoleException e) {
//				role = rm.newRole(RoleManager.ADMNISTRATORROLENAME,"Administators role");			
//			}
//			user.getRoles().add(role);
//		}
//	
//		try {
//			
//			Properties properties = new Properties();
//			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
//			properties.load(url.openStream());;
//
//// ------------ ESTO DEBERIA DE DESCOMENTARSE --------------- y avisar en este correo al usuario que su registro ha sido			
//			
//			Mailer.sendMail(properties.getProperty("SMTP_HOST",  Globals.SMTP_HOST),
//					properties.getProperty("MAIL_ACTIVATION_SENDER",Globals.MAIL_ACTIVATION_SENDER),
//					user.getEmail(),
//					properties.getProperty("MAIL_ACTIVATION_SUBJECT",Globals.MAIL_ACTIVATION_SUBJECT), 
//					properties.getProperty("MAIL_ACTIVATION_BODY",Globals.MAIL_ACTIVATION_BODY) + user.getBusinessCompany().getActivationKey()
//        	);
//
//			em.persist(user);
//		
//		} catch (IOException e) {
//			e.printStackTrace();
//			logger.error(e);
//			throw new MailException(e.getMessage());
//		} catch (AddressException e) {
//			e.printStackTrace();
//			logger.error(e);
//			throw new MailException(e.getMessage());
//		} catch (MessagingException e) {
//			e.printStackTrace();
//			logger.error(e);			
//			throw new MailException(e.getMessage());			
//		} 
//
//		return (user);
	}

	public void activate(String activationKey) throws ActivateAccountException {
		try {
			User user = userManager.findUserByName(sc.getCallerPrincipal().getName());
			if(user.getBusinessCompany().getActivationKey().equals(activationKey)){
				logger.debug("Before to check Activaton Key");
				
//				BusinessCompany bc = user.getBusinessCompany();
//				bc.setIsActive(Boolean.TRUE);
				
				user.getBusinessCompany().setIsActive(true);
				em.persist(user);
//				em.refresh(user);
			}else{
				throw new ActivateAccountException("El codigo de activacion no es valido.");
			}
			
			
		} catch (FindingException e) {
			logger.error(e);
			e.printStackTrace();
			throw new ActivateAccountException(e.getMessage());
		}		

		
	}	
	
	private int getNextId(String fieldName, String persistenceClass){
		String sql = "select max("+fieldName+") as max from "+persistenceClass+" tbl";
		logger.debug(">>> Getting a new Id for " + persistenceClass + " with sql sentences: " + sql);
		Integer max =  (Integer)em.createQuery(sql).
						getSingleResult();
		logger.debug(">>> New Id for " + persistenceClass + "  = " + max.intValue()+1);

		return max.intValue() + 1;
	}
}
