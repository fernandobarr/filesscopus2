<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc"%>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
String mensagem = (String) request.getAttribute("MENSAGEM_SUCESSO");
%>

<table width="95%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
            <td height="30">&nbsp;</td>
        </tr>
		<tr>
			<td class="textos" align="center">
				<!-- TODO - colocar a mensagem específica de cada tela -->
				<%
					if (mensagem == null) {
					%>
					<strong>Cliente(s) aprovado(s) com sucesso!</strong>
					<% 
					} else {
					%>
					 <strong><%=mensagem %></strong> 
					<% 
					}
				%>
				
			</td>
		</tr>
		<tr>
			<td align="center">
				<br/>
				<br/>
				<html:link action="MenuManutencaoDispositivoSeguranca" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
					<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
				</html:link> 
			</td>
		</tr>
	</tbody>
</table>