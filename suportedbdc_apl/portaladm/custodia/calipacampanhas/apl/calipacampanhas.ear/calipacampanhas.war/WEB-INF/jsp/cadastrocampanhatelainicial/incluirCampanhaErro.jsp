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
	document.forms[0].action = '<bean:write name="RETORNAR_PARA"/>?CTRL=' + '<%=request.getParameter("CTRL")%>';
	document.forms[0].submit();
	return true;
}

//-->
</script>
<html:form action="ExibirMenu" method="post">
	<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
	<input type="hidden" name="voltar" value="true">
	<html:hidden property='cdAmbienteInternet' />
	<html:hidden property='campanha.cdCategoriaPagina' />
	
	<html:hidden property="campanha.nmCampanha"/>

	<html:hidden property="conteudoImagem.dsTextoAlternativoConteudoCampanha"/>
	<html:hidden property="conteudoImagem.dsTextoConteudoCampanha"/>
	<html:hidden property="conteudoImagem.enFisicoConteudoCampanha"/>
	<html:hidden property="conteudoImagem.enURLConteudoCampanha"/>
	
	<html:hidden property="conteudoImagem.cdLinkConteudoCampanha"/>
	<html:hidden property="conteudoImagem.linkTO.cdTipoLink"/>
	<html:hidden property="conteudoImagem.linkTO.enUrlLinkConteudoCampanha"/>
	<html:hidden property="conteudoImagem.linkTO.cdLinkConteudoCampanha"/>
<div id="mensagem">
	<p><html:errors /> </p>
</div>
</html:form>
<div id="botoes" class="linhaBotoes">
	<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
</div>
