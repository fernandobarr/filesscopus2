<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;CHARSET=iso-8859-1" />
	<title>Página de Error</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/template/css/tiles.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/template/css/components.css"/>">
	<link rel="stylesheet" type="text/css" media="print" href="<c:url value="/template/css/print.css"/>">
</head>			
	
<body>

<table id="mainLayout" border="0" cellpadding="0" cellspacing="0" class="tmainpage">
<%-- HEADER --%>
<thead>
	<tr><th class="theaderPanel" scope="colgroup" colspan="1">
		<table border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<tr><td><img src="<c:url value="/template/images/barra_top_prime.gif"/>" alt="Bradesco Dia e Noite" style="border:0" /></td></tr>
			</tbody>
		</table>
		</th>
	</tr>
</thead>
<%-- FOOTER --%>
<tfoot>
	<tr><td class="tfooterPanel" colspan="1">
		<table border="0" cellpadding="0" cellspacing="0">
			<tbody><tr><td><img src="<c:url value="/template/images/rodape.gif"/>" /></td></tr></tbody>
		</table>
	</td></tr>
</tfoot>

<tbody>
	<tr><td class="ccontext">
	<table id="content:innerLayout" border="0" cellpadding="0" cellspacing="0" class="tmainpage">
		<thead><tr><th class="tsubHeaderPanel" scope="colgroup" colspan="1"></th></tr></thead>
		<tfoot><tr><td class="thelpPanel" colspan="1"></td></tr></tfoot>
		<tbody>
			<tr><td class="ccontext">
			<table id="content:contentLayout" border="0" cellpadding="0" cellspacing="0" class="tmainpage">
				<thead><tr><th class="tmainMenuPanel" scope="colgroup" colspan="1"></th></tr></thead>
				<tbody><tr><td class="ccontext">
					   <table id="content:pageContentLayout" border="0" cellpadding="0" cellspacing="0" class="tmainpage">
						<thead><tr><th class="pathContext" scope="colgroup" colspan="1"></th></tr></thead>
						<tbody>
							<tr><td class="cbodyContext">
							<table border="0" cellspacing="6" width="100%">
								<tbody>
								<%-- BODY --%>
								<tr><td class="HtmlOutputTextTitleColorBradesco">EXCEÇÃO DA APLICAÇÃO<br></td></tr>
								<tr><td class="HtmlOutputTextBradesco"> Detectada Throwable Exception: ${pageContext.errorData.throwable}</td></tr>
								<tr><td class="HtmlOutputTextBradesco"> <b>Código do erro: </b>${pageContext.errorData.statusCode} </td></tr>
								<tr><td class="HtmlOutputTextBradesco"> <b>Detalhe do Erro: </b><br>${pageContext.errorData.throwable.cause}</td></tr>
								<tr><td class="HtmlOutputTextBradesco"> Verifique o arquivo de log para visualizar o registro do erro</td></tr>
								<tr><td class="HtmlOutputTextBradesco"><a href="index.jsp">Voltar a página principal</a></td></tr>
								<%-- /BODY --%>
								</tbody>
							</table>
							</td></tr>
						</tbody></table></td></tr>
				</tbody></table></td></tr>
		</tbody></table></td></tr>
</tbody></table>
	
</body>
</html>