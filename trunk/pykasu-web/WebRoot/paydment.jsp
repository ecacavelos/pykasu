<%@ page contentType="text/html" language="java"%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<%@page import="py.com.roshka.pykasu.web.util.HBAccountV2"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<html:html>
	<head>
		<script LANGUAGE="JavaScript" charset="UTF-8" SRC="menus.js"></script>
		<script LANGUAGE="JavaScript" charset="UTF-8" SRC="js/sha1.js"></script>
		<script LANGUAGE="JavaScript" charset="UTF-8" SRC="js/pykFiscalComun.js"></script>
		<script LANGUAGE="JavaScript" charset="UTF-8" SRC="js/pykasu_util.js"></script>		
		<script LANGUAGE="JavaScript">

								
			function encryp2params(tmp_pass, obj){
				obj.value = hex_sha1(tmp_pass.value)
			}
			<%
				java.util.List taxes = (java.util.List) request.getAttribute("taxes");
				java.util.Iterator itTaxes = taxes.iterator();
				NumberFormat nf = NumberFormat.getInstance(new Locale("es", "py"));
			%>
			
			var jsTaxes = new Array(<%=taxes.size()%>);

			<%
			py.com.roshka.pykasu.persistence.fiscal.Taxes tax = null;
			while(itTaxes.hasNext()){
				tax = (py.com.roshka.pykasu.persistence.fiscal.Taxes) itTaxes.next();				
				if(tax.getInitPeriod() != null){%>
					var init = new Date();
					init.setMilliseconds(<%=tax.getInitPeriod().getTime()%>);
					
			<%	}
				if(tax.getFinalPeriod() != null){%>
					var final = new Date();
					final.setMilliseconds(<%=tax.getFinalPeriod().getTime()%>);
			<%	}%>
			
				var tax = new Array(<%=tax.getTaxId()%>,'<%=tax.getRequerePeriod()%>',init,final,'<%=tax.getType()%>');
				jsTaxes.push(tax);
			<%	
			}
			%>
			jsTaxes.sort();

			<%java.util.List<HBAccountV2> accountList = (java.util.List<HBAccountV2>)request.getAttribute("accounts");%>
			var jsAccounts = new Array(0);
			<%if(accountList != null){%>
				<%for(HBAccountV2 account : accountList){%>
					var account = new Array(<%=account.getNumber()%>,<%=account.getTotalAvailableAmount()%>,0);
					jsAccounts.push(account);
				<%}%>
			<%}%>

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
				return "PAYMENT";
			}

			function submitForm(){
				var form = document.getElementById('paymentform');
				if(!validateDate()){
					alert('Fecha de Declaración NO VALIDA');
					return;
				}
				if (document.getElementById('resolutionNr').value.length > 11){
					alert('El número de resolución debe ser menor o igual a 11 dígitos');
					return false;					
				}
				
				
				if(document.getElementById('dv').value == ""){
					alert("RUC Incorrecto.");
					return;
				}

				var tax = jsTaxes[document.getElementById('obligationTax').selectedIndex];
				if(tax[1]=='S'){  //requiere periodo, por tanto hay que controlar que sea mayor que el periodo establecido
					if(document.getElementById('year').value == "" || document.getElementById('month').value == ""){
						alert('Debe especificar el periodo correctamente');
						return;
					}				
				}

				if(tax[4]=='R'){  //requiere resolucion, por tanto hay que controlar que tenga al menos un valor
					if(document.getElementById('resolutionNr').value == ""){
						alert('Debe especificar el núrmero de Resolución');
						return;
					}				
				}

				if(<%=(accountList != null)%>){

					<%
					int accountOrder = 0;
					if(accountList != null){
						for(HBAccountV2 account : accountList){%>
							<%
								String amount = ""+accountOrder + "_" + account.getNumber(); 
								accountOrder++;
							%>
							document.getElementById("<%=amount%>").value = removeCommas(document.getElementById("<%=amount%>").value);
							if(parseInt(document.getElementById("<%=amount%>").value) == 0){
								document.getElementById("<%=amount%>").value = "";
							}
						<%}%>
					<%}%>

					calculateTotalAmount();
					document.getElementById("amount").value = document.getElementById("totalAmount").innerHTML;					
				}				
			    
			    document.getElementById("amount").value = removeCommas(document.getElementById("amount").value);
				

				form.submit(); //el control los montos se realizan en el momento de la carga.
		
			}
			
			function checkAmount(input){
				var amountData = input.id.split("_");
				
				var account = jsAccounts[amountData[0]];
				var	amount = removeCommas(input.value);
				if(input.value != null){
				   if(amount > account[1]){ //el valor que ingreso es mayor que los disponible en la cuenta
				      alert("El monto máximo disponible en la cuenta " + account[0] + " es de : " + account[1]);
				   	  input.value = "0";
				   	  jsAccounts[amountData[0]][2] = 0;				   
				   }else{
				   	  jsAccounts[amountData[0]][2] = amount; // monto de la cuenta. se utiliza para el sumador
				   }
				}				
				calculateTotalAmount();
			}
			
			function getValueInt(value){
				
				if(isNaN(parseInt(value))){
					return 0;
				}else{
					return parseInt(value);
				}
			}
			
			
			function calculateTotalAmount(){
				var totalAmount = 0;
				for(var i=0; i < jsAccounts.length; i++){	
					totalAmount =  parseInt(totalAmount) + parseInt(jsAccounts[i][2]);
				}
				document.getElementById('totalAmount').innerHTML = addCommas(totalAmount);
			}
			
			function validateDate(){
				return true;
			}
			
			function loadForm(){
				setupTaxObligation(document.getElementById('obligationTax'))
			}
			function enableInputs(){
				var rucInput = document.getElementById('ruc');				
				rucInput.disabled = 'false';
				document.getElementById('totalAmount').innerHTML = "0";
			}
			var valueOld;
		</script>
		<link href="styles/pykasu.css" rel="stylesheet" type="text/css">			
	</head>
	
	<body onload="loadForm()">
	<jsp:include page="header.jsp"/> 
	<jsp:include page="menu.jsp"/>
	  
	<div id="main">
	<jsp:include page="messages.jsp"/> 
	<h2>Formulario de Pagos</h2>
	<%
		if(accountList != null){			
			int i = 0;
			for(HBAccountV2 hbAccount : accountList){
				i++;
			
	%>
		<input type="hidden" id='<%="accountAmount"+(i++)%>' value='<%=nf.format(hbAccount.getAvailableAmount())%>' />
	<%
		} 
	}
	%>
	<html:form action="paydment" styleId="paymentform" method="post">	
	<table width="90%" align="center">
		<tr>
			<td width="15%"><label>RUC:</label></td>
			<td width="45%"><html:text property="ruc" style="width:100%;" styleId="ruc" onblur="updateRuc(this)"/></td>
			<td width="15%"><label>Dígito verificador:</label></td>
			<td width="25%"><html:text property="dv" style="width:100%;" styleId="dv" readonly="true"/></td>
		</tr>
		<tr>
			<td width="15%"><label>Nombre / Razón Social</label></td>
			<td colspan="3"><html:text property="firstLastName" styleId="firstLastName" readonly="true" style="width:100%;"/></td>
		</tr>
		<tr>
			<td width="15%"><label>Obligación:</label></td>
			<td width="45%">
					<html:select property="obligationTax" onchange="setupTaxObligation(this)" styleId="obligationTax" style="width:100%;">
						  <html:options collection="taxes"
			                  property="taxId" 
			                  labelProperty="completeDescription"/>
					</html:select>
			</td>
			<td width="15%"><label>Resolución:</label></td>	
			<td width="25%"><html:text property="resolutionNr" styleId="resolutionNr" style="width:100%;"/></td>
		</tr>
			<td width="15%"><label>Mes:</label></td>
			<td width="45%">
				<html:select property="month" styleId="month">
					<html:option value=""></html:option>
					<html:option value="1"> 01 - Enero</html:option>
					<html:option value="2"> 02 - Febrero</html:option>
					<html:option value="3"> 03 - Marzo</html:option>
					<html:option value="4"> 04 - Abril</html:option>
					<html:option value="5"> 05 - Mayo</html:option>
					<html:option value="6"> 06 - Junio</html:option>
					<html:option value="7"> 07 - Julio</html:option>
					<html:option value="8"> 08 - Agosto</html:option>
					<html:option value="9"> 09 - Setiembre</html:option>
					<html:option value="10"> 10 - Octubre</html:option>
					<html:option value="11"> 11 - Noviembre</html:option>
					<html:option value="12"> 12 - Diciembre</html:option>																																																							
				</html:select>
			</td>
			<td width="15%"><label>Año:</label></td>
			<td width="25%">&nbsp;<html:select property="year" style="width:100%;" styleId="year"><html:options collection="years"
		                  property="value" 
		                  labelProperty="label"/>
			</html:select>
			</td>		
		<tr>
			<td colspan="4"><hr></td>
		</tr>
			<%int index=0; %>
			<%if(accountList != null){%>
			<td colspan="4">
				<table style="payment" width="95%" align="center">				
					<tr>
						<th width="15%" style="background-color: #88C4FF;"> Número</th>
						<th width="25%" style="background-color: #88C4FF;">Tipo</th>
						<th width="20%" style="background-color: #88C4FF;">Disponible</th>
						<%--<th width="15%" style="background-color: #88C4FF;">A confirmar</th> --%>
						<th width="20%" style="background-color: #88C4FF;">Línea de Sobregiro</th>
						<th width="20%" style="background-color: #88C4FF;">A debitar</th>
					</tr>
					<%for(HBAccountV2 hba : accountList){%>
					<tr>
						<td align="center"><%=hba.getNumber()%></td>
						<td align="center"><%=hba.getAccountType()%></td>
						<td align="right"><%=nf.format(hba.getAvailableAmount())%></td>
						<%-- %><td align="right"><%=nf.format(hba.getToConfirmAmount())%></td> --%>
						<td align="right"><%=nf.format(hba.getOverAmount())%></td>
						<td><input type="text" name="paid_amount_<%=hba.getNumber()%>" id="<%=index%>_<%=hba.getNumber()%>" onkeyup="colocarpuntos(this)" onblur="checkAmount(this)" value="0"/></td>												
					</tr>
					<%index++; %>
					<%}%>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td alAign="right">Total:</td>
						<td align="right"><div id="totalAmount">0</div></td>
						<input type="text" style="visibility: hidden" name="amount" id="amount"/>
					</tr>
				</table>
			</td>
			<%}else{%>
				<td width="15%"><label>Monto:</label></td>
				<td width="25%"><html:text property="amount" style="width:100%;" styleId="amount" onkeyup="colocarpuntos(this)"/></td>					
			<%}%>

		<tr>
			<td colspan="4"><hr></td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<html:button value="Enviar" property="send" onclick="submitForm();" />&nbsp;
				<html:reset value="Cancelar" onclick="enableInputs();"/>
			</td>	
		</tr>
	</table>	
	</html:form>
	<label id="secondLastName"/>
	<label id="firstName"/>
	<label id="middleName"/>		

	</div>
	</body>
</html:html>	
