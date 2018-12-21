<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<script type="text/javascript" src="<nedc:estaticpath path="jquery.js" type="javascript" />"></script>
<script type="text/javascript" src="<nedc:estaticpath path="numeric.js" type="javascript" />"></script>
<script type="text/javascript" src="<nedc:estaticpath path="gestaoFiltros.js" type="javascript" />"></script>

<html:form action="InclusaoCnpjCpf" method="post">
<input type="hidden" name="CTRL" value="<%=request.getParameter("CTRL")%>">
<html:hidden name="criacaoClientesForm" property="senhaGestor"/>
<html:hidden name="criacaoClientesForm" property="filtroEscolhido"/>
<html:hidden name="criacaoClientesForm" property="tipoInclusao"/>
<html:hidden name="criacaoClientesForm" property="listaCnpjCpf" styleClass="listaCnpjCpf"/>

<table width="40%" align="center" border="0" id="tabela_dados">
	<tbody>
		<tr>
			<td colspan="4" class="textosBrancos" height="30">&nbsp;</td>
		</tr>
		<tr class="textoBranco" bgcolor="#828282">
			<td colspan="4" height="20">
				<b>Filtro do Dispositivo de Segurança nas transações Net Empresa</b>
			</td>
		</tr>
		
		<tr style="display: none;" id="linha_vazia">
			<td class="textos" align="center" bgcolor="#ebebeb">CNPJ</td>
			<td bgcolor="#ebebeb">
				<input name="CNPJ" size="11" maxlength="14" value="" class="textos numeric input_cnpj" style="width: 150px;" type="text">
			</td>
			<td class="textos" align="center" bgcolor="#ebebeb">CPF</td>
			<td bgcolor="#ebebeb">
				<input name="CPF" size="11" maxlength="11" value="" class="textos numeric input_cpf" style="width: 150px;" type="text">
			</td>
			<td align="center">
				<a href="Javascript:;" class="adicionaLinha" title="Adicionar linha"><img src="<nedc:estaticpath path="bt_adicionarItem.gif" type="imagem" />" border="0"></a>
				<a href="Javascript:;"class="removeLinha" title="Remover linha" style="display:none"><img src="<nedc:estaticpath path="bt_removerItem.gif" type="imagem" />" border="0"></a>
			</td>
		</tr>
		
		<tr class="linha_dados">
			<td class="textos" align="center" bgcolor="#ebebeb">CNPJ</td>
			<td bgcolor="#ebebeb">
				<input name="CNPJ" size="11" maxlength="14" value="" class="textos numeric input_cnpj" style="width: 150px;" type="text">
			</td>
			<td class="textos" align="center" bgcolor="#ebebeb">CPF</td>
			<td bgcolor="#ebebeb">
				<input name="CPF" size="11" maxlength="11" value="" class="textos numeric input_cpf" style="width: 150px;" type="text">
			</td>
			<td align="center">
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
<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<html:link action="CriacaoClientes" paramId="CTRL" paramName="CTRL">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link> 
			<input src="<nedc:estaticpath path="bt_limpar.gif" type="imagem" />" style="margin: 10px 5px -5px;" onclick="document.forms[0].reset();" type="image" /> 
			<a href="Javascript: validarInclusaoCnpjCpf();"><img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" border=0></a>
		</td>
	</tr>
</table>

