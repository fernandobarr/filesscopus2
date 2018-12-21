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

<html:form action="ExcluirDispositivoServicoNaoContabil" method="post">
<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
<html:hidden name="manutencaoAdministrativoForm" property="indicesSelecionados" styleClass="indicesSelecionados"/>

<logic:empty name="manutencaoAdministrativoForm" property="listaParametrizacaoServico">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	    <tr><td>&nbsp;</td></tr>
	    <tr><td>&nbsp;</td></tr>
	    <tr>
	        <td width="100%" align="center" class="textos">
		    	<b>
					Nenhum serviço cadastrado.
				</b>
	        </td>
	    </tr>
    </table>
</logic:empty>

<logic:notEmpty name="manutencaoAdministrativoForm" property="listaParametrizacaoServico">
	<TABLE cellSpacing=2 cellPadding=2 width="60%" border=0 align="center" id="tabelaZebrada">
		<thead class="textos">
			<TR class="textoBranco" bgcolor="#828282">
				<TD></TD>
				<TD>Serviço</TD>
			  	<TD>Assinatura Isolada</TD>
			  	<TD>Assinatura Conjunta</TD>
			  	<td></td>
			</TR>
		</thead>
		<TBODY class="textos">
			<logic:iterate name="manutencaoAdministrativoForm" property="listaParametrizacaoServico" id="parametrizacaoServico">
				<tr>
					<td><html:checkbox name="parametrizacaoServico" property="selecionado" styleClass="checkServico" /></td>
					<td><bean:write name="parametrizacaoServico" property="elemento.servico.descricao"/></td>
					<td><html:checkbox name="parametrizacaoServico" property="elemento.chaveSeisAssinaturaIsolada" disabled="true"/> Assinatura</td>
					<td><html:checkbox name="parametrizacaoServico" property="elemento.chaveSeisAssinaturaConjunta" disabled="true"/> Assinatura</td>
					<td><html:link action="AlterarDispositivoServicoNaoContabil" paramId="CTRL" paramName="CTRL" indexed="true">Alterar</html:link></td>
				</tr>
			</logic:iterate>
		</TBODY>
	</TABLE>
</logic:notEmpty>
<br/>
<br/>
                    
<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<html:link action="MenuManutencaoDispositivoSeguranca" paramId="CTRL" paramName="CTRL">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link>
			<logic:notEmpty name="manutencaoAdministrativoForm" property="listaParametrizacaoServico">
				<a href="Javascript: validarExclusao();"><img src="<nedc:estaticpath path="bt_excluir.gif" type="imagem" />" border=0></a>
			</logic:notEmpty>
			<html:link action="IncluirDispositivoServicoNaoContabil" paramId="CTRL" paramName="CTRL">
				<img src="<nedc:estaticpath path="bt_incluir.gif" type="imagem" />" border="0">
			</html:link>
		</td>
    </tr>
</table>
</html:form>