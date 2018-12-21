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
			<td height="40" align="center">
				O(s) contrato(s) abaixo foi(ram) inclu�do(s) com sucesso.
				<br/>
				<br/>
				<br/>
			</td>
		</tr>
		<!-- <tr class="textos" height="20">
			<td align="right">P�g. 1 de 1</td>
		</tr> -->
		<tr class="textoBranco" bgcolor="#828282" height="20">
			<td class="textosBrancos" height="20">
				<b>Filtro do Dispositivo de Seguran�a nas transa��es Net Empresa</b>
			</td>
		</tr>
		<tr class="textos" bgcolor="#CCCCCC" height="20">
			<td align="center">Contrato</td>
		</tr>
		<logic:iterate name="listaIntervalos" id="intervalo">
			<tr class="textos" bgcolor="#ebebeb" height="20">
				<td align="center"><bean:write name="intervalo" property="contratoInicial"/> - <bean:write name="intervalo" property="contratoFinal"/></td>
			</tr>
		</logic:iterate>
	</tbody>
</table>
<br/>
<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<html:link action="MenuGestaoFiltros" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link> 
		</td>
	</tr>
</table>

