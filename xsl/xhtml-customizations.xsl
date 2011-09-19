<?xml version='1.0'?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  xmlns:cf="http://docbook.sourceforge.net/xmlns/chunkfast/1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:date="http://exslt.org/dates-and-times"
  version="1.0"
  exclude-result-prefixes="cf exsl date"
>

  <!-- Templates specific to a particular section, which we break out for maintainability. -->
  <xsl:import href="xhtml-tm.xsl"/>

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

  <xsl:template name="user.footer.navigation">
    <hr/>
    <xsl:apply-templates select="//copyright[1]" mode="titlepage.mode"/>
  </xsl:template>

  <xsl:template name="user.head.content">
    <meta name="date">
      <xsl:attribute name="content">
        <xsl:call-template name="datetime.format">
          <xsl:with-param name="date" select="date:date-time()"/>
          <xsl:with-param name="format" select="'d B Y'"/>
        </xsl:call-template>
      </xsl:attribute>
    </meta>
  </xsl:template>

</xsl:stylesheet>
