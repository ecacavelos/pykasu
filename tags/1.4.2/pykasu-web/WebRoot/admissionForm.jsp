<%@ page contentType="text/html" language="java" %>
<%@page import="py.com.roshka.pykasu.persistence.users.BusinessCompany"%>
<%@page import="py.com.roshka.pykasu.web.util.BranchOfficeManager"%>
<%@page import="java.util.List"%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<%
	List<BranchOfficeManager.Zone> zonas = BranchOfficeManager.getBranchOfficeByZone();

%>
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
  Para que su Solicitud de Admisión sea aceptada, es necesario que Ud. presente el siguiente <br/> 
  <a href="html/contrato.pdf" target="blanck">Contrato de Prestación de Servicios</a> 
  en cualquiera de los Centros de Atención al cliente hablilitados
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
				<%for(BranchOfficeManager.Zone zona : zonas){%>
					<optgroup label="<%=zona.getName()%>">
						<option value=""></option>
					<%for(BranchOfficeManager.BranchOffice bo : zona.getBranchOffices()){%>
						<option value="<%=bo.getId()%>"><%=bo.getName()%>-<%=bo.getAddress()%></option>
					<%}%>
					</optgroup>
				<%}%>  			
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
	  		<td colspan="4">	
	  		<div style="color: blue; font-size: 10px; font-style: italic; width: 700px;" >
	  		Si Ud. tiene ya una cuenta, o su empresa tiene varias cuentas 
	  		con la cual ya han realizado declaraciones anteriores, y desea que
	  		las mismas sean migradas a su nueva cuenta, favor especifíque los
	  		nombres de usuario separados entre ; (punto y coma)
	  		Ejemplo: pwelti;aiwa;rramirez  
	  		</div>
	  		</td>
	  	</tr> 	  	
	  	<tr>
	  		<td>Migración de usuarios anterirores:</td>
	  		<td colspan="3">&nbsp;<html:text property="legacyUsers" size="60"></html:text></td>
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
				<%for(BranchOfficeManager.Zone zona : zonas){%>
					<optgroup label="<%=zona.getName()%>">
						<option value=""></option>
					<%for(BranchOfficeManager.BranchOffice bo : zona.getBranchOffices()){%>
						<option value="<%=bo.getId()%>"><%=bo.getName()%>-<%=bo.getAddress()%></option>
					<%}%>
					</optgroup>
				<%}%>  			
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
	  		<td colspan="4">	
	  		<div style="color: blue; font-size: 10px; font-style: italic; width: 700px;" >
	  		Si Ud. tiene ya una cuenta, o su empresa tiene varias cuentas 
	  		con la cual ya han realizado declaraciones anteriores, y desea que
	  		las mismas sean migradas a su nueva cuenta, favor especifíque los
	  		nombres de usuario separados entre ; (punto y coma)
	  		Ejemplo: pwelti;aiwa;rramirez  
	  		</div>
	  		</td>
	  	</tr> 	  	
	  	<tr>
	  		<td>Migración de usuarios anterirores:</td>
	  		<td colspan="3">&nbsp;<html:text property="legacyUsers" size="60"></html:text></td>
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
