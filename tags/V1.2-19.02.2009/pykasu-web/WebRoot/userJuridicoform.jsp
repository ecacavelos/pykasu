<%@ page contentType="text/html" language="java"

%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>


<html>
<head>
<title>Sistema</title>
<script LANGUAGE="JavaScript" SRC="menus.js"></script>
<script LANGUAGE="JavaScript" SRC="js/sha1.js"></script>
<script LANGUAGE="JavaScript">
	function encryp2params(tmp_pass, obj){
		obj.value = hex_sha1(tmp_pass.value)
	}
</script>
<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="header.jsp"/> 
<jsp:include page="menu.jsp"/> 
<div id="main">
<div id="register">
<html:form action="/registerJuridico.do" >

  <html:hidden property="formType" value="<%=(String)request.getAttribute(py.com.roshka.pykasu.web.Globals.USER_FORM_FORM_TYPE) %>"/>
  <html:hidden property="userType" value="juridico"/>

  <logic:present name="PYKASU.ERROR">
		<div id="errors">
			<p><bean:write name="PYKASU.ERROR" filter="false"/></p>
		</div>
  </logic:present>

  <table class="form">
	<tr>
		<td>
			<h2>Registro en el Sistema - Persona Jurídica</h2>
		</td>
	</tr>
	<tr>
		<td>
		   <h3>Datos de la cuenta</h3>
		</td>
	</tr>
	<tr>
		<td>
		  <table width="100%">
			    <tr>
					<td class="formlab" colspan="2">
						Nombre de la cuenta:
					</td>
					<td>
						<html:text property="userName"/>
						<html:errors property="userform.userName.mandatory"/>
						<html:errors property="userform.userName.invalid"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p class="hint">Nombre de la cuenta de usuario, ejemplo: jperez.</p>
					</td>
				</tr>
			  
				<logic:notPresent name="<%=py.com.roshka.pykasu.web.Globals.LOGIN_USER%>"> 
					<tr>
						<td class="formlabel">
							Nombre de la Empresa:
						</td>
						<td>
							<html:text property="businessCompanyName"/> 
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p class="hint">En el caso de un contribuyente particular, colocar un nombre de fantasia</p>
						</td>
					</tr>
					
					<tr>
						<td class="formlabel">
							Ramo:
						</td>
						<td class="formfield">
							<html:text property="comercialActivity"/> 
						</td>
					</tr>
	
					<tr>
						<td class="formlabel">
							RUC:
						</td>
						<td class="formfield">
							<html:text property="businessCompanyRuc"/>
							<html:errors property="userform.companyRuc.mandatory"/>
						</td>
						<td class="formlabel">
							DV:
						</td>
						<td class="formfield">
							<html:text property="businessCompanyDV"/>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							Persona de contacto:
						</td>
						<td class="formfield">
							<html:text property="contactPerson"/> 
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							C.I. del contacto:
						</td>
						<td class="formfield">
							<html:text property="ciContactPerson"/> 
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							Dirección:
						</td>
						<td class="formfield">
							<html:text property="address"/>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							Localidad:
						</td>
						<td class="formfield">
							<html:text property="locality"/>
						</td>
					</tr>
					
					<tr>
						<td class="formlabel">
							Teléfono:
						</td>
						<td class="formfield">
							<html:text property="phoneNumber"/>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							Fax:
						</td>
						<td class="formfield">
							<html:text property="faxNumber"/>
						</td>
					</tr>
					<tr>
						<td class="formlabel">
							Fecha de constitución:
						</td>
						<td class="formfield">
							<html:text property="constitutionDate"/>
						</td>
					</tr>
				</logic:notPresent>
			</table>
		</td>
	</tr>
		<tr>
		<td>
			<h3> Datos del Usuario Administrador </h3>
		</td>
	</tr>
	<!-- DATOS DEL USUARIO ADMINISTRADOR -->
	<tr>
		<td>
			<table width="100%">
				<tr>
					<td class="formlabel">
						Nombre completo:
					</td>
					<td class="formfield" colspan="3">
						<html:text property="fullName"/>
						<html:errors property="userform.name.mandatory"/>
					</td>
				</tr>	
				<tr>
					<td class="formlabel">
						Correo electrónico:
					</td>
					<td colspan="3" class="formfield">
						<html:text property="email" size="40"/>
						<html:errors property="userform.email.mandatory"/>
					</td>		
				</tr>	
				<tr>
					<td class="formlabel">
						Password:
					</td>
					<td class="formfield">
						<html:hidden property="password" styleId="password"/>
						<input type="password" name="tmpPassword" onchange="encryp2params(this, document.getElementById('password'))"/>
					</td>
					<td class="formlabel">
						Repetir Password:
					</td>
					<td class="formfield">
						<html:hidden property="replyPassword" styleId="replyPassword"/>
						<input type="password" name="tmpReplyPassword" onchange="encryp2params(this, document.getElementById('replyPassword'))"/>
						<html:errors property="userform.password.mandatory"/>
						<html:errors property="userform.replyPassword.mandatory"/>
						<html:errors property="userform.passwords.notEquals"/>
						<html:errors property="userform.password.short"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%">
				<tr>
					<td align="right" width="85%">
						<html:submit value="Guardar"/>
					</td>
					<td align="right" width="15%">
						<html:cancel value="Cancelar"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</html:form>
</div>
</div>
</body>
</html>
