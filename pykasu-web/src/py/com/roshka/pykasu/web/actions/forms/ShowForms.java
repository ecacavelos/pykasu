/*
 * Created on Jul 6, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions.forms;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.web.Globals;

/**
 * 
 * @author jrey
 * 
 * @struts.action path = "/findForms"
 * @struts.action-forward name = "success" path = "/forms/forms.jsp"
 */
public class ShowForms extends Action {
    static org.apache.log4j.Logger logger = org.apache.log4j.Logger
            .getLogger(ShowForms.class);

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        FormManager formManager = null;
        InitialContext ic = new InitialContext();
        logger.info("find forms");
        formManager = (FormManager) ic.lookup("pykasu/FormManager/local");
        
        if (request.getParameter("FORM") != null) {
            String formName = request.getParameter("FORM");
            GenericFormManager genericForm = formManager
                    .getFormManager(formName);
            
    		Calendar init = Calendar.getInstance();
    		Calendar end = Calendar.getInstance();
    		init.setTime(new Date(System.currentTimeMillis()));
    		end.setTime(new Date(System.currentTimeMillis()));

    		if(request.getParameter("form_action")!=null)    			
    			init.roll(Calendar.YEAR, false);

    		
    		init.set(Calendar.HOUR, 0);
    		init.set(Calendar.MINUTE, 0);

    		end.set(Calendar.HOUR, 23);
    		end.set(Calendar.MINUTE, 59);
    		
    		
    		
    		if(request.getParameter("init_date")!=null && request.getParameter("init_date").length()>0 &&
    		   request.getParameter("init_month")!=null && request.getParameter("init_month").length()>0 &&
    		   request.getParameter("init_year")!=null && request.getParameter("init_year").length()>0){
    			try{
	    			init.set(Calendar.DATE, Integer.parseInt(request.getParameter("init_date")));
	    			init.set(Calendar.MONTH, Integer.parseInt(request.getParameter("init_month"))-1);
	    			init.set(Calendar.YEAR, Integer.parseInt(request.getParameter("init_year")));
	    			
	    			request.setAttribute("init_date", request.getParameter("init_date"));
	    			request.setAttribute("init_month", request.getParameter("init_month"));
	    			request.setAttribute("init_year", request.getParameter("init_year"));
    			}catch (Exception e) {
					logger.warn(e);
					request.getSession().setAttribute(Globals.ERROR_MESSAGE,"No se pudo interpretar la fecha de inicio");
				}
    		}
    		if(request.getParameter("end_date")!=null &&  request.getParameter("end_date").length()>0 && 
    		   request.getParameter("end_month")!=null && request.getParameter("end_month").length()>0 && 
    		   request.getParameter("end_year")!=null && request.getParameter("end_year").length()>0) {
    			try{
	    			end.set(Calendar.DATE, Integer.parseInt(request.getParameter("end_date")));
	    			end.set(Calendar.MONTH, Integer.parseInt(request.getParameter("end_month"))-1);
	    			end.set(Calendar.YEAR, Integer.parseInt(request.getParameter("end_year")));
    			}catch (Exception e) {
					logger.warn(e);
					request.getSession().setAttribute(Globals.ERROR_MESSAGE,"No se pudo interpretar la fecha de fin");
				}
    			
    		}            
            List forms = genericForm.getForms(init, end);
            
            String title = "Búsqueda de formularios " + formName;
            
            request.setAttribute(Globals.FORM_NAME,formName);
            request.setAttribute(Globals.FORMS_RESULTSET, forms);
            request.setAttribute(Globals.GLOBAL_TITLE, title);

            
//            if (forms!=null){
                return mapping.findForward("success");
//            }
                
        }
        return mapping.findForward("index");
    }

}
