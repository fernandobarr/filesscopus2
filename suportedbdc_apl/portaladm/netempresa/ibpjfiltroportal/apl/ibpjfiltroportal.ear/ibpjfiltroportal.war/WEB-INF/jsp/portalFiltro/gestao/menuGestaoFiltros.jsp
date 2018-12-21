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
    		<%-- <html:link styleClass="menuv" action="MenuFiltro" paramId="CTRL" paramName="CTRL">Filtro de Implantação</html:link> --%>
    		<a href="MenuFiltro.do?CTRL=<%=request.getParameter("CTRL") %>&menuFiltro=implantacao" class="menuv">Filtro de Implantação</a>
    	</td>
	</tr>
	<tr>
	    <td width="25">&nbsp;</td>
    	<td height="20">
    		<%-- <html:link styleClass="menuv" action="ManuFiltro" paramId="CTRL" paramName="CTRL">Filtro de Exceção</html:link> --%>
    		<a href="MenuFiltro.do?CTRL=<%=request.getParameter("CTRL") %>&menuFiltro=excecao" class="menuv">Filtro de Exceção</a>
    	</td>
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
