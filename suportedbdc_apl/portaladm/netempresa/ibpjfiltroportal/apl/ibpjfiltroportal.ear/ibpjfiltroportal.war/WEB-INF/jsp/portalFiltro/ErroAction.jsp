<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
String valCTRL = request.getParameter("CTRL");
pageContext.setAttribute("CTRL", valCTRL);
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td width="100%" align="center" class="textos">
	    	<b>
			<logic:messagesPresent>
				<html:errors/>
			</logic:messagesPresent>
			</b>
        </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
    	<td width="100%" align="center">
			<html:link action="MenuGestaoFiltros" paramId="CTRL" paramName="CTRL">
				<IMG src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border=0>
			</html:link>&nbsp;&nbsp;
    	</td>
    </tr>
</TABLE>