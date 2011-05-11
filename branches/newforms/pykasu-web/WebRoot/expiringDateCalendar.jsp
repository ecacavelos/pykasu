<%@ taglib uri="bean" prefix="bean"%>
<%@ taglib uri="logic" prefix="logic"%>
<%@ taglib uri="html" prefix="html"%>

<html>
<head>
<title></title>
<script LANGUAGE="JavaScript" SRC="js/rshk.js"></script>
<script language="javascript">
	function getSY(){
		return 0;
	}
	
</script>
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

<h1>Calendario de Vencimientos</h1>
<html:form action="expiringDateCalendar" method="post">

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
<h2>Vencimientos</h2>
<table  width="90%" id="table_detalles" align="center" cellpadding="4" cellspacing="0">
	<tr>
		<th>Formulario</th>
		<th>Desde</th>
		<th>Hasta</th>	
		<th>Vencimiento</th>	
	</tr>
	<%
		int index = 0;
	%>
	<logic:iterate id="expiringDate" name="expiringDates">
	<%String key = Integer.toString(index);%>
	
	<tr>
		<td><html:text property='<%= "formType(" + key + ")" %>'  styleId='<%= "detalle_id_" + key %>' onfocus="elegirFila(this)"/></td>
		<td><html:text property='<%= "charFrom(" + key + ")" %>' styleId='<%= "detalle_descripcion_" + key %>' onfocus="elegirFila(this)"/></td>
		<td><html:text property='<%= "charTo(" + key + ")" %>' styleId='<%= "detalle_importe_" + key %>' onfocus="elegirFila(this)"/></td>
		<td><html:text property='<%= "date(" + key + ")" %>' styleId='<%= "detalle_importe_" + key %>' onfocus="elegirFila(this)"/></td>		
		<td><input type="checkbox" name='<%= key %>' id='<%= key %>' onfocus="delete(this)"/>
	    <td><html:hidden property='<%= "id(" + key + ")" %>'/> </td>
	</tr>
		<%index++;%>
	</logic:iterate>
</table>
<table>
	<tr>
		<td><html:button property="submit" value="NUEVO DETALLE" onclick="addDetail()" /></td>
		<td><html:button property="submit" value="ELIMINAR" onclick="eliminar()"/></td>
	</tr>
</table>

<hr>

<html:submit value="Guardar todo el calendario"/>
<html:reset  value="Cancelar todo el calendario"/>

</html:form>

</div>
</html>
