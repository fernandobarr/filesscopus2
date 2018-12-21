<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<%
pageContext.setAttribute("CTRL", request.getParameter("CTRL"));
%>

<table align="center" border="0" cellpadding="2" cellspacing="2">
	<tbody>
		<tr class="textos">
			<td align="left"><b>Selecione o filtro desejado:</b></td>
			<td align="left">
				<select class="combos" style="width: 400px;">
					<option value="0">Selecione o filtro</option>
					<option value="1">Tíquete</option>
					<option value="2">Saldos E Extratos em Java</option>
					<option value="3">Plug In de Segurança</option>
					<option value="4">Vale Pedágio JAVA TIBC 3.0</option>
					<option value="5">Campanha - Cidadetran</option>
					<option value="7">Gerador de Logs de Extrato</option>
					<option value="8">Dispatcher Java</option>
					<option value="9">Filtro do Dispositivo de Segurança nas transações Net Empresa</option>
				</select>
			</td>
		</tr>
		<tr class="textos" align="center">
			<td colspan="2" align="left">
				<br/>
				<br/>
				<br/> 
				<b>Selecione o tipo de consulta:</b>
			</td>
		</tr>
		<tr class="textos">
			<td colspan="2" align="left">
				<input name="tipo_inclusao" id="cnpj_cpf" type="radio" /> Por CNPF e CPF<br/>
				<input name="tipo_inclusao" id="agencia" type="radio" /> Por intervalo de agência<br/>
				<input name="tipo_inclusao" id="contrato" type="radio" /> Por intervalo de número de contrato
			</td>
		</tr>
	</tbody>
</table>

<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<br/>
			<br/> 
			<html:link action="MenuGestaoFiltros" paramId="CTRL" paramName="CTRL" style="padding-right: 5px;">
				<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" border="0">
			</html:link> 
			<html:link action="ManutencaoConsultaClientes" paramId="CTRL" paramName="CTRL" style="padding-left: 5px;">
				<img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" border="0">
			</html:link>
		</td>
	</tr>
</table>
