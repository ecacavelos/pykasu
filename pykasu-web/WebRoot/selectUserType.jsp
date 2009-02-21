<%@ page contentType="text/html" language="java" %>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>


<html>
<head>
<title>Sistema</title>
<script LANGUAGE="JavaScript" SRC="js/sha1.js"></script>
<script LANGUAGE="JavaScript">
	function encryp2params(tmp_pass, obj){
		obj.value = hex_sha1(tmp_pass.value)
	}
</script>
<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="header.jsp"/> 
<jsp:include page="menu.jsp"/> 
<div id="main">
<div id="register">
<html:form action="/showuserform.do">

  <logic:present name="PYKASU.ERROR">
		<div id="errors">
			<p><bean:write name="PYKASU.ERROR" filter="false"/></p>
		</div>
  </logic:present>

  <table cellspacing="1" cellpadding="2" class="form">
	<tr>
		<td>
			<h2>Registro en el Sistema </h2>
		</td>
	</tr>
	<tr>
		<td class="seccion" align="left" >
			<font size="2">
				Seleccione el tipo de persona a registrar:			
			</font>
		</td>
	</tr>
	<tr height="8"/>
	<tr>
		<td align="left">
			<html:radio property="userType" value="fisico"/>Persona Física
		</td>
	</tr>
	<tr>
		<td align="left">
			<html:radio property="userType" value="juridico"/>Persona Jurídica
		</td>
	</tr>
	<tr height="15"/>
	<tr>
		<td align="center" class="btns">
			<html:submit value="Registrar"/>
		</td>
	</tr>
  </table>
</html:form>
</div>
</div>
</body>
</html>
