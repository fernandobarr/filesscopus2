<script type="text/javascript" src="<nedc:estaticpath path="tiny_mcePT/tiny_mce.js" type="javascript"/>"></script>
<script type="text/javascript">
tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		plugins: "advlink,table",
		theme_advanced_buttons1 : "espaco,fontselect,espaco,fontsizeselect,espaco,separator,forecolor,backcolor,separator,justifyleft,justifycenter,justifyright,separator,bold,italic,underline,separator,link,unlink",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_fonts : "Tahoma tahoma;Arial=arial;Verdana=verdana",
		language: "pt",
		adv_link_path : "<%=URL_BASE%>",
		adv_link_ctrl: "<%=valCTRL%>",
		adv_link_site: "<%=cdSite%>",
		theme_advanced_more_colors : false,
		theme_advanced_text_colors : "333333,BF0000,C80000,00746B,004E9A,000000,666666,999999,CCCCCC,EBEBEB,FFFFFF",
		theme_advanced_background_colors: "333333,BF0000,C80000,00746B,004E9A,000000,666666,999999,CCCCCC,EBEBEB,FFFFFF",
		content_css : "<nedc:estaticpath path='estrutura_nn.css' type='estilo' />,<nedc:estaticpath path='interna_nn.css' type='estilo' />",
		body_class: "conteudo_pagina after fn"
		
});
</script>