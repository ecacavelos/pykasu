package py.com.roshka.pykasu.web.forms;

import org.apache.struts.action.ActionForm;
/**
 * 
 * 
 * @struts.form name = "SelectUserType"
 * 
 */
public class SelectUserType extends ActionForm{

	private String userType;

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
	
}

