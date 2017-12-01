<?xml version="1.0" encoding="UTF-8"?>
<!--
Refer to EC_CodeList.xls for a mapping of error codes to corresponding human readable values
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
<title>Business rules for e-TrustEx DeleteDocumentWrapper</title>
<ns prefix="qdt"
      uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"/>
  <ns prefix="cct"
      uri="urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2"/>
  <ns prefix="cbc"
      uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac"
      uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="udt"
      uri="urn:un:unece:uncefact:data:draft:UnqualifiedDataTypesSchemaModule:2"/>
  <ns prefix="stat"
      uri="urn:oasis:names:specification:ubl:schema:xsd:DocumentStatusCode-1.0"/>
  <ns prefix="ec"
      uri="ec:schema:xsd:DocumentWrapperRequest-0.1"/>
  <ns prefix="fn"
      uri="http://www.w3.org/2005/xpath-functions"/>
  <ns prefix="xs"
      uri="http://www.w3.org/2001/XMLSchema"/>
<pattern name="documenttypecode check">
  <rule context="*[local-name()='DocumentReferenceRequest']/cbc:DocumentTypeCode">
    <assert flag="error" test="not ( normalize-space(.) = '' )">error.documenttypecode_check</assert>
  </rule>
</pattern>
    <include href="DeleteDocumentWrapper_code_list_constraints.sch"/>
</schema>
  
