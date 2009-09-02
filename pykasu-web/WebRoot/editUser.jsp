<%@ page contentType="text/html" language="java" %>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<jsp:directive.page import="py.com.roshka.pykasu.persistence.admission.*"/>
<% java.util.List<Admission> admissions = (java.util.List<Admission>) request.getAttribute("admissions");  %>

<html>
<head>
<title>Lista de Usuarios</title>
<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="header.jsp"/> 
<jsp:include page="menu.jsp"/>
 
<div id="main">
	<h3>Edición de Usuarios</h3>
	<jsp:include page="messages.jsp"/>
		
	<html:form action="edituser.do" method="post">
		<table>
			<tr>
				<td>Usuario:</td>
				<%if(request.getParameter("actionType")!=null && request.getParameter("actionType").equalsIgnoreCase("add")){%>
					<td><html:text property="userName" value="" styleClass="inputform"></html:text></td>
					<td><html:errors property="userform.userName.mandatory"/></td>				
				<%}else{ %>
					<td><%=request.getAttribute("editUser")!=null?((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getUserName():""%></td>
				<%}%>
					<td></td>
				
				
			</tr>
			<tr>
				<td>Nombre:</td>
				<td><html:text property="fullName" styleClass="inputform" value="<%=request.getAttribute("editUser")!=null?((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getFullName():""%>"></html:text></td>
				<td><html:errors property="userform.name.mandatory"/></td>
			</tr>
			<tr>
				<td>Documento Nro.:</td>
				<td><html:text property="documentNumber" styleClass="inputform" value="<%=request.getAttribute("editUser")!=null?((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getDocumentNumber():""%>"></html:text></td>
				<td><html:errors property="userform.ci.mandatory"/></td>
			</tr>
			<tr>
				<td>Correo:</td>
				<td><html:text property="email" styleClass="inputform" value="<%=request.getAttribute("editUser")!=null?((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getEmail():""%>"></html:text></td>
				<td><html:errors property="userform.email.mandatory"/></td>
			</tr>			
			<tr>
				<td>Contraseña:</td>
				<td><html:password property="password"></html:password><br/></td>
				<%if(request.getParameter("actionType")!=null && request.getParameter("actionType").equalsIgnoreCase("add")){%>
				<td></td>
				<%}else{ %>
				<td>Dejar en blanco para mantener la contraseña actual</td>			
				<%}%>
				<td></td>
			</tr>
			<tr>
				<td>Confirmación:</td>
				<td><html:password property="replyPassword"></html:password></td>
				<td></td>
			</tr>

			<tr>
				<td><html:submit value="Guardar"></html:submit></td>
				<td><html:reset value="Limpiar"></html:reset></td>
			</tr>
			
			<input type="hidden" name="save" value="true"/>
			<input type="hidden" name="userId" value="<%=request.getAttribute("editUser")!=null?((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getId():""%>"/>
		</table>
	</html:form>	
</div>
</body>
</html>
