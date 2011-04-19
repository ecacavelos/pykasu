/*
 * Created on Jul 20, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions.forms;

import java.util.HashMap;
import java.util.Map;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.exceptions.ExcludedContributorException;
import py.com.roshka.pykasu.interfaces.FormManager;

/**
 * 
 * @author jrey
 * @struts.action path = "/getInformationsByRuc" scope = "request"
 * @struts.action-forward name = "success" path = "/xml/contributorinfo.jsp"
 * 
 */
public class GetInformationByRucAction extends Action {

    public static final String RUC = "ruc";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

    	boolean excludedRuc = false;
    	
        InitialContext ic = new InitialContext();
        FormManager formManager = null;
        formManager = (FormManager) ic.lookup("pykasu/FormManager/local");

        Map<String, String> more = new HashMap<String, String>();//aqui van los mensajes
        
        Map<String, String> infos = new HashMap<String, String>();
        try{
	        infos =
	        	 formManager.getContributorInfo(
	        			request.getParameter("ruc"),
	        			request.getParameter("formType")
	        			);
        }catch (ExcludedContributorException e) {
			more.put("DECLARATION_RUC_EXLUDED", "true");
			excludedRuc = true;
		}
        


        if (infos.size() == 0 && !excludedRuc) {
            more.put("RUCINFO_NOT_FOUND", "true");
        } 


        request.setAttribute(py.com.roshka.pykasu.web.Globals.CONTRIBUTOR_INFO,
                infos);
        request.setAttribute(py.com.roshka.pykasu.web.Globals.MORE_MESSAGES,
                more);

        return mapping.findForward("success");
    }

}
