<xsl:stylesheet  version="1.0"
		 xmlns:tei="http://www.tei-c.org/ns/1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		 >
  
  <xsl:template match="tei:TEI">
    <xsl:apply-templates select="tei:text"/>
  </xsl:template>
  
  <xsl:template match="@*|node()" priority="-1">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()|text()"/>
    </xsl:copy>
  </xsl:template>


</xsl:stylesheet>