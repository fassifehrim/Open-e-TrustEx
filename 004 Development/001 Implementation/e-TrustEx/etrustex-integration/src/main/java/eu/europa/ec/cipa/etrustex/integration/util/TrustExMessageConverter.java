package eu.europa.ec.cipa.etrustex.integration.util;

import java.io.ByteArrayOutputStream;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.xml.soap.SOAPMessage;

import org.apache.commons.lang.StringUtils;
import org.springframework.integration.jms.JmsHeaders;
import org.springframework.jms.support.converter.MessageConversionException;
import org.springframework.jms.support.converter.MessageConverter;
import org.springframework.ws.soap.saaj.SaajSoapMessage;

import eu.europa.ec.cipa.etrustex.integration.ejb.DocumentQueueMessageListener;
import eu.europa.ec.cipa.etrustex.integration.exception.MessageProcessingException;
import eu.europa.ec.cipa.etrustex.integration.message.TrustExMessage;
import eu.europa.ec.cipa.etrustex.integration.message.TrustExMessageHeader;
import eu.europa.ec.cipa.etrustex.integration.service.BusinessServiceActivator;
import eu.europa.ec.cipa.etrustex.services.IPartyService;
import eu.europa.ec.cipa.etrustex.types.ErrorResponseCode;
import eu.europa.ec.cipa.etrustex.types.MessageHeaderType;
import eu.europa.ec.cipa.etrustex.types.RedeliveryReasonType;

public class TrustExMessageConverter implements MessageConverter {
//	public final static String MSG_ID="MSG_ID";
//	public final static String MSG_AUTH_USER="MSG_AUTH_USER";
//	public final static String MSG_DOC_ID ="MSG_DOC_ID";
//	public final static String MSG_CORR_ID = "MSG_CORR_ID";
//	public final static String MSG_DOC_VER = "MSG_DOC_VER";
//	public final static String MSG_PARENT_DOC_ID ="MSG_PARENT_DOC_ID";
//	public final static String MSG_SENDER_ID ="MSG_SENDER_ID";
//	public final static String MSG_SENDER_PTY_ID ="MSG_SENDER_PTY_ID";
//	public final static String MSG_RECEIVER_ID ="MSG_RECEIVER_ID";
//	public final static String MSG_RECEIVER_PTY_ID ="MSG_RECEIVER_PTY_ID";
//	public final static String MSG_TRANS_TYPE_ID ="MSG_TRANS_TYPE_ID";
//	public final static String MSG_ISSUER_ID ="MSG_ISSUER_ID";
//	public final static String MSG_ICA_ID ="MSG_ICA_ID";
//	public final static String MSG_REDELIVERY_REASON ="MSG_REDELIVERY_REASON";
	
	@Override
	public Object fromMessage(Message message) throws JMSException,
			MessageConversionException {
		TrustExMessage<String> trustExMessage = new TrustExMessage<String>(null);
		TrustExMessageHeader header = new TrustExMessageHeader();
		header.setMessageId(message.getLongProperty(MessageHeaderType.MESSAGE_ID.getCode()));
		header.setAuthenticatedUser(message.getStringProperty(MessageHeaderType.USER.getCode()));
		header.setMessageDocumentId(message.getStringProperty(MessageHeaderType.DOCUMENT_ID.getCode()));
		header.setCorrelationId(message.getStringProperty(MessageHeaderType.CORR_ID.getCode()));
		header.setMessageDocumentVersion(message.getStringProperty(MessageHeaderType.MSG_DOC_VER.getCode()));
		header.setMessageParentDocumentId(message.getStringProperty(MessageHeaderType.MSG_PARENT_DOC_ID.getCode()));
		header.setMessageParentDocumentTypeCode(message.getStringProperty(MessageHeaderType.MSG_PARENT_DOC_TYPECODE.getCode()));
		header.setSenderIdWithScheme(message.getStringProperty(MessageHeaderType.MSG_SENDER_ID.getCode()));
		header.setReceiverIdWithScheme(message.getStringProperty( MessageHeaderType.MSG_RECEIVER_ID.getCode()));
		header.setTransactionTypeId(message.getLongProperty(MessageHeaderType.MSG_TRANS_TYPE_ID.getCode()));
		header.setIssuerPartyId(message.getLongProperty(MessageHeaderType.MSG_ISSUER_ID.getCode()));
		header.setSenderPartyId(message.getLongProperty(MessageHeaderType.MSG_SENDER_PTY_ID.getCode()));
		header.setReceiverPartyId(message.getLongProperty(MessageHeaderType.MSG_RECEIVER_PTY_ID.getCode()));
		header.setTransactionNamespace(message.getStringProperty(MessageHeaderType.MSG_TRANSACTION_NS.getCode()));
		header.setTransactionRequestLocalName(message.getStringProperty(MessageHeaderType.MSG_TRANSACTION_REQUEST_LOCAL_NAME.getCode())); 
		header.setAvailableNotification((message.getStringProperty(MessageHeaderType.MSG_AVAILABLE_NOTIFICATION.getCode())));
		header.setLogCorrelationId(message.getStringProperty(MessageHeaderType.LOG_CORRELATION_ID.getCode()));
		header.setMessageRoutingId(message.getStringProperty(MessageHeaderType.MSG_ROUTING_ID.getCode()));
		
		header.setReplyTo(message.getStringProperty(MessageHeaderType.REPLY_TO.getCode()));
		header.setInstanceIdentifier(message.getStringProperty(MessageHeaderType.INSTANCE_IDENTIFIER.getCode()));
		
		IPartyService partyService = (IPartyService)BusinessServiceActivator.getApplicationContext().getBean("partyService");
		header.setIssuer(partyService.getParty(header.getIssuerPartyId()));
		
		header.setInterchangeAgreementId(message.getLongProperty(MessageHeaderType.MSG_ICA_ID.getCode()));
		header.setMessageIsRedelivered(message.getJMSRedelivered());
		String redeliverReason = message.getStringProperty(MessageHeaderType.MSG_REDELIVERY_REASON.getCode());
		if (redeliverReason != null){
			header.setRedeliveryReason(RedeliveryReasonType.valueOf(redeliverReason));
		}
		header.getMessageHeaders().setPriority(message.getJMSPriority());
		trustExMessage.setHeader(header);
		trustExMessage.setPayload(header.getMessageDocumentId());
		return trustExMessage;
	}

	@Override
	public Message toMessage(Object o, Session session) throws JMSException,
			MessageConversionException {

		TrustExMessage<String> message = null;
		
		Message jmsMessage = null;
		if (o instanceof TrustExMessage){
			//in case of SOAP over HTTP, convert the Trustex message into a JMS message
			message = (TrustExMessage<String>)o;
			jmsMessage = session.createTextMessage();
			jmsMessage.setLongProperty(MessageHeaderType.MESSAGE_ID.getCode(), message.getHeader().getMessageId());
			jmsMessage.setStringProperty(MessageHeaderType.USER.getCode(), message.getHeader().getAuthenticatedUser());
			jmsMessage.setStringProperty(MessageHeaderType.DOCUMENT_ID.getCode(), message.getHeader().getMessageDocumentId());
			jmsMessage.setStringProperty(MessageHeaderType.CORR_ID.getCode(), message.getHeader().getCorrelationId());
			jmsMessage.setStringProperty(MessageHeaderType.MSG_DOC_VER.getCode(), message.getHeader().getMessageDocumentVersion());
			jmsMessage.setStringProperty(MessageHeaderType.MSG_PARENT_DOC_ID.getCode(), message.getHeader().getMessageParentDocumentId());
			jmsMessage.setStringProperty(MessageHeaderType.MSG_PARENT_DOC_TYPECODE.getCode(), message.getHeader().getMessageParentDocumentTypeCode());
			jmsMessage.setStringProperty(MessageHeaderType.MSG_SENDER_ID.getCode(), message.getHeader().getSenderIdWithScheme());
			jmsMessage.setStringProperty(MessageHeaderType.MSG_RECEIVER_ID.getCode(), message.getHeader().getReceiverIdWithScheme());
			jmsMessage.setLongProperty(MessageHeaderType.MSG_TRANS_TYPE_ID.getCode(), message.getHeader().getTransactionTypeId());
			jmsMessage.setLongProperty(MessageHeaderType.MSG_ISSUER_ID.getCode(), message.getHeader().getIssuerPartyId());
			jmsMessage.setLongProperty(MessageHeaderType.MSG_SENDER_PTY_ID.getCode(), message.getHeader().getSenderPartyId());
			jmsMessage.setLongProperty(MessageHeaderType.MSG_RECEIVER_PTY_ID.getCode(), message.getHeader().getReceiverPartyId());
			jmsMessage.setStringProperty(MessageHeaderType.MSG_AVAILABLE_NOTIFICATION.getCode(), message.getHeader().getAvailableNotification());
			jmsMessage.setStringProperty(MessageHeaderType.MSG_ROUTING_ID.getCode(), message.getHeader().getMessageRoutingId());
			
			jmsMessage.setStringProperty(MessageHeaderType.MSG_TRANSACTION_NS.getCode(), message.getHeader().getTransactionNamespace());
			jmsMessage.setStringProperty(MessageHeaderType.MSG_TRANSACTION_REQUEST_LOCAL_NAME.getCode(), message.getHeader().getTransactionRequestLocalName());
			
			jmsMessage.setLongProperty(MessageHeaderType.MSG_ICA_ID.getCode(), message.getHeader().getInterchangeAgreementId());
			((TextMessage) jmsMessage).setText(""+message.getHeader().getMessageId());
			
			if (message.getHeader().getReplyTo() != null){
				jmsMessage.setStringProperty(MessageHeaderType.REPLY_TO.getCode(), message.getHeader().getReplyTo());
			}
			
			if (message.getHeader().getInstanceIdentifier() != null){
				jmsMessage.setStringProperty(MessageHeaderType.INSTANCE_IDENTIFIER.getCode(), message.getHeader().getInstanceIdentifier());
			}
			
			if (message.getHeader().getRedeliveryReason() != null){
				jmsMessage.setStringProperty(MessageHeaderType.MSG_REDELIVERY_REASON.getCode(), message.getHeader().getRedeliveryReason().name());
			}
			
			jmsMessage.setStringProperty(MessageHeaderType.LOG_CORRELATION_ID.getCode(), message.getHeader().getLogCorrelationId());
			jmsMessage.setJMSPriority(message.getHeader().getMessageHeaders().getPriority());
			
		} else if (o instanceof SaajSoapMessage) {
			//in case of SOAP over JMS, the SOAP response message must be converted to a JMS message
			SaajSoapMessage soapMessage = (SaajSoapMessage)o;
			jmsMessage = session.createTextMessage();
			try {
				jmsMessage.setJMSCorrelationID(soapMessage.getSaajMessage().getSOAPHeader().getAttribute(JmsHeaders.CORRELATION_ID));
				soapMessage.getSaajMessage().getSOAPHeader().removeAttribute(JmsHeaders.CORRELATION_ID);
				jmsMessage.setStringProperty(eu.europa.ec.cipa.etrustex.integration.util.MessageHeaders.HEADER_RESPONSE_CODE, 
						DocumentQueueMessageListener.getJmsHeaders().getResponseCode());
				writeSOAPBody(soapMessage.getSaajMessage(), (TextMessage)jmsMessage);
				DocumentQueueMessageListener.removeJmsHeaders();
			} catch (Exception e) {
				throw new MessageProcessingException("soapenv:Server", ErrorResponseCode.TECHNICAL_ERROR.getDescription(), null,
						ErrorResponseCode.TECHNICAL_ERROR, null, null);
			}
		} else if (o == null || StringUtils.isEmpty(((String)o))) {
			// in case of SOAP over JMS, if no SOAP fault has to be sent, an empty JMS message is created
			jmsMessage = session.createTextMessage();
			jmsMessage.setJMSCorrelationID(DocumentQueueMessageListener.getJmsHeaders().getCorrelationId());
			jmsMessage.setStringProperty(eu.europa.ec.cipa.etrustex.integration.util.MessageHeaders.HEADER_RESPONSE_CODE, 
					DocumentQueueMessageListener.getJmsHeaders().getResponseCode());
		} else {
			throw new MessageProcessingException("soapenv:Server", ErrorResponseCode.TECHNICAL_ERROR.getDescription(), null,
					ErrorResponseCode.TECHNICAL_ERROR, null, null);
		}
		return jmsMessage;
	}
    
    private void writeSOAPBody(SOAPMessage soapMessage, TextMessage textMessage) throws Exception {
        ByteArrayOutputStream bodyOutput = new ByteArrayOutputStream();
        soapMessage.writeTo(bodyOutput);
        textMessage.setText(bodyOutput.toString("UTF-8"));
        bodyOutput.close();
    }    
	
}