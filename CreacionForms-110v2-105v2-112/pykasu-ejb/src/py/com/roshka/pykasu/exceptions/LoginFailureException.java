package py.com.roshka.pykasu.exceptions;

public class LoginFailureException extends PykasuGenericException {
	public LoginFailureException(){
		super();
	}

	public LoginFailureException(String message){
		super(message);
	}
}
