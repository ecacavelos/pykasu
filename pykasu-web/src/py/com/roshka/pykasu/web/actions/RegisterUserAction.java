/*
 * Created on 12/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions;


import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import py.com.roshka.pykasu.ejb.AdmissionManagerEJB;
import py.com.roshka.pykasu.exceptions.InvalidUserNameException;
import py.com.roshka.pykasu.exceptions.MailException;
import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.interfaces.AdmissionManager;
import py.com.roshka.pykasu.interfaces.SystemRegistration;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.forms.RegisterUserForm;

/**
 * 
 * @author jrey
 *
 * @struts.action
 *  path = "/register"
 *  input = "/createUserForm.jsp"
 *  name = "RegisterUserForm"
 *  parameter = "formType"
 *  validate = "true";  
 *  
 *  
 *  @struts.action-forward
 *      name = "success"
 *      path = "/index.jsp"
 *      
 *  @struts.action-forward
 *      name = "error"
 *      path = "/index.jsp"
 *
 */
public class RegisterUserAction extends DispatchAction{

    static org.apache.log4j.Logger logger = org.apache.log4j.Logger
            .getLogger(RegisterUserAction.class);
    
	public ActionForward registerUser(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

    	System.out.println("A registrar usuario");
        logger.info("Register User");
        if (!super.isCancelled(request)){
        	System.out.println("Va a leer el form");
            RegisterUserForm registerUserForm = (RegisterUserForm)form;
            
            InitialContext ic = new InitialContext();
            
            SystemRegistration systemRegistration = (SystemRegistration) ic.lookup("pykasu/SystemRegistration/local");  
            
            String clearPasswd = request.getParameter("tmpPassword");
            try{

	        	User user =
		        	systemRegistration.register(
		    			registerUserForm.getUserName(),
		    			registerUserForm.getFullName(),
		    			registerUserForm.getPhoneNumber(),
		    			registerUserForm.getRuc(),
		    			registerUserForm.getDv(),
		    			registerUserForm.getAddress(),
		    			registerUserForm.getLocality(),
		    			registerUserForm.getEmail(),
		    			//registerUserForm.getPassword(),
		    			clearPasswd,
		    			registerUserForm.getBusinessCompanyName(),//Nombre de la empresa
		    			registerUserForm.getComercialActivity(),//Ramo
		    			registerUserForm.getContactPerson(), //Persona de contacto
		    			registerUserForm.getCiContactPerson(), //CI del contacto
		    			registerUserForm.getFaxNumber(), //Fax number
		    			registerUserForm.getConstitutionDate(), //Fecha de constitucion
		    			registerUserForm.getUserType(),//Tipo de usuario (fisico, juridico)
		    			registerUserForm.getOffice()
					);
	        		        		    	
	            request.setAttribute(Globals.MESSAGE,"La cuenta " + registerUserForm.getUserName() + " ha sido modificada.<br>Se le ha enviado un correo a la direccion " + registerUserForm.getEmail() + " con las instrucciones necesarias para activar la cuenta.");
	            if(request.getParameter("admissionId")!=null){
	            	try{
	            	AdmissionManager amgr = (AdmissionManager) ic.lookup("pykasu/AdmissionManager/local");
	            	amgr.admitedAdmission(Integer.parseInt(request.getParameter("admissionId")), user.getBusinessCompany());
	            	}catch (PykasuGenericException e) {
	            		logger.error(e);
	            		request.setAttribute(Globals.ERROR,"Ocurrió un error al establecer el estado de esta Admisión a " + AdmissionManagerEJB.STATUS_CONFIGURADO+". Esto no le afectará al usuario.");
					}
	            }
	            
        	}catch (MailException e) {        		
        		logger.error(e);
        		e.printStackTrace();
        		request.setAttribute(Globals.ERROR,"No se ha podido enviar un correo a la direccion: " + registerUserForm.getEmail() + "<br>Favor verifique que la direccion sea valida.");        		
        		return mapping.findForward("error");
        	}catch (InvalidUserNameException e){
        		logger.error(e);
        		e.printStackTrace();
        		request.setAttribute(Globals.ERROR,"El nombre de usuario " + registerUserForm.getUserName() + "  no es valido.<br>Posiblemente ya existe uno en el sistema.");
        		return mapping.findForward("error");        		        	       		
        	}catch (PykasuGenericException e){
        		logger.error(e);   
        		e.printStackTrace();
        		request.setAttribute(Globals.ERROR,"Ocurrio un error de la aplicacion al registrar el usuario.");
        		return mapping.findForward("error");        		
        	}catch (Exception e){
        		logger.error(e);    
        		e.printStackTrace();
        		request.setAttribute(Globals.ERROR,"Ocurrio un error inesperado en el sistema al registrar el usuario.");
        		return mapping.findForward("error");        		
        	}

        	System.out.println("guardado en la BD");
            
        }else{
        	System.out.println("va a cancelar");
            request.setAttribute(Globals.MESSAGE,"Cancelar - No se ha creado ningun usuario");
        }
        return mapping.findForward("index");
    }
    
   public ActionForward addUser(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

    	if(request.getSession(false).getAttribute("PYKASU.LOGIN.USER")==null){
    		request.setAttribute(Globals.MESSAGE,"El Usuario no tiene sesion");
            return mapping.findForward("index");
        }
        
        if (!super.isCancelled(request)){
            RegisterUserForm registerUserForm = (RegisterUserForm)form;
            
            //request.getSession(true).setAttribute("PYKASU.LOGIN.USER",
            //userBean);
            
            User user = (User) request.getSession(false).getAttribute("PYKASU.LOGIN.USER");
            
            logger.info(user.getUserName() + "add user to "+user.getBusinessCompany().getName());
            
            InitialContext ic = new InitialContext();
            
            SystemRegistration systemRegistration = (SystemRegistration) ic.lookup("pykasu/SystemRegistration/local");
            
            try{
	            systemRegistration.addUser(
	            		registerUserForm.getUserName(),
	                    registerUserForm.getPassword(),
	                    registerUserForm.getFullName(),
	                    user.getBusinessCompany(),
	                    registerUserForm.getCiContactPerson()
	                    );
	            System.out.println("guardado en la BD");
	            request.setAttribute(Globals.MESSAGE,"La cuenta " + user.getUserName() + " ha sido creada.");

            }catch(InvalidUserNameException e) {
        		logger.error(e);
        		request.setAttribute(Globals.ERROR,"El nombre de usuario: '" + registerUserForm.getUserName() + "' ya existe en el sistema<br>Favor escoja otro.");        		
        		return mapping.findForward("error");            	
            }
        }else{
            request.setAttribute(Globals.MESSAGE,"Cancelar - No se ha creado ningun usuario." );
        }
        return mapping.findForward("index");
    }
    
}
