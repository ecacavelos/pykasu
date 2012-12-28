package py.com.roshka.pykasu.exceptions;

public class HBUpdateException extends HBGenericException {
	public HBUpdateException() {
		super();
	}

	public HBUpdateException(String message) {
		super(message);
	}

	public HBUpdateException(String message, Throwable cause) {
		super(message, cause);
	}

	public HBUpdateException(Throwable cause) {
		super(cause);
	}

}
