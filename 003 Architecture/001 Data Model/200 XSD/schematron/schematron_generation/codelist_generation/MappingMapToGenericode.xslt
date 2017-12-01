<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2008r2sp1

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:n="http://docs.oasis-open.org/codelist/ns/genericode/1.0/" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsi xsl" xmlns="http://docs.oasis-open.org/codelist/ns/genericode/1.0/">
	<xsl:namespace-alias stylesheet-prefix="n" result-prefix="#default"/>
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/CodeList">
		<n:CodeList>
			<xsl:attribute name="xsi:schemaLocation">
				<xsl:value-of select="'http://docs.oasis-open.org/codelist/ns/genericode/1.0/ C:/DOCUME~1/danielsm/Desktop/codelists/genericode.xsd'"/>
			</xsl:attribute>
			<Identification xmlns="">
				<xsl:for-each select="Identification">
					<xsl:for-each select="ShortName">
						<xsl:variable name="Vvar138_ShortName_string" select="string(.)"/>
						<ShortName>
							<xsl:value-of select="string($Vvar138_ShortName_string)"/>
						</ShortName>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="Identification">
					<xsl:for-each select="LongName">
						<xsl:variable name="Vvar145_LongName_string" select="string(.)"/>
						<LongName>
							<xsl:value-of select="string($Vvar145_LongName_string)"/>
						</LongName>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="Identification">
					<xsl:for-each select="ListID">
						<xsl:variable name="Vvar152_ListID_string" select="string(.)"/>
						<LongName>
							<xsl:attribute name="Identifier">
								<xsl:value-of select="string('listID')"/>
							</xsl:attribute>
							<xsl:value-of select="string($Vvar152_ListID_string)"/>
						</LongName>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="Identification">
					<xsl:for-each select="Version">
						<xsl:variable name="Vvar161_Version_string" select="string(.)"/>
						<Version>
							<xsl:value-of select="string($Vvar161_Version_string)"/>
						</Version>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="Identification">
					<xsl:for-each select="CanonicalUri">
						<xsl:variable name="Vvar168_CanonicalUri_string" select="string(.)"/>
						<CanonicalUri>
							<xsl:value-of select="string($Vvar168_CanonicalUri_string)"/>
						</CanonicalUri>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="Identification">
					<xsl:for-each select="CanonicalVersionUri">
						<xsl:variable name="Vvar175_CanonicalVersionUri_string" select="string(.)"/>
						<CanonicalVersionUri>
							<xsl:value-of select="string($Vvar175_CanonicalVersionUri_string)"/>
						</CanonicalVersionUri>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="Identification">
					<xsl:for-each select="LocationUri">
						<xsl:variable name="Vvar182_LocationUri_string" select="string(.)"/>
						<LocationUri>
							<xsl:value-of select="string($Vvar182_LocationUri_string)"/>
						</LocationUri>
					</xsl:for-each>
				</xsl:for-each>
				<Agency>
					<xsl:for-each select="Identification">
						<xsl:for-each select="AgencyLongName">
							<xsl:variable name="Vvar189_AgencyLongName_string" select="string(.)"/>
							<LongName>
								<xsl:value-of select="string($Vvar189_AgencyLongName_string)"/>
							</LongName>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="Identification">
						<xsl:for-each select="AgencyIdentifier">
							<xsl:variable name="Vvar196_AgencyIdentifier_string" select="string(.)"/>
							<Identifier>
								<xsl:value-of select="string($Vvar196_AgencyIdentifier_string)"/>
							</Identifier>
						</xsl:for-each>
					</xsl:for-each>
				</Agency>
			</Identification>
			<xsl:variable name="Vvar85_const" select="'code'"/>
			<xsl:variable name="Vvar93_const" select="'name'"/>
			<xsl:variable name="Vvar95_const" select="'optional'"/>
			<xsl:variable name="Vvar99_const" select="'string'"/>
			<ColumnSet xmlns="">
				<Column>
					<xsl:attribute name="Id">
						<xsl:value-of select="string($Vvar85_const)"/>
					</xsl:attribute>
					<xsl:attribute name="Use">
						<xsl:value-of select="string('required')"/>
					</xsl:attribute>
					<ShortName>
						<xsl:value-of select="string('Code')"/>
					</ShortName>
					<Data>
						<xsl:attribute name="Type">
							<xsl:value-of select="string('normalizedString')"/>
						</xsl:attribute>
					</Data>
				</Column>
				<Column>
					<xsl:attribute name="Id">
						<xsl:value-of select="string($Vvar93_const)"/>
					</xsl:attribute>
					<xsl:attribute name="Use">
						<xsl:value-of select="string($Vvar95_const)"/>
					</xsl:attribute>
					<ShortName>
						<xsl:value-of select="string('Name')"/>
					</ShortName>
					<Data>
						<xsl:attribute name="Type">
							<xsl:value-of select="string($Vvar99_const)"/>
						</xsl:attribute>
					</Data>
				</Column>
				<Column>
					<xsl:attribute name="Id">
						<xsl:value-of select="string('examples')"/>
					</xsl:attribute>
					<xsl:attribute name="Use">
						<xsl:value-of select="string($Vvar95_const)"/>
					</xsl:attribute>
					<ShortName>
						<xsl:value-of select="string('Examples')"/>
					</ShortName>
					<Data>
						<xsl:attribute name="Type">
							<xsl:value-of select="string($Vvar99_const)"/>
						</xsl:attribute>
					</Data>
				</Column>
				<Key>
					<xsl:attribute name="Id">
						<xsl:value-of select="string('codeKey')"/>
					</xsl:attribute>
					<ShortName>
						<xsl:value-of select="string('CodeKey')"/>
					</ShortName>
					<ColumnRef>
						<xsl:attribute name="Ref">
							<xsl:value-of select="string($Vvar85_const)"/>
						</xsl:attribute>
					</ColumnRef>
				</Key>
			</ColumnSet>
			<SimpleCodeList xmlns="">
				<xsl:for-each select="ValuesSet">
					<xsl:for-each select="ValueSet">
						<Row>
							<Value>
								<xsl:attribute name="ColumnRef">
									<xsl:value-of select="string($Vvar85_const)"/>
								</xsl:attribute>
								<xsl:for-each select="Code">
									<xsl:variable name="Vvar209_Code_string" select="string(.)"/>
									<SimpleValue>
										<xsl:value-of select="$Vvar209_Code_string"/>
									</SimpleValue>
								</xsl:for-each>
							</Value>
							<Value>
								<xsl:attribute name="ColumnRef">
									<xsl:value-of select="string($Vvar93_const)"/>
								</xsl:attribute>
								<xsl:for-each select="Value">
									<xsl:variable name="Vvar215_Value_string" select="string(.)"/>
									<SimpleValue>
										<xsl:value-of select="$Vvar215_Value_string"/>
									</SimpleValue>
								</xsl:for-each>
							</Value>
						</Row>
					</xsl:for-each>
				</xsl:for-each>
			</SimpleCodeList>
		</n:CodeList>
	</xsl:template>
</xsl:stylesheet>
