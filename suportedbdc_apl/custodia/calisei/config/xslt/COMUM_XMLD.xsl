<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml"
	xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w10="urn:schemas-microsoft-com:office:word"
	xmlns:aml="http://schemas.microsoft.com/aml/2001/core" xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint"
	xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
	xmlns:sl="http://schemas.microsoft.com/schemaLibrary/2003/core"
	xmlns:doc="http://www.oasis-open.org/docbook/xml/4.0"
	exclude-result-prefixes="doc">
<xsl:import href="FuncoesExternas.xsl"/>

<!-- Template agencia e conta -->
<xsl:template name="templateAgenciaConta">
<xsl:param name="titulo"/>
<xsl:param name="conta"/>
<w:p>
	<w:pPr>
		<w:pStyle w:val="titulo.agencia.conta"/>
	</w:pPr>
	<w:r>
		<w:t><xsl:value-of select="$titulo"/>: Agência: <xsl:value-of select="$conta/@agencia"/>  Conta: <xsl:value-of select="$conta/@num-conta"/>-<xsl:call-template name="gerarDAC"><xsl:with-param name="numConta" select="$conta/@num-conta"/></xsl:call-template></w:t>
		<w:br w:type="text-wrapping"/>
	</w:r>
</w:p>
</xsl:template>

</xsl:stylesheet>