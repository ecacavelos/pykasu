/*
 * Created on Jun 16, 2006
 * Chapulín Colorado
 */
package py.com.roshka.pykasu.persistence.users;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.security.RolesAllowed;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity (name = "Role")
//@EntityListeners (py.com.roshka.pykasu.persistence.audit.Audit.class)
//@SequenceGenerator(name = "seq_roles", sequenceName = "seq_roles")
@Table (name = "roles")
public class Role implements Serializable{
    
    private Integer id;
    private String roleName;
    private String roleDescription;
    private Boolean isActive;
    private List<User> users=new ArrayList<User>();


	public Role() {
    }
    
	
    public Role(String name, String description){
    	this();
    	roleName = name;
    	roleDescription = description;
    	isActive = true;
    }

    @Id @Column (name="role_iid")
    //@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_roles")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name="is_active")
    public Boolean getIsActive() {
        return isActive;
    }

    @RolesAllowed("sysadmin")
    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public String getRoleDescription() {
        return roleDescription;
    }

    public void setRoleDescription(String roleDescription) {
        this.roleDescription = roleDescription;
    }

    @Column (unique = true)
    public String getRoleName() {
        return roleName;
    }

    @RolesAllowed("sysadmin")
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    
    @SuppressWarnings("unchecked")
	@ManyToMany(
    	cascade={CascadeType.PERSIST},
    	mappedBy="roles",
    	targetEntity=py.com.roshka.pykasu.persistence.users.User.class
    )   
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
    
}
