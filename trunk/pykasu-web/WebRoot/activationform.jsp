
<%@ page contentType="text/html" language="java"

%>

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
	<h1>Activar Cuenta</h1>
	<form action="activationAccount.do" method="get">
	<table align="left">
		<tr>
			<th>Ingrese la clave de activación:</th>
			<td><input type="text" name="accountNumber"/></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="Activar"/>
			</td>
		</tr>
	</table>
	</form>
</div>
<body>&gt;</body>
</html>
