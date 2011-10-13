function onloadForm(){
	loadScript('js/pykFiscalComun.js');
	v_onload = 1; 
	orirecti();
	v_onload = 0;
	var dateField = document.getElementById('paymentDate');
	
	if(document.getElementById('formStatus').value == 'insert_mode'){
		document.getElementById('paymentDate').value = document.getElementById('suggestedPaymentDate').value;
	}
}

function calculateBeforePlugin(){

}
function calculateAfterPlugin(){
	orirecti();
	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	pm_paymentDate = document.getElementById('paymentDate').value;
	pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
	pm_fiscalPeriodYear = removeCommas(document.getElementById('fiscalPeriodYear').value);
//	pm_called = 1;
//	pm_called2 = 1;
//	calcPorcentajeMoras();
	pm_called = 1;
	pm_called2 = 1;		
	if( PORC_MORA == 0 || 
		PORC_INTERES == 0 || 
		CONTRAVENSION_CMOV == 0 ||
		CONTRAVENSION_SMOV == 0)
	{
		pm_called = 0;	
	}
	
	calcPorcentajeMoras();
	
	
	calculateC35();
	calculateC36();
	
	
	//calcPorcentajeMoras801();
	
	//if (document.getElementById('prePrintedNumber').value == ''){
	//	alert('El numero de orden debe ser llenado');
	//}
	
}
//cambiar para el 801
var v_onload = 1;
var  pm_called = 0;
var  pm_called2 = 0;
var pm_paymentDate = null;
var pm_advancedpaymentDate = null;
var pm_ruc = null;
var pm_fiscalPeriodMounth = null;
var pm_fiscalPeriodYear = null;
var pm_advancedPayment = null;
var pm_monthClose = null;

function calcPorcentajeMoras(){
	if (pm_called == 0){
		getFiscalMoraInfo();
		return;
	}
	//alert("calcPorcentajeMoras() CONTRAVENSION_CMOV:" + CONTRAVENSION_CMOV + "  PORC_MORA:" + PORC_MORA + "  PORC_INTERES: "+ PORC_INTERES);
	var norectificativa = 1;
	if (document.getElementById('declarationType').value=='| 2 | RECTIFICATIVA'){
		norectificativa = 0;
	}
	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('R5_IG_C2').value =  CONTRAVENSION_CMOV*norectificativa;
		if(document.getElementById('R5_IG_C2').value != null)
  		   colocarpuntos(document.getElementById('R5_IG_C2'));
	}
	refreshVars();
	TRGS5L8_1();
	TRGS5L8_2();
	TRGc45();
	TRGc45_0();
	TRGS5L10_1();
	TRGS5L10_2();
	TRGc46();
	TRGc46_0()
	TRGc46_1();
	
	var tmp38 = getValueFormatless('R5_IA_C2');
	var tmp39 = getValueFormatless('R5_IB_C1');
	var tmp40 =	getValueFormatless('R5_IC_C1');
	var tmp41 = getValueFormatless('R5_ID_C1');
	var tmp42 = getValueFormatless('R5_IE_C1');
	var tmp43 = getValueFormatless('R5_IF_C1');
	var tmp46 = getValueFormatless('R5_IK_C1');

	
	var op = (tmp38) - (tmp39 +tmp40+tmp41+tmp42+tmp43+tmp46)
	if(op < 0){
		op = 0
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('R5_IM_C2').value =  (PORC_MORA * op).toFixed(0);//*norectificativa;
		if(document.getElementById('R5_IM_C2').value != null)
  		   colocarpuntos(document.getElementById('R5_IM_C2'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('R5_IN_C2').value =  (PORC_INTERES * op).toFixed(0);//*norectificativa;
		if(document.getElementById('R5_IN_C2').value != null)
  		   colocarpuntos(document.getElementById('R5_IN_C2'));
	}

	//alert("calcPorcentajeMoras() c113:" + document.getElementById('c113').value + "  c116:" + document.getElementById('c116').value + "  c117: "+ document.getElementById('c117').value);	
	refreshVars();
	TRGS5L12();
	TRGc49();
	TRGc49_0();
	/*TRG_C111_1();
	TRG_C111_2();
	TRG_C115_1();
	TRG_C115_2();
	TRG_C116();
	TRG_C117();
	TRG_C118();*/
	//alert("calcPorcentajeMoras() c113:" + document.getElementById('c113').value + "  c116:" + document.getElementById('c116').value + "  c117: "+ document.getElementById('c117').value);	
	var tmp = (0).toFixed(0);
}



function orirecti(){
	
	try{
		var decType = document.getElementById('declarationType');
		var rectPPN = document.getElementById('rectificativePPN');
		//rectPPN.value = '';
		rectPPN.disabled = 'true';
		
		if (decType.value == "| 2 | RECTIFICATIVA"){			
			rectPPN.disabled = '';
		}
		else{			
			rectPPN.value='';
			rectPPN.disabled = 'true';
		}
	
		pm_called = 1;//para que no llame al servidor..
		
		calcPorcentajeMoras();	
	}catch(e){
		//alert('error al calcular Origen');
	}			
}

function verifyDeclaredPeriod(){

	var referenceDate= new Date();
	referenceDate.setFullYear(1994,11,31);
	
	var declaredPeriod = new Date();
	
	var tmpPeriodMonth = getValueFormatless("fiscalPeriodMounth");
	var tmpPeriodYear = getValueFormatless("fiscalPeriodYear");	
	declaredPeriod.setFullYear(tmpPeriodYear,tmpPeriodMonth-1,1);
	
	if(declaredPeriod >= referenceDate){
		return true;
	}else{
	return false;
	}
}



function calculateC35(){
	refreshVars();
	if (verifyDeclaredPeriod()){
		document.getElementById('R4_IG_C1').value=''
	}else{
			
		var tmpC25= getValueFormatless('R2_ID_C2');
		var op= tmpC25/2;
		
		document.getElementById('R4_IG_C1').value=Math.round(op);
		colocarpuntos(document.getElementById('R4_IG_C1'));
	}

}

function calculateC36(){
	refreshVars();
	if (verifyDeclaredPeriod()){
		document.getElementById('R4_IH_C1').value='';
	}else{
			var tmpC14= getValueFormatless('R1_IE_C2');
		
		if (tmpC14 > 0){
		
			var tmpC23= getValueFormatless('R2_IB_C2');
			var tmpC12= getValueFormatless('R1_IC_C2');
			var op= Math.round((tmpC23/2)*(tmpC12/tmpC14));
		
			document.getElementById('R4_IH_C1').value=op;
			colocarpuntos(document.getElementById('R4_IH_C1'));
		}else{
			document.getElementById('R4_IH_C1').value='';
		}
	}

}


function getFormType(){
	return '801';
}
//fecha de pago mayor o igual que actual




/*###################################################################
		YA EXISTEN EN PYKFISCALCOMUN.-
  ###################################################################
  
function GetXmlHttpObject(handler){ 
	var objXMLHttp=null
	
	if (window.XMLHttpRequest){
		objXMLHttp=new XMLHttpRequest()
	}
	else if (window.ActiveXObject){
		objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP")
	}
	return objXMLHttp
}
function inicializar(){
	pm_called = 0;
	pm_called2 = 0;
	R7_II_C2_VMORA = 0;	
	R7_IJ_C2_VINTERES = 0;
	R7_IE_C2_WM = 0;
	R7_IE_C2_WOM = 0;
	pm_VMORA = 0;	
	pm_VINTERES = 0;
	pm_WM = 0;
	pm_WOM = 0;
}

function getPorcentajeMoras(component){
	if (component.value == valueOld){
		valueOld = null;
		return;
	}
	if (component.id == 'ruc'){
		pm_ruc = component.value.toUpperCase;
	}else if(component.id == 'paymentDate'){
		pm_paymentDate = component.value;
	}else if (component.id == 'fiscalPeriodMounth'){
		pm_fiscalPeriodMounth = component.value;
	}else if (component.id == 'fiscalPeriodYear'){
		if (parseFloat(removeCommas(component.value))>2005){
			alert('el a?o de declaracion no es valido. debe ser menor o igual a 2005');
		}
		else{
			pm_fiscalPeriodYear = component.value;
		}
		pm_fiscalPeriodYear = component.value;
	}
	getFiscalMoraInfo();
}


function changeMoraInfo(){


	if (request2.readyState == 4 || request2.readyState == 'complete'){

		var xmlDoc = request2.responseXML;
	
		var values = xmlDoc.getElementsByTagName("fiscal-info");
		R7_II_C2_VMORA = 0;
		R7_IJ_C2_VINTERES = 0;
		R7_IE_C2_WM = 0;
		R7_IE_C2_WOM = 0;
				
		for (i=0; i<values[0].childNodes.length; i++){
			if (values[0].childNodes[i].nodeName == 'info'){
				
				var key = values[0].childNodes[i].getAttributeNode('key').value;
				var value = values[0].childNodes[i].getAttributeNode('value').value;
				if (key == 'R7_II_C2_VMORA'){
					R7_II_C2_VMORA = parseFloat(value);
					
				}
				
				if (key == 'R7_IJ_C2_VINTERES'){
					R7_IJ_C2_VINTERES = parseFloat(value);
					
				}
				if (key == 'R7_IE_C2_WM' ){ //con movimientos
					
					R7_IE_C2_WM = parseFloat(value).toFixed(0);
					
				}
				if (key == 'R7_IE_C2_WOM' ){ //sin movimientos
						
					R7_IE_C2_WOM = parseFloat(value).toFixed(0);
					
				}
			}//if comentario
			if (values[0].childNodes[i].nodeName == 'message'){
				
				var key = values[0].childNodes[i].getAttributeNode('key').value;
				var value = values[0].childNodes[i].getAttributeNode('value').value;

				if (key == 'PAYMENT_DATE_NOT_VALID'){
					alert('fecha no valida');
					document.getElementById('paymentDate').focus();
				}
				if (key == 'DECLARATION_DATE_NOT_VALID'){
					alert('Fecha de declaracion no valida');
				}
				if (key == 'ERROR'){
					alert(value);
				}

			}//if comentario
		}//for i
		pm_called = 1;
		calcPorcentajeMoras()
	}//if complete
	
}

function getFiscalMoraInfo(){
	request2= GetXmlHttpObject();


	if (request == null){
		alert('El sitio no soporta AJAX');
		return;
	}
	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	pm_paymentDate = document.getElementById('paymentDate').value;
	
	
	
	if (pm_paymentDate == null || pm_ruc == null || pm_fiscalPeriodMounth == null || pm_fiscalPeriodYear == null || pm_fiscalPeriodYear == 0 || pm_fiscalPeriodMounth == 0){
		return ;
	}
	
	var url = 'getMoraInfo.do'
	url = url + '?id='+Math.random();
	url = url + '&fiscalInfoType=expiring'
	url = url + '&form=801';
	url = url + '&ruc='+pm_ruc;
	url = url + '&paymentDate='+pm_paymentDate;
	url = url + '&fiscalPeriodMounth='+pm_fiscalPeriodMounth;
	url = url + '&fiscalPeriodYear='+pm_fiscalPeriodYear;

	
	request2.onreadystatechange=changeMoraInfo;
	request2.open('POST',url,true);
	request2.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request2.send(null);
	for (i=0;i<20000;i++);
	
}
function removeZeros(el){
	var newValue = '';
	var oldValue = el.value;
	var continuar = true;
	var i=0
	while (i<oldValue.length && continuar == true){
		if (oldValue.charAt(i)!='0'){
			continuar = false;
		}else{
			i++;
		}
	}
	for (j=i;j<oldValue.length; j++){
		newValue = newValue + oldValue.charAt(j);
	}
	el.value=newValue;
		
}

function updateRuc (el){
	if (el.value == valueOld){
		valueOld = null;
		return;
	}

	if (el.value == ''){
		alert('el campo Ruc esta vacio');
	}
	request= GetXmlHttpObject();
	if (request == null){
		alert('El sitio no soporta AJAX');
		return;
	}
	var url = 'getInformationsByRuc.do'
	url = url + '?id='+Math.random();
	url = url + '&ruc='+document.getElementById('ruc').value.toUpperCase();
	
	request.onreadystatechange=confirmComentSender;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);
	
}


function confirmComentSender(){

	if (request.readyState == 4 || request.readyState == 'complete'){

		var xmlDoc = request.responseXML;
	
		var values = xmlDoc.getElementsByTagName("contributor-info");

		var table = null;
		var row = null;
		var field = null;
		var additionalInfo = false;
		
		document.getElementById('firstLastName').value = '';
		document.getElementById('secondLastName').value = '';
		document.getElementById('firstName').value = '';
		document.getElementById('middleName').value = '';

				
		for (i=0; i<values[0].childNodes.length; i++){
			
			if (values[0].childNodes[i].nodeName == 'field'){
				for (j = 0; j<values[0].childNodes[i].childNodes.length;j++){
					if (values[0].childNodes[i].childNodes[j].nodeName == 'field-id'){
						field = values[0].childNodes[i].childNodes[j].firstChild.nodeValue;
					}
				
					if (values[0].childNodes[i].childNodes[j].nodeName == 'field-value'){
						try{
							if (field == 'additionalInfo'){
								if (values[0].childNodes[i].childNodes[j].firstChild.nodeValue == 'false'){
									additionalInfo = false;
				
								}else if (values[0].childNodes[i].childNodes[j].firstChild.nodeValue == 'true'){
									additionalInfo = true;
								}
								
							}else{
								if (field != 'status'){
									document.getElementById(field).value = values[0].childNodes[i].childNodes[j].firstChild.nodeValue;
									document.getElementById(field).readOnly = 'true';
								}
							}
						}catch(e){}
					}
				}//for j
				
			}//if comentario
			
			if (values[0].childNodes[i].nodeName == 'message'){
				
				var key = values[0].childNodes[i].getAttributeNode('key').value;
				var value = values[0].childNodes[i].getAttributeNode('value').value;

				if (key == 'RUCINFO_NOT_FOUND' && value == 'true'){
					document.getElementById('firstLastName').readOnly = '';
					document.getElementById('secondLastName').readOnly = '';
					document.getElementById('firstName').readOnly = '';
					document.getElementById('middleName').readOnly = '';
					alert('No se encontro informacion de RUC');
				}
				
			}//if comentario
			
		}//for i
		if (additionalInfo == false){
			if (confirm('No tiene informacion sobre'+document.getElementById('ruc').value+'. Llenar ahora mismo?')){
					window.open('showForm.do?FORM=ClientData','Imprimir','status=1,location=0,toolbar=0, resizable=1, scrollbars=2, width=700, height=500');

			}
		}
		inicializar();
		getFiscalMoraInfo();
		getFiscalMoraInfo801();
		
	}//if complete
}
###################################################################
	FUNCIONES QUE YA NO SE USAN.-
###################################################################

//para el 801
function changeMoraInfo801(){


	if (request.readyState == 4 || request.readyState == 'complete'){
		error = false;
		var xmlDoc = request.responseXML;
	
		var values = xmlDoc.getElementsByTagName("fiscal-info");
		pm_VMORA = 0;
		pm_VINTERES = 0;
		pm_WM = 0;
		pm_WOM = 0;
				
		for (i=0; i<values[0].childNodes.length; i++){
			if (values[0].childNodes[i].nodeName == 'info'){
				
				var key = values[0].childNodes[i].getAttributeNode('key').value;
				var value = values[0].childNodes[i].getAttributeNode('value').value;
				if (key == 'R7_II_C2_VMORA'){
					pm_VMORA = parseFloat(value);
					
				}
				
				if (key == 'R7_IJ_C2_VINTERES'){
					pm_VINTERES = parseFloat(value);
					
				}
				if (key == 'R7_IE_C2_WM' ){ //con movimientos
					
					pm_WM = parseFloat(value).toFixed(0);
					
				}
				if (key == 'R7_IE_C2_WOM' ){ //sin movimientos
						
					pm_WOM = parseFloat(value).toFixed(0);
					
				}
			}//if comentario
			if (values[0].childNodes[i].nodeName == 'message'){
				
				var key = values[0].childNodes[i].getAttributeNode('key').value;
				var value = values[0].childNodes[i].getAttributeNode('value').value;

				if (key == 'PAYMENT_DATE_NOT_VALID'){
					alert('fecha no valida');
					document.getElementById('paymentDate').focus();
				}
				if (key == 'DECLARATION_DATE_NOT_VALID'){
					alert('Fecha de declaracion no valida');
				}
				if (key == 'ERROR'){
					alert(value);
					error = true;
				}

			}//if comentario
		}//for i
		if (error == true){
			pm_VMORA = 0;
			pm_VINTERES = 0;
			pm_WM = 0;
			pm_WOM = 0;
		}
		pm_called2 = 1;
		calcPorcentajeMoras801();
		//}
	}//if complete
	
}

var R7_II_C2_VMORA = 0;	
var R7_IJ_C2_VINTERES = 0;
var R7_IE_C2_WM = 0;
var R7_IE_C2_WOM = 0;

//para la segunda parte
var pm_VMORA = 0;	
var pm_VINTERES = 0;
var pm_WM = 0;
var pm_WOM = 0;

function getPorcentajeMoras801(component){
	if (component.id  == 'monthClose'){
		v_monthClose = component.value;
		if (v_monthClose < 1 || v_monthClose > 12 ){
			pm_monthClose = null;
			alert("El Mes de cierre debe ser un n?mero entre 1 y 12");
			return;
		}
		pm_monthClose = v_monthClose;
	}else if (component.id == 'advancePayment'){
		v_advancedPayment = component.value;
		if (v_advancedPayment < 1 || v_advancedPayment > 4){
			pm_advancedPayment = null;
			alert("El Anticipo debe ser un n?mero entre 1 y 4");
			return;
		}
		pm_advancedPayment = v_advancedPayment;
	}else if (component.id == 'expiringDate'){
		pm_advancedpaymentDate = component.value;
		
	}
	
	getFiscalMoraInfo801();
}
//para la segunda parte del formulario 801
function getFiscalMoraInfo801(){
	


	
	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	pm_paymentDate = document.getElementById('paymentDate').value;
	pm_advancedPayment = document.getElementById('advancePayment').value;
	pm_monthClose = document.getElementById('monthClose').value;
	
	if (pm_monthClose == null || pm_advancedPayment == null || pm_advancedpaymentDate == null){
		return ;
	}
	//TAMBIEN TIENE QUE TENER LOS PARAMETROS VIEJOS
	if (pm_paymentDate == null || pm_ruc == null){
		return ;
	}
	var url = 'getMoraInfo801.do'
	url = url + '?id='+Math.random();
	url = url + '&form=801';
	url = url + '&ruc='+pm_ruc;
	url = url + '&fiscalInfoType=advanced'
	url = url + '&expiringDate='+pm_advancedpaymentDate;
	url = url + '&paymentDate='+pm_paymentDate;
	url = url + '&advancedNumber='+pm_advancedPayment;
	url = url + '&clausureMonth='+pm_monthClose;
	
	
	request= GetXmlHttpObject();
	if (request == null){
		alert('El sitio no soporta AJAX');
		return;
	}
	request.onreadystatechange=changeMoraInfo801;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);
}

function calcPorcentajeMoras801(){
	R4_IF_C2 = null;
	if (pm_called2 == 0){
		getFiscalMoraInfo801();
		return;
	}
	var norectificativa = 1;
	if (document.getElementById('declarationType').value=='RECTIFICATIVA'){
		norectificativa = 0;
	}
	var contravencion = pm_WOM;
	
	refreshVars();
	//54,56,57,58 
	if (R6_IA_C2 > 0 || R6_IC_C1 > 0 || R6_ID_C1 > 0 || R6_IE_C1 > 0){
		contravencion = pm_WM;
	}
	
	if (contravencion != null){		
		R6_IF_C2 = contravencion;
		document.getElementById('R6_IF_C2').value = addCommas(contravencion*norectificativa);
	}

	refreshVars();
	TRGS6L7_1();
	refreshVars();
	TRGS6L7_2();	
	refreshVars();
	TRGS6L8_1();
	refreshVars();
	TRGS6L8_2();
	refreshVars();
	TRGS6L9_1();
	refreshVars();
	TRGS6L9_2();
	
	refreshVars();
	
	
	
	if (R6_IF_C2 != null && (R6_II_C2-contravencion)>=0){
		//parseFloat(value).toFixed(0);
		document.getElementById('R6_IJ_C2').value = addCommas(parseFloat((R6_II_C2-contravencion)*pm_VMORA*norectificativa).toFixed(0));
		document.getElementById('R6_IK_C2').value = addCommas(parseFloat((R6_II_C2-contravencion)*pm_VINTERES*norectificativa).toFixed(0));
		
	}else{
		document.getElementById('R6_IJ_C2').value ='';
		document.getElementById('R6_IK_C2').value='';
	}
	if (R6_IH_C1 == 0){
		refreshVars();
		//TRGS4L13();
	}else{
		document.getElementById('R6_IL_C2').value='';
	}
	
	refreshVars();
	TRGS6L12();
	refreshVars();
	TRGivaTaxAmount();
	refreshVars();
	TRGrentTaxAmount();
	refreshVars();	
	TRGtotalAmount();	
	postRefresh();
	
	postRefresh();
	

}


function updatePreprinterNumber (el){
	 if (isNaN(document.getElementById('prePrintedNumber').value)) { alert('El numero pre impreso debe ser numerico'); return; }
	
	var url = 'getPreprinterNumberStatus.do'
	url = url + '?id='+Math.random();
	url = url + '&form=801'
	url = url + '&preprinterNumber='+el.value
	request= GetXmlHttpObject();
	if (request == null){
		alert('El sitio no soporta AJAX');
		return;
	}
	request.onreadystatechange=confirmPreprinterNumber;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);
	
}
function confirmPreprinterNumber(){

	if (request.readyState == 4 || request.readyState == 'complete'){

		var xmlDoc = request.responseXML;
	
		var values = xmlDoc.getElementsByTagName("preprinternumber-status");
		
	
				
		for (i=0; i<values[0].childNodes.length; i++){
			if (values[0].childNodes[i].nodeName == 'status'){
					if (values[0].childNodes[i].getAttributeNode('status').value == 'EXIST'){
						alert('El Numero Preimpreso: '+values[0].childNodes[i].getAttributeNode('number').value + ' ya existe');
					}
					if (values[0].childNodes[i].getAttributeNode('status').value == 'ERROR'){
						alert('Error al buscar el estado del numero preimpreso');
					}
			}//if comentario
		}//for i
	}//if complete
}

function calcPorcentajeMoras(){

	if (pm_called == 0){
		getFiscalMoraInfo();
		return;
	}
	
	var norectificativa = 1;
	
	if (document.getElementById('declarationType').value=='RECTIFICATIVA'){
		norectificativa = 0;
	}
	
	var contravencion = R7_IE_C2_WOM;	
	refreshVars();
	//9,14,21,26,29, 37,41,42,43 
	if (R1_IE_C1 > 0 || R1_IE_C2 > 0 || R2_IG_C1 > 0 || R2_IG_C2 > 0 || R3_IC_C1 > 0 || R4_IJ_C1 > 0 || R5_ID_C1 > 0 || R5_IE_C1 > 0 || R5_IF_C1 > 0){
		contravencion = R7_IE_C2_WM;
	}
	
	
	if (contravencion != null){		
		R5_IG_C2 = contravencion;
		document.getElementById('R5_IG_C2').value = addCommas(contravencion*norectificativa);
	}else{
	}
	refreshVars();
	TRGS5L8_1()
	refreshVars();
	TRGS5L8_2()

	refreshVars();
	TRGS5L9_1();
	refreshVars();
	TRGS5L9_2();

	refreshVars();
	TRGS5L10_1();
	refreshVars();
	TRGS5L10_2();
	refreshVars();
	TRGS5L11();
	refreshVars();
	TRGS5L12();
	refreshVars();
	
	
	
	if (R5_IL_C2 != null && (R5_IL_C2-contravencion) >= 0){
		//parseFloat(value).toFixed(0);
		document.getElementById('R5_IM_C2').value = addCommas(parseFloat((R5_IL_C2-contravencion)*R7_II_C2_VMORA*norectificativa).toFixed(0));
		document.getElementById('R5_IN_C2').value = addCommas(parseFloat((R5_IL_C2-contravencion)*R7_IJ_C2_VINTERES*norectificativa).toFixed(0));
		
	}else{
		document.getElementById('R5_IM_C2').value ='';
		document.getElementById('R5_IN_C2').value='';
	}
	
	refreshVars();
		TRGS5L15();
	refreshVars();
	TRGivaTaxAmount();
	refreshVars();
	TRGrentTaxAmount();
	refreshVars();	
	TRGtotalAmount();	
	postRefresh();

}

###################################################################*/