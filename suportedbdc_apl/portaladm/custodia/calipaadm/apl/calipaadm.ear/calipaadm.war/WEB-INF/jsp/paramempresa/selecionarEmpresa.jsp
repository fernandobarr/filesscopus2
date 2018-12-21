<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/nedc-EstaticPath.tld" prefix="nedc" %>

<script type="text/javascript">

	function buscarEmpresa() {
		
		var codEmpresa = $('.codEmpresaSel').val();
        var xhr = $.ajax({
            type: "POST",
            url: "/calipaadm/BuscarEmpresa.do",
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
		empresaForm.action = "SelecionarEmpresa.do";
		empresaForm.submit();
	}
	
	function continuar() {
		var qtdeMaster = $('.qtdeMaster').val();
		
		if (qtdeMaster < 0) {
			alert("Quantidade de Masters menor do que permitido");
		} else if (qtdeMaster > 9) {
			alert("Quantidade de Masters maior do que permitido");
		} else {
			empresaForm.action = "GravarEmpresa.do";
			empresaForm.submit();
		}
	}
	
	function isNumber(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        	alert("Apenas números de 0-9 são permitidos");
    		return false;
        }
        return true;
     }
</script>

<html:form action="GravarEmpresa">
	<table class="tabelaDadosPortal">
		<thead>
			<tr>
				<th colspan="3">Home</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Lista de Empresas:</td>
				<td>
					<html:select name="empresaForm" property="empresa.codEmpresa" styleClass="codEmpresaSel">
						<html:option value="" />
						<html:options collection="listaEmpresasSelect" property="codEmpresa" labelProperty="razaoSocial" />
					</html:select>
				</td>
				<td><img src="<nedc:estaticpath path="bt_procurar.gif" type="imagem" />" onclick="buscarEmpresa();"></td>
			</tr>
			<tr>
				<td>CNPJ:</td>
				<td colspan="2"><html:text name="empresaForm" property="empresa.cnpj" readonly="true" styleClass="cnpj" /></td>
			</tr>
			<tr>
				<td>Razão Social:</td>
				<td colspan="2"><html:text name="empresaForm" property="empresa.razaoSocial"  readonly="true" styleClass="razaoSocial" /></td>
			</tr>
			<tr>
				<td>Quantidade Máx de Gestor de Acesso:</td>
				<td colspan="2"><html:text onkeypress="return isNumber(event)" name="empresaForm" property="empresa.qtdeMaster"  styleClass="qtdeMaster" /></td>
			</tr>
		</tbody>
	</table>
	<div id="botoes" class="linhaBotoes">
		<img src="<nedc:estaticpath path="bt_voltar.gif" type="imagem" />" onclick="voltar();">
		<img src="<nedc:estaticpath path="bt_continuar.gif" type="imagem" />" onclick="continuar();">
	</div>
</html:form>
