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
			<h2>Creaci�n de Clientes</h2>
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
						<td class="formlabel">Direcci�n:</td>
						<td class="formfield"><html:text property="address" size="60" value="<%=admission.getAddress()%>"/></td>
					</tr>
					<tr>
						<td class="formlabel">Localidad:</td>
						<td class="formfield"><html:text property="locality" size="60" value="<%=admission.getLocality()%>"/></td>
					</tr>
					<tr>
						<td class="formlabel">Tel�fono:</td>
						<td class="formfield">
							<html:text property="phoneNumber" value="<%=admission.getPhone()%>"/>
							Fax:
							<html:text property="faxNumber" value="<%=admission.getFax()%>"/>
						</td>
							
						</td>
					</tr>
					<tr>
						<td class="formlabel">Fecha de constituci�n:</td>
						<td class="formfield">
							<html:text property="constitutionDate" value="<%=admission.getConstitutionStr()%>"/>
						</td>
					</tr>
				  	<tr>				  		
				  		<td>Centro de Atenci�n al Cliente<br/>donde retirar� sus formularios:</td>	  		
				  		<td colspan="2">				  			
				  			<html:select property="office" value="<%=admission.getOffice()%>">				  				
								<optiongroup label="Asunci�n">
									<html:option value=""></html:option>
									<html:option value="CASA MATRIZ">Casa Matriz - EEUU 780 e/Fulgencio R. Moreno y L.A. de Herrera</html:option>
									<html:option value="GRAL SANTOS">Gral. Santos - Avda. Gral. Santos esq. Avda. Fndo. de la Mora</html:option>
									<html:option value="PALMA">Palma - Palma esq. Ntra. Sra. de la Asunci�n</html:option>
									<html:option value="OLIVA">Oliva - Oliva esq. O`leary</html:option>
									<html:option value="PINOZA">Pinoz� - Avda. Eusebio Ayala esq. Bruno Guggiari</html:option>
									<html:option value="VILLA MORRA">Villa Morra - Charles de Gaulle c/ Mcal. Lopez</html:option>
									<html:option value="MULTIPLAZA">Multiplaza - Avda Eusebio Ayala N� 4501</html:option>
									<html:option value="DENIS ROA">Denis Roa - Denis Roa esq. Mois�s Bertoni</html:option>
									<html:option value="SANTISIMA TRINIDAD">Santisima Trinidad - Avda. Sacramento esq. Avenida Santisima Trinidad</html:option>
								</optiongroup>
								<optiongroup label="Gran Asunci�n">
									<html:option value="SAN LORENZO I">San Lorenzo I - Ruta Mcal. Estigarribia esq. Cnel. Romero</html:option>
									<html:option value="SAN LORENZO II">San Lorenzo II - 10 de Agosto esq. Hernandarias</html:option>
									<html:option value="NEMBY">�emby - 9 de Agosto esq. Ytoror�</html:option>
									<html:option value="LAMBARE">Lambar� - Avda. Cacique Lambar� c/San Vicente</html:option>
									<html:option value="MARIANO R. ALONSO">Mariano R. Alonso - Ruta Transchaco Km. 15 1/2</html:option>
									<html:option value="LIMPIO">Limpio - Avda. Col�n c/ Mcal. Estigarribia</html:option>
									<html:option value="LUQUE">Luque - Avda. Gral. Aquino esq. Teniente Herrero Bueno</html:option>
									<html:option value="FNDO DE LA MORA">Fndo. de la Mora - Ruta Mcal. Estigarribia esq. 10 de Julio</html:option>
									<html:option value="CAPIATA">Capiat� - Ruta Mcal Estigarribia esq. Mcal. L�pez Km 20</html:option>
								</optiongroup>
								<optiongroup label="Interior">
									<html:option value="CAACUPE">Caacup� - Eligio Ayala esq. Juan E. O`leary</html:option>
									<html:option value="CAAGUAZU">Caaguaz� - Avda. Bernardino Caballero c/ Gral. D�az</html:option>
									<html:option value="CARAPEGUA">Carapegu� - Ruta Mcal. L�pez y Crist�bal Col�n</html:option>
									<html:option value="CIUDAD DE SAN IGNACIO">Ciudad de San Ignacio - Ruta Mcal. Estigarribia  esq. Fulgencio Yegros </html:option>
									<html:option value="CIUDAD DEL ESTE I">Ciudad del Este I - Avda.Gral. Bernardino Caballero esq. Paso de Patria</html:option>
									<html:option value="CIUDAD DEL ESTE II">Ciudad del Este II - Avda. Julio C�sar Riquelme - Km 7 Monday</html:option>
									<html:option value="CIUDAD DEL ESTE III">Ciudad del Este III - Boquer�n c/Avda. Adri�n Jara.</html:option>
									<html:option value="CNEL OVIEDO">Cnel. Oviedo - Jos� Segundo Decoud e/ Tuyut�</html:option>
									<html:option value="CONCEPCION">Concepci�n - Pdte. Franco e/ Gral. Garay y 14 de Mayo</html:option>
									<html:option value="CURUGUATY">Curuguaty - 14 de Mayo esq. Julia Miranda Cueto de Estigarribia</html:option>
									<html:option value="ENCARNACION">Encarnaci�n - Mcal. Estigarribia entre Tom�s Romero Pereira y Villarrica</html:option>
									<html:option value="ITAGUA">Itagu� - Ruta Mcal. Estigarribia esq. Juan C. Centuri�n </html:option>
									<html:option value="KATUETE">Katuet� - La Residenta esq. Capell�n Arzamendia</html:option>
									<html:option value="LOMA PLATA">Loma Plata - Avda. Central N� 1160 esq. Gondra</html:option>
									<html:option value="MARIA AUXILIADORA">Maria Auxiliadora - Tomas Romero Pereira esq. Maria Auxiliadora</html:option>
									<html:option value="OBLIGADO">Obligado - Avda. Gaspar R. de Francia esq. Colonias Unidas</html:option>
									<html:option value="PEDRO JUAN CABALLERO">Pedro Juan Caballero - Avda. Carlos A. L�pez y Perpetuo Socorro</html:option>
									<html:option value="PILAR">Pilar - Albersoni esq. Antequera</html:option>
									<html:option value="SALTOS DEL GUAIRA">Saltos del Guair� - Avenida Paraguay esq. Ricardo Mendez Gonzalves</html:option>
									<html:option value="SAN ESTANISLAO">San Estanislao - Mcal.L�pez c/ Cnel.Zoilo Gonz�lez</html:option>
									<html:option value="SAN JUAN NEPOMUCENO">San Juan Nepomuceno - Ruta Mcal. Estigarribia N� 360 c/Pai Fari�a</html:option>
									<html:option value="SANTA RITA">Santa Rita - Avda. Carlos Antonio L�pez esq. Eusebio Ayala</html:option>
									<html:option value="SANTA ROSA DEL AGUARAY">Santa Rosa del Aguaray - Ruta General Aquino c/ Prof. Pedro G�nzalez</html:option>
									<html:option value="VILLARRICA">Villarrica - Avda. Carlos A. L�pez esq. Mcal. Estigarribia</html:option>
								</optiongroup>  			
				  			</html:select>
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
					<td class="formlabel">Correo electr�nico:</td>
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
