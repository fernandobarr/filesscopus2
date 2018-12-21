<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<link rel="stylesheet" href="<nedc:estaticpath path="manutencaoFiltros.css" type="estilo" />" type="text/css"/>
<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript" />"></script>
<script type="text/javascript" src="<nedc:estaticpath path="numeric.js" type="javascript" />"></script>
<script type="text/javascript" src="<nedc:estaticpath path="currency.js" type="javascript" />"></script>
<script type="text/javascript" src="<nedc:estaticpath path="manutencaoFiltros.js" type="javascript" />"></script>

<html:form action="ConfirmarIncluirDispositivoServicoContabil" method="post">
	<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
	<html:hidden name="incluirParametrizacaoContabilForm" property="senhaGestor"/>

	<TABLE cellSpacing=2 cellPadding=2 width="95%" border=0 align="center" id="tabelaZebrada">
		<thead class="textos">
			<TR class="textoBranco" bgcolor="#828282">
				<TD colspan="2">&nbsp;</TD>
				<TD colspan="3">ASSINATURA ISOLADA</TD>
			  	<TD colspan="3">ASSINATURA CONJUNTA</TD>
			</TR>
			<tr bgcolor="#cccccc">
				<td rowspan="2">Serviço</td>
				<td rowspan="2">Valor</td>
				<td rowspan="2">Lote - OTP <br/>Simples</td>
				<td colspan="2">Validação Valor Superior <br/>Assinatura</td>
				<td rowspan="2">Lote - OTP <br/>Simples</td>
				<td colspan="2">Validação Valor Superior <br/>Assinatura</td>
			</tr>
			<tr bgcolor="#cccccc">
				<td>Unitária</td>
				<td>Lote</td>
				<td>Unitária</td>
				<td>Lote</td>
			</tr>
		</thead>
		<TBODY class="textos">
			<tr>
				<td>
					<html:select name="incluirParametrizacaoContabilForm" property="servicoEscolhido" styleClass="combos">
						<%-- <html:option value="0">Selecione o serviço</html:option> --%>
						<html:optionsCollection name="incluirParametrizacaoContabilForm" property="listaServicoTO" label="descricao" value="numeroConfig" />
					</html:select>
				</td>
				<td>R$ <html:text name="incluirParametrizacaoContabilForm" property="valor" styleClass="valor inputCurrency"></html:text></td>
				<td><html:checkbox name="incluirParametrizacaoContabilForm" property="assinaturaIsoladaLoteSimples" value="true"/></td>
				<td><html:checkbox name="incluirParametrizacaoContabilForm" property="assinaturaIsoladaSuperiorUnitaria" value="true"/></td>
				<td><html:checkbox name="incluirParametrizacaoContabilForm" property="assinaturaIsoladaSuperiorLote" value="true"/></td>
				<td><html:checkbox name="incluirParametrizacaoContabilForm" property="assinaturaConjuntaLoteSimples" value="true"/></td>
				<td><html:checkbox name="incluirParametrizacaoContabilForm" property="assinaturaConjuntaSuperiorUnitaria" value="true"/></td>
				<td><html:checkbox name="incluirParametrizacaoContabilForm" property="assinaturaConjuntaSuperiorLote" value="true"/></td>
			</tr>
		</TBODY>
	</TABLE>
</html:form>
<br/>
<br/>

<%@ include file="../senha.jsp" %>
<br/>
                 
<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<html:link action="ManutencaoDispositivoSegurancaContabil" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link>
			<a href="Javascript: validarValor();"><img src="<nedc:estaticpath path="bt_confirmar.gif" type="imagem" />" border=0></a>
		</td>
    </tr>
</table>
