<%@ page contentType="text/html" language="java"%>
<%@page import="py.com.roshka.pykasu.persistence.users.BusinessCompany"%>

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
/*	function encryp2params(tmp_pass, obj){
		obj.value = hex_sha1(tmp_pass.value)
	}
*/	
	function encryp2params(){
		document.getElementById('password').value = hex_sha1(document.getElementById('tmpPassword')); 
		document.getElementById('replyPassword').value = hex_sha1(document.getElementById('tmpReplyPassword'));
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

  <html:hidden property="formType" value="<%=(String)request.getAttribute(py.com.roshka.pykasu.web.Globals.USER_FORM_FORM_TYPE) %>"/>  
  <html:hidden property="userType" value="<%=admission.getType()%>"/>
  <input type="hidden" name="admissionId" value="<%=admission.getId()%>"/>

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
		  			<%if(admission.getType().equalsIgnoreCase(BusinessCompany.TYPE_MULTI_USER)){ %>
					<tr>
						<td  width="40%" align="right">Nombre de la Empresa:</td>
						<td><html:text property="businessCompanyName" size="60" value="<%=admission.getCompanyName()%>"/></td>
					</tr>
					<%} %>
					<tr>
						<td width="40%" align="right">Actividad Principal:</td>
						<td class="formfield"><html:text property="comercialActivity" size="60" value="<%=admission.getMainActivity()%>"/></td>
					</tr>
					<tr>
						<td class="formlabel">RUC:</td>
						<td class="formfield">
							<html:text property="ruc" value="<%=admission.getRuc()%>"/>
							<html:errors property="userform.Ruc.mandatory"/>						
							DV:<html:text property="dV" size="2" value="<%=admission.getDv()%>"/></td>
					</tr>
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
				  	<tr>				  		
				  		<td>Centro de Atención al Cliente<br/>donde retirará sus formularios:</td>	  		
				  		<td colspan="2">				  			
				  			<html:select property="office" value="<%=admission.getOffice()%>">
								<optgroup label="Asunción">
									<option value=""></option>
									<option value="1">Casa Matriz - EEUU 780 e/Fulgencio R. Moreno y L.A. de Herrera</option>
									<option value="3">Gral. Santos - Avda. Gral. Santos esq. Avda. Fndo. de la Mora</option>
									<option value="7">Palma - Palma esq. Ntra. Sra. de la Asunción</option>
									<option value="26">Oliva - Oliva esq. O`leary</option>
									<option value="23">Pinozá - Avda. Eusebio Ayala esq. Bruno Guggiari</option>
									<option value="14">Villa Morra - Charles de Gaulle c/ Mcal. Lopez</option>
									<option value="25">Multiplaza - Avda Eusebio Ayala N° 4501</option>
									<option value="34">Denis Roa - Denis Roa esq. Moisés Bertoni</option>
									<option value="36">Santisima Trinidad - Avda. Sacramento esq. Avenida Santisima Trinidad</option>
								</optiongroup>
								<optgroup label="Gran Asunción">
									<option value="2">San Lorenzo I - Ruta Mcal. Estigarribia esq. Cnel. Romero</option>
									<option value="32">San Lorenzo II - 10 de Agosto esq. Hernandarias</option>
									<option value="8">Ñemby - 9 de Agosto esq. Ytororó</option>
									<option value="10">Lambaré - Avda. Cacique Lambaré c/San Vicente</option>
									<option value="9">Mariano R. Alonso - Ruta Transchaco Km. 15 1/2</option>
									<option value="29">Limpio - Avda. Colón c/ Mcal. Estigarribia</option>
									<option value="4">Luque - Avda. Gral. Aquino esq. Teniente Herrero Bueno</option>
									<option value="13">Fndo. de la Mora - Ruta Mcal. Estigarribia esq. 10 de Julio</option>
									<option value="28">Capiatá - Ruta Mcal Estigarribia esq. Mcal. López Km 20</option>
								</optiongroup>
								<optgroup label="Interior">
									<option value="6">Caacupé - Eligio Ayala esq. Juan E. O`leary</option>
									<option value="15">Caaguazú - Avda. Bernardino Caballero c/ Gral. Díaz</option>
									<option value="17">Carapeguá - Ruta Mcal. López y Cristóbal Colón</option>
									<option value="33">Ciudad de San Ignacio - Ruta Mcal. Estigarribia  esq. Fulgencio Yegros </option>
									<option value="11">Ciudad del Este I - Avda.Gral. Bernardino Caballero esq. Paso de Patria</option>
									<option value="20">Ciudad del Este II - Avda. Julio César Riquelme - Km 7 Monday</option>
									<option value="31">Ciudad del Este III - Boquerón c/Avda. Adrián Jara.</option>
									<option value="12">Cnel. Oviedo - José Segundo Decoud e/ Tuyutí</option>
									<option value="16">Concepción - Pdte. Franco e/ Gral. Garay y 14 de Mayo</option>
									<option value="38">Curuguaty - 14 de Mayo esq. Julia Miranda Cueto de Estigarribia</option>
									<option value="5">Encarnación - Mcal. Estigarribia entre Tomás Romero Pereira y Villarrica</option>
									<option value="35">Itaguá - Ruta Mcal. Estigarribia esq. Juan C. Centurión </option>
									<option value="24">Katueté - La Residenta esq. Capellán Arzamendia</option>
									<option value="40">Loma Plata - Avda. Central Nº 1160 esq. Gondra</option>
									<option value="41">Maria Auxiliadora - Tomas Romero Pereira esq. Maria Auxiliadora</option>
									<option value="27">Obligado - Avda. Gaspar R. de Francia esq. Colonias Unidas</option>
									<option value="22">Pedro Juan Caballero - Avda. Carlos A. López y Perpetuo Socorro</option>
									<option value="18">Pilar - Albersoni esq. Antequera</option>
									<option value="37">Saltos del Guairá - Avenida Paraguay esq. Ricardo Mendez Gonzalves</option>
									<option value="21">San Estanislao - Mcal.López c/ Cnel.Zoilo González</option>
									<option value="39">San Juan Nepomuceno - Ruta Mcal. Estigarribia N° 360 c/Pai Fariña</option>
									<option value="30">Santa Rita - Avda. Carlos Antonio López esq. Eusebio Ayala</option>
									<option value="PAC">Santa Rosa del Aguaray - Ruta General Aquino c/ Prof. Pedro Gónzalez</option>
									<option value="19">Villarrica - Avda. Carlos A. López esq. Mcal. Estigarribia</option>
									<option value="42">Coronel Bogado</option>
								</optiongroup>  			
				  			</html:select><br/>				  							  				
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
						<html:text property="fullName" size="40" value="<%= admission.getFname() + admission.getLname()%>"/>
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
						<html:text property="userName" size="40" value="<%=""+request.getAttribute("userName")%>"/>
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
						<input type="password" name="tmpPassword" size="40" value="<%=""+admission.getId()%>"/>
					</td>
			</tr>
			<tr>		
					<td class="formlabel">Repetir Password:</td>
					<td class="formfield">
						<html:hidden property="replyPassword" styleId="replyPassword"/>
						<input type="password" name="tmpReplyPassword" size="40" value="<%=""+admission.getId()%>"/>
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
						<html:submit value="Crear" onclick="encryp2params()"/>
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
