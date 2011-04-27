<%@ page contentType="text/html" language="java" %>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>


<html>
<head>
<title>Registro al Sistema</title>
<script LANGUAGE="JavaScript" SRC="js/sha1.js"></script>
<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="header.jsp"/> 
<div id="main">
 <logic:present name="error">
	<div style="font-size: 14px; font-weight: bold; padding: 12px;" >
		<%=request.getAttribute("error") %>			
	</div>
  </logic:present>
  
  <logic:present name="success">
	<div style="font-size: 14px; font-weight: bold; padding: 12px;" >
		<%=request.getAttribute("success") %>			
	</div>
	<div style="font-size: 14px;">
		Gente de Visi�n Banco se pondr� en contacto con usted para darle curso a su Solicitud. <br/>
		En este punto, deber� aceptar las condiciones establecidas en el Contrato de Prestaci�n de Servicios.<br/>
		Finalmente, usted recibir� un nombre de usuario y contrase�a con el cual podr� ingresar al Sistema de Tributos Web
	</div>
  </logic:present>
</div>
</body>
</html>
