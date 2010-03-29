<%@ page contentType="text/html" language="java"%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<html:html>
	<head>
		<link href="styles/pykasu.css" rel="stylesheet" type="text/css">	
		<script type="text/javascript">
			function sendtoprint(){
				document.getElementById('top').style.visibility='hidden';
				document.getElementById('top').style.height='0px';
				document.getElementById('top').style.width='0px';				
				window.print();
			}				
		</script>		
	</head>
	<body class="payment">
		<div id="top" heigth="5%">
			<img id="printimage" src="/pycasu/images/printer.jpg" onclick="sendtoprint()"/>
			<a onclick="sendtoprint()">Imprimir</a>
			<br><br><br>
		</div>
		
		<table class="payment">
			<tr class="payment">
				<td class="payment"><img src="images/logo_chico.gif" align="left"/> </td>
				<td colspan="2" class="payment" style="text-align: center;"><label style="font-weight: bold; font-size: x-large;">Boleta de Pago</label><br><label>Formulario 97 -1</label></td>
				<td class="payment">Nro.<bean:write name="payment" property="id" /></td>
			</tr>
			<tr>
				<td colspan="4">&nbsp;</td>
			</tr>
			<tr class="payment">
				<td class="paymentLabel">RUC:</td>
				<td class="payment"><bean:write name="payment" property="ruc" /></td>
				<td class="paymentLabel" style="text-align: right;">DV:</td>
				<td class="payment"><bean:write name="payment" property="dv" /></td>
			</tr>
			<tr class="payment">
				<td class="paymentLabel">Nombre o Razón Social:</td>
				<td class="payment" colspan="3"><bean:write name="payment" property="fname" /></td>
			</tr>
			<tr class="payment">
				<td class="paymentLabel">Código Obligación <br>(Nro. del Impuesto):</td>
				<td class="payment" colspan="3"><bean:write name="payment" property="obligation" /></td>
			</tr>
			<tr class="payment">
				<td class="paymentLabel">Obligación <br>(Descripción):</td>
				<td class="payment" colspan="3"><bean:write name="tax" property="description" /></td>
			</tr>
			<tr class="payment">
				<td class="paymentLabel">Periodo:</td>
				<td class="payment"><bean:write name="payment" property="fiscalPeriodMonth" />&nbsp;<bean:write name="payment" property="fiscalPeriodYear" /></td>
				<td class="paymentLabel">Numero de Resolución:</td>
				<td class="payment"><bean:write name="payment" property="resolution" /></td>
			</tr>
			<tr class="payment">
				<td class="paymentLabel">Total a pagar:</td>
				<td class="payment" colspan="3"><bean:write name="payment" property="paymentAmount" format="###,###,###"/></td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<tr class="payment">
				<td class="paymentLabel">Fecha de Emisión:</td>
				<td class="payment"><%=new java.text.SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date(System.currentTimeMillis()))%></td>
				<td class="paymentLabel">Firma y Sello del Cajero:</td>
				<td class="payment"></td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<tr>
				<td colspan="4" style="font-size: x-small;">a. Los pagos realizados se imputarán conforme a lo señalado en el art. 162 de la Ley 125/91</td>
			</tr>
			<tr>
				<td colspan="4">&nbsp;</td>
			</tr>			
			<tr>
				<td colspan="4" class="paymentLabel">Certificación: </td>
			</tr>
		</table>
	</body>
</html:html>