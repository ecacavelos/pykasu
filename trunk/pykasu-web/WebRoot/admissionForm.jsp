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
  
  <b>Gracias por estar interesado en el Sistema de Tributos Web de Visi�n Banco</b><br/><br/>
  A trav�s de este sistema Ud podr� cargar formularios impositivos y disfrutar<br/> 
  de los servicios que Visi�n Banco le brinda, como ser la presentaci�n de dichos formularios,<br/> 
  o el pago en l�nea de los mismos, entre otros.
  <br/><br/>
  Para que su Solicitud de Admisi�n sea aceptada, es necesario que Ud. presente el siguiente <br/> 
  <a href="html/contrato.pdf" target="blanck">Contrato de Prestaci�n de Servicios</a> 
  en cualquiera de los Centros de Atenci�n al cliente hablilitados
  <br/><br/>  
  Sea tan amable de elegir el tipo de cuenta que m�s se ajusta a sus necesidades:<br/>
  
   <html:radio property="type" value="MULTI_USER" onclick="sendform('false')" styleId="multiuser"/><b>Cuenta Empresarial</b><br/>
  Con este tipo de cuenta, Ud y m�s personas relacionadas a su empresa, podran cargar formularios impositivos.<br/>
  Generalmente este tipo de cuenta, se ajusta a Empresas Contables que registran formularios impositivos de sus clientes.<br/><br/> 
  <html:radio property="type" value="SINGLE_USER" onclick="sendform('false')" styleId="singleuser"/><b>Cuenta Particular</b><br/>
  Con este tipo de cuenta, Ud podran cargar sus formularios impositivos.<br/>
  Normalmente, este tipo de cuenta es seleccionado por personas independientes que cargar sus formularios impositivos.
  <br/> 
  <br/>
  Una vez seleccionado el tipo de cuenta, se le requerir�n algunos datos necesarios para realizar el registos<br/>
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
	  		<td>D�gito verificador: (*)</td>
	  		<td><html:text property="dv" size="1"></html:text><br/>
	  		<html:errors property="userform.dv.mandatory"/></td>  		
	  	</tr>
	  	<tr>
	  		<td>Direcci�n: (*)</td>
	  		<td colspan="1"><html:text property="address"></html:text><br/>
	  		<html:errors property="userform.address.mandatory"/></td>
	  		<td>Localidad:</td>
	  		<td colspan="1"><html:text property="locality"></html:text></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Centro de Atenci�n al Cliente<br/>donde retirar� sus formularios:(*)</td>  		  		
	  		<td colspan="3">
	  			<html:select property="office">
					<optgroup label="Asunci�n">
						<option value=""></option>
						<option value="1">Casa Matriz - EEUU 780 e/Fulgencio R. Moreno y L.A. de Herrera</option>
						<option value="3">Gral. Santos - Avda. Gral. Santos esq. Avda. Fndo. de la Mora</option>
						<option value="7">Palma - Palma esq. Ntra. Sra. de la Asunci�n</option>
						<option value="26">Oliva - Oliva esq. O`leary</option>
						<option value="23">Pinoz� - Avda. Eusebio Ayala esq. Bruno Guggiari</option>
						<option value="14">Villa Morra - Charles de Gaulle c/ Mcal. Lopez</option>
						<option value="25">Multiplaza - Avda Eusebio Ayala N� 4501</option>
						<option value="34">Denis Roa - Denis Roa esq. Mois�s Bertoni</option>
						<option value="36">Santisima Trinidad - Avda. Sacramento esq. Avenida Santisima Trinidad</option>
					</optiongroup>
					<optgroup label="Gran Asunci�n">
						<option value="2">San Lorenzo I - Ruta Mcal. Estigarribia esq. Cnel. Romero</option>
						<option value="32">San Lorenzo II - 10 de Agosto esq. Hernandarias</option>
						<option value="8">�emby - 9 de Agosto esq. Ytoror�</option>
						<option value="10">Lambar� - Avda. Cacique Lambar� c/San Vicente</option>
						<option value="9">Mariano R. Alonso - Ruta Transchaco Km. 15 1/2</option>
						<option value="29">Limpio - Avda. Col�n c/ Mcal. Estigarribia</option>
						<option value="4">Luque - Avda. Gral. Aquino esq. Teniente Herrero Bueno</option>
						<option value="13">Fndo. de la Mora - Ruta Mcal. Estigarribia esq. 10 de Julio</option>
						<option value="28">Capiat� - Ruta Mcal Estigarribia esq. Mcal. L�pez Km 20</option>
					</optiongroup>
					<optgroup label="Interior">
						<option value="6">Caacup� - Eligio Ayala esq. Juan E. O`leary</option>
						<option value="15">Caaguaz� - Avda. Bernardino Caballero c/ Gral. D�az</option>
						<option value="17">Carapegu� - Ruta Mcal. L�pez y Crist�bal Col�n</option>
						<option value="33">Ciudad de San Ignacio - Ruta Mcal. Estigarribia  esq. Fulgencio Yegros </option>
						<option value="11">Ciudad del Este I - Avda.Gral. Bernardino Caballero esq. Paso de Patria</option>
						<option value="20">Ciudad del Este II - Avda. Julio C�sar Riquelme - Km 7 Monday</option>
						<option value="31">Ciudad del Este III - Boquer�n c/Avda. Adri�n Jara.</option>
						<option value="12">Cnel. Oviedo - Jos� Segundo Decoud e/ Tuyut�</option>
						<option value="16">Concepci�n - Pdte. Franco e/ Gral. Garay y 14 de Mayo</option>
						<option value="38">Curuguaty - 14 de Mayo esq. Julia Miranda Cueto de Estigarribia</option>
						<option value="5">Encarnaci�n - Mcal. Estigarribia entre Tom�s Romero Pereira y Villarrica</option>
						<option value="35">Itagu� - Ruta Mcal. Estigarribia esq. Juan C. Centuri�n </option>
						<option value="24">Katuet� - La Residenta esq. Capell�n Arzamendia</option>
						<option value="40">Loma Plata - Avda. Central N� 1160 esq. Gondra</option>
						<option value="41">Maria Auxiliadora - Tomas Romero Pereira esq. Maria Auxiliadora</option>
						<option value="27">Obligado - Avda. Gaspar R. de Francia esq. Colonias Unidas</option>
						<option value="22">Pedro Juan Caballero - Avda. Carlos A. L�pez y Perpetuo Socorro</option>
						<option value="18">Pilar - Albersoni esq. Antequera</option>
						<option value="37">Saltos del Guair� - Avenida Paraguay esq. Ricardo Mendez Gonzalves</option>
						<option value="21">San Estanislao - Mcal.L�pez c/ Cnel.Zoilo Gonz�lez</option>
						<option value="39">San Juan Nepomuceno - Ruta Mcal. Estigarribia N� 360 c/Pai Fari�a</option>
						<option value="30">Santa Rita - Avda. Carlos Antonio L�pez esq. Eusebio Ayala</option>
						<option value="PAC">Santa Rosa del Aguaray - Ruta General Aquino c/ Prof. Pedro G�nzalez</option>
						<option value="19">Villarrica - Avda. Carlos A. L�pez esq. Mcal. Estigarribia</option>
						<option value="42">Coronel Bogado</option>
					</optiongroup>  			
	  			</html:select><br/>
	  			<html:errors property="userform.office.mandatory"/></td>
	  		</td>  		
	  	</tr>  	  	
	  	<tr>
	  		<td>Tel�fono: (*)</td>
	  		<td colspan="1"><html:text property="phone"></html:text><br/>
	  		<html:errors property="userform.phone.mandatory"/></td>
	  		<td>Fax:</td>
	  		<td colspan="1"><html:text property="fax"></html:text></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Fecha de constituci�n: (*)</td>
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
	  		<td>C�dula Identidad: (*)</td>
	  		<td colspan="1"><html:text property="ciContactPerson"></html:text><br/>
	  		<html:errors property="userform.ci.mandatory"/></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Correo electr�nico: (*)</td>
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
	  		<td>D�gito verificador: (*)</td>
	  		<td><html:text property="dv" size="1"></html:text><br/>
	  		<html:errors property="userform.dv.mandatory"/></td>  		
	  	</tr>
	  	<tr>
	  		<td>Direcci�n: (*)</td>
	  		<td colspan="1"><html:text property="address"></html:text><br/>
	  		<html:errors property="userform.address.mandatory"/></td>
	  		<td>Localidad:</td>
	  		<td colspan="1"><html:text property="locality"></html:text></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Centro de Atenci�n al Cliente<br/>donde retirar� sus formularios:(*)</td>	  		
	  		<td colspan="3">
	  			<html:select property="office">
					<optgroup label="Asunci�n">
						<option value=""></option>
						<option value="1">Casa Matriz - EEUU 780 e/Fulgencio R. Moreno y L.A. de Herrera</option>
						<option value="3">Gral. Santos - Avda. Gral. Santos esq. Avda. Fndo. de la Mora</option>
						<option value="7">Palma - Palma esq. Ntra. Sra. de la Asunci�n</option>
						<option value="26">Oliva - Oliva esq. O`leary</option>
						<option value="23">Pinoz� - Avda. Eusebio Ayala esq. Bruno Guggiari</option>
						<option value="14">Villa Morra - Charles de Gaulle c/ Mcal. Lopez</option>
						<option value="25">Multiplaza - Avda Eusebio Ayala N� 4501</option>
						<option value="34">Denis Roa - Denis Roa esq. Mois�s Bertoni</option>
						<option value="36">Santisima Trinidad - Avda. Sacramento esq. Avenida Santisima Trinidad</option>
					</optiongroup>
					<optgroup label="Gran Asunci�n">
						<option value="2">San Lorenzo I - Ruta Mcal. Estigarribia esq. Cnel. Romero</option>
						<option value="32">San Lorenzo II - 10 de Agosto esq. Hernandarias</option>
						<option value="8">�emby - 9 de Agosto esq. Ytoror�</option>
						<option value="10">Lambar� - Avda. Cacique Lambar� c/San Vicente</option>
						<option value="9">Mariano R. Alonso - Ruta Transchaco Km. 15 1/2</option>
						<option value="29">Limpio - Avda. Col�n c/ Mcal. Estigarribia</option>
						<option value="4">Luque - Avda. Gral. Aquino esq. Teniente Herrero Bueno</option>
						<option value="13">Fndo. de la Mora - Ruta Mcal. Estigarribia esq. 10 de Julio</option>
						<option value="28">Capiat� - Ruta Mcal Estigarribia esq. Mcal. L�pez Km 20</option>
					</optiongroup>
					<optgroup label="Interior">
						<option value="6">Caacup� - Eligio Ayala esq. Juan E. O`leary</option>
						<option value="15">Caaguaz� - Avda. Bernardino Caballero c/ Gral. D�az</option>
						<option value="17">Carapegu� - Ruta Mcal. L�pez y Crist�bal Col�n</option>
						<option value="33">Ciudad de San Ignacio - Ruta Mcal. Estigarribia  esq. Fulgencio Yegros </option>
						<option value="11">Ciudad del Este I - Avda.Gral. Bernardino Caballero esq. Paso de Patria</option>
						<option value="20">Ciudad del Este II - Avda. Julio C�sar Riquelme - Km 7 Monday</option>
						<option value="31">Ciudad del Este III - Boquer�n c/Avda. Adri�n Jara.</option>
						<option value="12">Cnel. Oviedo - Jos� Segundo Decoud e/ Tuyut�</option>
						<option value="16">Concepci�n - Pdte. Franco e/ Gral. Garay y 14 de Mayo</option>
						<option value="38">Curuguaty - 14 de Mayo esq. Julia Miranda Cueto de Estigarribia</option>
						<option value="5">Encarnaci�n - Mcal. Estigarribia entre Tom�s Romero Pereira y Villarrica</option>
						<option value="35">Itagu� - Ruta Mcal. Estigarribia esq. Juan C. Centuri�n </option>
						<option value="24">Katuet� - La Residenta esq. Capell�n Arzamendia</option>
						<option value="40">Loma Plata - Avda. Central N� 1160 esq. Gondra</option>
						<option value="41">Maria Auxiliadora - Tomas Romero Pereira esq. Maria Auxiliadora</option>
						<option value="27">Obligado - Avda. Gaspar R. de Francia esq. Colonias Unidas</option>
						<option value="22">Pedro Juan Caballero - Avda. Carlos A. L�pez y Perpetuo Socorro</option>
						<option value="18">Pilar - Albersoni esq. Antequera</option>
						<option value="37">Saltos del Guair� - Avenida Paraguay esq. Ricardo Mendez Gonzalves</option>
						<option value="21">San Estanislao - Mcal.L�pez c/ Cnel.Zoilo Gonz�lez</option>
						<option value="39">San Juan Nepomuceno - Ruta Mcal. Estigarribia N� 360 c/Pai Fari�a</option>
						<option value="30">Santa Rita - Avda. Carlos Antonio L�pez esq. Eusebio Ayala</option>
						<option value="PAC">Santa Rosa del Aguaray - Ruta General Aquino c/ Prof. Pedro G�nzalez</option>
						<option value="19">Villarrica - Avda. Carlos A. L�pez esq. Mcal. Estigarribia</option>
						<option value="42">Coronel Bogado</option>
					</optiongroup>  			
	  			</html:select><br/>
	  			<html:errors property="userform.office.mandatory"/></td>
	  		</td>  		
	  	</tr>  	  	
	  	<tr>
	  		<td>Tel�fono: (*)</td>
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
	  		<td>C�dula Identidad: (*)</td>
	  		<td colspan="1"><html:text property="ciContactPerson"></html:text><br/>
	  		<html:errors property="userform.ci.mandatory"/></td>  		
	  	</tr>  	
	  	<tr>
	  		<td>Correo electr�nico: (*)</td>
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
