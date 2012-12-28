package py.com.roshka.pykasu.exceptions;

public class PykasuFatalException extends PykasuGenericException {
	public PykasuFatalException(){
		super();
	}

	public PykasuFatalException(String message){
		super(message);
	}
}
