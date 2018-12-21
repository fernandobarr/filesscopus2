<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>

<script language="javascript">
function voltar() {
	document.forms.frmVoltar.submit();
}	
function anteriores() {
	document.forms.frmDetalhar.action = "ConsultarCampanhaLista.do";
	document.forms.frmDetalhar.elements['linhaInicial'].value = parseInt(document.forms.frmDetalhar.elements['linhaInicial'].value) - 1;
	document.forms.frmDetalhar.submit();
}
function proximos() {
	document.forms.frmDetalhar.action = "ConsultarCampanhaLista.do";
	document.forms.frmDetalhar.elements['linhaInicial'].value = parseInt(document.forms.frmDetalhar.elements['linhaInicial'].value) + 1;
	document.forms.frmDetalhar.submit();
}
function detalhar() {
	var test = false;
	var objRadio = document.forms.frmDetalhar.elements['campanha.cdCampanha'];
	if (objRadio.length != null) {
		for (i=0; i < objRadio.length; i++ ) {
			if (objRadio[i].checked == true) test = true;
		}
	} else {
		 if (objRadio.checked == true) test = true;
	}
	if (test == false){
		alert("Selecione uma campanha para detalhar.");
	} else {
		document.forms.frmDetalhar.action = "DetalharCampanha.do";
		document.forms.frmDetalhar.submit();
	}
}

</script>
<html:form action="ConsultarCampanha.do" styleId="frmVoltar" method="post">
	<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
	<html:hidden property='cdAmbienteInternet' />
	<html:hidden property='campanha.cdCategoriaPagina' />
	<html:hidden property='campanhaFiltro.cdCategoriaPagina' />

	<html:hidden property="campanhaFiltro.cdCampanha"/>
	<html:hidden property="campanhaFiltro.cdSituacaoCampanha"/>
	<html:hidden property="campanhaFiltro.cdIndicadorSituacaoAtivo"/>
	<html:hidden property="campanhaFiltro.nmCampanha"/>
	<html:hidden property="campanhaFiltro.categoriaInformativo.cdCategoriaInformativo"/>
	
</html:form>
	<logic:notPresent name="MSG_USUARIO">
<div id="dadosCampanha" >
	<html:form action="ConsultarCampanhaLista.do" styleId="frmDetalhar" method="post">
		<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
		<html:hidden property='cdAmbienteInternet' />
		<html:hidden property='campanha.cdCategoriaPagina' />
		<html:hidden property='campanhaFiltro.cdCategoriaPagina' />
	
		<html:hidden property="campanhaFiltro.cdCampanha"/>
		<html:hidden property="campanhaFiltro.cdSituacaoCampanha"/>
		<html:hidden property="campanhaFiltro.cdIndicadorSituacaoAtivo"/>
		<html:hidden property="campanhaFiltro.nmCampanha"/>
		<html:hidden property="campanhaFiltro.categoriaInformativo.cdCategoriaInformativo"/>
	
		<html:hidden property="linhaInicial"/>
		<div class="linhaPaginacao">
			<div class="esquerda textos">Total&nbsp;de&nbsp;campanhas:&nbsp;<bean:write name="listaCampanhas" property="qtTotalLinhas"/></div>
			<div class="direita textos">Pág <bean:write name="listaCampanhas" property="nuPaginaAtual"/> de <bean:write name="listaCampanhas" property="qtTotalPaginas"/></div>
		</div>
		<table class="tabelaListagemPortal">
			<colgroup>
				<col style="width: 26px;"/>
				<col style="width: 50px;"/>
				<logic:equal value="2" property='campanhaFiltro.cdCategoriaPagina' name="campanhaForm">
				<col style="width: 160px;"/>
				</logic:equal>
				<col style=""/>
				<col style="width: 60px;"/>
			</colgroup>
			<thead>
				<tr>
					<th colspan="5">
						<strong><bean:write name="categoriaPagina" property="nmCategoriaPagina"/></strong>
					</th>
				</tr>
				<tr>
					<th colspan="2" >Solicitação</th>
				<logic:equal value="2" property='campanhaFiltro.cdCategoriaPagina' name="campanhaForm">
					<th>Categoria</th>
				</logic:equal>
					<th>Nome da Campanha</th>
					<th>Situação</th>
				</tr>
			</thead>							
			<tbody>
			<logic:iterate id="campanha" name="listaCampanhas" 
					type="br.com.bradesco.custodia.portal.campanhas.negocio.CampanhaTO">
				<tr>
					<td >
						<html:radio name="campanhaForm"  property="campanha.cdCampanha" idName="campanha" value="cdCampanha" styleClass="combos"/>
					</td>
					<td class="center"><bean:write name="campanha" property="cdCampanha"/></td>
				<logic:equal value="2" property='campanhaFiltro.cdCategoriaPagina' name="campanhaForm">
					<td><bean:write name="campanha" property="categoriaInformativo.nmCategoriaInformativo"/></td>
				</logic:equal>
					<td class="left" ><bean:write name="campanha" property="nmCampanha"/></td>
					<td class="center">
						<logic:equal value="1" name="campanha" property="cdIndicadorSituacaoAtivo">
							<img src="<nedc:estaticpath path="sem_verde.gif" type="imagem" />" border=0>
						</logic:equal>
						<logic:equal value="0" name="campanha" property="cdIndicadorSituacaoAtivo">
							<img src="<nedc:estaticpath path="sem_vermelho.gif" type="imagem" />" border=0>
						</logic:equal>
					</td>
				</tr>
			</logic:iterate>
			</tbody>
		</table>
		<div class="linhaPaginacao">
			<div class="esquerda">
				<logic:equal value="true" name="listaCampanhas" property="temAnterior"> 
					<a href="javascript: anteriores();" class="dadosv">&lt;&lt; anteriores</a>
				</logic:equal>
			</div>
			<div class="direita">
				<logic:equal value="true" name="listaCampanhas" property="temProximo"> 
					<a href="javascript: proximos();" class="dadosv">próximos &gt;&gt;</a>
				</logic:equal>
			</div>
		</div>
		<div class="legendaTabela">
			<table class="tabelaListagemPortal">
				<colgroup>
					<col style="width: 26px;"/>
					<col style=""/>
				</colgroup>
				<tbody>
				<tr>
					<td class="center"><img src="<nedc:estaticpath path="sem_verde.gif" type="imagem" />" border=0></td>
					<td>Ativada</td>
				</tr>
				<tr>
					<td class="center"><img src="<nedc:estaticpath path="sem_vermelho.gif" type="imagem" />" border=0></td>
					<td>Desativada</td>
				</tr>
				</tbody>
			</table>
		</div>
	</html:form>	
</div>
<div id="botoes" class="linhaBotoes">
	<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
	<img src="<nedc:estaticpath path="bt_detalhar.gif" type="imagem" />" onclick="detalhar();">
</div>	
	
	</logic:notPresent>
	<logic:present name="MSG_USUARIO">
<div id="mensagem">
	<p><bean:write name="MSG_USUARIO"/></p>
</div>
<div id="botoes" class="center">
	<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
</div>	

	</logic:present>
