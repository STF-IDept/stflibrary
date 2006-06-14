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
	
	<xsl:template match="simplelist[@role='ShipList']/member">
	  <li class="{name(.)}">
		<xsl:attribute name="class">
			<xsl:value-of select="@role" /><xsl:text> </xsl:text><xsl:value-of select="name(.)" />
		</xsl:attribute>
		<xsl:apply-templates />
		<xsl:if test="@role = 'NPC'">
			<xsl:element name="span">
				<xsl:attribute name="class">NPC-marker</xsl:attribute>
				<xsl:text> (NPC)</xsl:text>
			</xsl:element>
		</xsl:if>
		
	  </li>
	</xsl:template>
	
	
	<xsl:template match="productnumber">
	  <span class="{name(.)}">NCC-<xsl:apply-templates /></span>
	</xsl:template>
	
	<xsl:template match="productname">
	  <span class="{name(.)}">USS <xsl:apply-templates /></span>, 
	</xsl:template>

	<xsl:template match="article//authorgroup" mode="article.titlepage.recto.auto.mode">
		<div xsl:use-attribute-sets="article.titlepage.recto.style">
			<xsl:attribute name="class">authorgroup-wrapper</xsl:attribute>
			<xsl:if test="@role != ''">
				<p class="authorgroup-title"><xsl:value-of select="@role" /></p>
			</xsl:if>
			<xsl:apply-templates select="." mode="article.titlepage.recto.mode"/>
		</div>
	</xsl:template>
	
	<!-- Add the common footer bar, customized for this book. -->
	<xsl:template name="user.footer.content">
		<xsl:call-template name="copyright.bar">
			<xsl:with-param name="pdffile" select="'tm.pdf'"/>
		</xsl:call-template>
	</xsl:template>



	
</xsl:stylesheet>
