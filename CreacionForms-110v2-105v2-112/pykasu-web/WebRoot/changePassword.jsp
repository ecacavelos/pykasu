
<%@ page contentType="text/html" language="java"
%>
<jsp:directive.page import="py.com.roshka.pykasu.web.Globals"/>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<title>Sistema - Cambio de Password</title>		
		<script LANGUAGE="JavaScript" src="js/sha1.js"></script>				
		<link href="styles/pykasu.css" rel="stylesheet" type="text/css">

		<script type="text/javascript">
/*		
			function encryp(){
//				alert('encryp');
			
				var a   = document.getElementById('actual');
//				alert(a.value);				
				a.value = hex_sha1(a.value);
//				alert(a.value);
				
				var np  = document.getElementById('newpassw');
//				alert(np.value);
				np.value = hex_sha1(np.value);
//				alert(np.value);
				
	
				var npc = document.getElementById('newpasswconf');				
//				alert(npc.value);
				npc.value = hex_sha1(npc.value);
//				alert(npc.value);

//				alert('end to encryp');					
				return true;
					
			}		
*/			
			function whichButton(event)
			{
				if(document.getElementById('login_button') != null && event.keyCode==13){
					encryp();
				}
			}
		</script>
	</head>
	
	<body>
		<br><jsp:include page="header.jsp"/>
		 
		 <%
		 	boolean fisttime = request.getAttribute("firsttime") != null && ((String)request.getAttribute("firsttime")).equalsIgnoreCase("true"); 
		 %>
		 
		<logic:notPresent name="firstTime">
			<jsp:include page="menu.jsp"/>
		</logic:notPresent>
		
		<div id="main">
			
			<jsp:include page="messages.jsp"/>
			
			<h3>Formulario de Cambio de Contraseña</h3>

			<logic:present name="firstTime">
				Es la primera vez que ingresa al Sistema de Tributos Web con una contraseña provista por un administrador.<br/>
				Como una medida de seguridad, es necesario que cambie esta contraseña.
			</logic:present>
			
			<form action="changePassword.do" method="post">
				<input type="hidden" name="change" value="true"/>
				<logic:present name="firstTime">
					<input type="hidden" name="firstTime" value="true"/>
				</logic:present>
				
				<br/>	
				<table>				
					<tr>
						<td>Contraseña actual:</td>
						<td><input type="password" name="actual" id="actual" /></td>
					</tr>
					<tr>
						<td>Nueva contraseña:</td>
						<td><input type="password" name="newpassw" id="newpassw" /></td>
					</tr>				
					<tr>
						<td>Confirmación de contraseña:</td>
						<td><input type="password" name="newpasswconf" id="newpasswconf" /></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>						
					</tr>																																
					<tr>
						<td align="center"><input type="submit" value="Cambiar"/></td>
						<td align="center"><input type="reset" value="Limpiar"/></td>
					</tr>																							
				</table>
			</form>
		</div> 

	</body>
</html>
