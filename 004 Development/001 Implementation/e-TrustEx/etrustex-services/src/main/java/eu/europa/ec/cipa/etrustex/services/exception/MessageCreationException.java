package eu.europa.ec.cipa.etrustex.services.exception;

import eu.europa.ec.cipa.etrustex.types.ErrorResponseCode;

public class MessageCreationException extends EncodedBusinessException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public MessageCreationException(String message,
			ErrorResponseCode responseCode) {
		super(message, responseCode);
	}

	public MessageCreationException(Throwable cause,
			ErrorResponseCode responseCode) {
		super(cause, responseCode);
	}

	public MessageCreationException(Throwable cause, String message,
			ErrorResponseCode responseCode) {
		super(cause, message, responseCode);
	}

}
