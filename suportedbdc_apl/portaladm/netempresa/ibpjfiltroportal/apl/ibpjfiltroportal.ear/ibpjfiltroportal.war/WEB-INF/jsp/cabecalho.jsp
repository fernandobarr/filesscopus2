<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%@page import="br.com.bradesco.portaladm.negocio.TempoSessao" errorPage="errojsp.jsp"%>

<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
TempoSessao tempoSessao = (TempoSessao) request.getAttribute("tempoSessao");
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="446" height="27" nowrap background="<nedc:estaticpath path="barra_superior_left.gif" type="imagem" />">&nbsp;</td>
        <td width="100%" background="<nedc:estaticpath path="barra_superior_center.gif" type="imagem" />">&nbsp;</td>
        <td width="67" height="27" nowrap><a class="menupc" href="<nedc:link tipo="encerrarSessao"/>?CTRL=<%=request.getParameter("CTRL")%>">
		<img src="<nedc:estaticpath path="barra_superior_right.gif" type="imagem" />" border="0"></a></td>
    </tr>
</table>
<table width="100%" height="55" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr>
        <td class="dadosv" width="10">&nbsp;</td> 
        <td class="dadosv" width="248"><bean:write name="usuarioPortal" property="nomeUsuario" /><br>O seu último acesso foi em <bean:write name="usuarioPortal" property="ultimoAcesso"/></td>
        <td width="20"><img height=33 src="<nedc:estaticpath path="hr_vrt_sup.gif" type="imagem" />" width=1></td>
        <td class="dadosc"><%=tempoSessao.getDataAtual()%></td>
<% if (tempoSessao.getTipoExpiracao() == 0) { %>
        <td class="dadosc" align="right"><bean:write name="tempoSessao" property="tempoMaximoInativo"/> Tempo Máximo de Inatividade</td>
        <td width="10" align="right" class="dadosc">&nbsp;</td>
<% } else if (tempoSessao.getTipoExpiracao() == 1) { %>
        <td class="dadosc" align="right"><bean:write name="tempoSessao" property="tempoRestante"/> Tempo Restante de Sessão</td>
        <td width="10" align="right" class="dadosc">&nbsp;</td>        
<% } else { %>
        <td class="dadosc" align="right"><bean:write name="tempoSessao" property="tempoRestante"/> Tempo Restante de Sessão<BR><bean:write name="tempoSessao" property="tempoMaximoInativo"/>Tempo Máximo de Inatividade</td>
        <td width="10" align="right" class="dadosc">&nbsp;</td>        
<% } %>
    </tr>
</table>
<table width="100%" height="18" border="0" cellpadding="0" cellspacing="0" id=TABLE1>
    <tr bgcolor="#ffffff"> 
        <td valign="bottom" background="<nedc:estaticpath path="menu_superior_fundo.gif" type="imagem" />">
            <table width="100%" height="16" border="0" cellpadding="0" cellspacing="0">
                <tr align="center">
                    <td width="10">&nbsp;</td>
                    <td width="100"><A class=menupc style="vertical-align: middle;" href="<nedc:link tipo="menuPortal"/>?CTRL=<%=request.getParameter("CTRL")%>"/>Home</A></td>
                    <td width="1" class="menupc">|</td>
                    <td width="120"></td>
                    <td class="menuvv">&nbsp;</td>
                    <td width="150" class="menuvv"><a class="menupc" href="<nedc:link tipo="encerrarSessao"/>?CTRL=<%=request.getParameter("CTRL")%>"/>Encerra Sessão</a></td>
                    <td width="10" class="menuvv">&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>