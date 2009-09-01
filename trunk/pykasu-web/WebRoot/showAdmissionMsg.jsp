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
	<div id="errors">
		<%=request.getAttribute("error") %>			
	</div>
  </logic:present>
  
  <logic:present name="success">
	<div id="messages">
		<%=request.getAttribute("success") %>			
	</div>
  </logic:present>
</div>
</body>
</html>
