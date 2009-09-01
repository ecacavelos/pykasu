<%@ page contentType="text/html" language="java"%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<jsp:directive.page import="py.com.roshka.pykasu.persistence.admission.*"/>
<% Admission admission = (Admission) request.getAttribute("admission");  %>


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
<html:form action="/register.do" method="post">

  <%--<html:hidden property="formType" value="<%=admission.getType()%>"/>--%>
  <%--<html:hidden property="formType" value="registerUser"/>--%>
  <html:hidden property="formType" value="<%=(String)request.getAttribute(py.com.roshka.pykasu.web.Globals.USER_FORM_FORM_TYPE) %>"/>  
  <html:hidden property="userType" value="<%=admission.getType()%>"/>

  <table class="form">
	<tr>
		<td>
			<h2>Creación de Clientes</h2>
		</td>
	</tr>
	<tr>
		<td>
		   <h3>Datos Principales</h3>
		</td>
	</tr>
	<tr>
		<td>
		  <table width="100%">
					<tr>
						<td  width="40%">Nombre de la Empresa:</td>
						<td><html:text property="businessCompanyName" size="60" value="<%=admission.getCompanyName()%>"/></td>
					</tr>
<%-- 
					<tr>
						<td colspan="2">
							<p class="hint">En el caso de un contribuyente particular, colocar un nombre de fantasia</p>
						</td>
					</tr>
--%>					
					<tr>
						<td class="formlabel">Actividad Principal:</td>
						<td class="formfield"><html:text property="comercialActivity" size="60" value="<%=admission.getMainActivity()%>"/></td>
					</tr>
					<tr>
						<td class="formlabel">RUC:</td>
						<td class="formfield">
							<html:text property="ruc" value="<%=admission.getRuc()%>"/>
							<html:errors property="userform.Ruc.mandatory"/>						
							DV:<html:text property="dV" size="2" value="<%=admission.getDv()%>"/></td>
					</tr>
<%-- 
					<tr>
						<td class="formlabel">Persona de contacto:</td>
						<td class="formfield"><html:text property="contactPerson" value="<%=admission.getContactPerson()%>" size="60"/></td>
					</tr>
--%>					
					<tr>
						<td class="formlabel">Dirección:</td>
						<td class="formfield"><html:text property="address" size="60" value="<%=admission.getAddress()%>"/></td>
					</tr>
					<tr>
						<td class="formlabel">Localidad:</td>
						<td class="formfield"><html:text property="locality" size="60" value="<%=admission.getLocality()%>"/></td>
					</tr>
					<tr>
						<td class="formlabel">Teléfono:</td>
						<td class="formfield">
							<html:text property="phoneNumber" value="<%=admission.getPhone()%>"/>
							Fax:
							<html:text property="faxNumber" value="<%=admission.getFax()%>"/>
						</td>
							
						</td>
					</tr>
					<tr>
						<td class="formlabel">Fecha de constitución:</td>
						<td class="formfield">
							<html:text property="constitutionDate" value="<%=admission.getConstitutionStr()%>"/>
						</td>
					</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
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
					<td width="30%" align="right">Nombre completo:</td>
					<td class="formfield" colspan="3">
						<html:text property="fullName" size="40" value="<%=admission.getLname() + ", " + admission.getFname()%>"/>
						<html:errors property="userform.name.mandatory"/>
					</td>
				</tr>	
					<tr>
						<td class="formlabel">C.I.:</td>
						<td class="formfield"><html:text property="ciContactPerson" size="60" value="<%=admission.getCiContactPerson()%>"/></td>
					</tr>
				<tr>
					<td class="formlabel">Correo electrónico:</td>
					<td colspan="3" class="formfield">
						<html:text property="email" size="40" value="<%=admission.getMail()%>"/>
						<html:errors property="userform.email.mandatory"/>
					</td>		
				</tr>
				<tr>
					<td class="formlab" align="right">Nombre de la cuenta:</td>
					<td>
						<html:text property="userName" size="40" value="<%=admission.getFname().toLowerCase()+"."+admission.getLname().toLowerCase()%>"/>
						<html:errors property="userform.userName.mandatory"/>
						<html:errors property="userform.userName.invalid"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p class="hint">Nombre de la cuenta de usuario, ejemplo: jperez.</p>
					</td>
				</tr>
				<tr>
					<td class="formlabel">Password:</td>
					<td class="formfield">
						<html:hidden property="password" styleId="password" />
						<input type="text" name="tmpPassword" size="40" onchange="encryp2params(this, document.getElementById('password'))"/>
					</td>
			</tr><tr>		
					<td class="formlabel">Repetir Password:</td>
					<td class="formfield">
						<html:hidden property="replyPassword" styleId="replyPassword"/>
						<input type="text" name="tmpReplyPassword" size="40" onchange="encryp2params(this, document.getElementById('replyPassword'))"/>
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
						<html:submit value="Crear"/>
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
