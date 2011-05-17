<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Import the base stylesheet to modify. -->
  <!-- We import the non-chunk version to customize, then this file
    gets imported by another that links it up with the chunker. -->
  <xsl:import href="docbook.xsl"/>

  <!-- And add in our custom title pages. -->
  <xsl:include href="html-titlepage-templates.xsl"/>


  <!-- Import our common settings for all books. -->
<!--   <xsl:import href="html-common.xsl"/> -->

  <!-- Additional stylesheet parameters. -->
<!--   <xsl:param name="html.stylesheet" select="'styles/library.css'" /> -->

  <!-- Any custom templates we need go here. -->

  <!-- Get rid of the silly period after honorifics. -->
  <xsl:param name="punct.honorific" /> <!-- set it to empty string, select="" didn't work -->


</xsl:stylesheet>
