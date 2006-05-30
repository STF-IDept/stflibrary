<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<!-- Import the base stylesheet to modify. -->
	<xsl:import href="chunk.xsl"/>
	
	<!-- Import our common settings for all books. -->
	<xsl:import href="html-common.xsl"/>
	
	<!-- And add in our custom title pages. -->
	<xsl:include href="html-titlepage-templates.xsl"/>

	<!-- Additional stylesheet parameters. -->
	<xsl:param name="section.autolabel" select="1" />
	<xsl:param name="toc.max.depth" select="2"/>

	<!-- Any custom templates we need go here. -->
	<xsl:template match="productnumber">
	  <span class="{name(.)}">NCC-<xsl:apply-templates /></span>
	</xsl:template>
	
	<xsl:template match="productname">
	  <span class="{name(.)}">USS <xsl:apply-templates /></span>, 
	</xsl:template>
		
	<!-- Add the common footer bar, customized for this book. -->
	<xsl:template name="user.footer.content">
		<xsl:call-template name="copyright.bar">
			<xsl:with-param name="pdffile" select="'tm.pdf'"/>
		</xsl:call-template>
	</xsl:template>



	
</xsl:stylesheet>
