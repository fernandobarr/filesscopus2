<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript">
	function acessarServico(codServico) {
		if(codServico == 1) {
			document.forms[0].action = "SelecionarMenu.do";
			document.forms[0].submit();
		} else if (codServico == 2) {
			document.forms[0].action = "SelecionarEmpresa.do";
			document.forms[0].submit();
		} else if (codServico == 3) {
			document.forms[0].action = "Selecionarquery.do";
			document.forms[0].submit();
		} else if (codServico == 4){
		}
	}
</script>
<html:form action="SelecionarMenu" method="post">
	<table>
		<thead>
			<tr><th colspan="1"></th></tr>
		</thead>
		<tbody>
			<tr>
				<td><a onclick="acessarServico(1)">Controle de Menu</a></td>
			</tr>
			<tr>
				<td><a onclick="acessarServico(2)">Parametrização de Empresas</a></td>
			</tr>
			<tr>
				<td><a onclick="acessarServico(3)">Query Online</a></td>
			</tr>
			<tr>
				<td><a onclick="acessarServico(4)">Upload de Termo de Adesão</a></td>
			</tr>
		</tbody>
	</table>
</html:form>