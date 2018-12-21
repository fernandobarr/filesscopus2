<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<link rel="stylesheet" href="<nedc:estaticpath path="manutencaoFiltros.css" type="estilo" />" type="text/css"/>
<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript" />"></script>
<script type="text/javascript" src="<nedc:estaticpath path="manutencaoFiltros.js" type="javascript" />"></script>

<html:form action="ConfirmarAlterarNaoContabil" method="post" styleId="formAlteracao">
<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
<html:hidden name="manutencaoAdministrativoForm" property="senhaGestor"/>
<html:hidden name="manutencaoAdministrativoForm" property="servicoSelecionado.chaveSeisAssinaturaIsolada" styleClass="isolada"/>
<html:hidden name="manutencaoAdministrativoForm" property="servicoSelecionado.chaveSeisAssinaturaConjunta" styleClass="conjunta"/>

<TABLE cellSpacing=2 cellPadding=2 width="60%" border=0 align="center" id="tabelaZebrada">
	<thead class="textos">
		<TR class="textoBranco" bgcolor="#828282">
			<TD>Serviço</TD>
		  	<TD>Assinatura Isolada</TD>
		  	<TD>Assinatura Conjunta</TD>
		</TR>
	</thead>
	<TBODY class="textos">
		<tr>
			<td><bean:write name="manutencaoAdministrativoForm" property="servicoSelecionado.servico.descricao"/></td>
			<td><html:checkbox name="manutencaoAdministrativoForm" property="servicoSelecionado.chaveSeisAssinaturaIsolada" styleClass="isolada" /> Assinatura</td>
			<td><html:checkbox name="manutencaoAdministrativoForm" property="servicoSelecionado.chaveSeisAssinaturaConjunta" styleClass="conjunta" /> Assinatura</td>
		</tr>
	</TBODY>
</TABLE>
<br/>
<br/>
</html:form>

<%@ include file="../senha.jsp" %>
                 
<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<html:link action="ManutencaoDispositivoSegurancaNaoContabil" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link>
			<a href="Javascript: VrfFrm(this);"><img src="<nedc:estaticpath path="bt_confirmar.gif" type="imagem" />" border=0></a>
		</td>
    </tr>
</table>
