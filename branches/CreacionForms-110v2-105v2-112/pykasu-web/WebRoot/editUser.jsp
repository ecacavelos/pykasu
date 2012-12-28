<%@ page contentType="text/html" language="java" %>
<%@page import="py.com.roshka.pykasu.web.Globals"%>

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
					<td><html:text style="font-family:Verdana,Arial;font-size:10px;font-weight:normal;text-align:left;text-transform:none;" property="userName" value="" ></html:text></td>
					<td><html:errors property="userform.userName.mandatory"/></td>
					<input type="hidden" name="actionType" value="add" />				
				<%}else{ %>
					<td><%=request.getAttribute("editUser")!=null?((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getUserName():""%></td>
				<%}%>
					<td></td>
				
				
			</tr>
			<tr>
				<td>Nombre:</td>
				<td><html:text property="fullName"  style="font-family:Verdana,Arial;font-size:10px;font-weight:normal;text-align:left;text-transform:none;" value="<%=request.getAttribute("editUser")!=null?((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getFullName():""%>"></html:text></td>
				<td><html:errors property="userform.name.mandatory"/></td>
			</tr>
			<tr>
				<td>Documento Nro.:</td>
				<td><html:text property="documentNumber" style="font-family:Verdana,Arial;font-size:10px;font-weight:normal;text-align:left;text-transform:none;" value="<%=request.getAttribute("editUser")!=null?((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getDocumentNumber():""%>"></html:text></td>
				<td><html:errors property="userform.ci.mandatory"/></td>
			</tr>
			<tr>
				<td>Correo:</td>
				<td><html:text property="email" style="font-family:Verdana,Arial;font-size:10px;font-weight:normal;text-align:left;text-transform:none;" value="<%=request.getAttribute("editUser")!=null?((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getEmail():""%>"></html:text></td>
				<td><html:errors property="userform.email.mandatory"/></td>
			</tr>
			
			<%if(request.getAttribute("editUser")!=null && 
					((py.com.roshka.pykasu.persistence.users.User)request.getAttribute("editUser")).getUserName().equalsIgnoreCase(((py.com.roshka.pykasu.persistence.users.User)request.getSession().getAttribute(Globals.LOGIN_USER)).getUserName()) ){%>
			<tr>
				<td colspan="3"><br/>Si desea cambiar su contraseña, favor utlice la opción "Cambio de Contraseña" disponible en el menú<br/></td>
			</tr>													
			<%}else{%>
			<tr>
				<td>Contraseña:</td>
				<td><html:password property="password"></html:password></td>
				<%if(request.getParameter("actionType")!=null && request.getParameter("actionType").equalsIgnoreCase("add")){%>
				<td><html:errors property="userform.password.mandatory"/></td>
				<%}else{ %>
				<td>Dejar en blanco para mantener la contraseña actual<br/><html:errors property="userform.password.mandatory"/></td>			
				<%}%>				
			</tr>
			<tr>
				<td>Confirmación:</td>
				<td><html:password property="replyPassword"></html:password></td>
				<td>
					<html:errors property="userform.replyPassword.mandatory"/>
					<html:errors property="userform.passwords.notEquals"/>
					<html:errors property="userform.password.short"/>
				</td>
			</tr>
			
			<%}%>

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
