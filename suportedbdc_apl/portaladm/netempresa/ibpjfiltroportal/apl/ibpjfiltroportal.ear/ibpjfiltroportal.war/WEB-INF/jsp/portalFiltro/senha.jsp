<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<script type="text/javascript" src="<nedc:estaticpath path="validarSenha.js" type="javascript" />"></script>

<form name="formSenhas" onSubmit="return enviarFormSenhas();">
	<table border="0" cellpadding="2" cellspacing="2" align="center">
		<tr bgcolor="#ebebeb">
			<td class="textos">Senha:&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td class="textos"><input type="password" name="senhaGestor" class="combos" size="16" maxlength="8" id="senha"></td>
	   	</tr>
	</table>
</form>

<nedc:cryptapplet/>
