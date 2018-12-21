<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t" %>
<%@ taglib uri="http://bradesco.com.br/arq_components" prefix="brArq"%>
<%@ taglib uri="http://bradesco.com.br/app_components" prefix="brApp" %>
<%@ taglib uri="http://bradesco.com.br/html_custom_components" prefix="brHtml" %>
<%@ taglib uri="http://bradesco.com.br/app_components_ib" prefix="brAppIb" %>
<%@ taglib uri="http://bradesco.com.br/presentation_core" prefix="brCore"%>
<%-- <%@ taglib uri="http://bradesco.com.br/ib/components" prefix="ib" %>
<%@ taglib uri="http://bradesco.com.br/ib/seiLote" prefix="ibsei" %> --%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>

<tiles:useAttribute name="codigoFamiliaServico" id="codigoFamiliaServico" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="codigoServico" id="codigoServico" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="codigoMenu" id="codigoMenu" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="descricaoServico" id="descricaoServico" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="numeroTela" id="numeroTela" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="nivelCaminhoPao" id="nivelCaminhoPao" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="passo" id="passo" classname="java.lang.String" scope="request" ignore="true"/>
<tiles:useAttribute name="messageBundle" id="messageBundle" ignore="true" classname="java.lang.String" scope="session"/>
<tiles:useAttribute name="css" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="js" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="css_infra" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="js_infra" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="cssIE8" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="jsIE8" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="cssIE7" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="jsIE7" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="css_sei" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="js_sei" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="css_awb" classname="java.util.List" scope="request" ignore="true"/>
<tiles:useAttribute name="js_awb" classname="java.util.List" scope="request" ignore="true"/>

<tiles:useAttribute name="operacoesEm" id="operacoesEm" classname="java.lang.String" scope="request" ignore="true" />
<tiles:useAttribute name="actionEfetuarNovaAutorizacao" id="actionEfetuarNovaAutorizacao" classname="java.lang.String" scope="request" ignore="true" />

<html lang="pt-br">
<f:view>
<f:loadBundle basename="#{facesContext.application.messageBundle}" var="messageBundleInfra" />
<f:loadBundle basename="#{messageBundle}" var="messageBundle" />
<f:loadBundle basename="br.com.bradesco.web.ib.view.bundle.app.BotaoResourceBundle" var="botao" />
<f:loadBundle basename="br.com.bradesco.web.ib.view.bundle.app.Conteudos" var="conteudo" />

<head>
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<link rel="shortcut icon" href="http://www.bradesco.com.br/bradesco.ico"/>
	<title><h:outputText value="#{messageBundleInfra.webapp_title}" /></title>

	<t:dataList var="itemCSS" value="#{css_awb}" rendered="#{css_awb != null}">
		<brCore:addResource resource="#{itemCSS.link}" />
	</t:dataList>
	<t:dataList var="itemCSS" value="#{css_infra}" rendered="#{css_infra != null}">
		<brArq:stylesheet href="#{itemCSS.link}" media="#{itemCSS.tooltip}" />
	</t:dataList>
	<t:dataList var="itemCSS" value="#{css}" rendered="#{css != null}">
		<brArq:stylesheet href="#{itemCSS.link}" media="#{itemCSS.tooltip}" />
	</t:dataList>
	<t:dataList var="itemJS" value="#{js_awb}" rendered="#{js_awb != null}">
		<brCore:addResource resource="#{itemJS.link}" />
 	</t:dataList>
	<t:dataList var="itemJS" value="#{js_infra}" rendered="#{js_infra != null}">
		<brArq:javascript src="#{itemJS.link}" />
 	</t:dataList>
	<t:dataList var="itemJS" value="#{js}" rendered="#{js != null}">
		<brArq:javascript src="#{itemJS.link}" />
	</t:dataList>
	<h:outputText value="<!--[if lt IE 8]>" escape="false" rendered="#{(cssIE8 != null) || (jsIE8 != null)}" />
	<t:dataList var="itemCSS" value="#{cssIE8}" rendered="#{cssIE8 != null}">
		<brArq:stylesheet href="#{itemCSS.link}" media="#{itemCSS.tooltip}" />
	</t:dataList>
	<t:dataList var="itemJS" value="#{jsIE8}" rendered="#{jsIE8 != null}">
		<brArq:javascript src="#{itemJS.link}" />
	</t:dataList>
	<h:outputText value="<![endif]-->" escape="false" rendered="#{(cssIE8 != null) || (jsIE8 != null)}" />

	<f:verbatim>
		<script type="text/javascript">
			document.domain = "<h:outputText value='#{propBean.config.properties["url.domain"]}'/>";
		</script>
		<link rel="stylesheet" type="text/css" media="screen" href="<h:outputText value="#{propBean.config.properties['url.telainicial.sessao.persistente']}?#{propBean.config.properties['securityManager.sessioncheck.ctlName']}=#{sessionScope['custodia_session_ctrl']}"/>"
		<noscript></noscript>
	</f:verbatim>
</head>
<body>
	<t:div id="conteudo" styleClass="conteudo_pagina after">
		<t:div styleClass="topo after">
			<brAppIb:breadCrumb 
				id="UIBreadCrumb"
				familia="#{codigoFamiliaServico}" 
				servico="#{codigoServico}" 
				nivel="#{nivelCaminhoPao}"
				textoAlternativo="#{conteudo.orientacoesDeficienteVisual_1}" 
				disabled="#{(sessaoInfo.infoSiteParaSite == '1')}">
				<%-- <f:param name="CTRL" value="#{sessionScope['custodia_session_ctrl']}"/> --%>
			</brAppIb:breadCrumb>
			<brAppIb:fontSize 
				id="UIFontSize" 
				jquerySelector="#conteudo > .miolo"
				onFontSelected="callbackUIFontSize">
				<brCore:componentStateJS readStateCB="inicializaUIFontSize" saveStateCB="salvaUIFontSize" />
			</brAppIb:fontSize>
		</t:div>
		
		<t:div styleClass="miolo UIFontSize-level-1 after">
			<t:div styleClass="titulo after pb10">
				<%-- <ib:lista styleClass="lstUtil" rendered="#{not empty conteudo.ajuda}">
					<ib:itemLista styleClass="tp4">
						<brHtml:brOutputLink value="javascript:;//" rel="btn_ajuda" id="btn_ajuda" title="#{messageBundleInfra.ajuda_link_textoalternativo}" styleClass="tabindex">
							<brHtml:brOutputText value="#{messageBundleInfra.ajuda_link_texto}" />
						</brHtml:brOutputLink>
					</ib:itemLista>
				</ib:lista> --%>
				<brAppIb:help
					id="UIHelp" 
					helpBtnIDs="btn_ajuda" 
					altContent="#{conteudo.ajudaDeficienteVisual}" 
					rendered="#{conteudo.ajuda != ''}" >
					<brHtml:brOutputText value="#{conteudo.ajuda}" escape="false" />
				</brAppIb:help>
				<%-- <ib:lista styleClass="lstUtil" rendered="#{conteudo.ajuda == ''}">
					<ib:itemLista styleClass="tp4">
						<brHtml:brOutputText value="" styleClass="" />
					</ib:itemLista>
				</ib:lista> --%>

				<brHtml:brPanelGroup rendered="#{descricaoServico != ''}">
					<h:outputText value="<h2>" escape="false" />
					<brHtml:brOutputText value="#{messageBundle[descricaoServico]} " escape="false" />
					<%-- <brHtml:brOutputText value="<sup class='tooltip' title='#{messageBundleInfra.acessorapido_tooltip}'>#{codigoServico}</sup>" escape="false" rendered="#{codigoServico != ''}" />--%>
					<h:outputText value="</h2>" escape="false" />
				</brHtml:brPanelGroup>
				<brHtml:brOutputText value="<p>#{conteudo.subtitulo}</p>" escape="false" rendered="#{conteudo.subtitulo != ''}" />
			</t:div>
			
		 	<t:div styleClass="conteudo after" rendered="#{(codigoServico != '') && (passo != '0')}">
		   		<brAppIb:multipleSteps 
		   			id="UIMultipleSteps"
		   			servico="#{codigoServico}" 
		   			passo="#{passo}" />
			</t:div>
			<tiles:insert attribute="body" flush="false" ignore="true">
				<tiles:put name="praticidade" beanName="praticidade" />
			</tiles:insert>
			<%-- <ibsei:seiLoteForm></ibsei:seiLoteForm> --%>
		   	<%-- <t:div styleClass="txt-codigoTela" rendered="#{(codigoServico != '') && (numeroTela != '')}"><brHtml:brOutputText value="#{codigoServico}" escape="false" /><brHtml:brOutputText value="#{numeroTela}" escape="false" /></t:div> --%>
		</t:div>
		<t:div styleClass="base">
			<brHtml:brOutputText value="<!-- -->" styleClass="c1" escape="false" />
			<brHtml:brOutputText value="<!-- -->" styleClass="c2" escape="false" />
		</t:div>		  
	</t:div>
</body>
</f:view>
</html>
