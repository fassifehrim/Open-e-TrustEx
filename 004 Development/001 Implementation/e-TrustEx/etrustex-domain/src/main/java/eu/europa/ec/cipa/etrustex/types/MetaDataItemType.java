package eu.europa.ec.cipa.etrustex.types;

public enum MetaDataItemType {
	NOT_IMPLEMENTED,
	DOCUMENT_XSD,
	DOCUMENT_XSD_URL,
	DOCUMENT_SCEMATRON,
	DOCUMENT_SCEMATRON_URL,
	DOCUMENT_ID_XQUERY,
	DOCUMENT_ISSUEDATE_XQUERY,
	DOCUMENT_ISSUETIME_XQUERY,
	DOCUMENT_VERSION_XQUERY,
	DOCUMENT_CANNONICAL_NS,
	DOCUMENT_CANNONICAL_LOCALNAME,
	DOCUMENT_HUMAN_READABLE_XSLT,
	DOCUMENT_HUMAN_READABLE_PREPROC,
	BUSINESS_SERVICE_BEAN,
	SENDER_ID_XQUERY,
	RECEIVER_ID_XQUERY,
	PARENT_DOCUMENT_ID_XQUERY,
	PARENT_DOCUMENT_NA_STRATEGY,
	PARENT_ID_NOT_FOUND_TIMEFRAME,
	PARENT_DOCUMENT_TYPECODE_XQUERY,
	SYNCH_VALIDATE_XSD,
	SIGNATURE_INFO_QUERY,
	CORRELATION_ID_XQUERY,
	REPLYTO_XQUERY,
	SCHEME_ID_SEPARATOR,
	INSTANCE_IDENTIFIER_XQUERY,
	DEFAULT_USE_FILE_STORE,
	FILE_STORE_PATH,
	SERVER_URL,
	AVAILABLE_NOTIFICATION_XPATH,
	CFT_TEST_ENDPOINT,
	JUST_TEST_ENDPOINT,
	ECODEX_URL_ENDPOINT,
	ECODEX_REDIRECT_ROOT,
	DOMIBUS_URL_ENDPOINT,
	DOMIBUS_REDIRECT_ROOT,
	JMS_REPLY_TO_TIMEOUT,
	OLD_FAULT_SUPPORT,
	SENDER_GATEWAY_NAME,
	SENDER_GATEWAY_WSDL,
	HEADER_VERSION_XPATH,
	BUSINESS_SCOPE_II_XPATH,
	ACK_GENERATOR_CLASS,
	ACK_SIGNATURE_CLASS,
	SUPPORT_MULTICAST,
	DELETE_DOCUMENT_ALLOWED,
	MONITORING_EMAIL_RECIPIENTS,
    BUSINESS_HEADER_XPATH;
	
	
	public static MetaDataItemType resolve(String value){
		MetaDataItemType result;
		try {
			result = MetaDataItemType.valueOf(value);
		} catch (IllegalArgumentException ex) {  
			result = MetaDataItemType.NOT_IMPLEMENTED; 
		}
		return result;
	}	
}