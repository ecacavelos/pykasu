package py.com.roshka.pykasu.persistence.forms;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.Calendar;
import java.util.Iterator;

import py.com.roshka.pykasu.exceptions.FillFormException;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.ui.form.Cell;
import py.com.roshka.pykasu.ui.form.Form;

public class GenericForm {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(GenericForm.class);
	
	public void fillForm(Form form)	throws FillFormException{
	
		//GenericForm <- Form
		
		Object[] args = new Object[1];
//		Cell cell = null;
//		
//		Iterator it = form.getCells().iterator();
//		while(it.hasNext()){
			
		for(Cell cell : form.getCells()){
			try {
//				cell = (Cell)it.next();
				if(!cell.isOpaque()){ 
					PropertyDescriptor pd = new PropertyDescriptor(cell.getId(),this.getClass());
					args[0] = cell.getData();
					
					
					if (args[0] instanceof Double && pd.getPropertyType().equals(Integer.class)) {
						logger.info("-----> {"+ cell.getId() + "} Going to convert double into integer :  " + args[0]);
						Double d = (Double)args[0];
						int i = d.intValue();
						args[0] = new Integer(i);
					}
	
					if (args[0] instanceof Double && pd.getPropertyType().equals(String.class)) {
						logger.info("-----> {"+ cell.getId() + "} Going to convert double into string :  " + args[0]);
						Double d = (Double)args[0];
						int i = d.intValue();
						args[0] = new String(new Integer(i).toString());
					}
	
					if (args[0] instanceof java.util.Date && pd.getPropertyType().equals(java.util.Calendar.class)) {
						logger.info("-----> {"+ cell.getId() + "} Going to convert java.util.Date into java.util.Calendar :  " + args[0]);
						Calendar c = Calendar.getInstance();
						c.setTime((java.util.Date)args[0]);
						args[0] = c;
					}
					
					
					
					pd.getWriteMethod().invoke(this,args);
				}
				
			} catch (IllegalArgumentException e) {
				logger.debug("Error to fill the cell "+ cell.getId() + "  " + e.getMessage());
			} catch (IntrospectionException e) {
				logger.debug("Error to fill the cell "+ cell.getId(), e);
			} catch (IllegalAccessException e) {
				logger.debug("Error to fill the cell "+ cell.getId(), e);
			} catch (InvocationTargetException e) {
				logger.debug("Error to fill the cell "+ cell.getId(), e);
			}    		
		}
	}

	public Form loadForm(GenericFormManager gfm){
		//Form <-- GenericForm
		logger.info("load form ");
		Form form = gfm.getEmptyForm();    	
		Cell cell = null;
		Iterator it = form.getCells().iterator();
		while(it.hasNext()){
			try {
				cell = (Cell)it.next();
				if(!cell.isOpaque()){ 
					PropertyDescriptor pd = new PropertyDescriptor(cell.getId(),this.getClass());
					logger.info(pd.getReadMethod().getName() + " value: " + pd.getReadMethod().invoke(this));
					cell.setData(pd.getReadMethod().invoke(this));
				}
	
			} catch (IllegalArgumentException e) {
				logger.error(e.getClass().getName() + " = " +  e);
			} catch (IntrospectionException e) {
				logger.error(e.getClass().getName() + " = " +  e);
			} catch (IllegalAccessException e) {
				logger.error(e.getClass().getName() + " = " +  e);
			} catch (InvocationTargetException e) {
				logger.error(e.getClass().getName() + " = " +  e);
			}    		
		}
		cell = form.getCell("status");
		if(cell.getData().equals(TaxForm.FORM_STATUS_SENDED) 
		 ||cell.getData().equals(TaxForm.FORM_STATUS_PAYED)
		 ||cell.getData().equals(TaxForm.FORM_STATUS_REJECTED)
		){
			cell.setReadOnly(true);
		}else{
			cell.setReadOnly(false);
		}
		return form;
	}
	
	
}
