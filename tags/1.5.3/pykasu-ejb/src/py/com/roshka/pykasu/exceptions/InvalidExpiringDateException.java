package py.com.roshka.pykasu.exceptions;


public class InvalidExpiringDateException extends PykasuGenericException {
	public InvalidExpiringDateException(){
		super();
	}

	public InvalidExpiringDateException(String message){
		super(message);
	}
}
