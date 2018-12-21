<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix='nedc' %>
<%
    String ctrl = request.getParameter("CTRL");
    if(ctrl == null) {
        ctrl = "";
	}
	pageContext.setAttribute("CTRL", ctrl);
%>

<html>
<head>
    <title>Portal Administrativo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="stylesheet" href="<nedc:estaticpath path="estilos.css" type="estilo" />" type="text/css"/>
</head>

<body leftmargin="0" topmargin="0" background="<nedc:estaticpath path="fundo.gif" type="imagem" />">

<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr valign="top" height="100">
        <td>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="446" height="27" nowrap background="<nedc:estaticpath path="barra_superior_left.gif" type="imagem" />">&nbsp;</td>
        <td width="100%" background="<nedc:estaticpath path="barra_superior_center.gif" type="imagem" />">&nbsp;</td>
        <td width="67" height="27" nowrap><a class="menupc" href="<nedc:link tipo="encerrarSessao"/>?CTRL=<%=request.getParameter("CTRL")%>"><img src="<nedc:estaticpath path="barra_superior_right.gif" type="imagem" />" border="0"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
        <td><IMG hspace=20 src="<nedc:estaticpath path="gerCampanha.gif" type="imagem" />" vspace=10></td>
    </tr>
    <tr> 
        <td> 
            <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr> 
                    <td bgcolor="#dadada" class="titulo_cinza" height="16">&nbsp;&nbsp;&nbsp;PORTAL ADMINISTRATIVO</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr> 
        <td align="center" valign="top"></td>
    </tr>
</table>

        </td>
    </tr>
    <tr valign="top">
        <td>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td align="center" valign="top">
      <table width="95%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="210" valign="bottom" class=textos>
            <P align=center>
 <table width="302"  border="0" cellpadding="2" cellspacing="2" id=TABLE1 style="LEFT: 256px; WIDTH: 302px; TOP: -4px; HEIGHT: 32px">
                            <tr bgcolor="#ebebeb">
                                <td height="20" class="textos" align="center">           
            Serviço Indisponível.
            </td>
</tr>
</table>
            
            <br><br>
            <A href="#" onclick="history.back();"><IMG src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border=0></A>
            </P>
          </td>
        </tr>
        <tr>
          <td valign="top">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

        </td>
    </tr>
    <tr valign="bottom" height="30">
        <td height="30" align="right" class="dadosc">Tela 017</td>
    </tr>
    <tr valign="bottom" height="30">
        <td background="<nedc:estaticpath path="rodape_center.gif" type="imagem" />">

<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
    <tr valign="middle">
        <td align="center" width="60" height="30" nowrap><img src="<nedc:estaticpath path="rodape_left.gif" type="imagem" />"></td>
        <td class="rodape">Copyright 2005 Banco Bradesco S.A. e Scopus Tecnologia Ltda.</td>
        <td align="left" width="181" height="30" nowrap><img src="<nedc:estaticpath path="rodape_right.gif" type="imagem" />"></td>
    </tr>
</table>

        </td>
    </tr>
</table>
</body>
</html>