<?xml version='1.0'?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Set the stylesheet to use for the entire library. We'll set book-specific ones later. -->
  <xsl:param name="html.stylesheet" select="'../styles/main.css'" />

  <!-- Speeds up chunking under Xalan, Saxon. -->
  <xsl:param name="chunk.fast" select="1" />

  <!-- Sets the starting directory for the whole tree's output. -->
<!--   <xsl:param name="base.dir" select="'output/'" /> -->

  <!-- Pretty-print the output. -->
  <xsl:param name="chunker.output.indent" select="'yes'" />

  <!-- Specify the necessary DocType to make IE behave like a browser instead of a pile of crap. -->
<!--  <xsl:param name="chunker.output.doctype-public" select="'-//W3C//DTD XHTML 1.0 Strict//EN'" />-->
<!--  <xsl:param name="chunker.output.doctype-system" select="'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'" />-->

  <!-- Don't make each sect1 its own file, only chapters/articles. -->
  <xsl:param name="chunk.section.depth" select="0" />

  <!-- Base filenames off of ids instead of ugly strings. -->
  <xsl:param name="use.id.as.filename" select="1" />

  <!-- Turn off automatic style attributes. -->
  <xsl:param name="css.decoration" select="0" />

  <!-- Disable auto-numbering of chapters and sections unless we say otherwise. -->
  <xsl:param name="chapter.autolabel" select="0" />
  <xsl:param name="section.autolabel" select="0" />
  <xsl:param name="section.autolabel.max.depth" select="0" />

  <!-- Get rid of the silly period after honorifics. -->
  <xsl:param name="punct.honorific" /> <!-- set it to empty string, select="" didn't work -->

  <xsl:param name="img.src.path" select="''" />

  <!-- Any custom templates we need go here. -->

  <!-- Disable the body element attributes that are not strict-complaint. -->
  <xsl:template name="body.attributes">
  <!--   <xsl:attribute name="bgcolor">white</xsl:attribute> -->
  <!--   <xsl:attribute name="text">black</xsl:attribute> -->
  <!--   <xsl:attribute name="link">#0000FF</xsl:attribute> -->
  <!--   <xsl:attribute name="vlink">#840084</xsl:attribute> -->
  <!--   <xsl:attribute name="alink">#0000FF</xsl:attribute> -->
  </xsl:template>

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

  <!-- Add some copyright and standard-bragging stuff to every page. -->
  <xsl:template name="copyright.bar">
    <xsl:param name="pdffile" select="'moo'" />
    <div class="user-footer-content">
      <div id="copyright">&#x00A9; 2005-2009 star-fleet.com and its members</div>
      <div class="brag-buttons">
        <a href="http://www.w3.org/TR/html4/"><img src="../images/button-html.png" alt="Valid HTML 4.01 Transitional" /></a>
        <xsl:text>&#160;</xsl:text>
        <a href="http://www.w3.org/Style/CSS/"><img src="../images/button-css.png" alt="Valid CSS 2.0" /></a>
        <xsl:text>&#160;</xsl:text>
        <a href="http://www.docbook.org/"><img src="../images/button-docbook.png" alt="Build with DocBook" /></a>
        <xsl:text>&#160;</xsl:text>
        <a href="http://docbook.sourceforge.net/"><img src="../images/button-xsl.png" alt="Built with XSL" /></a>
        <xsl:text>&#160;</xsl:text>
        <a href="http://www.getfirefox.com/">
          <img border="0" alt="Get Firefox!" title="Get Firefox!" src="http://sfx-images.mozilla.org/affiliates/Buttons/80x15/white_2.gif"/>
        </a>
      </div>
      <br />
      <!--<div class="pdflink">
        <xsl:element name="a">
          <xsl:attribute name="href">../pdf/<xsl:value-of select="$pdffile"/></xsl:attribute>
          PDF version available
        </xsl:element>
      </div> -->
    </div>
  </xsl:template>

</xsl:stylesheet>
