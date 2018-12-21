<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>

<script type="text/javascript" src="<nedc:estaticpath path="gestaoCampanhas.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="validacao.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript"/>"></script>
<script type="text/javascript" src="<nedc:estaticpath path="geral.js" type="javascript"/>"></script>

<script type="text/javascript">
<!--
jQuery(document).ready(function() {
	if (jQuery('input[name="campanhaFiltro.cdCampanha"]').val() == '-1') {
		jQuery('input[name="campanhaFiltro.cdCampanha"]').val('');
	}
});

	function voltar() {
		document.forms.campanhaForm.action = 'ExibirMenu.do';
		document.forms.campanhaForm.submit();
		return false;
	}
	function continuar() {
		document.forms.campanhaForm.action = 'ConsultarCampanhaLista.do';
		document.forms.campanhaForm.submit();
		return false;
	}
	function limpar() {
		document.forms[0]['campanhaFiltro.cdIndicadorSituacaoAtivo'].selectedIndex = 0;
		document.forms[0]['campanhaFiltro.nmCampanha'].value='';
		document.forms[0]['campanhaFiltro.cdCampanha'].value='';
		
		if (document.forms[0]['campanhaFiltro.categoriaInformativo.cdCategoriaInformativo']) {
			document.forms[0]['campanhaFiltro.categoriaInformativo.cdCategoriaInformativo'].selectedIndex = 0;
		}
	}
	
//-->
</script>
<html:form action="ConsultarCampanhaLista"  method="post">
	<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
	<html:hidden property='cdAmbienteInternet' />
	<html:hidden property='campanha.cdCategoriaPagina' />
	<html:hidden property='campanhaFiltro.cdCategoriaPagina' />
	<html:hidden property="linhaInicial" value="1"/>
<div id="dadosCampanha" >
	<table class="tabelaDadosPortal">
		<thead>
			<tr>
				<th colspan="2"><bean:write name="categoriaPagina" property="nmCategoriaPagina" /></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Site:</td>
				<td><bean:write name="nmAmbienteInternet" /></td>
			</tr>
			<tr>
				<td>Situação:</td>
				<td>
					<html:select property="campanhaFiltro.cdIndicadorSituacaoAtivo" styleClass="combos">
						<html:option value="-1">&nbsp;</html:option>
						<html:option value="1">Ativa</html:option>
						<html:option value="0">Inativa</html:option>
					</html:select>
				</td>
			</tr>
			<tr>
				<td>Nome da campanha:</td>
				<td><html:text property="campanhaFiltro.nmCampanha" size="60" maxlength="50" styleClass="textos"/></td>
			</tr>
			<tr>
				<td>Numero da solicitação:</td>
				<td><html:text property="campanhaFiltro.cdCampanha" size="60" maxlength="10" styleClass="textos"/></td>
			</tr>
			<logic:equal value="2" property='campanhaFiltro.cdCategoriaPagina' name="campanhaForm">
			<tr>
				<td>Categoria:</td>
				<td>
					<html:select property="campanhaFiltro.categoriaInformativo.cdCategoriaInformativo" styleClass="combos">
						<html:option value="-1">&nbsp;</html:option>
						<html:options collection="listaCategorias" property="cdCategoriaInformativo" labelProperty="nmCategoriaInformativo"/>
					</html:select>	
				</td>
			</tr>
			</logic:equal>
		</tbody>
	</table>
</div>
</html:form>
<div id="botoes" class="linhaBotoes">
	<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
	<img src="<nedc:estaticpath path="bt_limpar.gif" type="imagem" />" onclick="limpar();">
	<img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" onclick="continuar();">
</div>
