package py.com.roshka.pykasu.interfaces;

import java.util.HashMap;
import py.com.roshka.pykasu.exceptions.FormManagerException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;

public interface FormManager {

	public GenericFormManager getFormManager(String formType)
		throws FormManagerException;

	public HashMap getContributorInfo(String ruc, String formType);
	
}
