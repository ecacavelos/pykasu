package py.com.roshka.pykasu.ejb;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.interfaces.AdmissionManager;
import py.com.roshka.pykasu.persistence.admission.Admission;
import py.com.roshka.pykasu.util.Globals;
import py.com.roshka.util.mail.Mailer;

@Stateless
@Local ({AdmissionManager.class})
@LocalBinding (jndiBinding="pykasu/AdmissionManager/local")
@Remote ({AdmissionManager.class})
@RemoteBinding (jndiBinding="pykasu/AdmissionManager/remote")

public class AdmissionManagerEJB implements AdmissionManager{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(AdmissionManagerEJB.class);

	public static final String STATUS_REGISTRO    = "REGISTRO";
	public static final String STATUS_CONFIRMADO  = "CONFIRMADO";
	public static final String STATUS_CONFIGURADO = "CONFIGURADO";
	public static final String STATUS_ACTIVADO 	  = "ACTIVO";

	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	public Integer addAdmission(Admission admission) throws PykasuGenericException {
		try{
			Double d = new Double(Math.random() * 10000000);
			Integer i = new Integer(d.intValue());
			admission.setId(i);
			
			if(admission.getStatus()==null || admission.getStatus().isEmpty()){
				admission.setStatus(STATUS_REGISTRO);
			}
			em.persist(admission);

			Properties properties = new Properties();
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);			
			properties.load(url.openStream());;

			Mailer.sendMail(properties.getProperty("SMTP_HOST",  Globals.SMTP_HOST),
					properties.getProperty("MAIL_ACTIVATION_SENDER",Globals.MAIL_ACTIVATION_SENDER),
					admission.getMail(),
					properties.getProperty("MAIL_ADMISSION_SUBJECT",Globals.MAIL_ADMISSION_SUBJECT), 
					properties.getProperty("MAIL_ADMISSION_BODY",Globals.MAIL_ADMISSION_BODY) + i + properties.getProperty("MAIL_TAIL",""));
			
			return i;			
		}catch (Exception e) {
			logger.error("Error al guardar el formulario de admision.", e);
			throw new PykasuGenericException(e.getMessage());
		}
	}

	public void activateAdmission(Integer admissionId)
			throws PykasuGenericException {
		
		Admission ads =  em.find(Admission.class, admissionId);
		if(!(""+ads.getStatus()).equalsIgnoreCase(STATUS_REGISTRO)){
			throw new PykasuGenericException("La solicitud ya ha sido procesada");
		}
		
		ads.setStatus(STATUS_CONFIRMADO);
		
		em.persist(ads);

		Properties properties = new Properties();
		URL url;
		try {
			url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());;
			
			Mailer.sendMail(
					properties.getProperty("SMTP_HOST",  Globals.SMTP_HOST),
					properties.getProperty("MAIL_ACTIVATION_SENDER",Globals.MAIL_ACTIVATION_SENDER),
					properties.getProperty("MAIL_ACTIVATION_OPER"),
					"Solicitud de Registro de Tribustos Web confiramda", 
					"Se ha confirmado la solicitud: " + ads.getId() + " correspondiente a " + ads.getContactPerson());
			
		} catch (Exception e) {
			throw new PykasuGenericException("Error al activar la solicitud de registro",e);
		}			
		
		
	}

	public List<Admission> getAll() throws PykasuGenericException {
		List<Admission> admissions = new ArrayList<Admission>();
		
		admissions = (List<Admission>) em.createQuery("select a.* from Admission a")
							.getResultList();
				
		return admissions;
	}
	
	@SuppressWarnings("unchecked")
	public List<Admission> getAdmissionsByStatus(String status) throws PykasuGenericException {
		
		List<Admission> admissions = new ArrayList<Admission>();
		
		admissions = (List<Admission>) em.createQuery("select a from Admission a where a.status like :status")
							.setParameter("status", status)
							.getResultList();
				
		return admissions;
	}

	public Admission getAdmission(Integer admissionId)
			throws PykasuGenericException {

		Admission ads =  em.find(Admission.class, admissionId);

		return ads;
	}
	
	
	
	
}
