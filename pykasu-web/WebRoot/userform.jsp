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
<html:form action="/register.do" >

  <html:hidden property="formType" value="<%=(String)request.getAttribute(py.com.roshka.pykasu.web.Globals.USER_FORM_FORM_TYPE) %>"/>
  <html:hidden property="userType" value="fisico"/>

  <logic:present name="PYKASU.ERROR">
		<div id="errors">
			<p><bean:write name="PYKASU.ERROR" filter="false"/></p>
		</div>
  </logic:present>

  <table align="center" class="form" width="80%">
	<tr>
		<td class="tituloTabla" width="100%">
			<h2>Registro en el Sistema - Persona Física</h2>
		</td>
	</tr>
	<tr>
		<td >
		   <h3>Datos de la cuenta</h3>
		</td>
	</tr>
	<tr>
		<td>
		  <table width="100%" >
			  	<tr>
					<td class="formlab">Nombre de la cuenta:
					</td>
					<td colspan="3">
						<html:text property="userName"/>
						<html:errors property="userform.userName.mandatory"/>
						<html:errors property="userform.userName.invalid"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="left">
						<p class="hint">Nombre de la cuenta de usuario, ejemplo: jperez.</p>
					</td>
				</tr>
				<tr height="15"/>
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
					<td colspan="4" align="left">
						<p class="hint">Ejemplo: Juan Manuel Pérez González</p>
					</td>
				</tr>
				<tr>
					<td class="formlabel">
						Cedula de Identidad:
					</td>
					<td class="formfield">
						<html:text property="ciContactPerson"/>
					</td>
				</tr>
				<tr height="15"/>
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
						RUC:
					</td>
					<td class="formfield">
						<html:text property="ruc"/>	
					</td>
					<td class="formlabel">
						DV:
					</td>
					<td class="formfield">
						<html:text property="dv"/>
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
					<td class="formlabel">
						Ciudad:
					</td>
					<td class="formfield">
						<html:text property="city"/>
					</td>
				</tr>
				<tr>
					<td class="formlabel">Fecha de nacimiento:</td>
					<td class="formfield"><html:text property="bornDate"/></td>
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
					<td align="left" colspan="4">
						<p class="hint"> Ejemplo: juanperez@gmail.com. En lo posible no colocar <br>
										 correos similares a hotmail. <br> (Ver Informaciones Generales)</p>
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
					<td align="right" width="85%"><html:submit value="Guardar"/></td>
					<td align="right" width="15%"><html:cancel value="Cancelar"/></td>
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
