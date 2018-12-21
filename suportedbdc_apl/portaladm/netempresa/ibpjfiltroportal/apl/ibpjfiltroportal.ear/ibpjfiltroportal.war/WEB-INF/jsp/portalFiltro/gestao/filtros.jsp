<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<script language="javascript" type="text/javascript">

//METODOS PARA A VALIDACAO DO FORMULARIO E CRIPTOGRAFIA DA SENHA
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
		document.forms[0].senhaGestor.value = document.applets[0].cript(window.document.formSenhas.senhaGestor.value);
		document.forms[0].submit();
		return;
	}
}

function enviarFormSenhas() {
	return false;
}

function submeter() {
	document.forms[0].submit();
}

function reload() {
	document.forms[0].action='Filtros.do';
	document.forms[0].consulta.value = "1";
	document.forms[0].submit();
}
</script>
<html:form action="AlterarFiltros" method="post">
<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
<html:hidden name="pesquisaFiltroForm" property="senhaGestor"/>
<html:hidden name="pesquisaFiltroForm" property="consulta"/>

<table align="center" border="0" cellpadding="2" cellspacing="2">
	<tbody>
		<tr class="textos">
			<td align="left"><b>Selecione o filtro desejado:</b></td>
			<td align="left">
				<html:select property="filtroEscolhido" styleClass="combos" onchange="reload();">
					<html:option value="0">Selecione o filtro</html:option>
					<html:optionsCollection name="pesquisaFiltroForm" property="listaFiltro" label="nome" value="codigo" />
				</html:select>
			</td>
		</tr>
		<tr class="textos" align="center">
			<td colspan="2" align="left">
				<br/><br/><br/>
				<b>Selecione a chave de ativação:</b>
			</td>
		</tr>
		<tr class="textos">
			<td align="left">
				<html:radio name="pesquisaFiltroForm" property="habilitar" value="S" /> Ligado
			</td>
			<td>
				<html:checkbox  name="pesquisaFiltroForm" property="todasEmpresas" value="I" /> Todas as empresas
			</td>
		</tr>
		<tr class="textos">
			<td>
				<html:radio name="pesquisaFiltroForm" property="habilitar" value="N" /> Desligado
			</td>
		</tr>
	</tbody>
</table>
</html:form>
<br/>
			<form name="formSenhas" onSubmit="return enviarFormSenhas();">
			<table border="0" cellpadding="2" cellspacing="2" align="center">
				<tr bgcolor="#ebebeb">
					<td class="textos">Senha:&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="textos"><input type="password" name="senhaGestor" class="combos" size="16" maxlength="8" id="senha"></td>
       			</tr>
			</table>
			</form>

<br/>
<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<html:link action="MenuGestaoFiltros" paramId="CTRL" paramName="CTRL">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link>
			<a href="Javascript: VrfFrm(this);"><img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" border=0></a>
		</td>
	</tr>
	<tr>
		<td>
			<nedc:cryptapplet/>
    	</td>
	</tr>
</table>
