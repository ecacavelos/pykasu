package py.com.roshka.pykasu.exceptions;

public class InvalidUserNameException extends PykasuGenericException {
	public InvalidUserNameException(){
		super();
	}

	public InvalidUserNameException(String message){
		super(message);
	}
}
