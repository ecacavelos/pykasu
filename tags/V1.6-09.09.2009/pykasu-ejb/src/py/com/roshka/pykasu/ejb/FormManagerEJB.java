package py.com.roshka.pykasu.ejb;

import java.io.InputStream;
import java.util.HashMap;

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

import py.com.roshka.pykasu.exceptions.FormManagerException;
import py.com.roshka.pykasu.exceptions.GetContributorInfoException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.interfaces.ClientDataInterface;
import py.com.roshka.pykasu.interfaces.Contributor;
import py.com.roshka.pykasu.interfaces.Form101ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form104ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form105ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form106ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form108ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form109ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form110ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form117ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form118ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form120ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form122ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form123ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form130ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form800ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form801ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form804ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form848ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form850ManagerInterface;
import py.com.roshka.pykasu.interfaces.Form90ManagerInterface;
import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.FormSettingInterface;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.ruc.Ruc;
import py.com.roshka.pykasu.ui.form.SimpleForm;
import py.com.roshka.pykasu.xml.Parser;


@Stateless
@Local ({FormManager.class})
@LocalBinding (jndiBinding="pykasu/FormManager/local")
@Remote ({FormManager.class})
@RemoteBinding (jndiBinding="pykasu/FormManager/remote")
//@SecurityDomain("PykasuAppPolicy")
public class FormManagerEJB implements FormManager {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(FormManagerEJB.class);

	@PersistenceContext(unitName = "pykasu")
	EntityManager em;
	
	@EJB private Form850ManagerInterface form850Mgr;
	@EJB private Form800ManagerInterface form800Mgr;	
	@EJB private Form801ManagerInterface form801Mgr;
	@EJB private Form120ManagerInterface form120Mgr;
	@EJB private Form101ManagerInterface form101Mgr;
	@EJB private Form123ManagerInterface form123Mgr;
	@EJB private Form110ManagerInterface form110Mgr;
	@EJB private Form117ManagerInterface form117Mgr;
	@EJB private Form122ManagerInterface form122Mgr;
	@EJB private Form804ManagerInterface form804Mgr;
	@EJB private Form118ManagerInterface form118Mgr;
	@EJB private Form109ManagerInterface form109Mgr;
	@EJB private Form108ManagerInterface form108Mgr;
	@EJB private Form106ManagerInterface form106Mgr;
	@EJB private Form104ManagerInterface form104Mgr;
	@EJB private Form105ManagerInterface form105Mgr;
	@EJB private Form130ManagerInterface form130Mgr;
	@EJB private Form848ManagerInterface form848Mgr;
	@EJB private Form90ManagerInterface form90Mgr;
	
	@EJB private ClientDataInterface clientDataMgr;
	@EJB private Contributor contributor;
	@EJB private FormSettingInterface formSetting;

	@Resource SessionContext sc;
	
	public GenericFormManager getFormManager(String formType) throws FormManagerException{
		if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_850)){
			return form850Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_800)){
			return form800Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_801)){
			return form801Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_120)){
			return form120Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_101)){
			return form101Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_123)){
			return form123Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_110)){
			return form110Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_117)){
			return form117Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_122)){
			return form122Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_804)){
			return form804Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_118)){
			return form118Mgr;
		}else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_109)){
			return form109Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_108)){
			return form108Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_106)){
			return form106Mgr;
		} else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_104)){
			return form104Mgr;
		}else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_105)){
			return form105Mgr;
		}else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_130)){
			return form130Mgr;
		}else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_848)){
			return form848Mgr;
		}else if(formType.equalsIgnoreCase(TaxForm.FORM_TYPE_90)){
			return form90Mgr;
		}
		throw new FormManagerException(formType + " is not available.");
	}

	@SuppressWarnings("unchecked")
	public HashMap getContributorInfo(String ruc, String formType){

		HashMap hm = new HashMap();
		Ruc thisRuc;
		try {
				
			thisRuc = contributor.getInfo(ruc);
			hm.put("ruc",thisRuc.getNewRuc());	

			hm.put("firstLastName","<![CDATA[" +thisRuc.getContributorName() +"]]>");
			hm.put("dv",thisRuc.getVerifiedDigit().toString());
			hm.put("secondLastName","");
			hm.put("firstName","");
			hm.put("middleName","");
			hm.put("status","");
			hm.put("type","");
	
			hm.put("additionalInfo","true");

		} catch (GetContributorInfoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hm;		

	}

	
}
