package py.com.roshka.pykasu.util;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import py.com.roshka.pykasu.exceptions.InvalidRoleException;
import py.com.roshka.pykasu.persistence.users.Role;

public class RoleManager {
	
	public static final String USERROLENAME = "users";
	public static final String ADMNISTRATORROLENAME = "administrator";
	public static final String SYSTEMADMINROLENAME = "sysadmin";

	private EntityManager em;
	
	public RoleManager(EntityManager em){
		this.em = em;
	}
	
	public Role getRole(String roleName) throws InvalidRoleException{
		Role role = null;
		try{
			role = (Role) em.createQuery("select r from Role r where r.roleName like :roleName")
						 	 .setParameter("roleName",roleName)
							 .getSingleResult();
		}catch (NoResultException e){
			throw new InvalidRoleException(roleName + " is not found.");
		}
		return role;
	}
	
	public Role newRole(String name, String description){
		Role role = null;
		role = new Role(name,description);
		return role;
	}
	
}
