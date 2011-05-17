<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
      <!ENTITY nbsp " ">
      ]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:saxon="http://icl.com/saxon"
        xmlns:lxslt="http://xml.apache.org/xslt"
        xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
        xmlns:exsl="http://exslt.org/common"
        xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
        version="1.1"
        exclude-result-prefixes="doc"
                extension-element-prefixes="saxon xalanredirect lxslt exsl">
  <xsl:output method="xml" omit-xml-declaration="no" version="1.0" indent="yes" media-type="text/xml" encoding="UTF-8"/>

  <!-- Identity Transformation -->
  <xsl:template match="@*|node()|text()">
    <xsl:copy>
      <xsl:apply-templates select="@*|*|text()" />
    </xsl:copy>
  </xsl:template>

<!--  <xsl:template match="/">
    <exsl:document href="'output.xml'" indent="'yes'">
      <xsl:copy-of select="."/>
    </exsl:document>
  </xsl:template>-->
  
<!--  <exsl:document href="'output.xml'"
           method="{$method}"
           encoding="{$encoding}"
           indent="{$indent}"
           omit-xml-declaration="{$omit-xml-declaration}"
           cdata-section-elements="{$cdata-section-elements}"
           media-type="{$media-type}"
           doctype-public="{$doctype-public}"
           doctype-system="{$doctype-system}"
           standalone="{$standalone}">
    <xsl:copy-of select="$content"/>
  </exsl:document>-->

  

  <xsl:template match="simplelist[member/@role]">
    <variablelist>
      <xsl:apply-templates mode="list"/>
    </variablelist>
  </xsl:template>

  <xsl:template match="simplelist/member" mode="list">
<!--     <xsl:if test="member[@role]"> -->
      <varlistentry>
        <term><xsl:value-of select="@role"/></term>
        <listitem><para><xsl:value-of select="."/></para></listitem>
      </varlistentry>
<!--     </xsl:if> -->
  </xsl:template>

</xsl:stylesheet>
