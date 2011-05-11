package py.com.roshka.pykasu.interfaces;

import java.util.Map;

import py.com.roshka.pykasu.exceptions.FormManagerException;
import py.com.roshka.pykasu.exceptions.GetContributorInfoException;

public interface FormManager {

	public GenericFormManager getFormManager(String formType)
		throws FormManagerException;

	public Map<String, String> getContributorInfo(String ruc, String formType) throws GetContributorInfoException;
	
}
