<!-- Re-tag IMP document for ELTEC -->
<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema" 
		xmlns:tei="http://www.tei-c.org/ns/1.0"    
		xmlns:eltec="http://distantreading.net/eltec/ns"
		xmlns="http://www.tei-c.org/ns/1.0"
		exclude-result-prefixes="xs tei eltec">

  <xsl:output indent="yes"/>
  <xsl:strip-space elements="tei:*"/>
  <xsl:preserve-space elements="tei:c"/>

  <xsl:template match="/">
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:choice">
    <xsl:choose>
      <xsl:when test="tei:orig/*[2]">
	<xsl:message>
	  <xsl:text>2 origs: </xsl:text>
	  <xsl:value-of select="tei:orig/tei:w[1]"/>
	  <xsl:text> + </xsl:text>
	  <xsl:value-of select="tei:orig/tei:w[2]"/>
	</xsl:message>
    </xsl:when>
    <xsl:when test="tei:norm/*[2]">
	<xsl:message>
	  <xsl:text>2 norms: </xsl:text>
	  <xsl:value-of select="tei:norm/tei:w[1]"/>
	  <xsl:text> + </xsl:text>
	  <xsl:value-of select="tei:norm/tei:w[2]"/>
	</xsl:message>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates mode="ana" select="tei:reg/tei:w">
	<xsl:with-param name="token" select="tei:orig/tei:w/text()"/>
      </xsl:apply-templates>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template mode="ana" match="tei:w">
    <xsl:param name="token"/>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:value-of select="$token"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Copy everything else -->
  <xsl:template match="* | @* | processing-instruction()">
    <xsl:copy>
      <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
