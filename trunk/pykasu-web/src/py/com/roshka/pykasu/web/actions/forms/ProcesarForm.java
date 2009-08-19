package py.com.roshka.pykasu.web.actions.forms;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.interfaces.RaffleTicketManager;
import py.com.roshka.pykasu.persistence.forms.TaxForm;
import py.com.roshka.pykasu.persistence.raffle.RaffleTicket;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Cell;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.util.Utils;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.forms.GenericForm;

/**
 * @struts.action
 *  input = "/forms/genericform.jsp"
 *  path = "/enviarGenericForm"
 *  name = "GenericForm"
 */

public class ProcesarForm extends Action{
    static org.apache.log4j.Logger logger = org.apache.log4j.Logger
            .getLogger(ProcesarForm.class);
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, 
    							 HttpServletRequest request, 
    							 HttpServletResponse response) 
    	throws Exception {
    	
    	User user = (User) request.getSession(false).getAttribute("PYKASU.LOGIN.USER");
        if(user==null){
            request.setAttribute(Globals.ERROR,"El Usuario no tiene sesion");
            return mapping.findForward("index");
        }
        
        GenericForm gf = (GenericForm) form;
        
        if (gf.getFormName() == null) {
            logger.error("GENERICFORM - FORM NAME IS NULL");
            return null;
        }
        
        if (!super.isCancelled(request)) {
            try {

                InitialContext ic = new InitialContext();
                FormManager formManager = null;
                formManager = (FormManager) ic.lookup("pykasu/FormManager/local");

                Form formBean = null;
                GenericFormManager genericForm = formManager.getFormManager(gf.getFormName());
                formBean = genericForm.getEmptyForm();
                
                RaffleTicketManager raffleTicketManager = null;
                raffleTicketManager = (RaffleTicketManager) ic.lookup("pykasu/RaffleTicketManager/local");
                
                
                logger.debug("Setting cells to Form ");
                
        		String presentationDate = gf.getField("paymentDate");
        		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        		System.out.println("Genericform.VALIDATE");
        		
        		String msg = "";
        		
        		logger.info("Presentation Date Validation.");
        		try {
        			Date presentation = sdf.parse(presentationDate);
        			Date actual = new Date(System.currentTimeMillis());
        			Integer diff = Utils.DateDiff(actual, presentation);
        			if(diff.intValue() < 0 ){
                        request.setAttribute(Globals.ERROR, "Error en la fecha del formulario: ");
                        logger.error("Error en la fecha del formulario! ");
                        return mapping.findForward("error");
        			}
        			
        			
        		} catch (ParseException e) {			
        			e.printStackTrace();
                    request.setAttribute(Globals.ERROR, "Error en la fecha del formulario: "+e.getMessage());
                    logger.error("Error en la fecha del formulario! ", e );
                    return mapping.findForward("index");
        		} 

                
                Iterator it = gf.getFields().keySet().iterator();
                
                while (it.hasNext()) {
                    String key = (String) it.next();
                    String value = (String) gf.getFields().get(key);
                    Cell cell = formBean.getCell(key);
                    if (cell != null) {
                        cell.setData(value);
                    } else {
                        //logger.info("cell not found:" + key);
                    }
                }
                //TODO: Hacer una ventana de mensajes para mostrar mensajes, y que no aparezca tan feo como ahora el mensaje
                logger.debug("La clase del FORMBEAN -> [Canonical: " + formBean.getClass().getCanonicalName() + "]/[Class: " + formBean.getClass().getName() + "]");
//                Cell c = formBean.getCell("paymentDate");
//                c.getData();
                
					
                if (gf.getNewInstance().equals("true")){                    
                    String id = genericForm.addForm(formBean);
                    msg = "El formulario ha sido guardado exitosamente." +
                    	  "El numero para identificar el formulario guardado es: " + id + "." +
                    	  "Favor recuerde este numero para futuras referencias.";                    
                    
                    
                }else{
                    genericForm.updateForm(formBean);
                    msg = "El formulario ha sido actualizado exitosamente.";
 
                }
                if(Utils.isRaffleTime(new Date(System.currentTimeMillis()))){
	                Cell cell = formBean.getCell("status");                
					if(cell.getData().equals(TaxForm.FORM_STATUS_SENDED)){
	                    //aca se pueden generar los cupones
	                    //si es cliente se generan los cupones y se le informa en el mensaje
	                    if(user.getBusinessCompany().getClient().booleanValue()){ //es cliente de VISION, se debe generar el ticket correspondiente
	                    	RaffleTicket ticket = raffleTicketManager.generateTicket(user);	                    	
	                    	msg = msg + "" +user.getBusinessCompany().getName() + 
	                    				" tiene 1 cupón número: "+ ticket.getId() + " a su nombre" +
	                    				" para el sorteo electrónico de 5 notebook" +
	                    				" con internet movil gratis por 1 año.";
	                    }
					}
				}
				logger.info(msg);
				request.setAttribute(Globals.MESSAGE, msg); 
            }
            catch (PykasuGenericException e){
                request.setAttribute(Globals.ERROR, "Error al editar el formulario: "+e.getMessage());
                logger.error("Error al editar el formulario! ", e );
            }
            catch (Throwable e) {
                request.setAttribute(Globals.ERROR, "Error al editar el formulario: Informar error a Administración del Sistema");
                logger.error("Error al editar el formulario! ", e );
            }
        }
        else{
            request.setAttribute(Globals.MESSAGE, "Se canceló la edicion del formulario");
        }
        return mapping.findForward("index");
        
    }
    
    
    
}
