package py.com.roshka.pykasu.web.actions.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
/**
 * 
 * @author Pablo
 *
 * @struts.form name = "UserEditForm"	
 */
public class UserEditForm extends ActionForm {
	private String userName;
	private String fullName;
	private String password;
	private String replyPassword;
	private String documentNumber;
	private String email;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getDocumentNumber() {
		return documentNumber;
	}
	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}
	public String getReplyPassword() {
		return replyPassword;
	}
	public void setReplyPassword(String replyPassword) {
		this.replyPassword = replyPassword;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();

        if(request.getParameter("actionType")!=null && request.getParameter("actionType").equalsIgnoreCase("add")){
        	if(getUserName()==null || getUserName().trim().length() == 0){
	            errors.add("userform.userName.mandatory", new ActionError("userform.userName.mandatory"));
        	}
        }
        
        if(getFullName()==null || getFullName().trim().length() == 0){
            errors.add("userform.name.mandatory", new ActionError("userform.name.mandatory"));
    	}
        
        if(getPassword()==null || getPassword().trim().length() == 0){
            errors.add("userform.password.mandatory", new ActionError("userform.password.mandatory"));
    	}
                
        if(getReplyPassword()==null || getReplyPassword().trim().length() == 0){
            errors.add("userform.replyPassword.mandatory", new ActionError("userform.replyPassword.mandatory"));
    	}

        if(getPassword()!= null && getPassword().length() < 6 ){
        	errors.add("userform.passwords.notEquals", new ActionError("userform.passwords.notEquals"));
        }

        
        if(getPassword()!= null && !getPassword().equalsIgnoreCase(getReplyPassword())){
        	errors.add("userform.password.short", new ActionError("userform.password.short"));
        }
        return errors;
	}
	
	
}
