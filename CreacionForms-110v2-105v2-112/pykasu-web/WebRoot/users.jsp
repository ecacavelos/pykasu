<%@ page contentType="text/html" language="java"

%>
<%@page import="py.com.roshka.pykasu.persistence.users.User"%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<html>
<head>
<title>Sistema</title>
<script LANGUAGE="JavaScript" SRC="menus.js"></script>
<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="header.jsp"/> 
<jsp:include page="menu.jsp"/> 
<div id="main"> 

<h3><%=(String)request.getAttribute(py.com.roshka.pykasu.web.Globals.GLOBAL_TITLE)%></h3>
	<table border="1">
<%
	java.util.List<User> users = ((java.util.List<User>)request.getAttribute(py.com.roshka.pykasu.web.Globals.USER_USERS_LIST));
	if(users.size() == 0){%>
		<tr><td>No hay registros</td></tr>
	<%}else{%>
		<tr>
			<th>Usuario</th>
			<th>Nombre</th>
			<th>CI</th>
			<th>Correo</th>
			<th>&nbsp;</th>						
		</tr>		
		<%for(User user : users){%>
		<tr>
			<td><%=user.getUserName() %></td>		
			<td><%=user.getFullName()%></td>
			<td><%=user.getDocumentNumber()%></td>
			<td><%=user.getEmail()%></td>
			<td><form action="edituser.do" method="post"><input type="hidden" name="userId" value="<%=user.getId()%>" /><input type="submit" value="Editar"/> </form></td>				
		</tr>		
		
		<%}%>
	<%}%>		
	</table>
</div>
</body>
</html>
