<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>

<%
// PELO MOTIVO DO FORM UTILIZAR O ATRIBUTO enctype="multipart/form-data", POR CAUSA DA CARGA DO PARAMETRO HTML:FILE,
// E NECESSARIO PASSAR O CTRL DIRETAMENTE JUNTO COM O NOME DA ACTION, POIS SENAO O CTRL NAO SERA PASSADO PARA A PR�XIMA PAGINA
String valCTRL = request.getParameter("CTRL");
pageContext.setAttribute("CTRL", valCTRL);
String actionDestino = "IncluirInformativoConfirmar.do?CTRL=" + valCTRL;
// variaveis para editor de texto (+valCTRL)
String URL_BASE;
URL_BASE = request.getRequestURL().toString();
URL_BASE = URL_BASE.substring(0, URL_BASE.lastIndexOf('/'));
URL_BASE = URL_BASE.substring(0, URL_BASE.lastIndexOf('/'));

String cdSite = "1";
%>
<script type="text/javascript" src="<nedc:estaticpath path="gestaoCampanhas.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="validacao.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="geral.js" type="javascript"/>"></script>

<script type="text/javascript">
<!--
	function voltar() {
		document.forms.campanhaForm.action = 'ExibirMenu.do?CTRL=<%=valCTRL %>';
		document.forms.campanhaForm.submit();
		return false;
	}
	function continuar() {
		var result = validarNomeCampanha(document.forms[0]);
		if (document.forms[0]['fakefiletext1'].value == "") {
			alert("O campo arquivo deve ser preenchido.");
			document.forms[0]['fakefiletext1'].focus();
			result = false;
		}		
		
		if (result && document.forms[0]['conteudoImagem.dsTextoConteudoCampanha'] != null 
				&& document.forms[0]['conteudoImagem.dsTextoConteudoCampanha'].value == '') {
			alert("Informe o campo texto.");
			document.forms[0]['conteudoImagem.dsTextoConteudoCampanha'].focus();
			result = false;
		}
		if (result) {
			document.forms.campanhaForm.action = '<%=actionDestino %>';
			document.forms.campanhaForm.submit();
		}			
	}
	function limpar() {
		document.forms[0]['campanha.nmCampanha'].value='';
		
		document.forms[0]['formFileArquivo'].value=null;
		document.forms[0]['fakefiletext1'].value='';
		
		if (document.forms[0]['conteudoImagem.enFisicoConteudoCampanha'])
			document.forms[0]['conteudoImagem.enFisicoConteudoCampanha'].value='';
		if (document.forms[0]['conteudoImagem.enURLConteudoCampanha'])
			document.forms[0]['conteudoImagem.enURLConteudoCampanha'].value='';

		document.forms[0]['conteudoImagem.dsTextoConteudoCampanha'].value='';

		document.forms[0]['campanha.categoriaInformativo.cdCategoriaInformativo'].selectedIndex = 0;
	}	
//-->
</script>
<html:form action="<%=actionDestino %>"  method="post" enctype="multipart/form-data">
	<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
	<html:hidden property='cdAmbienteInternet' />
	<html:hidden property='campanha.cdCategoriaPagina' />
<div id="dadosCampanha" >
	<table class="tabelaDadosPortal">
		<thead>
			<tr>
				<th colspan="2">Informativo</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Site:</td>
				<td><bean:write name="nmAmbienteInternet" /></td>
			</tr>
			<tr>
				<td>Nome do Informativo:</td>
				<td><html:text property="campanha.nmCampanha" size="60" maxlength="30" styleClass="textos"/></td>
			</tr>
			<tr>
				<td>Categoria:</td>
				<td>
					<html:select property="campanha.categoriaInformativo.cdCategoriaInformativo" styleClass="combos">
						<html:options collection="listaCategorias" property="cdCategoriaInformativo" labelProperty="nmCategoriaInformativo"/>
					</html:select>				
				</td>
			</tr>
			<tr>
				<td>Arquivo:</td>
				<td>
					<div class="fileinputs">
						<html:file property="formFileArquivo" size="40" styleClass="textos file" styleId="imgFile"
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
							<img src="<nedc:estaticpath path="bt_procurar.gif" type="imagem" />" border=0 onclick="document.forms[0]['formFileArquivo'].click();">
							&nbsp;
							<img alt="Ajuda" onclick="window.open('AjudaImagens.do?CTRL=<%=request.getParameter("CTRL")%>','','width=540,height=300,top=150,left=300')" src="<nedc:estaticpath path="ajuda.gif" type="imagem" />">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Texto:</td>
				<td><html:text property="conteudoImagem.dsTextoConteudoCampanha" size="60" maxlength="256" styleClass="textos"/></td>
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
