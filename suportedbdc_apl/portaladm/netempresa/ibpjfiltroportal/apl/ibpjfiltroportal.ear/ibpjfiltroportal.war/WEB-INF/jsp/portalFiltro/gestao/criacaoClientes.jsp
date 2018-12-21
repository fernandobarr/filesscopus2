<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript" />"></script>
<script>
function validarForm() {
	if (jQuery("#comboFiltros")[0].selectedIndex == 0) {
		alert("Selecione o filtro desejado.");
	} else if (jQuery(":radio:checked").length == 0) {
		alert("Selecione o tipo de inclusão.");
	} else {
		document.forms[0].submit();
	}
}
</script>

<html:form action="InclusaoClientes" method="post">
<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">

<table align="center" border="0" cellpadding="2" cellspacing="2">
	<tbody>
		<tr class="textos">
			<td align="left"><b>Selecione o filtro desejado:</b></td>
			<td align="left">
				<html:select property="filtroEscolhido" styleClass="combos" styleId="comboFiltros">
					<html:option value="0">Selecione o filtro</html:option>
					<html:optionsCollection name="criacaoClientesForm" property="listaFiltro" label="nome" value="codigo" />
				</html:select>
			</td>
		</tr>
		<tr class="textos" align="center">
			<td colspan="2" align="left">
				<br/>
				<br/>
				<br/> 
				<b>Selecione o tipo de inclusão:</b>
			</td>
		</tr>
		<tr class="textos">
			<td colspan="2" align="left">
				<html:radio name="criacaoClientesForm" property="tipoInclusao" value="inclusaoCnpjCpf" /> Por CNPJ e CPF<br/>
				<html:radio name="criacaoClientesForm" property="tipoInclusao" value="inclusaoIntervaloAgencias" /> Por intervalo de agência<br/> 
				<html:radio name="criacaoClientesForm" property="tipoInclusao" value="inclusaoCargaArquivo" /> Por carga de arquivo<br/>
				<html:radio name="criacaoClientesForm" property="tipoInclusao" value="inclusaoIntervaloContratos" /> Por intervalo de número de contrato
			</td>
		</tr>
	</tbody>
</table>

<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<br/>
			<br/> 
			<html:link action="MenuGestaoFiltros" paramId="CTRL" paramName="CTRL">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link> 
			<a href="Javascript: validarForm();"><img src="<nedc:estaticpath path="bt_incluir.gif" type="imagem" />" border=0></a>
		</td>
	</tr>
</table>
</html:form>