package py.com.roshka.pykasu.exceptions;

public class FormNotFoundException extends PykasuGenericException {
	public FormNotFoundException(){
		super();
	}

	public FormNotFoundException(String message){
		super(message);
	}
}
