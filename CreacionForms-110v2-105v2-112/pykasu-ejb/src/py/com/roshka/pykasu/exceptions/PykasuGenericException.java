package py.com.roshka.pykasu.exceptions;

public class PykasuGenericException extends Exception{

	public PykasuGenericException(){
		super();
	}

	public PykasuGenericException(String message){
		super(message);
	}

	public PykasuGenericException(String message, Throwable cause) {
		super(message, cause);
	}

	public PykasuGenericException(Throwable cause) {
		super(cause);
	}
	
	
}
