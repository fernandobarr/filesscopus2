<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>
<script>
$(function() {
    $(".dataMenu").datepicker({ dateFormat: 'dd/mm/yy' });
});
</script>
<%-- <html:form action="GravarMenu" method="post"> --%>
	<table class="tabelaDadosPortal tabelaDadosMenus">
		<logic:iterate id="menu" name="menuForm" property="listaMenusFilhos" 
					type="br.com.bradesco.custodia.portal.portaladm.negocio.MenuTO">
			<logic:equal value="1" property='bTreeLvl' name="menu">
				<thead>
					<tr>
						<th><bean:write name="menu" property="iMenuServc"/></th>
						<th>Menu Habilitado</th>
						<th>Bloqueio de Menu por período</th>
						<th>Data início bloqueio</th>
						<th>Data fim bloqueio</th>
					</tr>
				</thead>
			</logic:equal>
		</logic:iterate>
		<tbody>
			<logic:iterate id="menu" name="menuForm" property="listaMenusFilhos"
					type="br.com.bradesco.custodia.portal.portaladm.negocio.MenuTO">
				<logic:equal value="2" property='bTreeLvl' name="menu">
					<tr>
						<td colspan="5" style="font-weight: bold;"><bean:write name="menu" property="iMenuServc"/></td>
					</tr>
				</logic:equal>
				<logic:equal value="3" property='bTreeLvl' name="menu">
					<tr>
						<td><bean:write name="menu" property="iMenuServc"/></td>
						<td><html:checkbox name="menu" property="cIndcdLinkMenuHablt"/></td>
						<td><html:checkbox name="menu" property="cIndcdMenuHabltPeriod"/></td>
						<td><html:text name="menu" property="dInicBloqMenu" styleClass="dataMenu"/></td>
						<td><html:text name="menu" property="dFimBloqMenu" styleClass="dataMenu"/></td>
					</tr>
				</logic:equal>
			</logic:iterate>
		</tbody>
	</table>
<%-- 	<html:cancel value="" ></html:cancel> --%>
<%-- 	<html:submit>Save</html:submit> --%>
	<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
	<img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" onclick="continuar();">
<%-- </html:form> --%>