<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
String valCTRL = request.getParameter("CTRL");
pageContext.setAttribute("CTRL", valCTRL);

// Determina o flag que indica a pagina que deve ser associada ao botao voltar, ou seja,
// para que página deve voltar.
// Cada flag é determinada dentro de cada action que foi acionada anteriormente.
// Tipos de valores:
// PAGINA_INICIAL         - retorna para a página inicial (UTILIZADA COMO DEFAULT CASO NAO EXISTA FLAG)
// PAGINA_CAMPANHA_FILTRO - retorna para a página tipo de campanha
// PAGINA_CAMPANHA_SITUACAO - retorna para a página situacao de campanha
// PAGINA_CAMPANHA_LISTA - retorna para a página listagem de campanhas
// PAGINA_CAMPANHA_DETALHAR - retorna para a página de detalhe de campanha
// PAGINA_RELATORIO_FILTRO - retorna para a página filtro de relatorio de campanhas
// PAGINA_RELATORIO_LISTA - retorna para a página listagem de relatorio de campanhas

String strRetornarPara = (String) request.getAttribute("RETORNAR_PARA");
if (strRetornarPara == null) {
	strRetornarPara = "PAGINA_INICIAL";
}
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
        <td align="center" valign="top"></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td width="100%" align="center" class="textos">
	    	<b>
				<html:errors/>
			</b>
        </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
    	<td width="100%" align="center">
    		<%
    		if (strRetornarPara.equals("PAGINA_INICIAL")) {
			    // BOTAO PARA VOLTAR PARA A PAGINA ne_exibirMenu.jsp
    		%>
				<html:link action="MenuGestaoFiltros" paramId="CTRL" paramName="CTRL">
					<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem"/>" border=0>
				</html:link>&nbsp;&nbsp;
			<%
    		} else if (strRetornarPara.equals("PAGINA_ANTERIOR")) {
    		%>
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem"/>" onclick="goBack();" border=0>
				<script>
					function goBack() {
    					window.history.back();
					}
				</script>
    		<%
    		}
			%>
    	</td>
    </tr>
</TABLE>