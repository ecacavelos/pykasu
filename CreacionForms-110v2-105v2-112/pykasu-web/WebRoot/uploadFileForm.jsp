
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

	<h1>Levantar archivo de formulario</h1>
	
	<form action="proccessfileform.do" method="post" enctype="multipart/form-data">
		<%if(request.getAttribute("message")!=null){ %>
			<div style="message"><%=request.getAttribute("message")%> </div>
		<%}%>
		<table align="left" width="60%">
			<tr>
				<th width="50%">Seleccione el archivo:</th>
				<td width="50%"><input type="file" name="theFile" /></td>
			</tr>
			<tr>
				<td>
				  <input type="submit" name="button" value="Enviar" />
				</td>
			</tr>
			<%if(request.getAttribute("isAfterCloseHours")!=null && ((Boolean)request.getAttribute("isAfterCloseHours")).booleanValue() ){ %>
			<tr>
				<td align="center" colspan="2">
					<label style="color: maroon; font-size: 10px; font-weight: bold;">
						Nota: Si levanta un formulario, el mismo será computado con la fecha de mañana, debido que ya se ha realizado el cierre diario de Formularios.
					</label>
				</td>
			</tr>
			<%} %>
		</table>
		
	</form>
	
</div>
</body>
</html>
