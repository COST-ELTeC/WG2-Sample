<!-- Re-tag IMP document for ELTEC -->
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema" 
		xmlns:h="http://www.w3.org/1999/xhtml" 
		xmlns:tei="http://www.tei-c.org/ns/1.0"    
		xmlns:eltec="http://distantreading.net/eltec/ns"
		xmlns="http://www.tei-c.org/ns/1.0"
		exclude-result-prefixes="xs h tei eltec">

  <xsl:output indent="yes"/>
  <xsl:strip-space elements="tei:*"/>
  <xsl:preserve-space elements="tei:c"/>

  <xsl:param name="orig"/>
  <xsl:key name="n" match="tei:p" use="@n"/>

  <xsl:variable name="ana" select="document($orig)//tei:body"/>
  
  <xsl:template match="/">
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="p">
    <xsl:variable name="n" select="@n"/>
    <xsl:copy-of select="key('n', $n, $ana)"/>
  </xsl:template>
  
  <!-- Copy everything else -->
  <xsl:template match="* | @* | processing-instruction()">
    <xsl:copy>
      <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
