/*
 * Created on Nov 14, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.forms;

import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.web.util.ExpiringDate;

/**
 * 
 * @author pwelti
 * 
 * @struts.form name = "expiringDateCalendar"
 */
public class ExpiringDateCalendar extends ActionForm {
    static org.apache.log4j.Logger logger = org.apache.log4j.Logger
            .getLogger(ExpiringDateCalendar.class);

    private Integer month;
    private Integer year;

    private HashMap expiringDates;

    public void reset(ActionMapping mapping, HttpServletRequest request) {

    	
        if (expiringDates == null && request.getAttribute("expiringDates") == null) {
        	this.expiringDates = new HashMap();
        	logger.info("Nuevo hashmap para expiring dates");
        }else if(request.getAttribute("expiringDates") != null){
        	this.expiringDates = (HashMap) request.getAttribute("expiringDates");
        	logger.info("Obteniendo el HashMap del request");
        }
        
        setMonth((Integer) request.getAttribute("month"));
        setYear((Integer) request.getAttribute("year"));
        logger.info("Cantidad de detalles : " + this.expiringDates.values());
        request.setAttribute("expiringDates", this.expiringDates.values());
    }

    public ActionErrors validate(ActionMapping arg0, HttpServletRequest arg1) {
        return super.validate(arg0, arg1);
    }

	public HashMap getExpiringDates() {
		return expiringDates;
	}

	public void setExpiringDates(HashMap expiringDates) {
		this.expiringDates = expiringDates;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}    
	
	
	@SuppressWarnings("unchecked")
	private ExpiringDate getExpiringDate(String key){
		if(expiringDates.get(key) == null){
		   expiringDates.put(key, new ExpiringDate());
		}
		return (ExpiringDate) expiringDates.get(key);
	}
	
	
    //details setter's	
	public void setFormType(String key, Integer value){
	 	ExpiringDate ed = getExpiringDate(key);
	 	logger.info("setFormType");
	 	ed.setFormType(value);
	}

	public void setDate(String key, String value){
	 	ExpiringDate ed = getExpiringDate(key);
	 	ed.setDate(value);
	}

	public void setCharFrom(String key, String value){
	 	ExpiringDate ed = getExpiringDate(key);
	 	ed.setCharFrom(value.toUpperCase().trim());
	}

	public void setCharTo(String key, String value){
	 	ExpiringDate ed = getExpiringDate(key);
	 	ed.setCharTo(value.toUpperCase().trim());
	}
	
	public void setId(String key, Integer value){
	 	ExpiringDate ed = getExpiringDate(key);
	 	ed.setId(value);		
	}
	

	//details getter's
	public Integer getId(String key){
	 	ExpiringDate ed = getExpiringDate(key);
	 	return ed.getId();
	}

	public Integer getFormType(String key){
	 	ExpiringDate ed = getExpiringDate(key);
	 	return ed.getFormType();
	}

	public String getDate(String key){
	 	ExpiringDate ed = getExpiringDate(key);
	 	return ed.getDate();
	}

	public String getCharFrom(String key){
	 	ExpiringDate ed = getExpiringDate(key);
	 	return ed.getCharFrom();
	}

	public String getCharTo(String key){
	 	ExpiringDate ed = getExpiringDate(key);
	 	return ed.getCharTo();
	}
	
}
