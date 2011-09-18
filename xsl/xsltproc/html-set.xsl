<?xml version="1.0" encoding="ASCII"?>
<!--This file was created automatically by html2xhtml-->
<!--from the HTML stylesheets.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:cf="http://docbook.sourceforge.net/xmlns/chunkfast/1.0" xmlns="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="cf exsl">

<!-- ********************************************************************
     $Id: chunkfast.xsl 8345 2009-03-16 06:44:07Z bobstayton $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://docbook.sf.net/release/xsl/current/ for
     copyright and other information.

     ******************************************************************** -->

<!-- ==================================================================== -->


  <xsl:import href="html-set-customizations.xsl"/>

<xsl:import href="../docbook/xhtml/chunk.xsl"/>


<xsl:param name="chunk.fast" select="1"/>

  <!--
    This file is a copy-paste-modify from xhtml/chunkfast.xsl.  The following
    customizations are all we're adding.  Arguably they could be put into a build
    script, but why the heck would we want these in the make file?
  -->

  <!--
    I don't fully understand why these work, but you need both of them. This
    limits the TOC depth for both set and book to 2, so you only see the top most
    sections at any given level.
  -->
  <xsl:param name="toc.max.depth" select="2"/>
  <xsl:param name="toc.section.depth" select="2"/>

  <!-- Set the stylesheet to use for the entire library. We'll set book-specific ones later. -->
  <xsl:param name="html.stylesheet" select="'../styles/main.css'" />

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

  <!-- END CUSTOMIZATIONS -->

<xsl:variable name="chunks" select="exsl:node-set($chunk.hierarchy)//cf:div"/>

<!-- ==================================================================== -->

<xsl:template name="process-chunk-element">
  <xsl:choose>
    <xsl:when test="$chunk.fast != 0 and $exsl.node.set.available != 0">
      <xsl:variable name="genid" select="generate-id()"/>

      <xsl:variable name="div" select="$chunks[@id=$genid or @xml:id=$genid]"/>

      <xsl:variable name="prevdiv" select="($div/preceding-sibling::cf:div|$div/preceding::cf:div|$div/parent::cf:div)[last()]"/>
      <xsl:variable name="prev" select="key('genid', ($prevdiv/@id|$prevdiv/@xml:id)[1])"/>

      <xsl:variable name="nextdiv" select="($div/following-sibling::cf:div|$div/following::cf:div|$div/cf:div)[1]"/>
      <xsl:variable name="next" select="key('genid', ($nextdiv/@id|$nextdiv/@xml:id)[1])"/>

      <xsl:choose>
        <xsl:when test="$onechunk != 0 and parent::*">
          <xsl:apply-imports/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="process-chunk">
            <xsl:with-param name="prev" select="$prev"/>
            <xsl:with-param name="next" select="$next"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$onechunk != 0 and not(parent::*)">
          <xsl:call-template name="chunk-all-sections"/>
        </xsl:when>
        <xsl:when test="$onechunk != 0">
          <xsl:apply-imports/>
        </xsl:when>
        <xsl:when test="$chunk.first.sections = 0">
          <xsl:call-template name="chunk-first-section-with-parent"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="chunk-all-sections"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
