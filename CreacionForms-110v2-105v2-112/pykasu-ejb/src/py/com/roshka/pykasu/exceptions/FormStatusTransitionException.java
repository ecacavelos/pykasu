package py.com.roshka.pykasu.exceptions;

public class FormStatusTransitionException extends PykasuGenericException {

	public FormStatusTransitionException(){
		super();
	}

	public FormStatusTransitionException(String message){
		super(message);
	}
}
