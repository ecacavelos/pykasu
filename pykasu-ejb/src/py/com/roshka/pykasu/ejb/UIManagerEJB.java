package py.com.roshka.pykasu.ejb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.EJB;
import javax.annotation.Resource;
import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.FindingException;
import py.com.roshka.pykasu.interfaces.UIManager;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.users.Role;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.menu.Action;
import py.com.roshka.pykasu.ui.menu.Program;
import py.com.roshka.pykasu.util.RoleManager;
import py.com.roshka.pykasu.xml.Parser;

@Stateless
@Local ({UIManager.class})
@LocalBinding (jndiBinding="pykasu/UIManager/local")
@Remote ({UIManager.class})
@RemoteBinding (jndiBinding="pykasu/UIManager/remote")
public class UIManagerEJB implements UIManager{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(UIManagerEJB.class);

	public static final String FILE_MENU_XML = "menu.xml";
	
	@PersistenceContext(unitName = "pykasu")
	EntityManager em;
	
	@Resource
	SessionContext sc;
	
	@EJB 
	private UserManager userManager;
	
	@SuppressWarnings("unchecked")
	public List<Program> getMenu() {

		Set<Program> menu  = null;

		try {
			User user = userManager.findUserByName(sc.getCallerPrincipal()
					.getName());

			logger.info(" ---------------------------> Principal! : "
					+ sc.getCallerPrincipal());
			
		
			{
				user.getRoles();
				List userRoles = new ArrayList();
				userRoles.addAll(user.getRoles());
	
				ClassLoader cl = getClass().getClassLoader();
				logger.info("Parseando el xml");
				logger.info("AVALIABLE TO PAY -- > " + user.getPaymentAvaliable());
				// El usuario no tiene permitido el pago
				if(user.getPaymentAvaliable()== false){
					menu = Parser.parseMenu2(cl.getResourceAsStream(FILE_MENU_XML),
							userRoles);
				}else{
					// El usuario tiene permitido el pago
					menu = Parser.parseMenu(cl.getResourceAsStream(FILE_MENU_XML),
						userRoles);
				}
				
			}
			
		} catch (FindingException e) {
			logger.error(e);
		} catch (Exception e){
			logger.error(e);	
			e.printStackTrace();
		}
		
		ArrayList al = new ArrayList(menu);
        Collections.sort(al);
		return al;
		
	}
	
	@SuppressWarnings({"unchecked"})
	private Program getPrograms(Role role){
		Program program = null;
		Action action = null;
		if(role.getRoleName().equals(RoleManager.USERROLENAME)){
			program = new Program("Formularios","Carga de diversos formularios",10);
			action = new Action("Formulario 850","Carga del formularion 850","/showForm.do");
			action.addSubAction("Nuevo Formulario 850","Muestra un Formulario 850 para ser cargado","showForm.do?FORM=850");
			action.addSubAction("Buscar formularios 850","Muestra todos los formulario 850 en el sistema","findForms.do?FORM=850");
			program.getActions().add(action);
			action = new Action("Formulario 800","Carga del formularion 800","/showForm.do");
			program.getActions().add(action);
			action = new Action("Formulario 801","Carga del formularion 801","/showForm.do");
			program.getActions().add(action);
		}else if(role.getRoleName().equals(RoleManager.ADMNISTRATORROLENAME)){
			program = new Program("Administración de Usuarios","Administración de Usuarios",20); 
			action = new Action("Agregar usuario","Agrega un nuevo usuario a su empresa","addUser.do");
			program.getActions().add(action);
			action = new Action("Buscar usuario","Realiza una búsquda de usuarioa de su empresa","showUsers.do");
			program.getActions().add(action);
		}else if(role.getRoleName().equals(RoleManager.SYSTEMADMINROLENAME)){

		}
		
		return program; 
	}
	

}
