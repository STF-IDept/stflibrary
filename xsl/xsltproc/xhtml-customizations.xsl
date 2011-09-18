<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:cf="http://docbook.sourceforge.net/xmlns/chunkfast/1.0" xmlns="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="cf exsl">

  <!-- Any custom templates we need go here. -->

  <!-- General templates -->

  <!-- We want simplelists to render as <ul> not tables, the way god intended. -->
  <xsl:template match="simplelist">
    <xsl:call-template name="anchor"/>
    <ul>
      <xsl:attribute name="class">
      <xsl:value-of select="@role" /><xsl:text> </xsl:text><xsl:value-of select="name(.)" />
    </xsl:attribute>
      <xsl:apply-templates />
    </ul>
  </xsl:template>
  <xsl:template match="member">
    <li class="{name(.)}">
    <xsl:attribute name="class">
      <xsl:value-of select="@role" /><xsl:text> </xsl:text><xsl:value-of select="name(.)" />
    </xsl:attribute>
    <xsl:apply-templates />
    </li>
  </xsl:template>

</xsl:stylesheet>
