/*
 * Created on Jul 20, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions.forms;

import java.util.HashMap;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.exceptions.FormNotFoundException;
import py.com.roshka.pykasu.interfaces.Form850ManagerInterface;
import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.persistence.forms.Form850;
import py.com.roshka.pykasu.ui.form.Form;

/**
 * 
 * @author jrey
 * @struts.action path = "/getPreprinterNumberStatus" scope = "request"
 * @struts.action-forward name = "success" path =
 *                        "/xml/preprinternumberstatus.jsp"
 * 
 */
public class GetPreprinterNumberStatusAction extends Action {

    static org.apache.log4j.Logger logger = org.apache.log4j.Logger
            .getLogger(GetPreprinterNumberStatusAction.class);

    public static final String RUC = "ruc";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String prePrintedNumber = request.getParameter("preprinterNumber");
        String formName = request.getParameter("form");

        try {
            System.out.println("vamoss");
            

            InitialContext ic = new InitialContext();

            FormManager formManager = (FormManager) ic
                    .lookup("pykasu/FormManager/local");
            GenericFormManager genericForm = formManager.getFormManager(formName);

            request.setAttribute("PREPRINTERNUMBER", prePrintedNumber);
            // Form850 f850 = (Form850)
            // fm.findForm850ByPrePrintedNumber(request.getParameter("preprinterNumber"));
            Form form = genericForm.getForm(prePrintedNumber);

            logger.info("----> There are exist a reference for "
                    + prePrintedNumber);
            request.setAttribute("PREPRINTERNUMBER_STATUS", "EXIST");
        } catch (FormNotFoundException e) {
            logger.info("----> There are NOT exist a reference for "
                    + request.getParameter("preprinterNumber")
                    + ". Exception: " + e);
            request.setAttribute("PREPRINTERNUMBER_STATUS", "NO EXIST");
        }
        catch (Throwable e){
            request.setAttribute("PREPRINTERNUMBER", prePrintedNumber );
            request.setAttribute("PREPRINTERNUMBER_STATUS", "ERROR");
        }
        return mapping.findForward("success");
    }

}
