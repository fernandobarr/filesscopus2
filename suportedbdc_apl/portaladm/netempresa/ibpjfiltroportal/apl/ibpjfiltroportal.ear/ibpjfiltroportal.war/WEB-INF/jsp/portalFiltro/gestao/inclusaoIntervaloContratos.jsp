<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc"%>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<script>
var msgIntervaloDe = "O campo Do Contrato é obrigatório.";
var msgIntervaloAte = "O campo Até Contrato é obrigatório.";
</script>

<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript" />"></script>
<script type="text/javascript" src="<nedc:estaticpath path="numeric.js" type="javascript" />"></script>
<script type="text/javascript" src="<nedc:estaticpath path="gestaoFiltros.js" type="javascript" />"></script>

<html:form action="InclusaoIntervaloContratos" method="post">
<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
<html:hidden name="criacaoClientesForm" property="senhaGestor"/>
<html:hidden name="criacaoClientesForm" property="filtroEscolhido"/>
<html:hidden name="criacaoClientesForm" property="tipoInclusao"/>
<html:hidden name="criacaoClientesForm" property="listaContratos" styleClass="listaIntervalos"/>

<table width="40%" align="center" border="0" id="tabela_dados">
	<tbody>
		<tr>
			<td colspan="2" class="textosBrancos" height="30">&nbsp;</td>
		</tr>
		<tr class="textoBranco" bgcolor="#828282">
			<td colspan="2" class="textosBrancos" height="20">
				<b>Filtro do Dispositivo de Segurança nas transações Net Empresa</b>
			</td>
		</tr>
		
		<tr id="linha_vazia" style="display: none;">
			<td align="center" bgcolor="#ebebeb" class="textos">
				Do Contrato: <input size="4" type="text" class="numeric input_de" />
			</td>
			<td bgcolor="#ebebeb" class="textos">
				Até Contrato: <input size="4" type="text" class="numeric input_ate"/>
			</td>
			<td align="right">
				<a href="Javascript:;" class="adicionaLinha" title="Adicionar linha"><img src="<nedc:estaticpath path="bt_adicionarItem.gif" type="imagem" />" border="0"></a>
				<a href="Javascript:;"class="removeLinha" title="Remover linha" style="display:none"><img src="<nedc:estaticpath path="bt_removerItem.gif" type="imagem" />" border="0"></a>
			</td>
		</tr>
		
		<tr class="linha_dados">
			<td align="center" bgcolor="#ebebeb" class="textos">
				Do Contrato: <input size="4" type="text" class="numeric input_de" />
			</td>
			<td bgcolor="#ebebeb" class="textos">
				Até Contrato: <input size="4" type="text" class="numeric input_ate"/>
			</td>
			<td align="right">
				<a href="Javascript:;" class="adicionaLinha" title="Adicionar linha"><img src="<nedc:estaticpath path="bt_adicionarItem.gif" type="imagem" />" border="0"></a>
				<a href="Javascript:;"class="removeLinha" title="Remover linha" style="display:none"><img src="<nedc:estaticpath path="bt_removerItem.gif" type="imagem" />" border="0"></a>
			</td>
		</tr>

	</tbody>
</table>
<br/>
</html:form>

<%@ include file="../senha.jsp" %>

<br/>
<table height="25" align="center">
	<tbody>
		<tr>
			<td align="center">
				<html:link action="CriacaoClientes" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
					<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
				</html:link> 
				<input src="<nedc:estaticpath path="bt_limpar.gif" type="imagem" />" style="margin: 0 5px;" onclick="document.forms[0].reset();" type="image" /> 
				<a href="Javascript: validarInclusaoIntervalos();"><img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" border=0></a>
			</td>
		</tr>
	</tbody>
</table>
