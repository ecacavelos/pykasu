package py.com.roshka.pykasu.exceptions;

public class HBGenericException extends PykasuGenericException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public HBGenericException() {
		super();
	}

	public HBGenericException(String message) {
		super(message);
	}

	public HBGenericException(String message, Throwable cause) {
		super(message, cause);
	}

	public HBGenericException(Throwable cause) {
		super(cause);
	}
	
}
