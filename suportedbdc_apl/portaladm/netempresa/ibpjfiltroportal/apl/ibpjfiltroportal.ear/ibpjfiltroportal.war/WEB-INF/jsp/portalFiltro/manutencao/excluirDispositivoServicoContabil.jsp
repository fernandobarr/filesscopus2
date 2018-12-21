<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<html:form action="/ConfirmarExcluirContabil" method="post" >
<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
<html:hidden name="manutencaoContabilForm" property="senhaGestor"/>

<table width="60%" align="center" border="0" id="tabela_dados">
	<tbody>
		<tr>
			<td colspan="1" class="textosBrancos" height="30">
				&nbsp;					                                
			</td>                                         
		</tr>                                                                                             
		<tr class="textoBranco" bgcolor="#828282">
			<td  class="textosBrancos" height="20">
				<b>Serviços a serem excluídos</b> 
			</td>
		</tr>
		<logic:iterate name="manutencaoContabilForm" property="listaServicoSelecionado" id="parametrizacaoServico">
			<tr height="20">
				<td class="textos" height="20" align="center" bgcolor="#ebebeb">
					<bean:write name="parametrizacaoServico" property="servico.descricao"/>
				</td>
			</tr>
		</logic:iterate>
	</tbody>
</table>
<br/>
<br/>
</html:form>

<%@ include file="../senha.jsp" %>
                 
<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<html:link action="ManutencaoDispositivoSegurancaContabil" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link>
			<a href="Javascript: VrfFrm(this);"><img src="<nedc:estaticpath path="bt_confirmar.gif" type="imagem" />" border=0></a>
		</td>
    </tr>
</table>
