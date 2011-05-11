package py.com.roshka.pykasu.exceptions;

public class ExcludedContributorException extends GetContributorInfoException {

	public ExcludedContributorException() {
	}

	public ExcludedContributorException(String message) {
		super(message);
	}

	public ExcludedContributorException(String message, Throwable cause) {
	}

	public ExcludedContributorException(Throwable cause) {
	}

}
