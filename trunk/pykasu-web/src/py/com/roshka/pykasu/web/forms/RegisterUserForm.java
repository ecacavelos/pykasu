/*
 * Created on 12/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.forms;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.web.Globals;

/**
 * 
 * @author jrey
 * 
 * @struts.form name = "RegisterUserForm"
 * 
 */
public class RegisterUserForm extends ActionForm {

    private String formType;
    private String userType;//Tipo de persona: Fisica, Juridica
    
    //Datos de la persona
    private String userName;//Nombre de usuario (nombre de la cuenta)
    private String fullName; //Nombre completo del usuario (Nombre y Apellido)
    private String phoneNumber;
    private String ruc;
    private String dv;
    private String address;
    private String locality; //Localidad de la empresa
    private String city;
    private String email;
    private String password;
    private String replyPassword;

    private String businessCompanyName;
    private String comercialActivity;//Ramo
    private String contactPerson;//Persona de contacto
    private String ciContactPerson;//C.I. de la persona
    private String faxNumber;
    private String constitutionDate; //Fecha de constitucion
    
    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {

    }

    @Override
    public ActionErrors validate(ActionMapping mapping,
            HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        System.out.println("Valida el form de registro");
        return errors;
    }

    public String getBusinessCompanyName() {
        return businessCompanyName;
    }

    public void setBusinessCompanyName(String businessCompanyName) {
        this.businessCompanyName = businessCompanyName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getReplyPassword() {
        return replyPassword;
    }

    public void setReplyPassword(String replyPassword) {
        this.replyPassword = replyPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public String getFormType() {
        return formType;
    }
    public void setFormType(String formType) {
        this.formType = formType;
    }
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFaxNumber() {
		return faxNumber;
	}
	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getComercialActivity() {
		return comercialActivity;
	}
	public void setComercialActivity(String comercialActivity) {
		this.comercialActivity = comercialActivity;
	}

	public String getCiContactPerson() {
		return ciContactPerson;
	}
	public void setCiContactPerson(String ciContactPerson) {
		this.ciContactPerson = ciContactPerson;
	}

	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getConstitutionDate() {
		return constitutionDate;
	}
	public void setConstitutionDate(String constitutionDate) {
		this.constitutionDate = constitutionDate;
	}

	public String getDv() {
		return dv;
	}
	public void setDv(String dv) {
		this.dv = dv;
	}

	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

//	public String getBornDate() {
//		return bornDate;
//	}
//	public void setBornDate(String bornDate) {
//		this.bornDate = bornDate;
//	}
//
//	public String getBusinessCompanyDV() {
//		return businessCompanyDV;
//	}
//	public void setBusinessCompanyDV(String businessCompanyDV) {
//		this.businessCompanyDV = businessCompanyDV;
//	}
	

}
