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
	<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript"/>"></script>
<%
/*
<script type="text/javascript" src="<nedc:estaticpath path="gestaoCampanhas.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="validacao.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="geral.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="tipoLinkConteudo.js" type="javascript"/>"></script>
*/
%>
	
	
	<style type="text/css">
	body {
		margin: 0px;
	}
	table {
		border: 0px; 
		border-collapse: collapse;
		padding: 0px;
	}
	.w100percent {
		width: 100%;
	}
	.w95percent {
		width: 95%;
	}
	.h100percent {
		height: 100%;
	}
	.h30 {
		height: 30px;
	}
	.h20 {
		height: 20px;
	}
	.center { 
		text-align: center; 
	}
	.left { 
		text-align: left; 
	}
	.right { 
		text-align: right; 
	}
	.vAt { 
		vertical-align: top;
	}
	.vAb { 
		vertical-align: bottom;
	}
	.paddingLateral40 {
		padding-left: 40px; padding-right: 40px;
	}
	.paddingLateral20 {
		padding-left: 20px; padding-right: 20px;
	}
	.hand {
		cursor: pointer;cursor: hand;
	}
	
	table.tabelaDadosPortal {
		width: 70%;
		margin-left:15%; 
		margin-right:15%;
		border: 2px;
		border-collapse: separate;
		padding: 2px;
	}
	table.tabelaDadosPortal thead tr {
		background-color: #828282;
		height: 16px;
	}	
	table.tabelaDadosPortal thead tr th { /* .textoBranco */
		font-family: Verdana; font-size: 7.5pt; color: #FFFFFF; font-weight: bold;
		text-align: left;
	}	
	table.tabelaDadosPortal tbody tr {
		background-color: #ebebeb;
		height: 20px;
	}	
	table.tabelaDadosPortal tbody tr td { /* .textos */
		font-family: Verdana; font-size: 7.5pt;
	}	
	table.tabelaDadosPortal tbody tr td:first-of-type { 
		width: 160px;
		text-align: left;
	}	
	table.tabelaDadosPortal tbody tr td a:link { /* .textos */
		font-family: Verdana; font-size: 7.5pt;  text-decoration: underline;
	}	
	table.tabelaDadosPortal tbody tr td a:hover{ /* .textos */
		font-family: Verdana; font-size: 7.5pt;  text-decoration: underline;
	}
	
	table.tabelaListagemPortal {
		width: 70%;
		margin-left:15%; 
		margin-right:15%;
		border: 2px;
		border-collapse: separate;
		padding: 2px;
	}
	table.tabelaListagemPortal thead tr:first-of-type {
		background-color: #828282;
		height: 16px;
	}	
	table.tabelaListagemPortal thead tr:first-of-type th { /* .textoBranco */
		font-family: Verdana; font-size: 7.5pt; color: #FFFFFF; font-weight: bold;
		text-align: left;
	}	
	table.tabelaListagemPortal thead tr {
		background-color: #CCCCCC;
		height: 16px;
	}	
	table.tabelaListagemPortal thead tr th {
		font-family: Verdana; font-size: 7.5pt;
		text-align: center;
		padding: 2px;
	}	
	table.tabelaListagemPortal tbody tr {
		background-color: #ebebeb;
		height: 20px;
	}	
	table.tabelaListagemPortal tbody tr td { /* .textos */
		font-family: Verdana; font-size: 7.5pt;
	}	
	table.tabelaListagemPortal tbody tr td a:link { /* .textos */
		font-family: Verdana; font-size: 7.5pt;  text-decoration: underline;
	}	
	table.tabelaListagemPortal tbody tr td a:hover{ /* .textos */
		font-family: Verdana; font-size: 7.5pt;  text-decoration: underline;
	}	
	
	div.linhaBotoes {
		text-align: center;
	}
	div.linhaBotoes img {
		cursor: pointer;cursor: hand;
		margin-left: 5px;
		margin-right: 5px;
	}
	
	div.linhaPaginacao {
		width: 70%;
		height 20px;
		margin-left:15%; 
		margin-right:15%;
		float: none;
		clear: both;
	}
	div.linhaPaginacao div.direita {
		width: 50%;
		text-align: right;
		float: right;
	}
	div.linhaPaginacao div.esquerda {
		width: 50%;
		text-align: left;
		float: left;
	}
	div.legendaTabela {
		width: 200px;
		float: none;
		clear: both;
		margin-left:15%; 
	}
	
	div.legendaTabela table.tabelaListagemPortal {
		width: 100%;
		margin-left:0%; 
		margin-right:0%;
	}
	
	div#mensagem p  {
		text-align: center; 
		background-color: #ebebeb;
		width: 70%;
		height: 16px;
		padding-top: 2px;
		margin-bottom:15px;
		margin-left:15%;
		margin-right:15%;
		font-family: Verdana;
		font-size: 7.5pt;
	}
	</style>
	<script type="text/javascript">
	function atualizarArquivo(formFile) {
		var $fileInputs = $(formFile).parents(".fileinputs");
		atualizaNomeArquivo(formFile, $(".fakefiletext", $fileInputs).get(0));
		$(".enderecoArquivo", $fileInputs).remove();
	}
	function atualizaNomeArquivo(de, para) {
		para.value=de.value.split(/(\\|\/)/g).pop();
	}
	function validarEmail() {
		var result = true;

		if (document.getElementById("email").value == "") {
			alert("O preenchimento do campo Email do Destinatário é obrigatório.");
			result = false;
		} else {
			//var rexp = /^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4})(;[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4})*$/;
			var rexp = /^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4})(\s*;\s*[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4})*;*$/;
			if (rexp.test(document.getElementById("email").value) == false) {
				alert("O Email do Destinatário informado é inválido.");
				result = false;
			}
		}
		
		return result;
	}
	function validarNomeCampanha(form) {
		var result = true;
		if (form['campanha.nmCampanha'].value == '') {
			alert("Informe o nome da campanha.");
			jQuery(form['campanha.nmCampanha']).focus();
			result = false;
		}	
		return result;
	}	
	function validarImagemCampanha(campoNomeArquivo,campoAlt,campoDV) {
		var result = true;
		result = result & validarNomeArquivoImagem(campoNomeArquivo.value, 
				"O campo imagem deve ser preenchido.", 
				"O nome do arquivo do campo imagem é inválido.");
		if (!result) campoNomeArquivo.focus();
		if (result && campoAlt != null && campoAlt.value == '') {
			alert("Informe o campo texto para alt da imagem.");
			campoAlt.focus();
			result = false;
		}
		if (result && campoDV != null && campoDV.value == '') {
			alert("Informe o campo texto dv da imagem.");
			campoDV.focus();
			result = false;
		}	
		return result;
	}
	function validarNomeArquivoImagem(nomeArquivo, msgVazio, msgInvalido) {
		var result = true;

		if (nomeArquivo == "") {
			alert(msgVazio);
			result = false;
		} else {
			var rexp = new RegExp('([A-Za-z0-9- _]+)+\.(png|gif|jpg|jpeg)$', 'i');
		    if (nomeArquivo.search(rexp) != 0) {
		    	alert(msgInvalido);
		    	result = false;
		    }
		}
		return result;	
	}	
	</script>
</head>

<body leftmargin="0" topmargin="0" background="<nedc:estaticpath path="fundo.gif" type="imagem" />">
<table class="w100percent h100percent">
	<tr valign="top" height="100">
		<td>
<!-- %%%%%%%%%%%%%%%%%%%%%% INÍCIO DO CABECALHO %%%%%%%%%%%%%%%%%%%%%% -->
			<tiles:insert attribute="header"/>
<!-- %%%%%%%%%%%%%%%%%%%%%%%% FIM DO CABECALHO %%%%%%%%%%%%%%%%%%%%%%% -->
		</td>
	</tr>
	<tr valign="top">
		<td>
			<table class="w100percent">
				<tr> 
					<td><img hspace=20 src="<nedc:estaticpath path="gerCampanhaCustodia.gif" type="imagem" />" vspace=10></td>
				</tr>
				<tr> 
					<td class="paddingLateral40"> 
						<table  class="w100percent">
							<tr> 
								<td bgcolor="#dadada" class="titulo_cinza" height="16">&nbsp;&nbsp;&nbsp;<tiles:getAsString name="titulo" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="h30">&nbsp;</td>
				</tr>
				<tr> 
					<td class="paddingLateral20 vAt">		
<!-- %%%%%%%%%%%%%%%%%%%%%% INÍCIO DO CORPO %%%%%%%%%%%%%%%%%%%%%% -->
			<tiles:insert attribute="body"/>
<!-- %%%%%%%%%%%%%%%%%%%%%%%% FIM DO CORPO %%%%%%%%%%%%%%%%%%%%%%% -->
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!-- numero da tela -->
	<tr class="vAb h30">
		<td align="right" class="dadosc">Tela <tiles:getAsString name="numTela"/></td>
	</tr>
	<tr class="vAb h30">
		<td background="<nedc:estaticpath path="rodape_center.gif" type="imagem" />" >
<!-- %%%%%%%%%%%%%%%%%%%%%% INÍCIO DO RODAPE %%%%%%%%%%%%%%%%%%%%%% -->
			<tiles:insert attribute="footer"/>
<!-- %%%%%%%%%%%%%%%%%%%%%%%% FIM DO RODAPE %%%%%%%%%%%%%%%%%%%%%%% -->
		</td>
	</tr>
</table>
</body>
</html>