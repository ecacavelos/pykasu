package py.com.roshka.pykasu.ejb;

import java.util.List;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.FormSettingRetrieveException;
import py.com.roshka.pykasu.interfaces.FormSettingInterface;
import py.com.roshka.pykasu.persistence.fiscal.FormSetting;


@Stateless
@Local ({FormSettingInterface.class})
@LocalBinding (jndiBinding="pykasu/FormSettingManager/local")
@Remote ({FormSettingInterface.class})
@RemoteBinding (jndiBinding="pykasu/FormSettingManager/remote")

public class FormSettingManager implements FormSettingInterface {

	@PersistenceContext(unitName = "tributos")
	EntityManager tributos;
	
	
	public FormSetting getFormSetting(String formType)
			throws FormSettingRetrieveException {
		try{
			return (FormSetting) 
				tributos.createQuery("select fs from FormSetting fs " +
					"where fs.formType = :formType")
					.setParameter("formType",formType)
					.getSingleResult();
						
		}catch(Exception e){
			throw new FormSettingRetrieveException(e.getMessage());
		}
	}

}
