<%@ taglib uri="bean" prefix="bean"%>
<%@ taglib uri="logic" prefix="logic"%>
<%@ taglib uri="html" prefix="html"%>

<html>
<head>
<title></title>
<script LANGUAGE="JavaScript" SRC="js/rshk.js"></script>

<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
</head>
<jsp:include page="header.jsp"/> 
<jsp:include page="menu.jsp"/> 

<div id="main">
<logic:present name="PYKASU.MESSAGE">
	<div id="messages">
		<p><bean:write name="PYKASU.MESSAGE" filter="false"/></p>
	</div>
</logic:present>
<logic:present name="PYKASU.ERROR">
	<div id="errors">
		<p><bean:write name="PYKASU.ERROR" filter="false"/></p>
	</div>
</logic:present>

<h1>Búsqueda de Periodos Fiscales</h1>
<html:form action="fiscalPeriodSearch">

<h2>Perido fiscal</h2>
<table style="width:100%;border-spacing:0">
	<tr>
		<th>Mes</th>
		<td><html:text property="month"/></td>

		<th>Año</th>
		<td><html:text property="year"/></td>
	</tr>
</table>
<hr>
	<html:submit value="Buscar"/>
	<html:reset  value="Cancelar"/>
<hr>
<logic:present name="RESULT.OK">
<h2>Vencimientos</h2>
<table  width="90%" id="table_detalles" align="center" cellpadding="4" cellspacing="0">
	<tr>
		<th>Id</th>
		<th>Formulario</th>
		<th>Desde</th>
		<th>Hasta</th>	
		<th>Vencimiento</th>	
	</tr>
	<%	int actualForm = 0;	%>
	<logic:iterate name="details" id="expiringDate">
	<tr>
		<td align="center"><bean:write name="expiringDate" property="id" format="###"/></td>
		<td align="center"><bean:write name="expiringDate" property="formType" format="###"/></td>
		<td align="center"><bean:write name="expiringDate" property="charFrom" /></td>
		<td align="center"><bean:write name="expiringDate" property="charTo" /></td>
		<td align="center"><bean:write name="expiringDate" property="date" format="dd/MM/yyyy" /></td>		
	</tr>
	</logic:iterate>
</table>
</logic:present>
</html:form>

</div>
</html>
