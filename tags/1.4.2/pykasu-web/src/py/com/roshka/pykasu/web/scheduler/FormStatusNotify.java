package py.com.roshka.pykasu.web.scheduler;

import java.io.IOException;
import java.net.URL;
import java.util.Properties;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.quartz.CronExpression;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;

import py.com.roshka.pykasu.scheduler.FormErrorNotification;


public class FormStatusNotify extends GenericServlet {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(FormStatusNotify.class);
	
    public FormStatusNotify() {    	
        super();
    }
	
	public void init(ServletConfig config) throws ServletException {

		super.init(config);  

		//obteniendo un CRON_EXPRESION
		String cronExpression = py.com.roshka.pykasu.util.Globals.CRON_MAIL_NOTIFICATIONS; // 
		Properties prop = new Properties();
		URL url;
		try {
			url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			prop.load(url.openStream());
			cronExpression = prop.getProperty("CRON_MAIL_NOTIFICATIONS", py.com.roshka.pykasu.util.Globals.CRON_MAIL_NOTIFICATIONS);
			logger.info("Utilizando la siguente expresion para la notifiacion de errores de validacion de formuarios: " + cronExpression);
		} catch (IOException e) {
			logger.error("Utilizando el valor del ENVIO DE OT por OMISION : " + cronExpression,e);
		}			
		
		// The Quartz Scheduler  
		Scheduler scheduler = null;  
		  
		try {  
			
			// =================== NOTIFICACION DE ERROR EN LA VALIDACION DE FORMULARIOS ======================	
			// Initiate a Schedule Factory  
			SchedulerFactory schedulerFactory = new StdSchedulerFactory();  
			// Retrieve a scheduler from schedule factory  
			scheduler = schedulerFactory.getScheduler();  
			// Initiate JobDetail with job name, job group and  
			// executable job class  
			JobDetail jobDetail = new JobDetail("FormErrorNotifications","FormErrorNotificationsGroup", FormErrorNotification.class);  
			// Initiate CronTrigger with its name and group name  
			CronTrigger cronTrigger = new CronTrigger("cronTrigger", "triggerGroup");  
			// setup CronExpression  
			CronExpression cexp = new CronExpression(cronExpression);  
			// Assign the CronExpression to CronTrigger  
			cronTrigger.setCronExpression(cexp);  
			// schedule a job with JobDetail and Trigger  
			scheduler.scheduleJob(jobDetail, cronTrigger);  
			  
			// start the scheduler  
			scheduler.start();  
	
		} catch (Exception e) {  
			e.printStackTrace();  
		}  
	}
	
	
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1)
			throws ServletException, IOException {
		
	}

}
