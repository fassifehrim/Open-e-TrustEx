package eu.europa.ec.cipa.etrustex.types;

public enum MessageHeaderType {
	MESSAGE_ID("REP_ID"),
	MSG_SENDER_ID("MSG_SENDER_ID"),
	MSG_RECEIVER_ID("MSG_RECEIVER_ID"),
	MSG_DOC_VER("MSG_DOC_VER"),
	RECEIVED_DATE("RECEIVED_DATE"), 
	USER("USER"), 
	CORR_ID("CORR_ID"), 
	MIME_TYPE("MIME_TYPE"), 
	DOCUMENT_ID("DOCUMENT_ID"),
	MSG_PARENT_DOC_ID("MSG_PARENT_DOC_ID"),
	MSG_PARENT_DOC_TYPECODE("MSG_PARENT_DOC_TYPECODE"),
	MSG_TRANS_TYPE_ID("MSG_TRANS_TYPE_ID"),
	MSG_ISSUER_ID("MSG_ISSUER_ID"),
	DOCUMENT_TYPE_CODE("DOCUMENT_TYPE_CODE"), 
	REPLY_TO_TYPE("REPLY_TO_TYPE"), 
	REPLY_TO_JMS_DESTINATION("REPLY_TO_JMS_DESTINATION"), 
	REPLY_TO("REPLY_TO"),
	MSG_SENDER_PTY_ID("MSG_SENDER_PTY_ID"),
	MSG_RECEIVER_PTY_ID("MSG_RECEIVER_PTY_ID"),
	MSG_ICA_ID("MSG_ICA_ID"),
	MSG_REDELIVERY_REASON("MSG_REDELIVERY_REASON"),
	MSG_TRANSACTION_NS("MSG_TRANSACTION_NS"),
	MSG_TRANSACTION_REQUEST_LOCAL_NAME("MSG_TRANSACTION_REQUEST_LOCAL_NAME"),
	MSG_AVAILABLE_NOTIFICATION("MSG_AVAILABLE_NOTIFICATION"),
	MSG_ROUTING_ID("MSG_ROUTING_ID"),
	
	//kept for backwarg compatibility with old platform
	INSTANCE_IDENTIFIER("INSTANCE_IDENTIFIER"), 
	MESSAGE_TYPE("MESSAGE_TYPE"), 
	CUSTOMER_ID("IDP_ID"), 
	BINARY_ID("BINARY_ID"),
	SUPPLIER_LEF_ID("LEF_ID"), 
	SUPPLIER_CODE("SUPPLIER_CODE"),
	SUPPLIER_ID("SUP_ID"),
	
	//Used for 0.1 JMS Services
	MSG_USER("MSG_USER"),
	MSG_CUSTOMER("MSG_CUSTOMER"), 
	MSG_SUPPLIER("MSG_SUPPLIER"),
	JMSCorrelationID("JMSCorrelationID"),
	
	LOG_CORRELATION_ID("LOG_CORRELATION_ID");

	private String code;

	MessageHeaderType(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}
}
