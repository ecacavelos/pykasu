
<%@ page contentType="text/html" language="java"
%>
<jsp:directive.page import="py.com.roshka.pykasu.persistence.uploadForm.UploadForm"/>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>
<html>
<head>
	<title>Sistema</title>
	<script LANGUAGE="JavaScript" SRC="menus.js"></script>
	<script LANGUAGE="JavaScript" SRC="js/CalendarPopup.js"></script>	
	<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/> 
<jsp:include page="menu.jsp"/> 
<div id="main">

	<h1>Formularios enviados al Sistema</h1>
	<form name="showUploadForms" id="showUploadForms" action="showuploadforms.do" method="post">
		<%pageContext.setAttribute("dateFormName","showUploadForms");
		pageContext.setAttribute("dateVarName","init");%>
		Desde:<%@include file="datemgr.jsp"%>
		<%pageContext.setAttribute("dateVarName","end");%>
		Hasta:<%@include file="datemgr.jsp" %>
		<br>
		<input type="submit" value="Recuperar"/>
	</form>
	<%
	java.util.List <UploadForm> uploadForms = (java.util.List <UploadForm>)request.getAttribute("uploadForms"); 
	int i = 0;
	%>
	<table align="center" width="100%">
		<tr>
			<th>Formulario Nro</th>
			<th>Tipo</th>
			<th>RUC</th>
			<th>Periodo</th>
			<th>Tipo declaracion</th>
			<th>Enviado</th>				
			<th>Enviado por</th>
			<th>Modificado</th>				
			<th>Estado</th>
		</tr>
		<%
		for(UploadForm uf : uploadForms){
		i++;
		%>
		<tr>
			<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center"><a href="editItem.do?id=<%=uf.getFormId()%>&form=<%=uf.getFormType()%>&option=Detalles"><%=uf.getFormId()%></a></td>
			<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center"><%=uf.getFormType()%></td>
			<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center"><%=uf.getRuc()%></td>
			<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center"><%=uf.getFiscalPeriod()%></td>
			<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center"><%=uf.getDeclarationType()%></td>
			<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center" width="20px"><%=uf.getUploadAt()%></td>
			<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center"><%=uf.getUser().getFullName()%></td>
			<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center" width="20px"><%=uf.getLastChange()%></td>
			<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center"><%=uf.getStatus()%></td>												
		</tr>
			<%if(uf.getDescription() != null && uf.getDescription().length() > 0){ %>
			<tr>
				<td <%out.print(i%2==0?" class=\"odd\"":"");%> align="center" colspan="9"><label style="color: navy;"><%=uf.getDescription()%></label></td>
			</tr>
			<%}%>
		<%}%>
	</table>

	
	
</div>
</body>
</html>
