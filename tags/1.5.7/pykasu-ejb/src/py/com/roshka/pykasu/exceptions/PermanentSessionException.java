package py.com.roshka.pykasu.exceptions;

public class PermanentSessionException extends PykasuGenericException {
	public PermanentSessionException(){
		super();
	}

	public PermanentSessionException(String message){
		super(message);
	}
}
