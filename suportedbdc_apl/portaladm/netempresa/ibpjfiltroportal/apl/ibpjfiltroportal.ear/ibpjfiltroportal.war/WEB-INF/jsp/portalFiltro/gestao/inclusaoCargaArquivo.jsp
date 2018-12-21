<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc"%>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<script>
function escolherArquivo() {
	document.getElementById("bt_file").click();
}
function arquivoExcolhido(element) {
	document.getElementById("caminho_arquivo").value = element.value;
}
</script>

<table width="40%" align="center" border="0">
	<tbody>
		<tr>
			<td colspan="2" class="textosBrancos" height="30">&nbsp;</td>
		</tr>
		<tr class="textoBranco" bgcolor="#828282">
			<td colspan="2" class="textosBrancos" height="20">
				<b>Filtro do Dispositivo de Segurança nas transações Net Empresa</b>
			</td>
		</tr>
		<tr height="20" bgcolor="#ebebeb" class="textos">
			<td width="60" align="center">Arquivo</td>
			<td bgcolor="#ebebeb">
				<input disabled="disabled" id="caminho_arquivo" type="text" 
					style="background-color: #ebebeb; border: 1px solid #cccccc; width: 300px; vertical-align: top;"/>
				<input src="<nedc:estaticpath path="bt_procurar.gif" type="imagem" />" onclick="escolherArquivo();" type="image"/>
				<input style="display: none;" id="bt_file" onchange="arquivoExcolhido(this);" type="file"/>
			</td>
		</tr>
	</tbody>
</table>
<br/>
<table align="center">
	<tr class="textos" height="20" bgcolor="#ebebeb">
		<td width="35%" align="left">Senha:</td>
		<td align="left"><input type="password"/></td>
	</tr>
</table>
<br/>
<table align="center">
	<tbody>
		<tr>
			<td>
				<html:link action="CriacaoClientes" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
					<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
				</html:link> 
				<html:link action="InclusaoCargaArquivo" paramId="CTRL" paramName="CTRL" style="padding-left: 5px;">
					<img src="<nedc:estaticpath path="bt_confirmar.gif" type="imagem" />" border="0">
				</html:link>
			</td>
		</tr>
	</tbody>
</table>
