package py.com.roshka.pykasu.web.actions.forms;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.FiscalRulesManager;
import py.com.roshka.pykasu.persistence.fiscal.Salary;

/**
 * 
 * @author pwelti
 * @struts.action path = "/getSalary" scope = "request"
 * @struts.action-forward name = "success" path = "/xml/salary.jsp"
 * 
 */
public class GetSalary extends Action {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(GetSalary.class);
		
	private static final String FISCAL_PERIOD_MONTH = "fpMonth" ;
	private static final String FISCAL_PERIOD_YEAR = "fpYear";

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    InitialContext ic = new InitialContext();
	    FiscalRulesManager fiscalRulesManager = (FiscalRulesManager) ic
	            .lookup("pykasu/FiscalRulesManager/local");

        String fpMonth =  request.getParameter(FISCAL_PERIOD_MONTH);
        String fpYear =  request.getParameter(FISCAL_PERIOD_YEAR);
        
        logger.info("Recipt Params to compute Salary: month:" + fpMonth + " year: " + fpYear);
        
        fpYear = fpYear.replace(".","") ;
        
        if(fpMonth.length() < 2){
        	fpMonth = "0" + fpMonth;
        }

        if(fpYear.length() < 4){
        	fpYear = "20" + fpMonth;
        }
        
        logger.info("Retrieve data to compute Salary: month:" + fpMonth + " year: " + fpYear);
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = sdf.parse("01/"+fpMonth+"/"+fpYear);
        logger.info("Date is " + date);
        Salary s = fiscalRulesManager.getSalary(date);

        request.setAttribute("SALARY",s);
        
	    return mapping.findForward("success");
	}

	
}
