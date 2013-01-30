<%@ page contentType="text/html" language="java" %>
<%@page import="py.com.roshka.pykasu.ejb.AdmissionManagerEJB"%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<jsp:directive.page import="py.com.roshka.pykasu.persistence.admission.*"/>
<% java.util.List<Admission> admissions = (java.util.List<Admission>) request.getAttribute("admissions");  %>

<html>
<head>
<title>Lista de Solicitudes de Registro</title>
<script LANGUAGE="JavaScript" SRC="js/sha1.js"></script>
<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="header.jsp"/> 
<jsp:include page="menu.jsp"/> 
<div id="main">
	<h3>Solicitudes de Registro de Cuenta</h3>
	<form action="admissionslist.do" method="post">
		Realice la búsqueda por:<br/><br/>
		Identificador:<input name="admissionId" type="text" value="<%=request.getAttribute("admissionId")==null?"":request.getAttribute("admissionId")%>"/>
		<br/>o
		<br/>
		Seleccione el estado:		
		<select name="status">
			<option value="<%=AdmissionManagerEJB.STATUS_REGISTRO%>"   <%if((""+request.getAttribute("status")).equalsIgnoreCase(AdmissionManagerEJB.STATUS_REGISTRO)){ out.write("selected=\"true\"");}%>><%=AdmissionManagerEJB.STATUS_REGISTRO%></option>
			<option value="<%=AdmissionManagerEJB.STATUS_CONFIRMADO%>" <%if((""+request.getAttribute("status")).equalsIgnoreCase(AdmissionManagerEJB.STATUS_CONFIRMADO)){ out.write("selected=\"true\"");}%>><%=AdmissionManagerEJB.STATUS_CONFIRMADO%></option>
			<option value="<%=AdmissionManagerEJB.STATUS_CONFIGURADO%>"<%if((""+request.getAttribute("status")).equalsIgnoreCase(AdmissionManagerEJB.STATUS_CONFIGURADO)){ out.write("selected=\"true\"");}%>><%=AdmissionManagerEJB.STATUS_CONFIGURADO%></option>
			<option value="<%=AdmissionManagerEJB.STATUS_ACTIVADO%>"   <%if((""+request.getAttribute("status")).equalsIgnoreCase(AdmissionManagerEJB.STATUS_ACTIVADO)){ out.write("selected=\"true\"");}%>><%=AdmissionManagerEJB.STATUS_ACTIVADO%></option>
		</select>
		<br/>
		<br/>
		<input type="submit" value="Recuperar" />
	</form>
		<br/>
		<br/>
	
	<%if(admissions != null && admissions.size() > 0){ %>
		<table border="1">
		<tr>
			<th>Tipo</th>
			<th>Empresa</th>
			<th>RUC</th>
			<th>Dirección</th>
			<th>Localidad</th>
			<th>Teléfono</th>
			<th>Nombre</th>			
			<th>Apellido</th>			
			<th>C.I.</th>
			<th>Estado</th>
			<th>&nbsp;</th>
		</tr>		
		
	<% 	for(Admission admission : admissions){ %>
		<tr>
			<td><%=admission.getTypeUIName()%></td>
			<td><%=admission.getCompanyName()%></td>
			<td><%=admission.getRuc() + "-" + admission.getDv()%></td>
			<td><%=admission.getAddress()%></td>
			<td><%=admission.getLocality()%></td>
			<td><%=admission.getPhone()%></td>
			<td><%=admission.getFname()%></td>			
			<td><%=admission.getLname()%></td>			
			<td><%=admission.getCiContactPerson()%></td>
			<td><%=admission.getStatus()%></td>
			<td>
				<%if(admission.getStatus().equalsIgnoreCase(AdmissionManagerEJB.STATUS_CONFIRMADO)){%>
					<form action="showuserform.do" method="post"><input type="hidden" name="admissionId" value="<%=admission.getId()%>" /><input type="submit" value="Procesar"/></form>
				<%}%>
			</td>
		</tr>		
	<%	}%>
		</table>		
	<% }else{%>
		No hay Solicitudes de Registro
	<%}%>
	
</div>
</body>
</html>
