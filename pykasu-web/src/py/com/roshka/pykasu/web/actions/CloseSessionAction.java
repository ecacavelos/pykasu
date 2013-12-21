/*
 * Created on 14/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;

/**
 * 
 * @author jrey
 * 
 * @struts.action path = "/closepykasusession"
 */
public class CloseSessionAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        try {
            if (request.getSession(false) != null) {
                User user = (User) request.getSession(false).getAttribute(
                        Globals.LOGIN_USER);
                request.getSession(false).invalidate();
                request.setAttribute(Globals.MESSAGE, user.getFullName()
                        + ": Se ha Cerrado tu sesión.");

            } else {
                request.setAttribute(Globals.MESSAGE,
                        "Error: No hay Session por Cerrar");
            }
        } catch (Throwable e) {
            request.setAttribute(Globals.MESSAGE,
            "Error: No hay Session por Cerrar");
        }
        return mapping.findForward("index");
    }

}
