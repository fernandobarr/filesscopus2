<%@ page isThreadSafe="true" buffer="32kb" contentType="text/html; charset=ISO8859_1" isErrorPage="true"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
	String ctrl = (String) request.getParameter("CTRL");
	if(ctrl == null) {
		ctrl = "";
	}
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
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					    <tr> 
					        <td><IMG hspace=20 src="<nedc:estaticpath path="gerCampanha.gif" type="imagem" />" vspace=10></td>
					    </tr>
					    <tr> 
					        <td> 
					            <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
					                <tr> 
					                    <td bgcolor="#dadada" class="titulo_cinza" height="16">&nbsp;&nbsp;&nbsp;Gestão de Campanhas</td>
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
					                    <td height="30"></td>
					                </tr>
					                <tr>
					                    <td align="center"></td>
					                </tr>
					                <tr>
					                    <td height="40"></td>
					                </tr>
					                <tr>
					                    <td align="center">
					                        <table width="302"  border="0" cellpadding="2" cellspacing="2" id=TABLE1 style="LEFT: 256px; WIDTH: 302px; TOP: -4px; HEIGHT: 32px">
					                            <tr bgcolor="#ebebeb">
					                                <td height="20" class="textos" align="center"><b>Erro ao processar a página.</b></td>
					                            </tr>
					                        </table>
					                        <P>&nbsp;</P>
					                        <P>&nbsp;</P>          
					                    </td>
					                </tr>
					                <tr>
					                    <td align="center">
					                        <table border="0" cellspacing="0" cellpadding="0">
					                            <tr>
					                                <td><a href="javascript: history.back();"><img src="<nedc:estaticpath path="/bt_voltar.gif" type="imagem" />" border="0"></a></td>
					                            </tr>
					                        </table>
					                        <P>&nbsp;</P>
					                        <P>&nbsp;</P>
					                    </td>
					                </tr>
					            </table>
					        </td>
					    </tr>
					</table>
			    </td>
			</tr>
		</table>
	</body>
</html>