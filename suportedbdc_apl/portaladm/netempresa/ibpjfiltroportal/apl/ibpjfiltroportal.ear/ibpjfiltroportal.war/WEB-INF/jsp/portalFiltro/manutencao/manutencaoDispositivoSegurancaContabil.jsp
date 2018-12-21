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

<html:form action="ExcluirDispositivoServicoContabil" method="post">
	<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
	<html:hidden name="manutencaoContabilForm" property="indicesSelecionados" styleClass="indicesSelecionados"/>
	
	<logic:empty name="manutencaoContabilForm" property="listaParametrizacaoServico">
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

	<logic:notEmpty name="manutencaoContabilForm" property="listaParametrizacaoServico">
		<TABLE cellSpacing=2 cellPadding=2 width="95%" border=0 align="center" id="tabelaZebrada">
			<thead class="textos">
				<TR class="textoBranco" bgcolor="#828282">
					<TD colspan="3">&nbsp;</TD>
			        <TD colspan="3">ASSINATURA ISOLADA</TD>
				  	<TD colspan="3">ASSINATURA CONJUNTA</TD>
				  	<TD>&nbsp;</TD>
				</TR>
				<tr bgcolor="#cccccc">
					<td rowspan="2"></td>
					<td rowspan="2">Serviço</td>
					<td rowspan="2">Valor</td>
					<td rowspan="2">Lote - OTP <br/>Simples</td>
					<td colspan="2">Validação Valor Superior <br/>Assinatura</td>
					<td rowspan="2">Lote - OTP <br/>Simples</td>
					<td colspan="2">Validação Valor Superior <br/>Assinatura</td>
					<TD rowspan="2">&nbsp;</TD>
				</tr>
				<tr bgcolor="#cccccc">
					<td>Unitária</td>
					<td>Lote</td>
					<td>Unitária</td>
					<td>Lote</td>
				</tr>
			</thead>
			<TBODY class="textos">
				<logic:iterate name="manutencaoContabilForm" property="listaParametrizacaoServico" id="parametrizacaoServico">
					<tr>
						<td><html:checkbox name="parametrizacaoServico" property="selecionado" styleClass="checkServico" /></td>
						<td><bean:write name="parametrizacaoServico" property="elemento.servico.descricao"/></td>
						<td><bean:write name="parametrizacaoServico" property="valor"/></td>
						<td><html:checkbox name="parametrizacaoServico" property="elemento.chaveSeisDigitosLoteInferiorLimiteIsolada" disabled="true"/></td>
						<td><html:checkbox name="parametrizacaoServico" property="elemento.chaveSeisDigitosIsoladaSuperiorLimiteIsolada" disabled="true"/></td>
						<td><html:checkbox name="parametrizacaoServico" property="elemento.chaveSeisDigitosLoteSuperiorLimiteIsolada" disabled="true"/></td>
						<td><html:checkbox name="parametrizacaoServico" property="elemento.chaveSeisDigitosLoteInferiorLimiteConjunta" disabled="true"/></td>
						<td><html:checkbox name="parametrizacaoServico" property="elemento.chaveSeisDigitosIsoladaSuperiorLimiteConjunta" disabled="true"/></td>
						<td><html:checkbox name="parametrizacaoServico" property="elemento.chaveSeisDigitosLoteSuperiorLimiteConjunta" disabled="true"/></td>
						<td><html:link action="AlterarDispositivoServicoContabil" paramId="CTRL" paramName="CTRL" indexed="true">Alterar</html:link></td>
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
				<logic:notEmpty name="manutencaoContabilForm" property="listaParametrizacaoServico">
					<a href="Javascript: validarExclusao();"><img src="<nedc:estaticpath path="bt_excluir.gif" type="imagem" />" border=0></a>
				</logic:notEmpty>
				<html:link action="IncluirDispositivoServicoContabil" paramId="CTRL" paramName="CTRL">
					<img src="<nedc:estaticpath path="bt_incluir.gif" type="imagem" />" border="0">
				</html:link>
			</td>
	    </tr>
	</table>
</html:form>
