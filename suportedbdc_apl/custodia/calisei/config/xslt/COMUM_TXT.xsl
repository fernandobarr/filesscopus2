<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="FuncoesExternas.xsl"/>

<!-- Template agencia e conta -->
<xsl:template name="templateAgenciaConta">
<xsl:param name="titulo"/>
<xsl:param name="conta"/>
<xsl:value-of select="$titulo"/>: Agência: <xsl:value-of select="$conta/@agencia"/>  Conta: <xsl:value-of select="$conta/@num-conta"/>-<xsl:call-template name="gerarDAC"><xsl:with-param name="numConta" select="$conta/@num-conta"/></xsl:call-template>
</xsl:template>

</xsl:stylesheet>