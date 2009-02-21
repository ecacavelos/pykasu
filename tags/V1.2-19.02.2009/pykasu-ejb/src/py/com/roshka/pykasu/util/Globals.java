package py.com.roshka.pykasu.util;

public class Globals {

	public static final String PYKASU_PROPERTIES = "related-files/pykasu-config.properties";
	
	public static final String SMTP_HOST = "172.30.1.3";
	public static final String MAIL_ACTIVATION_SENDER = "tributos@vision.com.py";
	public static final String MAIL_ACTIVATION_SUBJECT = "Datos para activacion de cuenta";
	public static final String MAIL_ACTIVATION_BODY = "Gracias por registrarse.\n" +
					        						  "Para terminar con el proceso de registro debe activar su cuenta.\n" +
					        						  "Para activar su cuenta Ud. debe ingresar al sitio web https://formularios.vision.com.py/pycasu/ \n" + 
					        						  "ingresar con su nombre de usuario y contrasena. " +
					        						  "Se desplegara un menu en el lado izquierdo de la ventana, por favor elija la opcion 'Activar Cuenta'" +
					        						  "Se le mostrara una ventana para ingresar su clave de activiacion, sea tan amable de ingresar esta clave. "+
					        	                      "Su clave de activacion es: ";
	
	public static final String CLOSE_HOUR = "CLOSE_HOUR";
	
	public static final String UPLOAD_FILE_FOLDER = "UPLOAD_FILE_FOLDER";
	
    public static final String FORM90_RUC = "ruc";

    public static final String FORM90_PAYDMENT_DATE = "paymentDate";

    public static final String FORM90_INITIAL_DATE = "initialDate";

    public static final String FORM90_SECTION = "section";
}
