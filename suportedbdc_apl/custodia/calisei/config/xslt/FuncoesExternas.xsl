<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Formata valores monetários -->
<xsl:template name="Scientific">
	<xsl:param name="Num"/>
	<xsl:if test="boolean(substring-after($Num,'E+'))">
		<xsl:call-template name="Scientific_Helper">
			<xsl:with-param name="m" select="substring-before($Num,'E+')" />
			<xsl:with-param name="e" select="substring-after($Num,'E+')" />
			<xsl:with-param name="sign">+</xsl:with-param>
		</xsl:call-template>
	</xsl:if>
	<xsl:if test="boolean(substring-after($Num,'E-'))">
		<xsl:call-template name="Scientific_Helper">
			<xsl:with-param name="m" select="substring-before($Num,'E-')" />
			<xsl:with-param name="e" select="substring-after($Num,'E-')" />
			<xsl:with-param name="sign">-</xsl:with-param>
		</xsl:call-template>
	</xsl:if>
	<xsl:if test="not(boolean(substring-after($Num,'E')))">
		<xsl:value-of select="format-number($Num, '###.###.###.##0,00', 'brazil')"/>		
	</xsl:if>
</xsl:template>
<xsl:template name="Scientific_Helper">
	<xsl:param name="m" />
	<xsl:param name="e" />
	<xsl:param name="sign"/>
	<xsl:choose>
		<xsl:when test="$e = 0 or not(boolean($e))">
			<xsl:value-of select="format-number($m, '###.###.###.##0,00', 'brazil')"/>				
		</xsl:when>
		<xsl:when test="$sign = '+'">
			<xsl:call-template name="Scientific_Helper">
				<xsl:with-param name="m" select="$m * 10" />
				<xsl:with-param name="e" select="$e - 1" />
				<xsl:with-param name="sign" select="$sign" />
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="$sign = '-'">
			<xsl:call-template name="Scientific_Helper">
				<xsl:with-param name="m" select="$m div 10" />
				<xsl:with-param name="e" select="$e + 1" />
				<xsl:with-param name="sign" select="$sign"/>
			</xsl:call-template>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<!-- Remove os codigos html -->
<xsl:template name="strip_HTML">
<xsl:param name="value"/>
<xsl:variable name="valueModified">
<xsl:call-template name="SEARCH-AND-REPLACE">
   <xsl:with-param name="string" select="$value" />
   <xsl:with-param name="search-for" select="'&amp;nbsp;'" />
   <xsl:with-param name="replace-with" select="' '" />
</xsl:call-template>
</xsl:variable>

<xsl:choose>
<xsl:when test="contains($valueModified,'&lt;')">
<xsl:value-of select = "substring-before($valueModified,'&lt;')" />  
<xsl:value-of select="substring-before($valueModified,'&lt;')" disable-output-escaping="yes"/>
<xsl:choose>
<xsl:when test="contains(substring-after($valueModified,'&lt;'),'&gt;')">
<xsl:call-template name="strip_HTML">
<xsl:with-param name="value"><xsl:value-of select="substring-after($valueModified,'&gt;')"/></xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$valueModified" disable-output-escaping="yes"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template name="SEARCH-AND-REPLACE">
   <xsl:param name="string" />
   <xsl:param name="search-for" />
   <xsl:param name="replace-with" />
   <xsl:choose>
      <xsl:when test='contains($string,$search-for)'>
	   <xsl:value-of select="substring-before($string,$search-for)"/>
	   <xsl:value-of select="$replace-with"/>
         <xsl:call-template name="SEARCH-AND-REPLACE">
            <xsl:with-param
               name="string"
               select="substring-after($string,$search-for)" />
            <xsl:with-param name="search-for" select="$search-for" />
            <xsl:with-param name="replace-with" select="$replace-with" />
         </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
         <xsl:value-of select="$string" />
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<!-- Formata data (dd/mm/yyyy, dd/mm/yy ou dd/mm) -->
<xsl:template name="formatDate">
    <xsl:param name="dateTime"/>
    <xsl:param name="pattern"/>
    <xsl:variable name="date" select="substring-before($dateTime, 'T')" />
    <xsl:variable name="month" select="substring-before(substring-after($date, '-'), '-')" />
    <xsl:variable name="day" select="substring-after(substring-after($date, '-'), '-')" />
    <xsl:if test="$dateTime != ''">
        <xsl:if test="$pattern = 'dd/mm/yyyy'">
        	<xsl:variable name="year" select="substring-before($date, '-')" />
        	<xsl:value-of select="concat($day, '/', $month, '/', $year)" />
        </xsl:if>
        <xsl:if test="$pattern = 'dd/mm/yy'">
        	<xsl:variable name="yearTemp" select="substring-before($date, '-')" />
        	<xsl:variable name="year" select="substring($yearTemp, 3, 4)" />
        	<xsl:value-of select="concat($day, '/', $month, '/', $year)" />
        </xsl:if>
        <xsl:if test="$pattern = 'dd/mm'">
        	<xsl:value-of select="concat($day, '/', $month)" />
        </xsl:if>
    </xsl:if>
</xsl:template>

<!-- Formata hora (HH'h'mm) -->
<xsl:template name="formatTime">
	<xsl:param name="dateTime" />
	<xsl:variable name="temp" select="substring-after($dateTime, 'T')" />
    <xsl:variable name="hour" select="substring($temp, 1, 2)" />
    <xsl:variable name="minute" select="substring($temp, 4, 2)" />
    <xsl:value-of select="concat($hour, 'h', $minute)" />
</xsl:template>

<!-- Calcula dígito da conta -->
<xsl:template name="gerarDAC">
	<xsl:param name="numConta"/>
	<xsl:call-template name="calculaModulo11">
		<xsl:with-param name="umValor" select="$numConta"/>
		<xsl:with-param name="pesoMaximo">7</xsl:with-param>
		<xsl:with-param name="lsoma">0</xsl:with-param>
		<xsl:with-param name="ipeso">2</xsl:with-param>
	</xsl:call-template>
</xsl:template>
<!-- Calcula módulo 11 -->
<xsl:template name="calculaModulo11">
	<xsl:param name="umValor"/>
	<xsl:param name="pesoMaximo"/>
	<xsl:param name="lsoma"/>
	<xsl:param name="ipeso" />
	<xsl:variable name="zero">0</xsl:variable>
	<xsl:variable name="digito">
		<xsl:call-template name="obtemUltimoDigito">
			<xsl:with-param name="string" select="$umValor"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="valor">
		<xsl:call-template name="obtemValor">
			<xsl:with-param name="string" select="$umValor"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="lsoma2" select="($lsoma + ($digito * $ipeso))"/>
	
	<xsl:if test="$valor != ''">
		<xsl:if test="$ipeso >= $pesoMaximo">
			<xsl:call-template name="calculaModulo11">
				<xsl:with-param name="umValor" select="$valor"/>
				<xsl:with-param name="pesoMaximo" select="$pesoMaximo" />
				<xsl:with-param name="lsoma" select="$lsoma2" />
				<xsl:with-param name="ipeso">2</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="$ipeso &lt; $pesoMaximo">
			<xsl:call-template name="calculaModulo11">
				<xsl:with-param name="umValor" select="$valor"/>
				<xsl:with-param name="pesoMaximo" select="$pesoMaximo" />
				<xsl:with-param name="lsoma" select="$lsoma2" />
				<xsl:with-param name="ipeso" select="$ipeso + 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$valor = ''">
		<xsl:variable name="digConta" select="11 - ($lsoma2 mod 11)"/>
		<xsl:choose>
			<xsl:when test="$digConta = 11 or $digConta = 10">
				<xsl:value-of select="$zero"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$digConta"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:if>
</xsl:template>
<!-- Obtém o ultimo caractere -->
<xsl:template name="obtemUltimoDigito">
	<xsl:param name="string"/>
	<xsl:value-of select="substring($string, string-length($string))"/>
</xsl:template>
<!-- Obtém o valor sem o último caractere -->
<xsl:template name="obtemValor">
	<xsl:param name="string"/>
	<xsl:value-of select="substring($string, 1, (string-length($string)-1))"/>
</xsl:template>

<!-- labels de conta bloqueada -->
<xsl:template name="informacaoContaBloqueada">
<xsl:param name="chave"/>
<xsl:variable name="label.conta.corrente.bloqueada">Conta Corrente bloqueada</xsl:variable>
<xsl:variable name="label.conta.corrente.nao.habilitada">Conta Corrente não habilitada</xsl:variable>
<xsl:variable name="label.conta.corrente.bloqueio.judicial">Conta Corrente bloqueada judicialmente</xsl:variable>
<xsl:variable name="label.conta.corrente.bloqueio.administrativo">Conta Corrente bloqueada administrativamente e judicialmente</xsl:variable>
<xsl:variable name="label.conta.poupanca.bloqueada">Conta Poupança bloqueada</xsl:variable>
<xsl:variable name="label.conta.poupanca.nao.habilitada">Conta Poupança não habilitada</xsl:variable>
<xsl:variable name="label.conta.poupanca.bloqueio.judicial">Conta Poupança bloqueada judicialmente</xsl:variable>
<xsl:variable name="label.conta.poupanca.bloqueio.administrativo">Conta Poupança bloqueada administrativamente e judicialmente</xsl:variable>
<xsl:variable name="label.conta.bloqueada">Conta bloqueada</xsl:variable>
<xsl:variable name="label.conta.nao.habilitada">Conta não habilitada</xsl:variable>
<xsl:variable name="label.conta.bloqueio.judicial">Conta bloqueada judicialmente</xsl:variable>
<xsl:variable name="label.conta.bloqueio.administrativo">Conta com bloqueio administrativo</xsl:variable>

<xsl:if test="$chave = 'label.conta.corrente.bloqueada'">
<xsl:value-of select="$label.conta.corrente.bloqueada"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.corrente.nao.habilitada'">
<xsl:value-of select="$label.conta.corrente.nao.habilitada"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.corrente.bloqueio.judicial'">
<xsl:value-of select="$label.conta.corrente.bloqueio.judicial"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.corrente.bloqueio.administrativo'">
<xsl:value-of select="$label.conta.corrente.bloqueio.administrativo"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.poupanca.bloqueada'">
<xsl:value-of select="$label.conta.poupanca.bloqueada"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.poupanca.nao.habilitada'">
<xsl:value-of select="$label.conta.poupanca.nao.habilitada"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.poupanca.bloqueio.judicial'">
<xsl:value-of select="$label.conta.poupanca.bloqueio.judicial"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.poupanca.bloqueio.administrativo'">
<xsl:value-of select="$label.conta.poupanca.bloqueio.administrativo"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.bloqueada'">
<xsl:value-of select="$label.conta.bloqueada"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.nao.habilitada'">
<xsl:value-of select="$label.conta.nao.habilitada"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.bloqueio.judicial'">
<xsl:value-of select="$label.conta.bloqueio.judicial"/>
</xsl:if>

<xsl:if test="$chave = 'label.conta.bloqueio.administrativo'">
<xsl:value-of select="$label.conta.bloqueio.administrativo"/>
</xsl:if>
</xsl:template>

<!-- Template agencia e conta Tabela -->
<xsl:template name="templateAgenciaContaTabela">
<xsl:param name="conta"/>
<xsl:value-of select="$conta/@agencia"/><xsl:text> | </xsl:text><xsl:value-of select="$conta/@num-conta"/>-<xsl:call-template name="gerarDAC"><xsl:with-param name="numConta" select="$conta/@num-conta"/></xsl:call-template>
</xsl:template>

</xsl:stylesheet>
