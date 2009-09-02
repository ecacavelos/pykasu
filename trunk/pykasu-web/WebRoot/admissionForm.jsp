<%@ page contentType="text/html" language="java" %>
<%@page import="py.com.roshka.pykasu.persistence.users.BusinessCompany"%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>


<html>
<head>
<title>Registro al Sistema</title>
<script LANGUAGE="JavaScript" SRC="js/sha1.js"></script>
<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function sendform(dataloaded){
		var loaded = document.getElementById('loaded');
		loaded.value = dataloaded;
		
		document.forms[1].submit();

		return true;
	}
</script>

</head>

<body>
<jsp:include page="header.jsp"/> 
<jsp:include page="menu.jsp"/> 
<div id="main">
	<%@include file="messages.jsp" %>
<div id="register">
<h3>Solicitud de Ingreso</h3>
<br><html:form action="/admissionform.do" method="post">
  <input type="hidden" name="loaded" id="loaded" value="false"/>
  
  <b>Gracias por estar interesado en el Sistema de Tributos Web de Visión Banco</b><br/><br/>
  A través de este sistema Ud podrá cargar formularios impositivos y disfrutar<br/> 
  de los servicios que Visión Banco le brinda, como ser la presentación de dichos formularios,<br/> 
  o el pago en línea de los mismos, entre otros.
  <br/><br/>
  Sea tan amable de elegir el tipo de cuenta que más se ajusta a sus necesidades:<br/>
  
   <html:radio property="type" value="MULTI_USER" onclick="sendform('false')" styleId="multiuser"/><b>Cuenta Empresarial</b><br/>
  Con este tipo de cuenta, Ud y más personas relacionadas a su empresa, podran cargar formularios impositivos.<br/>
  Generalmente este tipo de cuenta, se ajusta a Empresas Contables que registran formularios impositivos de sus clientes.<br/><br/> 
  <html:radio property="type" value="SINGLE_USER" onclick="sendform('false')" styleId="singleuser"/><b>Cuenta Particular</b><br/>
  Con este tipo de cuenta, Ud podran cargar sus formularios impositivos.<br/>
  Normalmente, este tipo de cuenta es seleccionado por personas independientes que cargar sus formularios impositivos.
  <br/> 
  <br/>
  Una vez seleccionado el tipo de cuenta, se le requerirán algunos datos necesarios para realizar el registos<br/>
  Los campos marcados con (*) indican que son obligatorios.
  <br/><br/><br/>
  <%if((""+request.getAttribute("type")).equalsIgnoreCase(BusinessCompany.TYPE_MULTI_USER)){%>  
  <table>  
	  <tr><td colspan="4" align="center"><h3>Datos de la Empresa</h3></td></tr>
	   <tr>
	  		<td>Nombre de la empresa: (*)</td>
	  		<td colspan="3"><html:text property="companyName" size="70"></html:text><br/>
	  		<html:errors property="userform.companyName.mandatory"/></td>
	  	</tr>  
	  	<tr>
	  		<td>Actividad Principal:</td>
	  		<td colspan="3"><html:text property="mainActivity" size="70"></html:text></td>
	  	</tr>  	
	  	<tr>
	  		<td>RUC: (*)</td>
	  		<td><html:text property="ruc" size="10"></html:text><br/>
	  		<html:errors property="userform.ruc.mandatory"/></td>
	  		<td>Dígito verificador: (*)</td>
	  		<td><html:text property="dv" size="1"></html:text><br/>
	  		<html:errors property="userform.dv.mandatory"/></td>  		
	  	</tr>
	  	<tr>
	  		<td>Dirección: (*)</td>
	  		<td colspan="1"><html:text property="address"></html:text><br/>
	  		<html:errors property="userform.address.mandatory"/></td>
	  		<td>Localidad:</td>
	  		<td colspan="1"><html:text property="locality"></html:text></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Centro de Atención al Cliente<br/>donde retirará sus formularios:(*)</td>  		  		
	  		<td colspan="3">
	  			<html:select property="office">
					<optgroup label="Asunción">
						<option value=""></option>
						<option value="CASA MATRIZ">Casa Matriz - EEUU 780 e/Fulgencio R. Moreno y L.A. de Herrera</option>
						<option value="GRAL SANTOS">Gral. Santos - Avda. Gral. Santos esq. Avda. Fndo. de la Mora</option>
						<option value="PALMA">Palma - Palma esq. Ntra. Sra. de la Asunción</option>
						<option value="OLIVA">Oliva - Oliva esq. O`leary</option>
						<option value="PINOZA">Pinozá - Avda. Eusebio Ayala esq. Bruno Guggiari</option>
						<option value="VILLA MORRA">Villa Morra - Charles de Gaulle c/ Mcal. Lopez</option>
						<option value="MULTIPLAZA">Multiplaza - Avda Eusebio Ayala N° 4501</option>
						<option value="DENIS ROA">Denis Roa - Denis Roa esq. Moisés Bertoni</option>
						<option value="SANTISIMA TRINIDAD">Santisima Trinidad - Avda. Sacramento esq. Avenida Santisima Trinidad</option>
					</optiongroup>
					<optgroup label="Gran Asunción">
						<option value="SAN LORENZO I">San Lorenzo I - Ruta Mcal. Estigarribia esq. Cnel. Romero</option>
						<option value="SAN LORENZO II">San Lorenzo II - 10 de Agosto esq. Hernandarias</option>
						<option value="NEMBY">Ñemby - 9 de Agosto esq. Ytororó</option>
						<option value="LAMBARE">Lambaré - Avda. Cacique Lambaré c/San Vicente</option>
						<option value="MARIANO R. ALONSO">Mariano R. Alonso - Ruta Transchaco Km. 15 1/2</option>
						<option value="LIMPIO">Limpio - Avda. Colón c/ Mcal. Estigarribia</option>
						<option value="LUQUE">Luque - Avda. Gral. Aquino esq. Teniente Herrero Bueno</option>
						<option value="FNDO DE LA MORA">Fndo. de la Mora - Ruta Mcal. Estigarribia esq. 10 de Julio</option>
						<option value="CAPIATA">Capiatá - Ruta Mcal Estigarribia esq. Mcal. López Km 20</option>
					</optiongroup>
					<optgroup label="Interior">
						<option value="CAACUPE">Caacupé - Eligio Ayala esq. Juan E. O`leary</option>
						<option value="CAAGUAZU">Caaguazú - Avda. Bernardino Caballero c/ Gral. Díaz</option>
						<option value="CARAPEGUA">Carapeguá - Ruta Mcal. López y Cristóbal Colón</option>
						<option value="CIUDAD DE SAN IGNACIO">Ciudad de San Ignacio - Ruta Mcal. Estigarribia  esq. Fulgencio Yegros </option>
						<option value="CIUDAD DEL ESTE I">Ciudad del Este I - Avda.Gral. Bernardino Caballero esq. Paso de Patria</option>
						<option value="CIUDAD DEL ESTE II">Ciudad del Este II - Avda. Julio César Riquelme - Km 7 Monday</option>
						<option value="CIUDAD DEL ESTE III">Ciudad del Este III - Boquerón c/Avda. Adrián Jara.</option>
						<option value="CNEL OVIEDO">Cnel. Oviedo - José Segundo Decoud e/ Tuyutí</option>
						<option value="CONCEPCION">Concepción - Pdte. Franco e/ Gral. Garay y 14 de Mayo</option>
						<option value="CURUGUATY">Curuguaty - 14 de Mayo esq. Julia Miranda Cueto de Estigarribia</option>
						<option value="ENCARNACION">Encarnación - Mcal. Estigarribia entre Tomás Romero Pereira y Villarrica</option>
						<option value="ITAGUA">Itaguá - Ruta Mcal. Estigarribia esq. Juan C. Centurión </option>
						<option value="KATUETE">Katueté - La Residenta esq. Capellán Arzamendia</option>
						<option value="LOMA PLATA">Loma Plata - Avda. Central Nº 1160 esq. Gondra</option>
						<option value="MARIA AUXILIADORA">Maria Auxiliadora - Tomas Romero Pereira esq. Maria Auxiliadora</option>
						<option value="OBLIGADO">Obligado - Avda. Gaspar R. de Francia esq. Colonias Unidas</option>
						<option value="PEDRO JUAN CABALLERO">Pedro Juan Caballero - Avda. Carlos A. López y Perpetuo Socorro</option>
						<option value="PILAR">Pilar - Albersoni esq. Antequera</option>
						<option value="SALTOS DEL GUAIRA">Saltos del Guairá - Avenida Paraguay esq. Ricardo Mendez Gonzalves</option>
						<option value="SAN ESTANISLAO">San Estanislao - Mcal.López c/ Cnel.Zoilo González</option>
						<option value="SAN JUAN NEPOMUCENO">San Juan Nepomuceno - Ruta Mcal. Estigarribia N° 360 c/Pai Fariña</option>
						<option value="SANTA RITA">Santa Rita - Avda. Carlos Antonio López esq. Eusebio Ayala</option>
						<option value="SANTA ROSA DEL AGUARAY">Santa Rosa del Aguaray - Ruta General Aquino c/ Prof. Pedro Gónzalez</option>
						<option value="VILLARRICA">Villarrica - Avda. Carlos A. López esq. Mcal. Estigarribia</option>
					</optiongroup>  			
	  			</html:select><br/>
	  			<html:errors property="userform.office.mandatory"/></td>
	  		</td>  		
	  	</tr>  	  	
	  	<tr>
	  		<td>Teléfono: (*)</td>
	  		<td colspan="1"><html:text property="phone"></html:text><br/>
	  		<html:errors property="userform.phone.mandatory"/></td>
	  		<td>Fax:</td>
	  		<td colspan="1"><html:text property="fax"></html:text></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Fecha de constitución: (*)</td>
	  		<td colspan="3"><html:text property="constitution"></html:text><br/>
	  		<html:errors property="userform.date.mandatory"/></td></td>
	  	</tr>  	
		<tr><td colspan="4" align="center"><h3>Datos del Contacto</h3></td></tr>
	  	<tr>
	  		<td>Nombres: (*)</td>
	  		<td colspan="3"><html:text property="fname" size="70"></html:text><br/>
	  		<html:errors property="userform.name.mandatory"/></td>
	  	</tr>
	  	<tr>
	  		<td>Apellidos: (*)</td>
	  		<td colspan="3"><html:text property="lname" size="70"></html:text><br/>
	  		<html:errors property="userform.lastName.mandatory"/></td>
	  	</tr>
	
	  	<tr>
	  		<td>Cédula Identidad: (*)</td>
	  		<td colspan="1"><html:text property="ciContactPerson"></html:text><br/>
	  		<html:errors property="userform.ci.mandatory"/></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Correo electrónico: (*)</td>
	  		<td colspan="3">&nbsp;<html:text property="mail" size="60"></html:text><br/>
	  		<html:errors property="userform.email.mandatory"/></td>
	  	</tr>  	
	  	<tr>  		
	  		<td colspan="4" align="center"><html:submit value="Registrar" onclick="sendform('true')"/>&nbsp;&nbsp;<html:reset value="Limpiar Campos"/></td>
	  	</tr>  	    	
  </table>
  <%}%>
  <%if((""+request.getAttribute("type")).equalsIgnoreCase(BusinessCompany.TYPE_SINGLE_USER)){%>
   
  <table>
	  	<tr>
	  		<td>Nombres: (*)</td>
	  		<td colspan="3"><html:text property="fname" size="70"></html:text><br/>
	  		<html:errors property="userform.name.mandatory"/></td>
	  	</tr>
	  	<tr>
	  		<td>Apellidos: (*)</td>
	  		<td colspan="3"><html:text property="lname" size="70"></html:text><br/>
	  		<html:errors property="userform.lastName.mandatory"/></td>
	  	</tr>
	  	<tr>
	  		<td>Actividad Principal:</td>
	  		<td colspan="3"><html:text property="mainActivity" size="70"></html:text></td>
	  	</tr>  	
	  	<tr>
	  		<td>RUC: (*)</td>
	  		<td><html:text property="ruc" size="10"></html:text><br/>
	  		<html:errors property="userform.ruc.mandatory"/></td>
	  		<td>Dígito verificador: (*)</td>
	  		<td><html:text property="dv" size="1"></html:text><br/>
	  		<html:errors property="userform.dv.mandatory"/></td>  		
	  	</tr>
	  	<tr>
	  		<td>Dirección: (*)</td>
	  		<td colspan="1"><html:text property="address"></html:text><br/>
	  		<html:errors property="userform.address.mandatory"/></td>
	  		<td>Localidad:</td>
	  		<td colspan="1"><html:text property="locality"></html:text></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Centro de Atención al Cliente<br/>donde retirará sus formularios:(*)</td>	  		
	  		<td colspan="3">
	  			<html:select property="office">
					<optgroup label="Asunción">
						<option value=""></option>
						<option value="CASA MATRIZ">Casa Matriz - EEUU 780 e/Fulgencio R. Moreno y L.A. de Herrera</option>
						<option value="GRAL SANTOS">Gral. Santos - Avda. Gral. Santos esq. Avda. Fndo. de la Mora</option>
						<option value="PALMA">Palma - Palma esq. Ntra. Sra. de la Asunción</option>
						<option value="OLIVA">Oliva - Oliva esq. O`leary</option>
						<option value="PINOZA">Pinozá - Avda. Eusebio Ayala esq. Bruno Guggiari</option>
						<option value="VILLA MORRA">Villa Morra - Charles de Gaulle c/ Mcal. Lopez</option>
						<option value="MULTIPLAZA">Multiplaza - Avda Eusebio Ayala N° 4501</option>
						<option value="DENIS ROA">Denis Roa - Denis Roa esq. Moisés Bertoni</option>
						<option value="SANTISIMA TRINIDAD">Santisima Trinidad - Avda. Sacramento esq. Avenida Santisima Trinidad</option>
					</optiongroup>
					<optgroup label="Gran Asunción">
						<option value="SAN LORENZO I">San Lorenzo I - Ruta Mcal. Estigarribia esq. Cnel. Romero</option>
						<option value="SAN LORENZO II">San Lorenzo II - 10 de Agosto esq. Hernandarias</option>
						<option value="NEMBY">Ñemby - 9 de Agosto esq. Ytororó</option>
						<option value="LAMBARE">Lambaré - Avda. Cacique Lambaré c/San Vicente</option>
						<option value="MARIANO R. ALONSO">Mariano R. Alonso - Ruta Transchaco Km. 15 1/2</option>
						<option value="LIMPIO">Limpio - Avda. Colón c/ Mcal. Estigarribia</option>
						<option value="LUQUE">Luque - Avda. Gral. Aquino esq. Teniente Herrero Bueno</option>
						<option value="FNDO DE LA MORA">Fndo. de la Mora - Ruta Mcal. Estigarribia esq. 10 de Julio</option>
						<option value="CAPIATA">Capiatá - Ruta Mcal Estigarribia esq. Mcal. López Km 20</option>
					</optiongroup>
					<optgroup label="Interior">
						<option value="CAACUPE">Caacupé - Eligio Ayala esq. Juan E. O`leary</option>
						<option value="CAAGUAZU">Caaguazú - Avda. Bernardino Caballero c/ Gral. Díaz</option>
						<option value="CARAPEGUA">Carapeguá - Ruta Mcal. López y Cristóbal Colón</option>
						<option value="CIUDAD DE SAN IGNACIO">Ciudad de San Ignacio - Ruta Mcal. Estigarribia  esq. Fulgencio Yegros </option>
						<option value="CIUDAD DEL ESTE I">Ciudad del Este I - Avda.Gral. Bernardino Caballero esq. Paso de Patria</option>
						<option value="CIUDAD DEL ESTE II">Ciudad del Este II - Avda. Julio César Riquelme - Km 7 Monday</option>
						<option value="CIUDAD DEL ESTE III">Ciudad del Este III - Boquerón c/Avda. Adrián Jara.</option>
						<option value="CNEL OVIEDO">Cnel. Oviedo - José Segundo Decoud e/ Tuyutí</option>
						<option value="CONCEPCION">Concepción - Pdte. Franco e/ Gral. Garay y 14 de Mayo</option>
						<option value="CURUGUATY">Curuguaty - 14 de Mayo esq. Julia Miranda Cueto de Estigarribia</option>
						<option value="ENCARNACION">Encarnación - Mcal. Estigarribia entre Tomás Romero Pereira y Villarrica</option>
						<option value="ITAGUA">Itaguá - Ruta Mcal. Estigarribia esq. Juan C. Centurión </option>
						<option value="KATUETE">Katueté - La Residenta esq. Capellán Arzamendia</option>
						<option value="LOMA PLATA">Loma Plata - Avda. Central Nº 1160 esq. Gondra</option>
						<option value="MARIA AUXILIADORA">Maria Auxiliadora - Tomas Romero Pereira esq. Maria Auxiliadora</option>
						<option value="OBLIGADO">Obligado - Avda. Gaspar R. de Francia esq. Colonias Unidas</option>
						<option value="PEDRO JUAN CABALLERO">Pedro Juan Caballero - Avda. Carlos A. López y Perpetuo Socorro</option>
						<option value="PILAR">Pilar - Albersoni esq. Antequera</option>
						<option value="SALTOS DEL GUAIRA">Saltos del Guairá - Avenida Paraguay esq. Ricardo Mendez Gonzalves</option>
						<option value="SAN ESTANISLAO">San Estanislao - Mcal.López c/ Cnel.Zoilo González</option>
						<option value="SAN JUAN NEPOMUCENO">San Juan Nepomuceno - Ruta Mcal. Estigarribia N° 360 c/Pai Fariña</option>
						<option value="SANTA RITA">Santa Rita - Avda. Carlos Antonio López esq. Eusebio Ayala</option>
						<option value="SANTA ROSA DEL AGUARAY">Santa Rosa del Aguaray - Ruta General Aquino c/ Prof. Pedro Gónzalez</option>
						<option value="VILLARRICA">Villarrica - Avda. Carlos A. López esq. Mcal. Estigarribia</option>
					</optiongroup>  			
	  			</html:select><br/>
	  			<html:errors property="userform.office.mandatory"/></td>
	  		</td>  		
	  	</tr>  	  	
	  	<tr>
	  		<td>Teléfono: (*)</td>
	  		<td colspan="1"><html:text property="phone"></html:text><br/>
	  		<html:errors property="userform.phone.mandatory"/></td>
	  		<td>Fax:</td>
	  		<td colspan="1"><html:text property="fax"></html:text></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Fecha de nacimiento: (*)</td>
	  		<td colspan="3"><html:text property="constitution"></html:text><br/>
	  		<html:errors property="userform.date.mandatory"/></td>
	  	</tr>  	
	  	<tr>
	  		<td>Cédula Identidad: (*)</td>
	  		<td colspan="1"><html:text property="ciContactPerson"></html:text><br/>
	  		<html:errors property="userform.ci.mandatory"/></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Correo electrónico: (*)</td>
	  		<td colspan="3">&nbsp;<html:text property="mail" size="60"><br/>
	  		<html:errors property="userform.email.mandatory"/></html:text></td>
	  	</tr>  	
	  	<tr>  		
	  		<td colspan="4" align="center"><html:submit value="Registrar" onclick="sendform('true')"/>&nbsp;&nbsp;<html:reset value="Limpiar Campos"/></td>
	  	</tr>  	    	
  </table>
  <%}%>
  <br/>
 
  
</html:form>
</div>
</div>
</body>
</html>
