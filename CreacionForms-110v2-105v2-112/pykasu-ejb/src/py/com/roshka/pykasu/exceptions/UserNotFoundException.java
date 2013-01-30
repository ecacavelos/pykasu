package py.com.roshka.pykasu.exceptions;

public class UserNotFoundException extends PykasuGenericException {

	public UserNotFoundException(){
		super();
	}
	
	public UserNotFoundException(String message){
		super(message);
	}
}
