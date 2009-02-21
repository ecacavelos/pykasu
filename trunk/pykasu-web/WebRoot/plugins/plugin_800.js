
function onloadForm(){
	loadScript('js/pykFiscalComun.js');
	var valueOld;
	var dateField = document.getElementById('paymentDate');
	
	if(document.getElementById('formStatus').value == 'insert_mode'){
		document.getElementById('paymentDate').value = document.getElementById('suggestedPaymentDate').value;
	}
	v_onload = 1;
	orirecti();
	v_onload = 0; 
}

function calculateBeforePlugin(){
}


function calculateAfterPlugin(){
	orirecti();
	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	pm_paymentDate = document.getElementById('paymentDate').value;
	pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
	pm_fiscalPeriodYear = removeCommas(document.getElementById('fiscalPeriodYear').value);
	pm_called = 1;
	pm_called2 = 1;
	calcPorcentajeMoras();
	//calcPorcentajeMoras800();
	if (document.getElementById('prePrintedNumber').value == ''){
		alert('El numero de orden debe ser llenado');
	}
}

//cambiar para el 800
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

function calculateBeforePlugin(){

}

function calculateAfterPlugin(){
	orirecti();
	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	pm_paymentDate = document.getElementById('paymentDate').value;
	pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
	pm_fiscalPeriodYear = removeCommas(document.getElementById('fiscalPeriodYear').value);	
	pm_called = 1;
	if( PORC_MORA == 0 || 
		PORC_INTERES == 0 || 
		CONTRAVENSION_CMOV == 0 ||
		CONTRAVENSION_SMOV == 0)
	{
		pm_called = 0;	
	}
	
	calcPorcentajeMoras();
}


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
		document.getElementById('R3_IG_C2').value =  CONTRAVENSION_CMOV*norectificativa;
		if(document.getElementById('R3_IG_C2').value != null)
  		   colocarpuntos(document.getElementById('R3_IG_C2'));
	}
	
	var tmp13 = getValueFormatless('R3_IA_C2');
	var tmp14 = getValueFormatless('R3_IB_C1');
	var tmp15 =	getValueFormatless('R3_IC_C1');
	var tmp16 = getValueFormatless('R3_ID_C1');
	var tmp17 = getValueFormatless('R3_IE_C1');
	var tmp18 = getValueFormatless('R3_IF_C1');
	
	var op = (tmp13) - (tmp14 +tmp15+tmp16+tmp17+tmp18)
	if(op < 0){
		op = 0
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('R3_IK_C2').value =  (PORC_MORA * op).toFixed(0);//*norectificativa;
		if(document.getElementById('R3_IK_C2').value != null)
  		   colocarpuntos(document.getElementById('R3_IK_C2'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('R3_IL_C2').value =  (PORC_INTERES * op).toFixed(0);//*norectificativa;
		if(document.getElementById('R3_IL_C2').value != null)
  		   colocarpuntos(document.getElementById('R3_IL_C2'));
	}

	//alert("calcPorcentajeMoras() c113:" + document.getElementById('c113').value + "  c116:" + document.getElementById('c116').value + "  c117: "+ document.getElementById('c117').value);	
	refreshVars();
	TRGS3L8();
	TRGS3L9();
	TRGS3L111();
	TRGS3L112();
	TRGS3L13();
	TRGS3L13_0();
	
	/*
	YA NO SE CALCULA.-
	TRG_C111_1();
	TRG_C111_2();
	TRG_C115_1();
	TRG_C115_2();
	TRG_C116();
	TRG_C117();
	TRG_C118();*/
	//alert("calcPorcentajeMoras() c113:" + document.getElementById('c113').value + "  c116:" + document.getElementById('c116').value + "  c117: "+ document.getElementById('c117').value);	
	var tmp = (0).toFixed(0);
}


function getFormType(){
	return '800';
}




/*##############################################################################
				FUNCIONES QUE YA EXISTEN EN EL PYKFISCALCOMUN
################################################################################
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
		getFiscalMoraInfo800();
	}//if complete
}

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
//fecha de pago mayor o igual que actual


function getFiscalMoraInfo(){
	request= GetXmlHttpObject();


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
	url = url + '&form=800';
	url = url + '&ruc='+pm_ruc.toUpperCase();
	url = url + '&paymentDate='+pm_paymentDate;
	url = url + '&fiscalPeriodMounth='+pm_fiscalPeriodMounth;
	url = url + '&fiscalPeriodYear='+pm_fiscalPeriodYear;

	
	request.onreadystatechange=changeMoraInfo;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);
	for (i=0;i<10000;i++){
	}
}
function changeMoraInfo(){


	if (request.readyState == 4 || request.readyState == 'complete'){

		var xmlDoc = request.responseXML;
	
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
					alert('Fecha de declaración no valida');
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

function getPorcentajeMoras(component){
	if (component.value == valueOld){
		valueOld = null;
		return;
	}
	if (component.id == 'ruc'){
		pm_ruc = component.value.toUpperCase();
	}else if(component.id == 'paymentDate'){
		pm_paymentDate = component.value;
	}else if (component.id == 'fiscalPeriodMounth'){
		pm_fiscalPeriodMounth = component.value;
	}else if (component.id == 'fiscalPeriodYear'){
		if (parseFloat(removeCommas(component.value))>2005){
			alert('el año de declaracion no es valido. debe ser menor o igual a 2005');
		}
		else{
			pm_fiscalPeriodYear = component.value;
		}
		pm_fiscalPeriodYear = component.value;
	}
	getFiscalMoraInfo();
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

//-------------------------------------------------------------------


/*##############################################################################
				FUNCIONES NO USADAS POR EL EL PYKFISCALCOMUN
################################################################################

/*
function updatePreprinterNumber (el){
	 if (isNaN(document.getElementById('prePrintedNumber').value)) { alert('El numero pre impreso debe ser numerico'); return; }
	
	var url = 'getPreprinterNumberStatus.do'
	url = url + '?id='+Math.random();
	url = url + '&form=800'
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
function changeMoraInfo800(){

	if (request2.readyState == 4 || request.readyState == 'complete'){

		var xmlDoc = request2.responseXML;
	
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
					alert('Fecha de declaración no valida');
				}
				if (key == 'ERROR'){
					alert(value);
				}

			}//if comentario
		}//for i
		pm_called2 = 1;
		calcPorcentajeMoras800();
	}//if complete
	
}

/*
var R7_II_C2_VMORA = 0;	
var R7_IJ_C2_VINTERES = 0;
var R7_IE_C2_WM = 0;
var R7_IE_C2_WOM = 0;

para la segunda parte
var pm_VMORA = 0;	
var pm_VINTERES = 0;
var pm_WM = 0;
var pm_WOM = 0;
*/
/*
function getPorcentajeMoras800(component){
	if (component.id  == 'monthClose'){
		v_monthClose = component.value;
		if (v_monthClose < 1 || v_monthClose > 12){
			pm_monthClose = null;
			alert("El Mes de cierre debe ser un nÚmero entre 1 y 12");
			return;
		}
		pm_monthClose = v_monthClose;
	}
	
	/*else if (component.id == 'advancePayment'){
		v_advancedPayment = component.value;
		if (v_advancedPayment < 1 || v_advancedPayment > 4){
			pm_advancedPayment = null;
			alert("El Anticipo debe ser un nÚmero entre 1 y 4");
			return;
		}
		pm_advancedPayment = v_advancedPayment;
	}else if (component.id == 'expiringDate'){
		pm_advancedpaymentDate = component.value;
		
	}
	
	//getFiscalMoraInfo800();
}

/*para la segunda parte del formulario 800
function getFiscalMoraInfo800(){
	
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
	var url = 'getMoraInfo.do'
	url = url + '?id='+Math.random();
	url = url + '&form=800';
	url = url + '&ruc='+pm_ruc;
	url = url + '&fiscalInfoType=advanced'
	url = url + '&expiringDate='+pm_advancedpaymentDate;
	url = url + '&paymentDate='+pm_paymentDate;
	url = url + '&advancedNumber='+pm_advancedPayment;
	url = url + '&clausureMonth='+pm_monthClose;
	
	
	request2= GetXmlHttpObject();
	if (request2 == null){
		alert('El sitio no soporta AJAX');
		return;
	}
	request2.onreadystatechange=changeMoraInfo800;
	request2.open('POST',url,true);
	request2.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request2.send(null);
}*/

//para el 800
/*
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
	
	if (R1_ID_C2 != 0 || R2_ID_C1 != 0){
		contravencion = R7_IE_C2_WM;
	}
	
	
	if (contravencion != null){		
		R3_IG_C2 = contravencion;
		document.getElementById('R3_IG_C2').value = addCommas(contravencion*norectificativa);
	}else{
	}
	refreshVars();
	TRGS3L8();
	//refreshVars();
	TRGS3L9();
	//refreshVars();
	TRGS3L101();
	//refreshVars();
	TRGS3L102();
	//refreshVars();
		
	//refreshVars();
	TRGS3L111();
	//refreshVars();
	TRGS3L112();
	
	
	
	if (R3_IJ_C2 != null && (R3_IJ_C2-contravencion) >= 0){
		//parseFloat(value).toFixed(0);
		document.getElementById('R3_IK_C2').value = addCommas(parseFloat((R3_IJ_C2-contravencion)*R7_II_C2_VMORA*norectificativa).toFixed(0));
		document.getElementById('R3_IL_C2').value = addCommas(parseFloat((R3_IJ_C2-contravencion)*R7_IJ_C2_VINTERES*norectificativa).toFixed(0));
		
	}else{
		document.getElementById('R3_IK_C2').value ='';
		document.getElementById('R3_IL_C2').value='';
		document.getElementById('R3_IM_C2').value='';
	}
	if (R3_II_C1 == 0){
		refreshVars();
		TRGS3L13()
	}else{
		document.getElementById('R3_IM_C2').value='';
	}
	refreshVars();
	fivaTaxAmount();
	//refreshVars();
	frentTaxAmount();
	//refreshVars();
	ftotalAmount();
	postRefresh();
		

}


function calcPorcentajeMoras800(){
	R4_IF_C2 = null;
	if (pm_called2 == 0){
		getFiscalMoraInfo800();
		return;
	}
	var norectificativa = 1;
	if (document.getElementById('declarationType').value=='RECTIFICATIVA'){
		norectificativa = 0;
	}
	var contravencion = pm_WOM;
	
	refreshVars();
	//si tiene movimientos
	if (R4_IA_C2!=0 || R4_IC_C1!=0 || R4_ID_C1  != 0 || R4_IE_C1 != 0){
		contravencion = pm_WM;
	}
	
	if (contravencion != null){		
		R4_IF_C2 = contravencion;
		document.getElementById('R4_IF_C2').value = addCommas(contravencion*norectificativa);
	}

	refreshVars();
	TRGS4L7();
	refreshVars();
	TRGS4L8();
	refreshVars();
	TRGS4L101();
	refreshVars();
	TRGS4L102();
	refreshVars();
	TRGS4L111();
	refreshVars();
	TRGS4L112();
	
	
	
	if (R4_IF_C2 != null && (R4_II_C2-contravencion)>=0){
		//parseFloat(value).toFixed(0);
		document.getElementById('R4_IJ_C2').value = addCommas(parseFloat((R4_II_C2-contravencion)*pm_VMORA*norectificativa).toFixed(0));
		document.getElementById('R4_IK_C2').value = addCommas(parseFloat((R4_II_C2-contravencion)*pm_VINTERES*norectificativa).toFixed(0));
		
	}else{
		document.getElementById('R4_IJ_C2').value ='';
		document.getElementById('R4_IK_C2').value='';
	}
	if (R4_IH_C1 == 0){
		refreshVars();
		TRGS4L13();
	}else{
		document.getElementById('R4_IL_C2').value='';
	}
	
	refreshVars();
	fivaTaxAmount();
	refreshVars();
	frentTaxAmount();
	refreshVars();
	ftotalAmount();
	postRefresh();
}
/*function onloadForm(){
	loadScript('js/pykFiscalComun.js');
	v_onload = 1;
	orirecti();
	v_onload = 0;
	var dateField = document.getElementById('paymentDate');
	
	if(document.getElementById('formStatus').value == 'insert_mode'){
		momentoActual = new Date();
    	d = momentoActual.getDate();
   		m = momentoActual.getMonth() + 1;
    	a = momentoActual.getYear();

    	if(a < 1900){
    		a = a + 1900
    	}
    	   	
		if (d <= 9){
			d = '0'+d;
		}
		if (m <= 9)
			m = '0'+m;
		fecha = d + '/' +m+'/'+a;
		dateField.value=fecha;
	}
}


/*
function orirecti(){
	var decType = document.getElementById('declarationType');
	var rectPPN = document.getElementById('rectificativePPN');
	rectPPN.disabled = 'true';
	if (decType.value == 'ORIGINAL'){
		rectPPN.disabled = 'true';
		rectPPN.disabled = 'readonly';
		
	}
	else{
		rectPPN.disabled = '';
		rectPPN.disabled = '';		
	}
	if (v_onload == 1)
		return;
	
	//pm_called = 1;//para que no llame al servidor..
	//calcPorcentajeMoras();
	//pm_called2 = 1;
	//calcPorcentajeMoras800();
		
}


################################################################################*/