package py.com.roshka.pykasu.web.forms;

import org.apache.struts.action.ActionForm;

/**
 * 
 * @author pwelti
 * 
 * @struts.form name = "fiscalPeriodSearch"
 */

public class FiscalPeriodSearch extends ActionForm{

	private Integer month;
    private Integer year;
	
    
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
    
    
}
