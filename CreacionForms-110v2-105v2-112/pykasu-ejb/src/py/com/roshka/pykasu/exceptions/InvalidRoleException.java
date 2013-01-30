package py.com.roshka.pykasu.exceptions;

public class InvalidRoleException extends PykasuGenericException{

	public InvalidRoleException(){
		super();
	}

	public InvalidRoleException(String message){
		super(message);
	}
}
