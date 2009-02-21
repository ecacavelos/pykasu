/*
 * Created on Jul 6, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions.admin;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.web.Globals;
/**
 * 
 * @author jrey
 *
 * @struts.action   
 *    path = "/editUserItem"
 *    parameter = "option"
 *    
 * @struts.action-forward
 *      name = "edit"
 *      path = "/showForm.do"
 *      
 *          
 */

public class EditResultUserItem extends DispatchAction{

    
    public ActionForward Detalles (ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        request.setAttribute(Globals.ERROR,"Borrar - No tiene permitido ver detalles del usuario");
        return  mapping.findForward("index");
    }
    public ActionForward Borrar (ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        request.setAttribute(Globals.ERROR,"Borrar - No tiene permitido Borrar Usuarios");
        return mapping.findForward("index");
    }
    public ActionForward Editar (ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        request.setAttribute(Globals.ERROR,"Borrar - No tiene permitido editar el usuario");
        return  mapping.findForward("edit");
    }
    
}
