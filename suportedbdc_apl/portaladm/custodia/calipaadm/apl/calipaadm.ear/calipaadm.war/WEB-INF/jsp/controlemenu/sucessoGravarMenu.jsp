<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>

<script>
function voltar() {
	menuForm.action = "SelecionarMenu.do";
	menuForm.submit();
}
</script>

<html:form action="SelecionarMenu.do">
	<div id="mensagem">
		<p>Configuração de menu incluída com sucesso!</p>
	</div>
	<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
</html:form>
