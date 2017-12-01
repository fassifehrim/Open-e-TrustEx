package eu.europa.ec.cipa.eprocurement.integration.business;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.StringReader;
import java.util.List;

import javax.persistence.NoResultException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.stream.StreamSource;

import net.sf.saxon.Configuration;
import net.sf.saxon.om.DocumentInfo;
import net.sf.saxon.trans.XPathException;

import org.bouncycastle.util.encoders.Base64;
import org.custommonkey.xmlunit.DetailedDiff;
import org.custommonkey.xmlunit.Diff;
import org.custommonkey.xmlunit.Difference;
import org.custommonkey.xmlunit.DifferenceEngine;
import org.custommonkey.xmlunit.XMLUnit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

import eu.europa.ec.cipa.etrustex.domain.Message;
import eu.europa.ec.cipa.etrustex.domain.Party;
import eu.europa.ec.cipa.etrustex.integration.api.IASynchBusinessService;
import eu.europa.ec.cipa.etrustex.integration.business.TrustExBusinessService;
import eu.europa.ec.cipa.etrustex.integration.exception.BusinessException;
import eu.europa.ec.cipa.etrustex.integration.exception.TechnicalErrorException;
import eu.europa.ec.cipa.etrustex.integration.message.TrustExMessage;
import eu.europa.ec.cipa.etrustex.types.ErrorResponseCode;

public class SubmitCallForTenders_2 extends TrustExBusinessService implements IASynchBusinessService {

	private static final String SIGNATURE_ELEMENT = "Signature";
	private static final String CFT_ELEMENT = "CallForTenders";
	private static final String XSD_CUBE_SIGNATURE = "http://wltdig04.cc.cec.eu.int:1141/CubeWeb";
	private static final String XSD_CFT = "urn:oasis:names:specification:ubl:schema:xsd:CallForTenders-2";
	private static final Logger logger = LoggerFactory.getLogger(SubmitCallForTenders_2.class);
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public TrustExMessage<String> processMessage(TrustExMessage<String> message)
			throws BusinessException, TechnicalErrorException {
		
//		String doctypeCode = "";
//		try {
//			Party receiverHParty = authorisationService.getParty(message.getHeader().getReceiverPartyId());
//			
//			Message mainMessage = messageService.retrieveMessage(message.getHeader().getMessageId());					
//			doctypeCode = mainMessage.getTransaction().getDocument().getDocumentTypeCode();
//			final Configuration config = new Configuration();
//			//final DynamicQueryContext dynamicContext = new DynamicQueryContext(config);
//			DocumentInfo docInfo = config.buildDocument(new StreamSource(new StringReader(message.getPayload())));
//			
//			String endpointId = queryForSingle("/*:CallForTenders/*:ContractingParty/*:Party/*:EndpointID",docInfo, config);			
//			
//			
//			String schemeId = null;
//			
//			//If SchemeID doesn't exist, assume it is a GLN
//			try {
//				schemeId = queryForSingle("/*:CallForTenders/*:ContractingParty/*:Party/*:EndpointID/@schemeID",docInfo, config);
//			} catch (Exception e) {
//				logger.warn("No Scheme ID for CFT:"+message.getHeader().getMessageDocumentId());
//			}
//			
//			if(schemeId == null || "".equals(schemeId)){
//				schemeId = "GLN";
//			}
//			
//			Party contractingParty = authorisationService.getParty(schemeId, endpointId);
//			
//			if(!receiverHParty.getId().equals(contractingParty.getId())){
//				throw new BusinessException(
//						"soapenv:Client",
//						"Sender and Receiver in Header and Body are not the same",
//						null,ErrorResponseCode.DOCUMENT_VALIDATION_FAILED,doctypeCode,
//						"Header's Receiver Body's ContractingParty Endpoint are not the same");
//			}
//		}catch(NoResultException e){ 
//			throw new BusinessException(
//					"soapenv:Client",
//					"Non Existing Sender or Receiver in the body",
//					null,ErrorResponseCode.DOCUMENT_VALIDATION_FAILED,doctypeCode,
//					"Non Existing Sender or Receiver in the body");
//		}catch (XPathException e) {
//			logger.error(e.getMessage(), e);
//			throw new TechnicalErrorException("soapenv:Server",
//					"Unable to retrieve information with query ", null,
//					"301", "Technical Error Occured");
//		}
			
		
		try {			
			//Code to compare CFT with the CFT inside an envelopping signature (if signature present). Use DOM nodes.
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			dbf.setNamespaceAware(true);		
			DocumentBuilder db = dbf.newDocumentBuilder(); 
			
						
			Document doc1 = db.parse(new ByteArrayInputStream(message.getPayload().getBytes("UTF-8")));
			
			Node enveloppingCFT = doc1.getElementsByTagNameNS(XSD_CFT, CFT_ELEMENT).item(0);		
			Node signature = doc1.getElementsByTagNameNS(XSD_CUBE_SIGNATURE, SIGNATURE_ELEMENT).item(0);
			
			if (signature == null){
				logger.info("No signature present, no check");
				return message;
			}
			
			byte[] temp = Base64.decode(signature.getTextContent());
			signature.setTextContent("");
			
			doc1 = createDocument(db, enveloppingCFT); 
			
			Document sigDoc = db.parse(new ByteArrayInputStream(temp));		
			Node enveloppedCFT = sigDoc.getElementsByTagNameNS(XSD_CFT, CFT_ELEMENT).item(0);		
			
			Document doc2 = createDocument(db, enveloppedCFT);
			
			XMLUnit.setIgnoreWhitespace(true);
			XMLUnit.setIgnoreComments(true);
					
			DetailedDiff myDiff = new DetailedDiff(new Diff(doc1,doc2));
						
			boolean isDifferent = false;
			for(Object diff : myDiff.getAllDifferences()){
				Difference d = (Difference)diff;
				if (d.getId()==DifferenceEngine.NAMESPACE_PREFIX_ID){
					continue;
				}else{
					isDifferent = true;
					logger.error("XML are different: "+d.getDescription()+" ("+d.toString()+")");					
					break;
				}
			}
			if (isDifferent){
				throw new BusinessException(
						"soapenv:Client",
						"Document is different than the object inside the envelopping signature",
						null,ErrorResponseCode.DOCUMENT_VALIDATION_FAILED,"443",
						"XML documents must be identical");
			}	
			return message;
		}catch(BusinessException e){
			throw e;
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new TechnicalErrorException("soapenv:Server",
					"Technical Error Occured", null,
					"301", "Technical Error Occured");
		}		
	}

	private Document createDocument(DocumentBuilder db, Node enveloppedCFT) {
		Document doc2 = db.newDocument();
		enveloppedCFT = doc2.adoptNode(enveloppedCFT);
		doc2.appendChild(enveloppedCFT);
		return doc2;
	}
}