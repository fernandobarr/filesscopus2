<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<table width="95%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="25">&nbsp;</td>
        <td height="20"><html:link styleClass="menuv" action="MenuManutencaoDispositivoSeguranca" paramId="CTRL" paramName="CTRL">Manutenção Dispositivo de Segurança nas transações Net Empresa</html:link></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</tD>
	</tr>
</table>
                 
<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<html:link action="MenuInicial" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link>
		</td>
    </tr>
</table>
