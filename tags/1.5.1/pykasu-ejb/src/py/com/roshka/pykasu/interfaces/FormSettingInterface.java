package py.com.roshka.pykasu.interfaces;

import py.com.roshka.pykasu.exceptions.FormSettingRetrieveException;
import py.com.roshka.pykasu.persistence.fiscal.FormSetting;

public interface FormSettingInterface {
	
	public FormSetting getFormSetting(String formType)
		throws FormSettingRetrieveException;
	
}
