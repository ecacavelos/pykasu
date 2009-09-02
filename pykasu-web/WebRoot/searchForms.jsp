<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="py.com.roshka.pykasu.persistence.forms.TaxForm"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<jsp:directive.page import="py.com.roshka.pykasu.persistence.forms.ItemSearch"/>
<% java.util.List<ItemSearch> items = (java.util.List<ItemSearch>) request.getAttribute("items");  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="description" content="This is my page">

		<script LANGUAGE="JavaScript" SRC="menus.js"></script>
		<script LANGUAGE="JavaScript" SRC="js/sha1.js"></script>
		<script LANGUAGE="JavaScript" SRC="js/pykFiscalComun.js"></script>
		<script LANGUAGE="JavaScript" SRC="js/pykasu_util.js"></script>
		<script LANGUAGE="JavaScript" SRC="js/CalendarPopup.js"></script>
		<script LANGUAGE="JavaScript" SRC="js/option.js"></script>
		
		<script type="text/javascript">
			var opt = new OptionTransfer("list1","list2");
			opt.setAutoSort(true);
			opt.setDelimiter("::");
			opt.saveNewRightOptions("widgetSelections");
		</script>
		
		<script LANGUAGE="JavaScript">
			function submitForm(){
				var form = document.getElementById('paymentform');
				if(!validateDate()){
					alert('Fecha de Declaración NO VALIDA');
					return;
				}
				
				var amount = document.getElementById('amount');
				amount.value = removeCommas(amount.value);
				
				form.submit();
			}			
		</script>
		<link href="styles/pykasu.css" rel="stylesheet" type="text/css">			
	</head>
	
	<body <%if(items == null){%>onload="opt.init(document.forms[0])"<%}%>>
	<br><jsp:include page="header.jsp"/> 
	<jsp:include page="menu.jsp"/> 
	<div id="main">
		<%if(items == null){%>
		<h1>Búsqueda de Formularios</h1>
		<hr/>
		<form action="searchForms.do" name="showForms" id="showForms">
			<input type="hidden" name="search" value="true" />
			<input type="hidden" name="widgetSelections" value="" />
			
			<h3>Seleccione los formularios:</h3>
			<table border="0" style="margin-top: 0; padding-top: 0" >
				<tr>
					<td >
						<div>
							Formularios disponibles<br/>
							<select multiple size="5" name="list1" onDblClick="opt.transferRight()">
								<option value="90">Formulario 90</option>
								<option value="101">Formulario 101</option>
								<option value="105">Formulario 105</option>
								<option value="106">Formulario 106</option>
								<option value="108">Formulario 108</option>
								<option value="109">Formulario 109</option>
								<option value="110">Formulario 110</option>
								<option value="117">Formulario 117</option>
								<option value="118">Formulario 118</option>
								<option value="120">Formulario 120</option>
								<option value="122">Formulario 122</option>
								<option value="123">Formulario 123</option>
								<option value="130">Formulario 130</option>
								<option value="800">Formulario 800</option>
								<option value="801">Formulario 801</option>
								<option value="804">Formulario 804</option>
								<option value="848">Formulario 848</option>
								<option value="850">Formulario 850</option>																
							</select>
						</div>
					</td>
					<td valign=middle align="center" >
						<input type="button" value="&gt;" onclick="opt.transferRight()" />
						<input type="button" value="&gt;&gt;" onclick="opt.transferAllRight()">
						<input type="button" value="&lt;&lt;" onclick="opt.transferAllLeft()">
						<input type="button" value="&lt;" onclick="opt.transferLeft()">
					</td>
					<td >
						<div>
		  					Formularios seleccionados<br/>
							<select multiple size="5" name="list2" onDblClick="opt.transferLeft()">
							</select>
						</div>
					</td>
				</tr>
			</table>
			<h3>Correspondiente al Periodo:</h3>
			<select name="mes">
				<option value="">--</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<select name="anho">
				<option value="">--</option>
			<%  java.util.Calendar c = java.util.Calendar.getInstance();
			 	int year = c.get(java.util.Calendar.YEAR);			 	
				for(int i=0; i<25; i++){ %>
				<option value="<%=year-i%>"><%=year-i%></option>	
			<%}%>
			</select>
			
			<h3>Presentado entre:</h3>
			<%
			  pageContext.setAttribute("dateFormName","showForms");
			  pageContext.setAttribute("dateVarName","presentationDateInit");
			%>			
			Desde:<%@include file="../datemgr.jsp"%>
			<%pageContext.setAttribute("dateVarName","presentationDateEnd");%>
			Hasta:<%@include file="../datemgr.jsp" %>
			<h3>Presentado para:</h3>
			RUC:<input type="text" name="ruc"/>&nbsp;o Nombre Contribuyente:<input type="text" name="contribuyente"/>
			<h3>&nbsp;</h3>
			<div id="help"></div>
			<h3>&nbsp;</h3>
			<input type="submit" value="Recuperar"/>			
		</form>
		<%}%>
		<hr/>
		<%		

		if(items != null){
			if(items.size() == 0){%>
				No existen datos que cumplan estos criterios.
			<%}else{%>
			<h1>Resultado de la Búsqueda</h1>
			<table border="1">
				<tr>
					<th>Formulario</th>
					<th>RUC</th>
					<th>DV</th>
					<th>Nombre</th>
					<th>Mes</th>
					<th>Año</th>					
					<th>Presentado</th>
					<th>Estado</th>
					<th>Historia</th>
				</tr>		
			<% 			
				for(ItemSearch item : items){%>
					<tr>
						<td> <%=item.getValue(ItemSearch.FieldName.FORM_TYPE)%></td>
						<td> <%=item.getValue(ItemSearch.FieldName.RUC)%></td>
						<td> <%=item.getValue(ItemSearch.FieldName.DV)%></td>
						<td> <%=item.getValue(ItemSearch.FieldName.FIRST_LAST_NAME)%></td>
						<td> <%=item.getValue(ItemSearch.FieldName.FISCAL_PERIOD_MOUNTH)%></td>
						<td> <%=item.getValue(ItemSearch.FieldName.FISCAL_PERIOD_YEAR)%></td>					
						<td> <%=item.getValue(ItemSearch.FieldName.PRESENTATION_DATE)%></td>
						<td> <%=item.getValue(ItemSearch.FieldName.STATUS)%></td>
						<td>
							<%if(item.getDetails() != null){%>
							<table>								
								<%for(Object[] details : item.getDetails()){ %>
								<tr><td><%=details[ItemSearch.FieldNameDetail.STATUS.ordinal()]%></td><td><%=details[ItemSearch.FieldNameDetail.AT.ordinal()]%></td></tr>
								<%}%>
							</table>
							<%}%>
						</td>
						<td>
							<form method="post" action="editItem.do">
								<input type="hidden" name="id" value="<%=item.getValue(ItemSearch.FieldName.FORM_IID)%>">
								<input type="hidden" name="form" value="<%=item.getValue(ItemSearch.FieldName.FORM_TYPE)%>">
																
								<input type="submit" value="Detalles" name="option"/>
								<%if(((String)item.getValue(ItemSearch.FieldName.STATUS)).equalsIgnoreCase(TaxForm.FORM_STATUS_PROCESS)){ %>
								<input type="submit" value="Editar" name="option"/>
								<%}%>
								<%if(((String)item.getValue(ItemSearch.FieldName.STATUS)).equalsIgnoreCase(TaxForm.FORM_STATUS_PROCESS)){ %>
								<input type="submit" value="Borrar" name="option"/>
								<%}%>
							</form>							
						</td>						
					</tr>
			<% 	}
			}
			%>
			</table>
			<br/>
			<hr/>
			<br/>
			<a href="searchForms.do"/>Realice una nueva búsqueda</a>
			<%}%>
	</div>
	</body>
</html:html>	