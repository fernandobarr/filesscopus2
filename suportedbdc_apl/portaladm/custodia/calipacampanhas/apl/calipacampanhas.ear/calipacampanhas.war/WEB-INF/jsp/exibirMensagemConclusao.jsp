<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%@ page import="java.util.HashMap" errorPage="errojsp.jsp"%>


<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<div id="mensagem">
	<p><bean:write name="MSG_USUARIO"/></p>
</div>
<div id="botoes" class="center">
	<html:link styleClass="menupc" action="ExibirMenu" paramId="CTRL" paramName="CTRL">
		<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" class="paddingLateral20">
	</html:link>
</div>
