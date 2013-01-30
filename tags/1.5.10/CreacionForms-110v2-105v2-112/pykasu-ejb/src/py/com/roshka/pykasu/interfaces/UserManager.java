package py.com.roshka.pykasu.interfaces;

import java.util.List;

import py.com.roshka.pykasu.exceptions.FindingException;
import py.com.roshka.pykasu.exceptions.LoginFailureException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.exceptions.UserNotFoundException;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.util.ResultItem;

public interface UserManager {
	public User getUser(String userName, String passwdDigest)
		throws UserNotFoundException, LoginFailureException;
	
	public void changePassword(String userName, String oldPassword, String newPassword)
		throws LoginFailureException;
	
	public void updateDataUser(User user);
	
	public List<ResultItem> getAllUsers();
	
	public List<User> getUsers() throws PykasuGenericException;
	
	public User findUserByName(String username) throws FindingException;
	
	public User getUser(String userId) throws PykasuGenericException;
	
	public void save(User user) throws PykasuGenericException;
	
	public User createUser(String userName, String passwordDigest, String fullName, String documentNumber, String email, BusinessCompany bc) throws PykasuGenericException;
}
