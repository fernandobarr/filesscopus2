<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>

<%
// PELO MOTIVO DO FORM UTILIZAR O ATRIBUTO enctype="multipart/form-data", POR CAUSA DA CARGA DO PARAMETRO HTML:FILE,
// E NECESSARIO PASSAR O CTRL DIRETAMENTE JUNTO COM O NOME DA ACTION, POIS SENAO O CTRL NAO SERA PASSADO PARA A PRÓXIMA PAGINA
String valCTRL = request.getParameter("CTRL");
pageContext.setAttribute("CTRL", valCTRL);
String actionDestino = "IncluirCampanhaConfirmar.do?CTRL=" + valCTRL;
// variaveis para editor de texto (+valCTRL)
String URL_BASE;
URL_BASE = request.getRequestURL().toString();
URL_BASE = URL_BASE.substring(0, URL_BASE.lastIndexOf('/'));
URL_BASE = URL_BASE.substring(0, URL_BASE.lastIndexOf('/'));

String cdSite = "1";

%>

<script type="text/javascript">
<!--
	function voltar() {
		document.forms.campanhaForm.action = 'ExibirMenu.do?CTRL=<%=valCTRL %>';
		document.forms.campanhaForm.submit();
		return false;
	}
	function continuar() {
		var result = validarNomeCampanha(document.forms[0]);
		if (result) result = validarImagemCampanha(document.forms[0]['fakefiletext1'],
				document.forms[0]['conteudoImagem.dsTextoAlternativoConteudoCampanha'], null);	
		if (result && jQuery("input:radio[name='conteudoImagem.linkTO.cdTipoLink']:checked").length == 0) {
			alert("Informe o tipo de link.");
			result = false;
		}
		if (document.forms[0]["conteudoImagem.linkTO.cdTipoLink"][1].checked
				&& document.forms[0]['conteudoImagem.linkTO.enUrlLinkConteudoCampanha'].value.length == 0) {
			alert("Informe a url do link.");
			result = false;
		}
		if (result && tinyMCE.activeEditor.getContent().length == 0) {
			alert("Informe o texto da campanha.");
			jQuery("#textoPaginaConteudoCampanha").focus();
			result = false;
		}
		if (result && (tinyMCE.activeEditor.getContent().length > 1000 || document.forms[0]['conteudoImagem.dsTextoConteudoCampanha'].value.length > 1000)) {
			alert("O texto da campanha excede o máximo de 1000 caracteres.");
			jQuery("#textoPaginaConteudoCampanha").focus();
			result = false;
		}		
		if (result) {
			document.forms.campanhaForm.action = '<%=actionDestino %>';
			document.forms.campanhaForm.submit();
		}	
	}	
	function limpar() {
		document.forms[0]['campanha.nmCampanha'].value='';
		
		document.forms[0]['formFileImagem'].value=null;
		document.forms[0]['fakefiletext1'].value='';
		
		document.forms[0]['conteudoImagem.dsTextoAlternativoConteudoCampanha'].value='';
		document.forms[0]['campanha.nmCampanha'].value='';
		
		document.forms[0]['conteudoImagem.cdLinkConteudoCampanha'].selectedIndex = 0;
		document.forms[0]['conteudoImagem.linkTO.cdLinkConteudoCampanha'].selectedIndex = 0;
		document.forms[0]['conteudoImagem.linkTO.enUrlLinkConteudoCampanha'].value='';
		
		document.forms[0]["conteudoImagem.linkTO.cdTipoLink"][0].checked=false;
		document.forms[0]["conteudoImagem.linkTO.cdTipoLink"][1].checked=false;
		document.forms[0]["conteudoImagem.linkTO.cdTipoLink"][2].checked=false;
		document.forms[0]["conteudoImagem.linkTO.cdTipoLink"][3].checked=false;
		
		document.forms[0]['conteudoImagem.dsTextoConteudoCampanha'].value='';
		tinyMCE.activeEditor.setContent('');
	}
	jQuery(document).ready(function() {
		if (document.forms[0]["conteudoImagem.linkTO.cdTipoLink"][1].checked == false) {
			document.forms[0]['conteudoImagem.linkTO.enUrlLinkConteudoCampanha'].value='';
		}
	});
	
//-->
</script>
<%@ include file="../editorTexto.jsp" %>
<html:form action="<%=actionDestino %>"  method="post" enctype="multipart/form-data">
	<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
	<html:hidden property='cdAmbienteInternet' />
	<html:hidden property='campanha.cdCategoriaPagina' />
<div id="dadosCampanha" >
	<table class="tabelaDadosPortal">
		<thead>
			<tr>
				<th colspan="2">Home</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Site:</td>
				<td><bean:write name="nmAmbienteInternet" /></td>
			</tr>
			<tr>
				<td>Nome da campanha:</td>
				<td><html:text property="campanha.nmCampanha" size="60" maxlength="30" styleClass="textos"/></td>
			</tr>
			<tr>
				<td>Imagem:</td>
				<td>
					<div class="fileinputs">
						<html:file property="formFileImagem" size="40" styleClass="textos file" styleId="imgFile"
							onchange="atualizarArquivo(this)"/>
						<div class="fakefile" >
							<logic:empty name="campanhaForm" property="conteudoImagem.enFisicoConteudoCampanha">
								<input type="text" readonly="readonly" size="48" name="fakefiletext1" class="textos fakefiletext" />
							</logic:empty>
							<logic:notEmpty name="campanhaForm" property="conteudoImagem.enFisicoConteudoCampanha">
								<html:hidden name="campanhaForm" property='conteudoImagem.enFisicoConteudoCampanha' styleClass="enderecoArquivo" />
								<html:hidden name="campanhaForm" property='conteudoImagem.enURLConteudoCampanha' styleClass="enderecoArquivo" />
								<input type='text' readonly='readonly' size='48' name='fakefiletext1' class='textos fakefiletext' value='<bean:write name="campanhaForm" property="conteudoImagem.nomeArquivo"/>'/>
							</logic:notEmpty>
							<img src="<nedc:estaticpath path="bt_procurar.gif" type="imagem" />" border=0 onclick="document.forms[0]['formFileImagem'].click();">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Texto para Alt:</td>
				<td><html:text property="conteudoImagem.dsTextoAlternativoConteudoCampanha" size="60" maxlength="256" styleClass="textos"/></td>
			</tr>
			<tr>
				<td>Link:</td>
				<td>
					<div>
						<html:radio  name="campanhaForm" styleId="cdTpLkImg1" property="conteudoImagem.linkTO.cdTipoLink" value="1" styleClass="combos tipoLink" />
						Serviço:
						<html:select  name="campanhaForm" property="conteudoImagem.cdLinkConteudoCampanha" styleClass="combos">
							<html:options collection="listaServicos" property="cdLinkConteudoCampanha" labelProperty="dsLinkConteudoCampanha"/>
						</html:select>
					</div>
					<div>
						<html:radio  name="campanhaForm" styleId="cdTpLkImg2" property="conteudoImagem.linkTO.cdTipoLink" value="2" styleClass="combos tipoLink" />
						Informe a URL:
						<html:text size="40" maxlength="256" styleId="txtLink1" property="conteudoImagem.linkTO.enUrlLinkConteudoCampanha" styleClass="textos"/>
					</div>
					<div>
						<html:radio  name="campanhaForm" styleId="cdTpLkImg3" property="conteudoImagem.linkTO.cdTipoLink" value="3" styleClass="combos tipoLink"/>
						Sem link
					</div>
					<div>
						<html:radio  name="campanhaForm" styleId="cdTpLkImg4" property="conteudoImagem.linkTO.cdTipoLink" value="4" styleClass="combos tipoLink" />
						Informativo:
						<html:select  name="campanhaForm" property="conteudoImagem.linkTO.cdLinkConteudoCampanha" styleClass="combos">
							<html:options collection="listaInformativos" property="cdCampanha" labelProperty="nmCampanha"/>
						</html:select>
					</div>
				</td>
			</tr>
			<tr>
				<td>Texto para Campanha:</td>
				<td><html:textarea property="conteudoImagem.dsTextoConteudoCampanha" styleId="textoPaginaConteudoCampanha" style="width: 510px; height: 150px; maxlength: 1300;"/></td>
			</tr>
		</tbody>
	</table>
</div>
</html:form>
<div id="botoes" class="linhaBotoes">
	<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
	<img src="<nedc:estaticpath path="bt_limpar.gif" type="imagem" />" onclick="limpar();">
	<img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" onclick="continuar();">
</div>
