package py.com.roshka.pykasu.exceptions;


public class FiscalPeriodNotFoundException extends PykasuGenericException {
	public FiscalPeriodNotFoundException(){
		super();
	}

	public FiscalPeriodNotFoundException(String message){
		super(message);
	}
}
