package py.com.roshka.pykasu.ejb;

import java.io.IOException;
import java.net.URL;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TemporalType;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.CalendarException;
import py.com.roshka.pykasu.exceptions.FiscalInfoException;
import py.com.roshka.pykasu.interfaces.CalendarManager;
import py.com.roshka.pykasu.persistence.fiscal.Holiday;
import py.com.roshka.pykasu.util.Globals;

@Stateless
@Local ({CalendarManager.class})
@LocalBinding (jndiBinding="pykasu/CalendarManager/local")
@Remote ({CalendarManager.class})
@RemoteBinding (jndiBinding="pykasu/CalendarManager/remote")
public class CalendarManagerEJB implements CalendarManager{

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(CalendarManagerEJB.class);
	
	@PersistenceContext(unitName = "tributos")
	EntityManager tributos;
	
	public Boolean isHoliday(Date date){
		
		try{
			Holiday h = (Holiday) tributos.createQuery("select h from Holiday h where h.holiday = :date")
								.setParameter("date", date, TemporalType.DATE)
								.getSingleResult();
			
			logger.info("Holiday found! to " + date + "  >>>> " + h.getDescription());
			return Boolean.TRUE;
		}catch (NoResultException e){
			logger.info("Holiday not found! to " + date);
			return Boolean.FALSE;
		}
		
	}
	
	public Date getNextAvailable(Date date) throws CalendarException{
		logger.debug("Buscando el siguiente dia habil para: " + date);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int i = 0;
		while( //busca el siguiente dia habil					
				(c.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY)   || 
				(c.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) ||
				(isHoliday(date).booleanValue()))
			{
				
				c.add(Calendar.DATE,1);

				i++;
				if(i>30){ //para que no entre en loop infinito en ningún caso
					throw new CalendarException("Problemas al buscar feriados");
				}
				
				date = c.getTime();
			}
		
		logger.debug("Siguiente dia habil para: " + date);
		return date;
	}
	
	public Date getSuggestedPaymentDate(Date date) throws CalendarException{
		logger.debug("Dia de pago sugerido para: " + date);
		try {
			Date suggestedDate = getNextAvailable(date);
			//si cambio de día por ser feriado o día no habil 
			//no hay que hacer caso de la hora
			if(suggestedDate.compareTo(date)!=0){
				logger.debug("Dia de pago sugerido para: " + date + " es " + suggestedDate.getTime());
				return suggestedDate;
			}else{ //es el mismo día, entonces hay que ver la hora
				Calendar actualServerDate = Calendar.getInstance();
				actualServerDate.setTime(new Date(System.currentTimeMillis()));
			
				ClassLoader cl = getClass().getClassLoader();
				Properties prop = new Properties();

//				prop.load(cl.getResourceAsStream(Globals.PYKASU_PROPERTIES));
				URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
				prop.load(url.openStream());;
				
				Calendar closeDate = Calendar.getInstance();
				String closeHour = prop.getProperty(Globals.CLOSE_HOUR);
				String[] ch = closeHour.split(":");
				if(ch.length != 2){
					throw new CalendarException("Formato de la hora de cierre mal establecido. Valor actual: " + closeHour + ". Recuerde que el formato de la hora de cierre debe ser HH:MM donde HH esta en el rango 01 ~ 24 y MM esta en el rango 00 ~ 59. Los dos puntos son requeridos.");
				}
				closeDate.set(Calendar.HOUR_OF_DAY,Integer.parseInt(ch[0]));
				closeDate.set(Calendar.MINUTE,Integer.parseInt(ch[1]));

				if(actualServerDate.after(closeDate)){
					actualServerDate.add(Calendar.DATE,1);												
					return getNextAvailable(actualServerDate.getTime());
				}else{
					logger.debug("Dia de pago sugerido para: " + date + " es " + actualServerDate.getTime());
					return actualServerDate.getTime();
				}
				
			}
			
		} catch (CalendarException e) {
			e.printStackTrace();
			throw new CalendarException("Problemas al buscar fecha sugerida de pago");
		}catch (IOException e) {
			e.printStackTrace();
			throw new CalendarException("Problemas al buscar fecha sugerida de pago");			
		}
	}
	
}
