<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>

<script type="text/javascript">

	function buscarEmpresa() {
		
		var codEmpresa = $('.codEmpresaSel').val();
        var xhr = $.ajax({
            type: "POST",
            url: "/calipaadm/Buscarquery.do",
            data: "codEmpresa=" + codEmpresa,
            success: function(output, status){
            	var jsonObj = xhr.getResponseHeader("X-JSON");
            	var obj = jQuery.parseJSON(jsonObj);
            	$('.razaoSocial').val(obj.razaoSocial);
            	$('.cnpj').val(obj.cnpj);
                $('.qtdeMaster').val(obj.qtdeMaster);
            },
            error: function(e){
                alert('Error: ' + e);
            }
        });
		
	}
	
	function voltar() {
		queryOnlineForm.action = "Selecionarquery.do";
		queryOnlineForm.submit();
	}
	
	function continuar() {
		var serverVal = $('.server').val();
		if (serverVal == '') {
			alert("Informe o endereço do Servidor");
		} else {
			var usuarioVal = $('.usuario').val();
			if (usuarioVal == '') {
				alert("Informe o nome do Usuário");
			} else {
				var senhaVal = $('.senha').val();
				if (senhaVal == '') {
					alert("Informe a Senha");	
				} else {
					var databaseVal = $('.database').val();
					if (databaseVal == '') {
						alert("Informe o nome do Banco de Dados");
					} else {
						var timeoutVal = $('.timeout').val();
						if (timeoutVal == '') {
							alert("Informe o tempo de expiração da conexão");
						} else {
							var queryTextVal = $('.queryText').val();
							if (queryTextVal == '') {
								alert("Informe a Query a ser executada");
							} else {
								var queryOnline = new Object();
								queryOnline.server = serverVal;
								queryOnline.usuario = usuarioVal;
								queryOnline.senha = senhaVal;
								queryOnline.database = databaseVal;
								queryOnline.timeout = timeoutVal;
								queryOnline.queryText = queryTextVal;
									
									
								$.ajax({
						            type: "POST",
						            url: "/calipaadm/ExecutarQuery.do",
						            data: "jSONParameters=" + JSON.stringify(queryOnline),
						            success: function(output, status){
						            	var jsonObj = xhr.getResponseHeader("X-JSON");
						            	var obj = jQuery.parseJSON(jsonObj);
						            	$('.razaoSocial').val(obj.razaoSocial);
						            	$('.cnpj').val(obj.cnpj);
						                $('.qtdeMaster').val(obj.qtdeMaster);
						            },
						            error: function(e){
						                alert('Error: ' + e);
						            }
						        });
							}
						}
					}
				}
			}
				
		}
		
	}
	
	
	
	
</script>
<h1>Verifique sua query antes de executar</h1>
<p>Para executar via linked server: LK_COT_DDS.&#60;database&#62;.&#60;owner&#62;.&#60;tabela&#62;</p>
<html:form action="ExecutarQuery">
	<table class="tabelaDadosPortal">
		<thead>
			<tr><th colspan="3">Dados da Query</th></tr>
		</thead>
		<tbody>
			<tr>
				<td>Server:</td>
				<td>
					<html:text name="queryOnlineForm" property="query.server"  styleClass="server" />
				</td>
			</tr>
			<tr>
				<td>
					Usuário SQL:
				</td>
				<td>
					<html:text name="queryOnlineForm" property="query.usuario" styleClass="usuario" />
				</td>
			</tr>
			<tr>
				<td>
					Senha:
				</td>
				<td>
					<html:text name="queryOnlineForm" property="query.senha"  styleClass="senha" />
				</td>
			</tr>
			<tr>
				<td>
					Database:
				</td>
				<td>
					<html:text name="queryOnlineForm" property="query.database"  styleClass="database" />
				</td>
			</tr>
			<tr>
				<td>
					Timeout(s):
				</td>
				<td>
					<html:text name="queryOnlineForm" property="query.timeout"  styleClass="timeout" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<html:textarea name="queryOnlineForm" property="query.queryText"  styleClass="queryText" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
					<img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" onclick="continuar();">
				</td>
			</tr>
		</tbody>
	</table>
<!-- 	<div id="botoes" class="linhaBotoes"> -->
<%-- 		<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();"> --%>
<%-- 		<img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" onclick="continuar();"> --%>
<!-- 	</div> -->
	<div>
		Resultados
		<div class="resultadoQuery">
		</div>
	</div>
</html:form>
