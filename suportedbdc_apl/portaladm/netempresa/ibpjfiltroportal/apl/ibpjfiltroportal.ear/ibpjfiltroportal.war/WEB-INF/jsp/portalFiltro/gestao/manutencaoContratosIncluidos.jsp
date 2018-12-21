<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc"%>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<table width="40%" align="center" border="0">
	<tbody>
		<tr class="textos">
			<td height="40">
				<input class="check" type="checkbox"/>
				Selecionar todo resultado da pesquisa 
				<br/> 
				<br/> 
				<br/>
			</td>
		</tr>
		<tr class="textos">
			<td colspan="2" align="left">Total de clientes: 1</td>
			<td colspan="2" align="right">Pág. 1 de 1</td>
		</tr>
	</tbody>
</table>

<table width="40%" align="center" border="0">
	<tbody>
		<tr class="textoBranco" bgcolor="#828282">
			<td colspan="3" class="textosBrancos" height="20">
				<b>Filtro do Dispositivo de Segurança nas transações Net Empresa</b>
			</td>
		</tr>
		<tr height="20" bgcolor="#CCCCCC" class="textos">
			<td width="5%" align="center">
				<input class="check" type="checkbox"/>
			</td>
			<td>Contrato</td>
			<td>Contrato</td>
		</tr>
		<tr height="20" bgcolor="#ebebeb" class="textos">
			<td width="5%" align="center">
				<input class="check" type="checkbox">
			</td>
			<td>3</td>
			<td>4</td>
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
				<html:link action="ManutencaoConsultaClientes" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
					<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
				</html:link> 
				<html:link action="ExcluirIntervaloContratos" paramId="CTRL" paramName="CTRL" style="padding: 0 5px;">
					<img src="<nedc:estaticpath path="bt_excluir.gif" type="imagem" />" border="0">
				</html:link>
			</td>
		</tr>
	</tbody>
</table>
