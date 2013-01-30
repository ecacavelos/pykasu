<%@ page contentType="text/html" language="java"%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<title>Pykasu</title>
	<script LANGUAGE="JavaScript" SRC="menus.js"></script>
	<script LANGUAGE="JavaScript" SRC="js/CalendarPopup.js"></script>	

	<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
	<link href="styles/form.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="../header.jsp"/> 
<jsp:include page="../menu.jsp"/> 
<div id="main"> 

	<h1><%=(String)request.getAttribute(py.com.roshka.pykasu.web.Globals.GLOBAL_TITLE)%></h1>
	<hr/>
	<form method="post" name="showForms" id="showForms" action="findForms.do">
		<%pageContext.setAttribute("dateFormName","showForms");
		pageContext.setAttribute("dateVarName","init");%>
		Desde:<%@include file="../datemgr.jsp"%>
		<%pageContext.setAttribute("dateVarName","end");%>
		Hasta:<%@include file="../datemgr.jsp" %>
		<br>
		<input type="hidden" name="FORM" value="<%=request.getAttribute(py.com.roshka.pykasu.web.Globals.FORM_NAME)%>">
		<input type="submit" name="form_action" value="Recuperar"/>
		(Si no establece ninguna fecha, recuerará los formularios del último año)
	</form>
	
	

<%
	java.util.List<py.com.roshka.pykasu.ui.util.ResultItem> results  = null;
	
	try{
	    results = ((java.util.List<py.com.roshka.pykasu.ui.util.ResultItem>)request.getAttribute(py.com.roshka.pykasu.web.Globals.FORMS_RESULTSET));
//	    results = ((java.util.List)request.getAttribute(py.com.roshka.pykasu.web.Globals.FORMS_RESULTSET)).iterator();	    
	}catch(Throwable e){
	 //   results = new java.util.ArrayList().iterator();
	}
	
	if(results==null || results.size()==0){
	%>
		<p class="user.message.info">
			No hay formularios guardados con este rango de fechas
		</p>
		<hr/>
	<%
	}else{
		int cssClassName = 0;
		boolean filaPar = true;
%>
	<p class="user.message.info">
		Cantidad de formularios recuperados:<%=results.size()%>
	</p>
	<hr/>
	<table width="80%" align="left" style="padding-left: 10px;">
<%		
		for(py.com.roshka.pykasu.ui.util.ResultItem item : results){
			filaPar = cssClassName % 2 == 0; 
			cssClassName++;
			if (item != null){
%>
			<form method="post" action="editItem.do">
				<tr>
					<td width="70%" style="padding: 7px;" <%out.print(filaPar?" class=\"odd\"":"");%>><%=item.getDescription()%>
						<input type="hidden" name="id" value="<%=item.getId().toString()%>">
						<input type="hidden" name="form" value="<%=request.getAttribute(py.com.roshka.pykasu.web.Globals.FORM_NAME)%>">
					</td>
					<td width="10%" align="center" <%out.print(filaPar?" class=\"odd\"":"");%>>
						<%if (item.isShowDetails()){%>
							<input type="submit" value="Detalles" name="option"> 
						<%}else{%>
							 Detalles
						<%}%>
					</td>
					<td width="10%" align="center" <%out.print(filaPar?" class=\"odd\"":"");%>>
						<%if (item.isEditable()){%>
							<input type="submit" value="Editar" name="option"> 
						<%}else{ %>
							 Editar
						<%}%>
					</td>
					<td width="10%" align="center" <%out.print(filaPar?" class=\"odd\"":"");%>>
						<%if (item.isDeleteable()){%>
							<input type="submit" value="Borrar" name="option"> 
						<%}else{%>
							 Borrar
						<%}%>
					</td>
				</tr>
			</form>
<%
			}
		}
	}
%>
</div>
</body>
</html>
