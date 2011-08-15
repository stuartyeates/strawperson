<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
		xmlns:tei="http://www.tei-c.org/ns/1.0"
		xmlns:html="http://www.w3.org/1999/xhtml"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" omit-xml-declaration="yes" />

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML></xsl:text>
    <html:html>
      <html:head>
	<xsl:comment>START blank header content TODO</xsl:comment>
	<meta content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7,chrome=1" />
	<title>TEI-derived HTML4 page</title>
	<meta name="keywords" content="TEI XHTML" />
	<meta name="description" content="TEI XHTML TEI-C" />
	<meta name="robots" content="NOODP" />
	<xsl:comment>END blank header content TODO</xsl:comment>
      </html:head>

      <html:body>
	<xsl:apply-templates select="tei:TEI/tei:text"/>
      </html:body>
    </html:html>
<xsl:text>
</xsl:text>
  </xsl:template>


  <xsl:template match="tei:div|tei:div0|tei:div1|tei:div2|tei:div3|tei:div4|tei:div5|tei:div6|tei:div7|tei:div7|tei:div8|tei:div9|tei:text|tei:front|tei:back">
    <html:div>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </html:div>
  </xsl:template>



  <xsl:template match="tei:head">
    <html:h1>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </html:h1>
  </xsl:template>

  <xsl:template match="tei:p">
    <html:p>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </html:p>
  </xsl:template>

 <xsl:template match="*" priority="-1">
   <html:span class="{local-name(.)}">
       <xsl:apply-templates select="*|@*|processing-instruction()|comment()|text()"/>
   </html:span>
 </xsl:template>
 

</xsl:stylesheet>
