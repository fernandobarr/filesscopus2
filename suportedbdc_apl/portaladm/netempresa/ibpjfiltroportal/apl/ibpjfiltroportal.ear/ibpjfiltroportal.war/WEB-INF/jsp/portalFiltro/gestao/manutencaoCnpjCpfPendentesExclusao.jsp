<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc"%>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<table width="55%" align="center" border="0">
	<tbody>
		<tr class="textos">
			<td align="left">Total de clientes: 1</td>
			<td align="right">Pág. 1 de 1</td>
		</tr>
	</tbody>
</table>

<table width="55%" align="center" border="0">
	<tbody>
		<tr class="textoBranco" bgcolor="#828282">
			<td colspan="3" class="textosBrancos" height="20">
				<b>Filtro do Dispositivo de Segurança nas transações Net Empresa</b>
			</td>
		</tr>
		<tr class="textos" height="20" bgcolor="#CCCCCC">
			<td><input type="checkbox"></td>
			<td>CNPJ</td>
			<td>CPF</td>
		</tr>
		<tr height="20" bgcolor="#ebebeb" class="textos">
			<td><input type="checkbox"></td>
			<td>01230045500001 20</td>
			<td>455.236.854-23</td>
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
				<html:link action="ExcluirCnpjCpf" paramId="CTRL" paramName="CTRL" style="padding: 0 5px;">
					<img src="<nedc:estaticpath path="bt_confirmar.gif" type="imagem" />" border="0">
				</html:link>
			</td>
		</tr>
	</tbody>
</table>
