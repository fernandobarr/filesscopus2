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
			<td align="left">Total de clientes: 1</td>
			<td align="right">P�g. 1 de 1</td>
		</tr>
	</tbody>
</table>

<table width="40%" align="center" border="0">
	<tbody>
		<tr class="textoBranco" bgcolor="#828282">
			<td colspan="3" class="textosBrancos" height="20">
				<b>Filtro do Dispositivo de Seguran�a nas transa��es Net Empresa</b>
			</td>
		</tr>
		<tr class="textos" height="20" bgcolor="#CCCCCC">
			<td width="33%">Contrato</td>
			<td width="33%">Contrato</td>
			<td width="33%">Data de exclus�o</td>
		</tr>
		<tr height="20" bgcolor="#ebebeb" class="textos">
			<td>3</td>
			<td>4</td>
			<td>10/12/2014</td>
		</tr>
	</tbody>
</table>
<br/>
<br/>
<table align="center">
	<tbody>
		<tr>
			<td>
				<html:link action="ManutencaoConsultaClientes" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
					<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
				</html:link> 
			</td>
		</tr>
	</tbody>
</table>
