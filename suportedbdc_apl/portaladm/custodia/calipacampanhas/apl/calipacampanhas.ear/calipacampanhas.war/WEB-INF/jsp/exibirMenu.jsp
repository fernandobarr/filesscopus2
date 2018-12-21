<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>

<%
//pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>
<script type="text/javascript">
<!--
	function submeterBotao(flag) {
		// Determina foi o botao pressionado.
		switch (flag) {
			case 1:
				//Pressionado o botão consultar
				document.forms.campanhaForm.action = 'IncluirCampanhaEntrada.do';
				break;
			case 2:
				//Pressionado o botão consultar
				document.forms.campanhaForm.action = 'ConsultarCampanha.do';
				break;
			default:
				document.forms.campanhaForm.action = 'ExibirMenu.do';
		}
		
		document.forms.campanhaForm.submit();
		return false;
	}
//-->
</script>
<html:form action="ExibirMenu" method="post">
	<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
<div id="dadosCampanha">
	<table class="tabelaDadosPortal">
		<thead>
			<tr>
				<th colspan="2">Dados da Campanha</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Site:</td>
				<td>
					<html:select property="cdAmbienteInternet" styleClass="combos">
						<html:options collection="listaAmbientes" property="cdAmbienteInternet" labelProperty="nmAmbienteInternet"/>
					</html:select>
				</td>
			</tr>
			<tr>
				<td>Tipo:</td>
				<td>
					<html:select property="campanha.cdCategoriaPagina" styleClass="combos">
						<html:options collection="listaCategorias" property="cdCategoriaPagina" labelProperty="nmCategoriaPagina"/>
					</html:select>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</html:form>
<div id="botoes" class="linhaBotoes">
	<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="submeterBotao(0);">
	<img src="<nedc:estaticpath path="bt_incluir.gif" type="imagem" />" onclick="submeterBotao(1);">
	<img src="<nedc:estaticpath path="bt_consultar.gif" type="imagem" />" onclick="submeterBotao(2);">
</div>
