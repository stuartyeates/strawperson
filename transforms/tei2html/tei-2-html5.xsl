<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
		xmlns:html="http://www.w3.org/1999/xhtml"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" omit-xml-declaration="yes" />
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML></xsl:text>
    <html:html>
      <html:body>
	<xsl:apply-templates select="tei:text/tei:body"/>
      </html:body>
    </html:html>
  </xsl:template>


  <xsl:template match="tei:div">
    <html:div>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </html:div>
  </xsl:template>

  <xsl:template match="tei:p">
    <html:p>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </html:p>
  </xsl:template>

</xsl:stylesheet>
