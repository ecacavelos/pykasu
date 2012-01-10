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
					alert('Fecha de Declaración NO VALIDA');
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
		<label>
			El PAGO se ha realizado EXITOSAMENTE
			<%if(request.getAttribute("paymentAmount")!=null){%>
				<%= " por el monto de: " + request.getAttribute("paymentAmount")%>
			<%}%>
		</label>
<%-- 		
		<p>
			<%if(((Boolean)request.getAttribute("showAccount")).booleanValue()){ %>			
				<%py.com.roshka.pykasu.web.util.HBAccount hbAccount = (py.com.roshka.pykasu.web.util.HBAccount) request.getAttribute("account");%>
				<%=hbAccount.getGeneralDescription()%>
			<%}else{%>
				&nbsp;
			<%}%>
		</p>
--%>		
	</div>
	</body>
</html:html>	
