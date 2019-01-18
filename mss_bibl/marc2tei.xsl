<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xpath-default-namespace="http://www.loc.gov/MARC21/slim">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@*, node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:strip-space elements="*"/>


  <xsl:template match="collection">

    <xsl:processing-instruction name="xml-model">
        <xsl:text>href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?</xsl:text>
    </xsl:processing-instruction>

    <xsl:processing-instruction name="xml-model">
        <xsl:text>href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
  </xsl:processing-instruction>

    <TEI xmlns="http://www.tei-c.org/ns/1.0">
      <teiHeader>
        <fileDesc>
          <titleStmt>
            <title>Lista de manuscritos preservados por la Biblioteca Nacional de España</title>
          </titleStmt>
          <publicationStmt>
            <p>Cologne Center for eHumanities</p>
          </publicationStmt>
          <sourceDesc>
            <p>Catálogo de la BNE</p>
          </sourceDesc>
        </fileDesc>
      </teiHeader>
      <text>
        <body>
          <listBibl>
            <xsl:apply-templates/>
          </listBibl>
        </body>
      </text>
    </TEI>

  </xsl:template>


  <xsl:template match="record">

    <xsl:element name="bibl" namespace="http://www.tei-c.org/ns/1.0">

      <xsl:attribute name="n">
        <xsl:value-of select="position()"/>
      </xsl:attribute>

      <xsl:attribute name="xml:id">
        <xsl:value-of select="controlfield[@tag = '001']"/>
      </xsl:attribute>

      <xsl:element name="author" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:value-of select="datafield[@tag = '100']/subfield[@code = 'a']"/>
      </xsl:element>

      <xsl:element name="title" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:attribute name="type">heading</xsl:attribute>
        <xsl:value-of select="datafield[@tag = '240']/subfield[@code = 'a']"/>
      </xsl:element>

      <xsl:element name="title" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:attribute name="type">full</xsl:attribute>
        <xsl:value-of select="datafield[@tag = '245']/subfield[@code = 'a']"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="substring-before(datafield[@tag = '245']/subfield[@code = 'h'], ':')"/>
      </xsl:element>

      <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:value-of select="datafield[@tag = '260']/subfield"/>
      </xsl:element>

      <xsl:for-each select="datafield[@tag = '500']/subfield[@code = 'a']">
        <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
          <xsl:attribute name="type">general</xsl:attribute>
          <xsl:value-of select="."/>
        </xsl:element>
      </xsl:for-each>

      <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:attribute name="type">publication</xsl:attribute>
        <xsl:value-of select="datafield[@tag = '596']/subfield[@code = 'a']"/>
      </xsl:element>

      <xsl:for-each select="datafield[@tag = '856']">
        <xsl:if test="subfield[@code = 'u']/text()">
          <xsl:element name="relatedItem" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="n">
              <xsl:value-of select="position()"/>
            </xsl:attribute>
            <xsl:element name="ref" namespace="http://www.tei-c.org/ns/1.0">
              <xsl:attribute name="target">
                <xsl:value-of select="subfield[@code = 'u']"/>
              </xsl:attribute>
              <xsl:value-of select="subfield[@code = 'y']"/>
            </xsl:element>
          </xsl:element>
        </xsl:if>
      </xsl:for-each>

    </xsl:element>

  </xsl:template>

</xsl:stylesheet>
