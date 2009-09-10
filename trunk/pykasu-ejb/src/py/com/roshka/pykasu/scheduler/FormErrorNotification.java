package py.com.roshka.pykasu.scheduler;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import py.com.roshka.pykasu.util.Globals;
import py.com.roshka.util.mail.Mailer;

public class FormErrorNotification implements Job {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(FormErrorNotification.class);
	
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		//1. consigo los formularios a notificar de la DB
		//2. marco en la DB que estoy enviando
		//3. envio los correos de notificacion y marco como enviado.
			
		logger.info("INICIO - Envio de Notificacion de Mensajes de Error");		


		Properties properties = new Properties();
		Connection conn = null;
		URL url;
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup("java:/PykasuDS");
			conn =  ds.getConnection();
			
			//1. consigo los formularios a notificar de la DB
			String sql = "select * from v_notifications_forms";
			//javax.persistence.Query q = em.createNativeQuery(sql);
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			List<Notification> notifications = new ArrayList<Notification>();
			String nids = "";
			while(rs != null && rs.next()){
				Notification notification = 
					new Notification(							//select wf.ffw_iid, wf.form_type, wf.form_iid, f.ruc, f.dv, f.fiscalperiodmounth, f.fiscalperiodyear, f.firstlastname, f.totalamount, f.presentationdate ,wf.status, b.email, wf.at, f.msg_info
							rs.getInt("ffw_iid"),				//int formwfId, 
							rs.getInt("form_type"),				//String formType, 
							rs.getInt("form_iid"), 				//int formId, 
							rs.getString("ruc"), 				//String ruc,
							rs.getString("dv"), 				//String dv, 
							rs.getInt("fiscalperiodmounth"),	//int month, 
							rs.getInt("fiscalperiodyear"),		//int year, 
							rs.getString("firstlastname"),		//String contributor, 
							rs.getDouble("totalamount"),		//Double amount,
							rs.getString("status"),				//String status, 
							rs.getString("email"),				//String mail, 
							rs.getTimestamp("at"), 				//Date arrivalTime, 
							rs.getString("msg_info")			//String message);
							);

				notifications.add(notification);
				nids = nids +  rs.getInt("ffw_iid") + ", ";
			}
			nids = nids +  "-1";
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				ps.close();
			}
			
			//2. marco en la DB que estoy enviando
			sql = "update forms_wf set action = 'SENDING', begin_proc = current_timestamp where FFW_IID in ("+nids+")";
			logger.info("Cambiando estado " + sql);
			ps = conn.prepareStatement(sql);
			int upds =ps.executeUpdate();
			//int upds = em.createNativeQuery(sql).executeUpdate();
			if(upds != notifications.size()){
				logger.warn("Se han actualizado " + upds + " registros de " + notifications.size()+". Esto puede ocacionar que se envien más de un correo a una persona");
			}
			ps.close();
			
			//3. envio los correos de notificacion y marco como enviado.
			sql = "update FORMS_WF set status='FINISH' where FFW_IID = ?";
			ps = conn.prepareStatement(sql);
			url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());
			
			for(Notification ntf : notifications){
				if(ntf.getMail() != null && (""+ntf.getMail()).trim().length() > 0){
					
					String msg = "El formulario del tipo "+ ntf.getFormType() +" identificado como : "  + ntf.getFormId() 
							   + "\ncorrespondiente a: " + ntf.getContributor()  
							   + "\nRUC: " + ntf.getRuc() 
							   + "\nDV: " + ntf.getDv()  
							   + "\nMes fiscal: " + ntf.getMonth() 
							   + "\nAño fiscal: " + ntf.getYear()
							   + "\nMonto: " + ntf.getAmount() 
							   + "\nRegistro el siguiente mensaje: " + ntf.getMessage()  
							   + "\nsiendo las: " + ntf.getArrivalTime() 
							   + "\n" + properties.getProperty("MAIL_TAIL") ;	
					try{
						Mailer.sendMail(
								properties.getProperty("SMTP_HOST",  Globals.SMTP_HOST),
								properties.getProperty("MAIL_ACTIVATION_SENDER",Globals.MAIL_ACTIVATION_SENDER),
								""+ntf.getMail(),
								"Error al procesar un formulario",
								msg);
						
						ps.setInt(1, ntf.getFormwfId());
						ps.executeUpdate();
					}catch (SQLException e) {
						logger.error("Error al cambiar el estado del FORMS_WF a FINISH : " + ntf.getFormwfId(),e);
					}catch (Exception e) {
						logger.error("Error al enviar el mensage " + msg + " al correo " + ntf.getMail(),e);
					}
				}else{
					logger.warn("La direccion de correo de la empresa perteneciente del formulario " +ntf.getFormwfId() + " no esta correctamente establecido");
				}
				
			}
			
		} catch (Exception e) {
			logger.error(e);
			logger.info("TERMINANDO CON ERRORES- Envio de Notificacion de Mensajes de Error " + e.getMessage());
		}finally{
			try {
				if(conn != null && !conn.isClosed()){
					conn.close();
				}
			} catch (SQLException e) {
				logger.error("Error al cerrar la conexion: bancaweb",e);				
			}
		}			
		
		logger.info("TERMINANDO - Envio de Notificacion de Mensajes de Error");
	}

}
