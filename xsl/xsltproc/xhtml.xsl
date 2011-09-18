<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:cf="http://docbook.sourceforge.net/xmlns/chunkfast/1.0" xmlns="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="cf exsl">

  <!-- Import the chunkfast version of the XHTML templates as a starting point. -->
  <xsl:import href="../docbook/xhtml/chunkfast.xsl"/>

  <!-- Now import our customizations.  Note that this import must appear second
       so that it takes precedence over chunkfast's templates. -->
  <xsl:import href="xhtml-customizations.xsl"/>

  <!--
    I don't fully understand why these work, but you need both of them. This
    limits the TOC depth for both set and book to 2, so you only see the top most
    sections at any given level.
  -->
  <xsl:param name="toc.max.depth" select="2"/>
  <xsl:param name="toc.section.depth" select="2"/>

  <!-- Set the stylesheet to use for the entire library. We'll set book-specific ones later. -->
  <xsl:param name="html.stylesheet" select="'styles/main.css'" />

  <!-- Sets the starting directory for the whole tree's output. -->
<!--   <xsl:param name="base.dir" select="'build/'" /> -->

  <!-- Pretty-print the output. -->
  <xsl:param name="chunker.output.indent" select="'yes'" />
  <!-- Don't make each sect1 its own file, only chapters/articles. -->
  <xsl:param name="chunk.section.depth" select="0" />

  <!-- Base filenames off of ids instead of ugly strings. -->
  <xsl:param name="use.id.as.filename" select="1" />

  <!-- Turn off automatic style attributes. -->
  <xsl:param name="css.decoration" select="0" />

  <!-- Disable auto-numbering of chapters and sections unless we say otherwise. -->
  <xsl:param name="chapter.autolabel" select="0" />
  <xsl:param name="part.autolabel" select="0" />
  <xsl:param name="article.autolabel" select="0" />
  <xsl:param name="section.autolabel" select="0" />
  <xsl:param name="section.autolabel.max.depth" select="0" />

  <!-- Get rid of the silly period after honorifics. -->
  <xsl:param name="punct.honorific" /> <!-- set it to empty string, select="" didn't work -->

  <xsl:param name="img.src.path" select="''" />

  <xsl:param name="generate.toc">
  appendix  toc,title
  article/appendix  nop
  article   toc,title
  book      toc,title
  part      toc,title
  preface   toc,title
  qandadiv  toc
  qandaset  toc
  reference toc,title
  set       toc,title
  </xsl:param>


</xsl:stylesheet>
