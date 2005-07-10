<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:exsl="http://exslt.org/common"
				version="1.0"
				exclude-result-prefixes="exsl">

<!--
This file copied from html/chunk.xsl and modified to import our customized rules.
See http://www.sagehill.net/docbookxsl/ChunkingCustomization.html
-->

<xsl:import href="html-set-customizations.xsl"/>
<xsl:import href="chunk-common.xsl"/>
<xsl:include href="manifest.xsl"/>
<xsl:include href="chunk-code.xsl"/>

<!-- And add in our custom title pages. -->
<xsl:include href="html-titlepage-templates.xsl"/>

</xsl:stylesheet>
