<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%@ page import="br.com.bradesco.portaladm.negocio.PermissaoSenhas,
                 br.com.bradesco.netEmpresa.filtroPortal.util.ConstantesPermissoesNEFP,
                 br.com.bradesco.netEmpresa.filtroPortal.util.Config"
         errorPage="errojsp.jsp"%>
         
<%@ page import="java.util.HashMap" %>


<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));

PermissaoSenhas perm = (PermissaoSenhas) request.getAttribute("permissoesSenhas");
%>

<table width="95%" border="0" cellspacing="0" cellpadding="0">
	<tr>
    	<td width="25">&nbsp;</td>
    	<td height="20">
    		<%-- <html:link styleClass="menuv" action="MenuFiltro" paramId="CTRL" paramName="CTRL">Gestão de Filtros</html:link> --%>
    		<a href="MenuGestaoFiltros.do?CTRL=<%=request.getParameter("CTRL") %>" class="menuv">Gestão de Filtros</a>
    	</td>
	</tr>
	<tr>
	    <td width="25">&nbsp;</td>
    	<td height="20">
    		<%-- <html:link styleClass="menuv" action="ManuFiltro" paramId="CTRL" paramName="CTRL">Manutenção Filtro Dispositivos Segurança</html:link> --%>
    		<a href="MenuManutencaoFiltros.do?CTRL=<%=request.getParameter("CTRL") %>" class="menuv">Manutenção Filtro Dispositivos Segurança</a>
    	</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</tD>
	</tr>
</table>
                 
<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td><a class=menupc href="<nedc:link tipo="menuPortal"/>?CTRL=<%=request.getParameter("CTRL")%>"><img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border=0></a></td>
    </tr>
</table>
