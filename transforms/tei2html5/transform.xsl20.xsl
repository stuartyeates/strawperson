<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
		xmlns:tei="http://www.tei-c.org/ns/1.0"
		xmlns="http://www.w3.org/1999/xhtml"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		exclude-result-prefixes='tei xsl'>
  <xsl:output indent="yes" method="xml" omit-xml-declaration="no" encoding="utf-8"  />

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML></xsl:text>
    <html>
      <head>
	<xsl:comment>START blank header content TODO</xsl:comment>
	<meta content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7,chrome=1" />
	<title>TEI-derived HTML4 page</title>
	<meta name="keywords" content="TEI XHTML" />
	<meta name="description" content="TEI XHTML TEI-C" />
	<meta name="robots" content="NOODP" />
	<xsl:comment>END blank header content TODO</xsl:comment>
      </head>

      <body>
	<xsl:apply-templates select="tei:TEI/tei:text"/>
      </body>
    </html>
<xsl:text>
</xsl:text>
  </xsl:template>


  <xsl:template match="tei:div|tei:div0|tei:div1|tei:div2|tei:div3|tei:div4|tei:div5|tei:div6|tei:div7|tei:div7|tei:div8|tei:div9|tei:text|tei:body|tei:front|tei:back">
    <div>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </div>
  </xsl:template>



  <xsl:template match="tei:head">
    <h1>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </h1>
  </xsl:template>

  <xsl:template match="tei:p">
    <p>
      <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
    </p>
  </xsl:template>

 <xsl:template match="@*" priority="-1" mode="copy-attributes-to-class">
   <xsl:copy/>
 </xsl:template>
 
 <xsl:template match="*" priority="-1">
   <span class="{local-name(.)}">
       <xsl:apply-templates select="@*" mode="copy-attributes-to-class"/>
       <xsl:apply-templates select="*|processing-instruction()|comment()|text()"/>
   </span>
 </xsl:template>
 

</xsl:stylesheet>
