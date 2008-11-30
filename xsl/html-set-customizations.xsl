<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<!-- Import the base stylesheet to modify. -->
	<!-- We import the non-chunk version to customize, then this file
		gets imported by another that links it up with the chunker. -->
	<xsl:import href="docbook/html/docbook.xsl"/>

	<!-- Import our common settings for all books. -->
	<xsl:import href="html-common.xsl"/>

	<!-- Additional stylesheet parameters. -->
	<xsl:param name="html.stylesheet" select="'styles/main.css'" />

	<!-- Any custom templates we need go here. -->
	
	<!-- Only one level in the set TOC, for book titles -->
	<xsl:param name="toc.max.depth" select="1"/>
	
	<!--
		This version of the <set> template is identical to the standard one,
		save that it does NOT continue processing after it generates the TOC.
		That way, we can run this on the entire tree but it will generate only
		the main index.html file.  Other books we can then process individually.
	-->
	<xsl:template match="set">
		<div class="{name(.)}">
			<xsl:call-template name="language.attribute"/>
			<xsl:if test="$generate.id.attributes != 0">
			<xsl:attribute name="id">
				<xsl:call-template name="object.id"/>
			</xsl:attribute>
			</xsl:if>
		
			<xsl:call-template name="set.titlepage"/>
		
			<xsl:call-template name="make.lots">
			<xsl:with-param name="toc.params">
				<xsl:call-template name="find.path.params">
				<xsl:with-param name="table" select="normalize-space($generate.toc)"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="toc">
				<xsl:call-template name="set.toc"/>
			</xsl:with-param>
			</xsl:call-template>

			<!-- <xsl:apply-templates/> -->
		</div>
	</xsl:template>


</xsl:stylesheet>  
