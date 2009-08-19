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

<h2><%=(String)request.getAttribute(py.com.roshka.pykasu.web.Globals.GLOBAL_TITLE)%></h2>
<table>
<%
	java.util.Iterator results = ((java.util.List)request.getAttribute(py.com.roshka.pykasu.web.Globals.USER_USERS_LIST)).iterator();
	while (results.hasNext()){
		py.com.roshka.pykasu.ui.util.ResultItem item = (py.com.roshka.pykasu.ui.util.ResultItem)results.next();	
%>
	<tr><td>
		<form method="get" action="editUserItem.do">
		<table>
		<tr>
		<td width="70%"><%=item.getDescription()%><input type="hidden" name="id" value="<%=item.getId().toString()%>"></td>
		<td width="10%">
			<%
				if (item.isShowDetails()){
			%>
				<input type="submit" value="Detalles" name="option"> 
			<%}else{ %>
				 Detalles
			<%}%>
		</td>
		<td width="10%">
			<%
				if (item.isEditable()){
			%>
				<input type="submit" value="Editar" name="option"> 
			<%}else{ %>
				 Editar
			<%}%>
		</td>
		<td width="10%">
			<%
				if (item.isDeleteable()){
			%>
				<input type="submit" value="Borrar" name="option"> 
			<%}else{ %>
				 Borrar
			<%}%>
		</td>
		</tr>
		</table>
		</form>
		</td>
	</tr>

<%}%>
</table>
<%
%>
</div>
</body>
</html>
