<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc"%>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<table width="55%" align="center" border="0">
	<tbody>
		<tr>
			<td colspan="3" class="textosBrancos" height="30">&nbsp;</td>
		</tr>
		<tr class="textoBranco" bgcolor="#828282">
			<td colspan="3" class="textosBrancos" height="20">
				<b>Filtro do Dispositivo de Segurança nas transações Net Empresa</b>
			</td>
		</tr>
		<tr height="20" bgcolor="#ebebeb" class="textos">
			<td align="center">
				CNPJ <input name="CNPJ" size="11" maxlength="14" value="" style="width: 130px" type="text"/>
			</td>
			<td bgcolor="#ebebeb">
				CPF <input name="CPF" size="11" maxlength="11" value="" style="width: 130px" type="text"/>
			</td>
			<td class="textos" align="center">
				Status: 
				<select class="combos">
					<option value="1">Pendentes de inclusão</option>
					<option value="2">Incluidos</option>
					<option value="3">Pendentes de exclusão</option>
					<option value="4">Excluidos</option>
				</select>
			</td>
		</tr>

	</tbody>
</table>
<br/>
<br/>
<table align="center">
	<tbody>
		<tr>
			<td align="center">
				<html:link action="ManutencaoClientes" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
					<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
				</html:link> 
				<input src="<nedc:estaticpath path="bt_limpar.gif" type="imagem" />" style="margin: 0 5px;" onclick="document.forms[0].reset();" type="image" /> 
				<html:link action="ManutencaoClientesCnpjCpf" paramId="CTRL" paramName="CTRL" style="padding-left: 5px;">
					<img src="<nedc:estaticpath path="bt_procurar.gif" type="imagem" />" border="0">
				</html:link>
			</td>
		</tr>
	</tbody>
</table>
