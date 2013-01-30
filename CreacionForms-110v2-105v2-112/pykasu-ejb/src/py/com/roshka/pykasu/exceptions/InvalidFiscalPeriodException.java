package py.com.roshka.pykasu.exceptions;

public class InvalidFiscalPeriodException extends PykasuGenericException {

	public InvalidFiscalPeriodException(){
		super();
	}

	public InvalidFiscalPeriodException(String message){
		super(message);
	}
}
