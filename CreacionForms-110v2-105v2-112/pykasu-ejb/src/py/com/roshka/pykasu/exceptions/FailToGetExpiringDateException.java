package py.com.roshka.pykasu.exceptions;

public class FailToGetExpiringDateException extends PykasuGenericException {
	public FailToGetExpiringDateException(){
		super();
	}

	public FailToGetExpiringDateException(String message){
		super(message);
	}
}
