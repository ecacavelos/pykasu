package py.com.roshka.pykasu.interfaces;

import java.util.Date;

import py.com.roshka.pykasu.exceptions.ActivateAccountException;
import py.com.roshka.pykasu.exceptions.InvalidRucException;
import py.com.roshka.pykasu.exceptions.InvalidUserNameException;
import py.com.roshka.pykasu.exceptions.MailException;
import py.com.roshka.pykasu.exceptions.PykasuFatalException;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;

public interface SystemRegistration {

	public BusinessCompany addBusinessCompany(String ruc, String name)
			throws InvalidRucException;

	public User addUser(String userName, String passwordDigest,String fullName, BusinessCompany bc, String documentNumber)
		    throws InvalidUserNameException, PykasuFatalException;
	
	public User register(String userName, String userFullName, String userPhoneNumber, String ruc, 
			String dv, String userAddress, String userLocality, String bornDate, String email,   
			String passwordDigest, String businessCompanyName, String comercialActivity,
			String businessCompanyRuc, String businessCompanyDv, String contactPerson, 
			String ciContactPerson, String businessAddress, String businessLocality, String businessPhoneNumber, 
			String faxNumber, String constitutionDate, String userType)
			throws InvalidRucException, InvalidUserNameException, MailException;
	
	public void activate(String activationKey)
			throws ActivateAccountException;		
}
