<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<%-- <script type="text/javascript" src="<nedc:estaticpath path="validacao.js" type="javascript"/>"></script> --%>
<%-- <script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript"/>"></script> --%>
<%-- <script type="text/javascript" src="<nedc:estaticpath path="geral.js" type="javascript"/>"></script> --%>

<style>
	.codMenuSel {
		display: none;
	}
</style>
<script type="text/javascript">

	function renderMenuForm() {
		var cdMenuSelecionado = $('.selectMenuPai').val();
		$("#div1").load("EditarMenu.do", {'cdMenuSelecionado':cdMenuSelecionado});
	}
	

	function continuar() {
		menuForm.action = 'GravarMenu.do';
		menuForm.submit();
	}
	
	function voltar() {
		menuForm.action = "SelecionarMenu.do";
		menuForm.submit();
	}
	
</script>
<html:form action="GravarMenu" method="post">
	<table class="tabelaDadosPortal">
		<thead>
			<tr><th colspan="2">Dados do Menu</th></tr>
		</thead>
		<tbody>
			<tr>
				<td>Família de Menu:</td>
				<td>
					<html:select onchange="renderMenuForm()" name="menuForm" property="cdMenuSelecionado" styleClass="selectMenuPai">
						<html:option value="" />
						<html:options collection="listaMenusPais" property="cMenuServc" labelProperty="iMenuServc" />
					</html:select>
				</td>
			</tr>
		</tbody>
	</table>
	
	
	<html:text property="cdMenuSelecionado" style="display: none" readonly="true" styleClass="codMenuSel" />
	<div id="div1">
	</div>
	<html:errors/>  
</html:form>


