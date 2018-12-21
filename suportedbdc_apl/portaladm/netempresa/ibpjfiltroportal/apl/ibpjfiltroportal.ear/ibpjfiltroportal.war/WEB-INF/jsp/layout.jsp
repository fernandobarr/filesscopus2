<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri='/WEB-INF/nedc-EstaticPath.tld' prefix='nedc' %>
<html>
<head>
    <title>Portal Administrativo</title>
    <link rel="stylesheet" href="<nedc:estaticpath path="upload.css" type="estilo" />" type="text/css"/>
    <link rel="stylesheet" href="<nedc:estaticpath path="estilos.css" type="estilo" />" type="text/css"/>
    <link rel="stylesheet" href="<nedc:estaticpath path="calendario.css" type="estilo" />" type="text/css"/>
    <link rel="stylesheet" href="<nedc:estaticpath path="home.css" type="estilo" />" type="text/css"/>
    <link rel="stylesheet" href="<nedc:estaticpath path="estrutura.css" type="estilo" />" type="text/css"/>
</head>

<body leftmargin="0" topmargin="0" background="<nedc:estaticpath path="fundo.gif" type="imagem" />">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr valign="top" height="100">
        <td>
<!-- %%%%%%%%%%%%%%%%%%%%%% INÍCIO DO CABECALHO %%%%%%%%%%%%%%%%%%%%%% -->
			<tiles:insert attribute="header"/>
<!-- %%%%%%%%%%%%%%%%%%%%%%%% FIM DO CABECALHO %%%%%%%%%%%%%%%%%%%%%%% -->
		</td>
	</tr>
	<tr valign="top">
    	<td>
    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr> 
			        <td><img hspace=20 src="<nedc:estaticpath path="gerFiltros.gif" type="imagem" />" vspace=10></td>
			    </tr>
			    <tr> 
			        <td> 
			            <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
			                <tr> 
			                    <td bgcolor="#dadada" class="titulo_cinza" height="16">
			                    	&nbsp;&nbsp;&nbsp;<tiles:getAsString name="tituloPagina"/>
			                    </td>
			                </tr>
			            </table>
			        </td>
			    </tr>
			    <tr> 
			        <td align="left" valign="top">
			        	<table width="95%"  border="0" cellspacing="0" cellpadding="0">
			                <tr>
			                    <td height="30">&nbsp;</td>
			                </tr>
			                <tr>
			                    <td valign="top">
								<!-- %%%%%%%%%%%%%%%%%%%%%% INÍCIO DO CORPO %%%%%%%%%%%%%%%%%%%%%% -->
									<tiles:insert attribute="body"/>
								<!-- %%%%%%%%%%%%%%%%%%%%%%%% FIM DO CORPO %%%%%%%%%%%%%%%%%%%%%%% -->
								</td>
							</tr>
						</table>
					</td>
			    </tr>
			</table>
		</td>
	</tr>
    <!-- numero da tela -->
	<tr valign="bottom" height="30">
    	<td height="30" align="right" class="dadosc">Tela <tiles:getAsString name="numTela"/></td>
    </tr>
	<tr valign="bottom" height="30">
    	<td background="<nedc:estaticpath path="rodape_center.gif" type="imagem" />" >
<!-- %%%%%%%%%%%%%%%%%%%%%% INÍCIO DO RODAPE %%%%%%%%%%%%%%%%%%%%%% -->
			<tiles:insert attribute="footer"/>
<!-- %%%%%%%%%%%%%%%%%%%%%%%% FIM DO RODAPE %%%%%%%%%%%%%%%%%%%%%%% -->
		</td>
	</tr>
</table>
</body>
</html>