package py.com.roshka.pykasu.exceptions;

public class HBQueryException extends HBGenericException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public HBQueryException() {
		super();
	}

	public HBQueryException(String message) {
		super(message);
	}

	public HBQueryException(String message, Throwable cause) {
		super(message, cause);
	}

	public HBQueryException(Throwable cause) {
		super(cause);
	}

	
}
