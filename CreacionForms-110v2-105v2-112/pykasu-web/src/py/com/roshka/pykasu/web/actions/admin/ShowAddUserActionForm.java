/*
 * Created on Jul 6, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.web.Globals;
/**
 * 
 * @author jrey
 *
 * @struts.action   
 *  path = "/addUser"
 * @struts.action-forward
 *  name = "success"
 *  path = "/userform.jsp"
 *  
 */
public class ShowAddUserActionForm extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        if(request.getSession(false).getAttribute("PYKASU.LOGIN.USER")==null){
            request.setAttribute(Globals.ERROR,"El Usuario no tiene sesion");
            return mapping.findForward("index");
        }
        request.setAttribute(Globals.USER_FORM_FORM_TYPE,Globals.USER_FORM_ADD_USER);
        return mapping.findForward("success");
    }

}
