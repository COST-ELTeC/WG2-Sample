<?xml version="1.1" encoding="utf-8"?>
<!-- Remove duplicate paragraphs from ELTeC sample -->
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:et="http://nl.ijs.si/et"
    exclude-result-prefixes="et"
    version="2.0">
  <xsl:key name="text" match="p" use="."/>
  <xsl:template match="text()"/>
  <xsl:template match="/">
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="samples">
    <samples n="{@n}">
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates/>
    </samples>
  </xsl:template>
  <xsl:template match="sample">
    <sample>
      <xsl:apply-templates/>
    </sample>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="p">
    <xsl:if test="generate-id(key('text', .)[1]) = generate-id(.)">
      <p n="{@n}">
	<xsl:value-of select="."/>
      </p>
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>
