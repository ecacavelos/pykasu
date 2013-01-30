package py.com.roshka.pykasu.exceptions;


public class MailException extends PykasuGenericException {
	public MailException(){
		super();
	}

	public MailException(String message){
		super(message);
	}
}
