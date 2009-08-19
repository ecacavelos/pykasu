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
 * 
 * 
 * 
 */
public class RegisterUserForm extends ActionForm {

    private String formType;
    private String userType;//Tipo de persona: Fisica, Juridica
    
    //Datos de la persona
    private String userName;//Nombre de usuario (nombre de la cuenta)
    private String fullName; //Nombre completo del usuario (Nombre y Apellido)
    //private String lastName;
    private String phoneNumber;
    private String ruc;
    private String dv;
    private String address;
    private String locality; //Localidad de la empresa
    private String city;
    private String bornDate;
    private String email;
    private String password;
    private String replyPassword;

    private String businessCompanyName;
    private String comercialActivity;//Ramo
    private String businessCompanyRuc;
    private String businessCompanyDV;
    private String contactPerson;//Persona de contacto
    private String ciContactPerson;//C.I. de la persona
    private String faxNumber;
    private String constitutionDate; //Fecha de constitucion
    
    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        //userName = "Nombre de Usuario";

    }
    /*errors.header=<table width="100%"><tr><td colspan="3" class="formerror"><li>
    errors.footer=</li></td></tr></table>
    userform.userName.mandatory=El campo usuario es obligatorio
    =El campo usuario no es V&aacute;lido
    userform.name.mandatory=El Campo Nombres es obligatorio
    userform.lastName.mandatory=El Campo Apellidos es obligatorio
    userform.password.mandatory=El Campo password es obligatorio
    userform.replyPassword.mandatory=El Campo repetir password es obligatorio
    userform.companyName.mandatory=El Campo Nombre de Compañia es obligatorio
    userform.companyRuc.mandatory=*/
    @Override
    public ActionErrors validate(ActionMapping mapping,
            HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        System.out.println("Valida el form de registro");
        /* validar user name
         *  */
       /* if (this.formType == null || (!formType.equals(Globals.USER_FORM_REGISTER_USER) && !formType.equals(Globals.USER_FORM_ADD_USER)) ){
            errors.add("userform.invalid.form", new ActionError(
            "userform.invalid.form"));
        }
        if (this.userName == null || userName.trim().equals("")){
            errors.add("userform.userName.invalid", new ActionError(
            "userform.userName.invalid"));
        }else if (this.userName.length() <= 3){
            errors.add("userform.userName.mandatory", new ActionError(
            "userform.userName.mandatory"));
        }
        //pasword
        if (this.password == null || this.password.trim().equals("")){
            errors.add("userform.name.mandatory", new ActionError(
            "userform.name.mandatory"));
        }else if (this.replyPassword == null || this.replyPassword.trim().equals("")){
            errors.add("userform.replyPassword.mandatory", new ActionError(
            "userform.replyPassword.mandatory"));
        }
        else if (!this.password.equals(replyPassword)){
            errors.add("userform.passwords.notEquals", new ActionError(
            "userform.passwords.notEquals"));
        }else if (this.password.length() < 3){
            errors.add("userform.password.short", new ActionError(
            "userform.passwords.short"));
        }

        //email
        if (this.email == null || this.email.trim().equals("")){
            errors.add("userform.email.mandatory", new ActionError(
            "userform.email.mandatory"));
        }        
        
        //nombres
        if (this.fullName == null || this.fullName.trim().equals("")){
            errors.add("userform.name.mandatory", new ActionError(
            "userform.name.mandatory"));
        }
        //apellidos AHORA SE GUARDA NOMBRE COMPLETO NOMAS, NO SEPARADO NOMBRE/APELLIDO
        if (this.lastName == null || this.lastName.trim().equals("")){
            errors.add("userform.lastName.mandatory", new ActionError(
            "userform.lastName.mandatory"));
        }
        
        // busisness Name
        if ((this.businessCompanyName == null || this.businessCompanyName.trim().equals("")) && this.formType.equals(Globals.USER_FORM_REGISTER_USER)){
            errors.add("userform.companyName.mandatory", new ActionError(
            "userform.companyName.mandatory"));
        }
        
        
        //  busisness RUC
        if ((this.businessCompanyRuc == null
                || businessCompanyRuc.trim().equals("")) && this.formType.equals(Globals.USER_FORM_REGISTER_USER)) {
            errors.add("userform.companyRuc.mandatory", new ActionError(
                    "userform.companyRuc.mandatory"));
        }        
        
        request.setAttribute(Globals.USER_FORM_FORM_TYPE,getFormType());*/
        return errors;
    }

    public String getBusinessCompanyName() {
        return businessCompanyName;
    }

    public void setBusinessCompanyName(String businessCompanyName) {
        this.businessCompanyName = businessCompanyName;
    }

    public String getBusinessCompanyRuc() {
        return businessCompanyRuc;
    }

    public void setBusinessCompanyRuc(String businessCompanyRuc) {
        this.businessCompanyRuc = businessCompanyRuc;
    }

   /* AHORA SE GUARDA NOMBRE COMPLETO, NO NOMBRE/APELLIDO
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }*/

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
	/**
	 * @return Returns the comercialActivity.
	 */
	public String getComercialActivity() {
		return comercialActivity;
	}
	/**
	 * @param comercialActivity The comercialActivity to set.
	 */
	public void setComercialActivity(String comercialActivity) {
		this.comercialActivity = comercialActivity;
	}
	/**
	 * @return Returns the ciContactPerson.
	 */
	public String getCiContactPerson() {
		return ciContactPerson;
	}
	/**
	 * @param ciContactPerson The ciContactPerson to set.
	 */
	public void setCiContactPerson(String ciContactPerson) {
		this.ciContactPerson = ciContactPerson;
	}
	/**
	 * @return Returns the contactPerson.
	 */
	public String getContactPerson() {
		return contactPerson;
	}
	/**
	 * @param contactPerson The contactPerson to set.
	 */
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	/**
	 * @return Returns the userType.
	 */
	public String getUserType() {
		return userType;
	}
	/**
	 * @param userType The userType to set.
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}
	/**
	 * @return Returns the locality.
	 */
	public String getLocality() {
		return locality;
	}
	/**
	 * @param locality The locality to set.
	 */
	public void setLocality(String locality) {
		this.locality = locality;
	}
	/**
	 * @return Returns the constitutionDate.
	 */
	public String getConstitutionDate() {
		return constitutionDate;
	}
	/**
	 * @param constitutionDate The constitutionDate to set.
	 */
	public void setConstitutionDate(String constitutionDate) {
		this.constitutionDate = constitutionDate;
	}
	/**
	 * @return Returns the dv.
	 */
	public String getDv() {
		return dv;
	}
	/**
	 * @param dv The dv to set.
	 */
	public void setDv(String dv) {
		this.dv = dv;
	}
	/**
	 * @return Returns the ruc.
	 */
	public String getRuc() {
		return ruc;
	}
	/**
	 * @param ruc The ruc to set.
	 */
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	/**
	 * @return Returns the city.
	 */
	public String getCity() {
		return city;
	}
	/**
	 * @param city The city to set.
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return Returns the bornDate.
	 */
	public String getBornDate() {
		return bornDate;
	}
	/**
	 * @param bornDate The bornDate to set.
	 */
	public void setBornDate(String bornDate) {
		this.bornDate = bornDate;
	}
	/**
	 * @return Returns the businessCompanyDV.
	 */
	public String getBusinessCompanyDV() {
		return businessCompanyDV;
	}
	/**
	 * @param businessCompanyDV The businessCompanyDV to set.
	 */
	public void setBusinessCompanyDV(String businessCompanyDV) {
		this.businessCompanyDV = businessCompanyDV;
	}
	

}
