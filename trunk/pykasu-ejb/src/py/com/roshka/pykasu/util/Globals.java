package py.com.roshka.pykasu.util;

public class Globals {

	//public static final String PYKASU_PROPERTIES = "related-files/pykasu-config.properties";
	public static final String PYKASU_PROPERTIES =  System.getProperty("jboss.server.config.url") + "/pykasu-config.properties";
	
	public static final String SMTP_HOST = "172.30.1.3";
	public static final String MAIL_ACTIVATION_SENDER = "tributos@vision.com.py";

	public static final String MAIL_ACTIVATION_SUBJECT = "Registro de Cuenta Activado";
	public static final String MAIL_ACTIVATION_BODY = "Gracias por utlizar el Sistema de Tributos Web.\n\nAhora su cuenta esta activada.\nPara ingresar por favor haga clic en el siguiente enlace:\nhttp://localhost:8080/pycasu/\ne ingrese con los siguietes datos:\n";

	public static final String MAIL_ADMISSION_SUBJECT="Registro de Cuenta en Proceso";
	public static final String MAIL_ADMISSION_BODY="Gracias por Registrar una solicitud para utilizar el Sistema de Tributos Web.\n\nPara validar su Registro, debe ingresar al siguiente enlace:\nhttp://localhost:8080/pycasu/activationreg.do?sn=";
	
	
	public static final String RAFFLE_BEGIN = "RAFFLE_BEGIN"; 
	public static final String RAFFLE_END = "RAFFLE_END";
	
	public static final String CLOSE_HOUR = "CLOSE_HOUR";
	
	public static final String UPLOAD_FILE_FOLDER = "UPLOAD_FILE_FOLDER";
	
    public static final String FORM90_RUC = "ruc";

    public static final String FORM90_PAYDMENT_DATE = "paymentDate";

    public static final String FORM90_INITIAL_DATE = "initialDate";

    public static final String FORM90_SECTION = "section";
}
