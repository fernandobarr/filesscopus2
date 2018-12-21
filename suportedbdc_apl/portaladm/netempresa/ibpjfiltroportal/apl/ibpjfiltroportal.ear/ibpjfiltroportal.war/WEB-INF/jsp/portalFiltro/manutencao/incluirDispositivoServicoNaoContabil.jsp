<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>
<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript" />"></script>
<script>
function validarInclusao() {
	if (jQuery(".combos").val() == 0) {
		alert("Selecione o serviço que deseja incluir.");
		return false;
	} 
	return true;
}
</script>

<link rel="stylesheet" href="<nedc:estaticpath path="manutencaoFiltros.css" type="estilo" />" type="text/css"/>

<html:form action="ConfirmarIncluirDispositivoServicoNaoContabil" method="post">
<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
<html:hidden name="incluirParametrizacaoForm" property="senhaGestor"/>
<table border="0" align="center">
	<tr class="textos">
		<td align="right">Serviço:</td>
		<td>
			<html:select name="incluirParametrizacaoForm" property="servicoEscolhido" styleClass="combos">
				<html:option value="0">Selecione o serviço</html:option>
				<html:optionsCollection name="incluirParametrizacaoForm" property="listaServicoTO" label="descricao" value="numeroConfig" />
			</html:select>
		</td>
	</tr>
	<tr class="textos">
		<td colspan="2"><br/></td>
	</tr>
	<tr class="textos">
		<td align="right">Assinatura Isolada:</td>
		<td><html:checkbox  name="incluirParametrizacaoForm" property="assinaturaIsolada" value="true" /> Assinatura</td>
	</tr>
	<tr class="textos">
		<td align="right">Assinatura Conjunta:</td>
		<td><html:checkbox  name="incluirParametrizacaoForm" property="assinaturaConjunta" value="true" /> Assinatura</td>
	</tr>
</table>
</html:form>

<br/>
<%@ include file="../senha.jsp" %>
<br/>

<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<html:link action="ManutencaoDispositivoSegurancaNaoContabil" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link>
			<a href="Javascript: if(validarInclusao()) VrfFrm(this);"><img src="<nedc:estaticpath path="bt_confirmar.gif" type="imagem" />" border=0></a>
		</td>
    </tr>
</table>
