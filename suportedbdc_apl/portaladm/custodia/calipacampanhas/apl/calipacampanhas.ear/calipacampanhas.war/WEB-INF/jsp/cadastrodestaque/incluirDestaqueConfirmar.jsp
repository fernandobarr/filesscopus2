<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>

<script type="text/javascript" src="<nedc:estaticpath path="gestaoCampanhas.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="validacao.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="geral.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="tipoLinkConteudo.js" type="javascript"/>"></script>

<script type="text/javascript">
<!--
function voltar() {
	document.forms[0].action = 'IncluirDestaqueEntrada.do?CTRL=' + '<%=request.getParameter("CTRL")%>';
	document.forms[0].submit();
	return true;
}


function limparTela()
{
	// limpa o campo senha
	window.document.formSenhas.senhaGestor.value = '';
}

// METODOS PARA A VALIDACAO DO FORMULARIO E CRIPTOGRAFIA DA SENHA
var Bloq=false;
var lStarted = 0;

function Started() {
	lStarted = 555;	
}

function VrfApplet(order) {
	if(navigator.appVersion.indexOf("Mac") != -1) {
		if(document.applets == null)
			return;
		if(document.applets.length == 0)
			return;
		if(!document.applets[order])
			return;
		if(document.applets[order].Existe != 555)
			return;
		return true;
	} else {
		if(lStarted != 555) {
			return;
		}
		return true;
	}
}

function VrfFrm(form) {
	if(document.getElementById("senha").value == "") {
		alert("Preencha o campo senha.");
		return;
	}
	
	if(Bloq)
		return;

	Bloq = true
	if(!VrfApplet(0)) {
		alert("Applet de segurança não carregado!");
		Bloq = false;
		return;
	} else {
		form.senhaGestor.value = document.applets[0].cript(window.document.formSenhas.senhaGestor.value);
		document.forms[0].action = "IncluirDestaqueEfetivar.do";
		form.submit();
		return;
	}
}

function enviarFormSenhas() {
	return false;
}
//-->
</script>
<html:form action="ExibirMenu" method="post">
	<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
	<html:hidden property='cdAmbienteInternet' />
	<html:hidden property='campanha.cdCategoriaPagina' />
	<html:hidden property="senhaGestor"/>
	
	<html:hidden property="campanha.nmCampanha"/>

	<html:hidden property="conteudoImagem.dsTextoAlternativoConteudoCampanha"/>
	<html:hidden property="conteudoImagem.dsTextoConteudoCampanha"/>
	<html:hidden property="conteudoImagem.enFisicoConteudoCampanha"/>
	<html:hidden property="conteudoImagem.enURLConteudoCampanha"/>
	
	<html:hidden property="conteudoImagem.cdLinkConteudoCampanha"/>
	<html:hidden property="conteudoImagem.linkTO.cdTipoLink"/>
	<html:hidden property="conteudoImagem.linkTO.enUrlLinkConteudoCampanha"/>
<div id="dadosCampanha" >
	<table class="tabelaDadosPortal">
		<thead>
			<tr>
				<th colspan="2">Destaque</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Site:</td>
				<td><bean:write name="nmAmbienteInternet" /></td>
			</tr>
			<tr>
				<td>Nome do Informativo:</td>
				<td><bean:write name="campanhaForm" property="campanha.nmCampanha"/></td>
			</tr>
			<tr>
				<td>Categoria:</td>
				<td><bean:write name="campanhaForm" property="conteudoImagem.cdLinkConteudoCampanha"/></td>
			</tr>
			<tr>
				<td>Arquivo:</td>
				<td>
					<bean:write name="campanhaForm" property="conteudoImagem.enFisicoConteudoCampanha"/>
					<bean:write name="campanhaForm" property="conteudoImagem.enURLConteudoCampanha"/>
					<img src="<bean:write name="campanhaForm" property="conteudoImagem.enURLConteudoCampanha"/>"
						alt="<bean:write name="campanhaForm" property="conteudoImagem.dsTextoAlternativoConteudoCampanha"/>"
						title="<bean:write name="campanhaForm" property="conteudoImagem.dsTextoAlternativoConteudoCampanha"/>" />
				</td>
			</tr>
			<tr>
				<td>Texto:</td>
				<td><bean:write name="campanhaForm"  property="conteudoImagem.dsTextoAlternativoConteudoCampanha"/></td>
			</tr>
		</tbody>
	</table>
</div>
</html:form>
<nedc:cryptapplet/>
<%
// FORMULARIO PARA CAPTURAR A SENHA DIGITADA PELO USUARIO
%>
<form name="formSenhas" onSubmit="return enviarFormSenhas();">
<div id="botoes" class="linhaBotoes">
	<table border="0" cellpadding="2" cellspacing="2" align="center">
		<tr bgcolor="#ebebeb">
			<td class="textos">Senha:&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><input type="password" name="senhaGestor" class="combos" size="16" maxlength="8" id="senha"></td>
		</tr>
	</table>
</div>
</form>
<div id="botoes" class="linhaBotoes">
	<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
	<img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" onclick="VrfFrm(document.campanhaForm);">
</div>
