package py.com.roshka.pykasu.interfaces;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import py.com.roshka.pykasu.exceptions.AddFormException;
import py.com.roshka.pykasu.exceptions.FiscalInfoException;
import py.com.roshka.pykasu.exceptions.FormDeleteException;
import py.com.roshka.pykasu.exceptions.FormNotFoundException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.exceptions.UpdateFormException;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;
import py.com.roshka.pykasu.ui.util.ResultItem;

public interface GenericFormManager {

	public Form getForm(String id)	throws FormNotFoundException;

	public void deteleForm(String id)throws FormDeleteException;
	
	public Form getEmptyForm();
	
	public String addForm(Form form) throws AddFormException;

	public void updateForm(Form form) throws UpdateFormException;
	
	public String uploadForm(SimpleForm simpleForm) throws PykasuGenericException;
	
	@SuppressWarnings("unchecked")
	public List<ResultItem> getAll();
	
	public List<ResultItem> getForms(Calendar init, Calendar end);
	
	//this method must be in other interface more specific in manage Tax Form (TaxFormManager?) 
	public Map getFiscalInfo(Map params) throws FiscalInfoException;		

}