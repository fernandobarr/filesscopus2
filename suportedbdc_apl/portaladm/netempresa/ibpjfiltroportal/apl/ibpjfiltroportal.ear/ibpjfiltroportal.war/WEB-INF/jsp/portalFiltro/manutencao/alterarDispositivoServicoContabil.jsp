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

<script>
jQuery(window).load(function() {
	jQuery(":text.valor").blur(function() {
		jQuery(":hidden.valor").val(jQuery(this).val());
	});
});
</script>

<html:form action="ConfirmarAlterarContabil" method="post" styleId="formAlteracao">
<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
<html:hidden name="manutencaoContabilForm" property="senhaGestor"/>
<html:hidden name="manutencaoContabilForm" property="valorAlteracao" styleClass="valor"/>
<html:hidden name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosLoteInferiorLimiteIsolada" styleClass="isoladaLoteSimples"/>
<html:hidden name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosIsoladaSuperiorLimiteIsolada" styleClass="isoladaSuperiorUnitaria"/>
<html:hidden name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosLoteSuperiorLimiteIsolada" styleClass="isoladaSuperiorLote"/>
<html:hidden name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosLoteInferiorLimiteConjunta" styleClass="conjuntaLoteSimples"/>
<html:hidden name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosIsoladaSuperiorLimiteConjunta" styleClass="conjuntaSuperiorUnitaria"/>
<html:hidden name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosLoteSuperiorLimiteConjunta" styleClass="conjuntaSuperiorLote"/>

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
			<td><bean:write name="manutencaoContabilForm" property="servicoSelecionado.servico.descricao"/></td>
			<td>R$ <html:text name="manutencaoContabilForm" property="valorAlteracao" styleClass="valor inputCurrency"></html:text></td>
			<td><html:checkbox name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosLoteInferiorLimiteIsolada" styleClass="isoladaLoteSimples"/></td>
			<td><html:checkbox name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosIsoladaSuperiorLimiteIsolada" styleClass="isoladaSuperiorUnitaria"/></td>
			<td><html:checkbox name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosLoteSuperiorLimiteIsolada" styleClass="isoladaSuperiorLote" /></td>
			<td><html:checkbox name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosLoteInferiorLimiteConjunta" styleClass="conjuntaLoteSimples"/></td>
			<td><html:checkbox name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosIsoladaSuperiorLimiteConjunta" styleClass="conjuntaSuperiorUnitaria"/></td>
			<td><html:checkbox name="manutencaoContabilForm" property="servicoSelecionado.chaveSeisDigitosLoteSuperiorLimiteConjunta" styleClass="conjuntaSuperiorLote"/></td>
		</tr>
	</TBODY>
</TABLE>
<br/>
<br/>
</html:form>

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
