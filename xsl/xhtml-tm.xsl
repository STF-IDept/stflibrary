<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:cf="http://docbook.sourceforge.net/xmlns/chunkfast/1.0" xmlns="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="cf exsl">

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

  <xsl:template match="simplelist[@role='ShipListEnt']/member">
    <li class="{name(.)}">
    <xsl:attribute name="class">
      <xsl:value-of select="@role" /><xsl:text> </xsl:text><xsl:value-of select="name(.)" />
    </xsl:attribute>
    <xsl:apply-templates mode="Ent" />
    <xsl:if test="@role = 'NPC'">
      <xsl:element name="span">
        <xsl:attribute name="class">NPC-marker</xsl:attribute>
        <xsl:text> (NPC)</xsl:text>
      </xsl:element>
    </xsl:if>
    </li>
  </xsl:template>

  <xsl:template match="productnumber" mode="Ent">
    <span class="{name(.)}">NC-<xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template match="productname" mode="Ent">
    <span class="{name(.)}">SS <xsl:apply-templates /></span>,
  </xsl:template>

  <xsl:template match="article//keywordset" mode="article.titlepage.recto.auto.mode">
    <dl class="classification">
      <xsl:apply-templates select="keyword" mode="article.titlepage.recto.mode" />
    </dl>
  </xsl:template>

  <xsl:template match="keywordset/keyword" mode="article.titlepage.recto.mode">
    <xsl:if test="@role != ''">
      <dt><xsl:value-of select="@role" /></dt>
      <dd><xsl:apply-templates mode="article.titlepage.recto.mode"/></dd>
    </xsl:if>
  </xsl:template>

  <xsl:template match="article//authorgroup" mode="article.titlepage.recto.auto.mode">
    <div class="group-wrapper">
      <div xsl:use-attribute-sets="article.titlepage.recto.style">
        <xsl:attribute name="class">authorgroup-wrapper</xsl:attribute>
        <xsl:if test="@role != ''">
          <p class="authorgroup-title"><xsl:value-of select="@role" /></p>
        </xsl:if>
        <xsl:apply-templates select="." mode="article.titlepage.recto.mode"/>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
