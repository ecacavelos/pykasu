<%@ page contentType="text/html" language="java"%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<html:html>
	<head>
		<script LANGUAGE="JavaScript" SRC="menus.js"></script>
		<script LANGUAGE="JavaScript" SRC="js/sha1.js"></script>
		<script LANGUAGE="JavaScript" SRC="js/pykFiscalComun.js"></script>
		<script LANGUAGE="JavaScript" SRC="js/pykasu_util.js"></script>		
		<script LANGUAGE="JavaScript">

								
			function encryp2params(tmp_pass, obj){
				obj.value = hex_sha1(tmp_pass.value)
			}

			function setupTaxObligation(sto){
				//sto -> select tax obligation		
				var tax = jsTaxes[sto.selectedIndex];
				showResolution(tax[4]);
				showFiscalPeriod(tax[1]);
			}
			
			function showFiscalPeriod(rfp){
				//rfp--> required Fiscal Period
				var month = document.getElementById('month');
				var year  = document.getElementById('year');				
				if(rfp == 'S'){
					month.disabled ='';
					year.disabled ='';				
				}else{
					month.value = '';
					year.value = '';
					month.disabled ='true';
					year.disabled ='true';				
				}
			}			
			
			function showResolution(rr){
				//rr --> required Resolution
				var rnr = document.getElementById('resolutionNr');
				if(rr == 'R'){
					rnr.disabled ='';				
				}else{
					rnr.value = '';
					rnr.disabled ='true';
				}
			}
			function getFormType(){
				return "850";
			}
			
			function submitForm(){
				var form = document.getElementById('paymentform');
				if(!validateDate()){
					alert('Fecha de Declaraci�n NO VALIDA');
					return;
				}
				
				var amount = document.getElementById('amount');
				amount.value = removeCommas(amount.value);
				
				form.submit();
			}
			
			function validateDate(){
				
				return true;
			}
			
			
			var valueOld;
		</script>
		<link href="styles/pykasu.css" rel="stylesheet" type="text/css">			
	</head>
	
	<body>
	<jsp:include page="header.jsp"/> 
	<jsp:include page="menu.jsp"/> 
	<div id="main">
		<h1>Formularios de Pago</h1> 
		<table width="100%">
			<tr>
				<th width="5%">Identificador</th>
				<th>RUC</th>
				<th>Nombre</th>
				<th>Obligaci�n</th>
				<th>Resoluci�n</th>
				<th>Mes</th>
				<th>A�o</th>
				<th>Cuenta</th>
				<th>Monto</th>
				<th>&nbsp;</th>
			</tr>
			<%
				boolean filaPar = false;
				int i=0;
			%>
			<logic:iterate id="payment" name="payments">
			<%	
				i++; 
				filaPar = (i % 2 == 0);
			%>
			<tr>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="center"><bean:write name="payment" property="id" /></td>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="center"><bean:write name="payment" property="ruc" /></td>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="center"><bean:write name="payment" property="fname" /></td>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="center"><bean:write name="payment" property="obligation" /></td>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="center"><bean:write name="payment" property="resolution" /></td>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="center"><bean:write name="payment" property="fiscalPeriodMonth" /></td>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="center"><bean:write name="payment" property="fiscalPeriodYear" /></td>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="center"><bean:write name="payment" property="savingAccountNumber" /></td>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="right"><bean:write name="payment" property="paymentAmount" format="###,###,###,###" /></td>
				<td <%out.print(filaPar?" class=\"odd\"":"");%> align="center"><a style="color: blue;" onclick="pykOpenWindow('/pycasu/printpaymentform.do?id=<bean:write name="payment" property="id"/>','_blank', 640, 600)" >Imprimir</a> </td>
			</tr>
			</logic:iterate>
		</table>
	</div>
	</body>
</html:html>	
