/*
 * Created on Jul 6, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions.forms;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.config.FormBeanConfig;

import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.web.Globals;

/**
 * 
 * @author jrey
 * 
 * @struts.action path = "/editItem" parameter = "option"
 * 
 * @struts.action-forward name = "edit" path = "/showForm.do"
 * 
 * 
 */

public class EditResultItem extends DispatchAction {

    public ActionForward Detalles(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {


        InitialContext ic = new InitialContext();
        FormManager formManager = null;

        formManager = (FormManager) ic.lookup("pykasu/FormManager/local");
        String sform = request.getParameter("form");
        System.out.println(sform);
        GenericFormManager genericForm = formManager.getFormManager(sform);
        
        String id  = request.getParameter("id");
        System.out.println(id);

        Form formBean = genericForm.getForm(id);

        if (formBean == null){
            request.setAttribute(Globals.MESSAGE,"No se encontro el documento");
            return mapping.findForward("index");
        }
        
        request.setAttribute(Globals.FORM_BEAN, formBean);
        request.setAttribute(Globals.FORM_NAME, request.getParameter("form"));
        request.setAttribute(Globals.FORM_BEAN_READONLY, Boolean.TRUE);
        request.setAttribute(Globals.FORM_STATUS, "view_mode");
        
        return mapping.findForward("edit");

    }

    public ActionForward Borrar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        InitialContext ic = new InitialContext();
        FormManager formManager = null;

        formManager = (FormManager) ic.lookup("pykasu/FormManager/local");
        GenericFormManager genericForm = formManager.getFormManager(request
                .getParameter("form"));
        Form formBean = genericForm.getForm(request.getParameter("id"));
        
        if (formBean == null){
            request.setAttribute(Globals.MESSAGE,"No se encontro el documento");
            return mapping.findForward("index");
        }

        if(formBean.getCell("STATUS")!=null && !formBean.getCell("STATUS").getData().toString().equalsIgnoreCase(TaxForm.FORM_STATUS_PROCESS)){
        	throw new PykasuGenericException("Solo se pueden borrar Formularios que se encuentren en " + TaxForm.FORM_STATUS_PROCESS);
        }

        genericForm.deteleForm(request.getParameter("id"));
        request.setAttribute(Globals.MESSAGE, "Se ha borrado el Formulario");

        return mapping.findForward("index");
    }

    public ActionForward Editar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        InitialContext ic = new InitialContext();
        FormManager formManager = null;

        formManager = (FormManager) ic.lookup("pykasu/FormManager/local");
        GenericFormManager genericForm = formManager.getFormManager(request
                .getParameter("form"));
        
        Form formBean = genericForm.getForm(request.getParameter("id"));
        
        
        if (formBean == null){
            request.setAttribute(Globals.MESSAGE,"No se encontro el documento");
            
            return mapping.findForward("index");
        }
        
        if(formBean.getCell("STATUS")!=null && !formBean.getCell("STATUS").getData().toString().equalsIgnoreCase(TaxForm.FORM_STATUS_PROCESS)){
        	throw new PykasuGenericException("Solo se pueden editar Formularios que se encuentren en " + TaxForm.FORM_STATUS_PROCESS);
        }

        request.setAttribute(Globals.FORM_BEAN, formBean);
        request.setAttribute(Globals.FORM_NAME, request.getParameter("form"));
        request.setAttribute(Globals.FORM_STATUS, "edit_mode");        

        return mapping.findForward("edit");

    }

}
