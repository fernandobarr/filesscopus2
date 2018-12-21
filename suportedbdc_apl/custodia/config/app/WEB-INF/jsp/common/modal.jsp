<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t" %>
<%@ taglib uri="http://bradesco.com.br/arq_components" prefix="brArq"%>
<%@ taglib uri="http://bradesco.com.br/app_components" prefix="brApp" %>
<%@ taglib uri="http://bradesco.com.br/html_custom_components" prefix="brHtml" %>
<%@ taglib uri="http://bradesco.com.br/app_components_ib" prefix="brAppIb" %>
<%@ taglib uri="http://bradesco.com.br/presentation_core" prefix="brCore"%>

<tiles:useAttribute name="codigoFamiliaServico" id="codigoFamiliaServico" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="codigoServico" id="codigoServico" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="codigoItemMenu" id="codigoItemMenu" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="descricaoServico" id="descricaoServico" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="numeroTela" id="numeroTela" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="largura" id="largura" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="focoBotaoFechar" id="focoBotaoFechar" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="messageBundle" id="messageBundle" ignore="true" classname="java.lang.String" scope="session"/>
<tiles:useAttribute name="css" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="js" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="css_infra" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="js_infra" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="cssIE8" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="jsIE8" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="cssIE7" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="jsIE7" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="css_awb" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="js_awb" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="subtitulo" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="css_sei" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="js_sei" classname="java.util.List" scope="request" ignore="true"/>

<html lang="pt-br">
<f:view>

<f:loadBundle basename="#{facesContext.application.messageBundle}" var="messageBundleInfra" />
<f:loadBundle basename="#{messageBundle}" var="messageBundle" />
<f:loadBundle basename="br.com.bradesco.web.ib.view.bundle.app.BotaoResourceBundle" var="botao" />
<f:loadBundle basename="br.com.bradesco.web.ib.view.bundle.app.Conteudos" var="conteudo" />

<head>
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Content-Type" content="text/html;CHARSET=iso-8859-1" />
	<link rel="shortcut icon" href="http://www.bradesco.com.br/bradesco.ico"/>
	<title><brHtml:brOutputText value="#{messageBundleInfra.webapp_title}" /></title>

	<brArq:dataList var="itemCSS" value="#{css_awb}" rendered="#{css_awb != null}">
		<brCore:addResource resource="#{itemCSS.link}" />
	</brArq:dataList>
	<brArq:dataList var="itemCSS" value="#{css_infra}" rendered="#{css_infra != null}">
		<brArq:stylesheet href="#{itemCSS.link}" media="#{itemCSS.tooltip}" />
	</brArq:dataList>
	<brArq:dataList var="itemCSS" value="#{css}" rendered="#{css != null}">
		<brArq:stylesheet href="#{itemCSS.link}" media="#{itemCSS.tooltip}" />
	</brArq:dataList>
	<brArq:dataList var="itemJS" value="#{js_awb}" rendered="#{js_awb != null}">
		<brCore:addResource resource="#{itemJS.link}" />
 	</brArq:dataList>
	<brArq:dataList var="itemJS" value="#{js_infra}" rendered="#{js_infra != null}">
		<brArq:javascript src="#{itemJS.link}" />
 	</brArq:dataList>
	<brArq:dataList var="itemJS" value="#{js}" rendered="#{js != null}">
		<brArq:javascript src="#{itemJS.link}" />
	</brArq:dataList>
	<brHtml:brOutputText value="<!--[if lt IE 8]>" escape="false" rendered="#{(cssIE8 != null) || (jsIE8 != null)}" />
	<brArq:dataList var="itemCSS" value="#{cssIE8}" rendered="#{cssIE8 != null}">
		<brArq:stylesheet href="#{itemCSS.link}" media="#{itemCSS.tooltip}" />
	</brArq:dataList>
	<brArq:dataList var="itemJS" value="#{jsIE8}" rendered="#{jsIE8 != null}">
		<brArq:javascript src="#{itemJS.link}" />
	</brArq:dataList>
	<brHtml:brOutputText value="<![endif]-->" escape="false" rendered="#{(cssIE8 != null) || (jsIE8 != null)}" />

	<brHtml:brVerbatim>
		<script type="text/javascript">
		<!--
			document.domain = "<h:outputText value='#{propBean.config.properties["url.domain"]}'/>";
		//-->
		</script>
		<noscript></noscript>
	</brHtml:brVerbatim>
</head>
<body style="background-color:transparent;">

	<brArq:div styleClass="jqmWindow_infra_estrutura" id="modalInfraEstrutura" style="width:#{largura};">
		<brArq:div styleClass="jqmCornerTop">
			<brHtml:brOutputText styleClass="cc" value="<!-- -->" escape="false" />
			<brHtml:brOutputText styleClass="c1" value="<!-- -->" escape="false" />
			<brHtml:brOutputText styleClass="c2" value="<!-- -->" escape="false" />
		</brArq:div>

		<brArq:div styleClass="jqmWrapper after">
			<brArq:div styleClass="jqmTop ml15 pl0 after bb1">
				<brHtml:brOutputLink value="javascript:;//" styleClass="lnkFechar closeModal" title="Fechar" rendered="#{focoBotaoFechar == 'true'}">
					<brHtml:brOutputText value="Fechar2" />
				</brHtml:brOutputLink>
				<brHtml:brOutputLink value="javascript:;//" styleClass="lnkFechar closeModal" title="Fechar" rendered="#{focoBotaoFechar != 'true'}">
					<brHtml:brOutputText value="Fechar2" />
				</brHtml:brOutputLink>
				<brHtml:brPanelGroup rendered="#{descricaoServico != ''}">
					<brHtml:brOutputText value="<h4>" escape="false" />
					<brHtml:brOutputLink value="" title="#{conteudo.orientacoesDeficienteVisual_1}" styleClass="tabindex tabfirst"/>					
					<brHtml:brOutputText styleClass="fts18px " value="#{messageBundle[descricaoServico]}" escape="false" />
					<brHtml:brOutputText value="</h4>" escape="false" />
				</brHtml:brPanelGroup>
				<brApp:p styleClass="clr fts11px mb10">
					<brHtml:brOutputText value="#{conteudo.subtitulo}" escape="false"/>
				</brApp:p>
			</brArq:div>			
			<brArq:div>
			     <brArq:div styleClass="pl20">
			         <brArq:div styleClass="jqmMiolo"></brArq:div>
			     </brArq:div>
	            <tiles:insert attribute="body" flush="false" ignore="true" />
			</brArq:div>
            
		</brArq:div>

		<brArq:div styleClass="jqmCornerBottom">
			<%-- <brArq:div styleClass="txt-codigoTela" rendered="#{(codigoServico != '') && (numeroTela != '')}"><brHtml:brOutputText value="#{codigoServico}" escape="false" /><brHtml:brOutputText value="#{numeroTela}" escape="false" /></brArq:div> --%>
			
			<brHtml:brOutputText styleClass="cc" value="<!-- -->" escape="false" />
			<brHtml:brOutputText styleClass="c3" value="<!-- -->" escape="false" />
			<brHtml:brOutputText styleClass="c4" value="<!-- -->" escape="false" />
		</brArq:div>
    </brArq:div>
</body>
</f:view>
</html>
