var salaryAmount;

var pm_fiscalPeriodMounth = null;

function disabledByCondition101(cell, cellConditionId){

	var cellCondition = document.getElementById(cellConditionId);
	
	if(cellCondition == null){
		return
	} 

	var valueCondition = cell.value;	
	if((valueCondition == null) || (valueCondition <= 0)){
		cellCondition.value = "";
		cellCondition.disabled = 'true';
	}else{
		cellCondition.disabled = '';
	}
}

function onloadForm(){
	loadScript('js/pykFiscalComun.js');
	
	var valueOld;
	var salaryAmount = '';
	var dateField = document.getElementById('paymentDate');
	
	if(document.getElementById('formStatus').value == 'insert_mode'){
		document.getElementById('paymentDate').value = document.getElementById('suggestedPaymentDate').value;
	}
	v_onload = 1;
	orirecti();
	v_onload = 0; 
	
	
	//estos elementos dependen de otras celdas para activarse
	disabledByCondition101(document.getElementById('c17'), 'c23');
	disabledByCondition101(document.getElementById('c18'), 'c24');
	disabledByCondition101(document.getElementById('c19'), 'c25');		
	disabledByCondition101(document.getElementById('c20'), 'c26');	
	disabledByCondition101(document.getElementById('c29'), 'c30');	
	disabledByCondition101(document.getElementById('c17'), 'c47');	
	disabledByCondition101(document.getElementById('c18'), 'c48');
	disabledByCondition101(document.getElementById('c19'), 'c49');
	disabledByCondition101(document.getElementById('c20'), 'c50');						
/*
	document.getElementById('c23').disabled = 'true';
	document.getElementById('c24').disabled = 'true';	
	document.getElementById('c25').disabled = 'true';	
	document.getElementById('c26').disabled = 'true';	
	document.getElementById('c30').disabled = 'true';	
	document.getElementById('c47').disabled = 'true';		
	document.getElementById('c48').disabled = 'true';		
	document.getElementById('c49').disabled = 'true';		
	document.getElementById('c50').disabled = 'true';	
*/	
	document.getElementById('fiscalPeriodMounth').value = 4;
	pm_fiscalPeriodMounth = 4; 				
	
}

function calculateBeforePlugin(){
	retriveSalary();

}


function calculateAfterPlugin(){
	orirecti();
	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	pm_paymentDate = document.getElementById('paymentDate').value;
	pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
	pm_fiscalPeriodYear = removeCommas(document.getElementById('fiscalPeriodYear').value);
	pm_called = 1;
	
	
	
	if((salaryAmount == null)||(salaryAmount == 0)){
		setTimeout("retriveSalary()",1500);		
	}
	
	/*Aca tengo que llamar a calculateC90 en vez de establecer el valor de c90 directamente. 
	 * A causa de este calculo directo, c90 estaba quedando con un valor si la declararcion es clausura.
	 * */
//	if(getValueFormatless('c76') > parseInt(salaryAmount)){
////		document.getElementById('c90').value = getValueFormatless('c76');	
//		
//		document.getElementById('c90').value = document.getElementById('c76').value;	
//		
//	}else{
//			
//		document.getElementById('c90').value = '';
//		
//	}
	calculateC90();
	
	
	
	setMinorValue('c91','c80','c90');
	TRGc92();
	TRGc92_0();
	setMinorValue('c93','c83','c92');
	TRGc94();
	TRGc94_0();
	
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
	
	var norectificativa = 1;
	if (document.getElementById('declarationType').value=='| 2 | RECTIFICATIVA'){
		norectificativa = 0;
	}
	
	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('c84').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c84').value != null)
  		   colocarpuntos(document.getElementById('c84'));
	}
	
	refreshVars();
	TRGc85();
	TRGc86();
	TRGc86_0();
	
	var tmp86 = document.getElementById('c86').value;
	var tmp84 = document.getElementById('c84').value;	
	
	var op = removeCommas(tmp86) - removeCommas(tmp84);
	if(op < 0){
		op = 0;
	}
	
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c87').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c87').value < 0){
			document.getElementById('c87').value  = 0;
		}
		if(document.getElementById('c87').value != null)
  		   colocarpuntos(document.getElementById('c87'));
	}		
	
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c88').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c88').value < 0){
			document.getElementById('c88').value  = 0;
		}
		if(document.getElementById('c88').value != null)
  		   colocarpuntos(document.getElementById('c88'));
	}
	
	refreshVars();
	TRGc89();
	
	var tmp = (0).toFixed(0);
}


function getFormType(){
	return '101';
}

function orirecti(){

	try{
		var decType = document.getElementById('declarationType');
		var rectPPN = document.getElementById('rectificativePPN');
	
		rectPPN.disabled = 'true';
		
		if (decType.value == "| 2 | RECTIFICATIVA"){			
			rectPPN.disabled = '';
		}
		else{			
			rectPPN.value = '';
			rectPPN.disabled = 'true';
		}
	
		pm_called = 1;//para que no llame al servidor..
		
		calcPorcentajeMoras();	
	
	}catch(e){
		//alert('error al calcular Origen');
	}	
}


function retriveSalary(){
	
	request= GetXmlHttpObject();

	//request= new XMLHttpRequest();

	if (request == null){
		alert('El sitio no soporta AJAX.');
		return;
	}

	var fpMonth = document.getElementById('fiscalPeriodMounth').value.toUpperCase();
	var fpYear  = document.getElementById('fiscalPeriodYear').value.toUpperCase();

	if((fpMonth == null)||(fpYear==null)||(fpMonth == '')||(fpYear == '')){		
		return;
	}

	var url = 'getSalary.do'
	url = url + '?id='+Math.random();
	url = url + '&fpMonth='+fpMonth;
	url = url + '&fpYear=' + fpYear;
	
	request.onreadystatechange=calculateC90;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);
}

function calculateC90(){
	var	calcula90=0;
	
	if(request.readyState == 4 || request.readyState == 'complete'){
		
		var xmlDoc = request.responseXML;
	
		var values = xmlDoc.getElementsByTagName("salary-info");
		
		var	tipoDeclara= document.getElementById('declarationType').value;		
		
		for (i=0; i<values[0].childNodes.length; i++){
			if (values[0].childNodes[i].nodeName == 'salary'){
				for (j = 0; j<values[0].childNodes[i].childNodes.length; j++){
					if (values[0].childNodes[i].childNodes[j].nodeName == 'salary-amount'){					
						salaryAmount = values[0].childNodes[i].childNodes[j].firstChild.nodeValue;
					}
				}
			}//if comentario
		}
		//	alert('salaryAmount: ' + salaryAmount);
		
		if(tipoDeclara=="| 5 | CLAUSURA"){
			document.getElementById('c90').value = '';
		}else{
			if(getValueFormatless('c76') > parseInt(salaryAmount)){
				document.getElementById('c90').value = document.getElementById('c76').value;	
			}else{
				document.getElementById('c90').value = '';
			}
		}		
	}
	
	//cesquivel 21-04-08: se llama a las funciones de calculo de los campos continuos al 90.
	setMinorValue('c91','c80','c90');
	TRGc92();
	TRGc92_0();
	setMinorValue('c93','c83','c92');
	TRGc94();
	TRGc94_0();

}

function controlaAnho(){
	var anhoform = getValueFormatless('fiscalPeriodYear');

	if(anhoform != 0){
		fecha = new Date();
		var anho = getActualYear();

		if(
			(
				(document.getElementById('declarationType').value == '| 5 | CLAUSURA') 
				&&(anho == anhoform)
			) 
		   || (anhoform < anho)  
		){

			getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		  

		}else{
			alert("Año de presentación incorrecto. El año debe ser menor al año corriente. En el caso de CLAUSURA, el año puede ser el mismo que el corriente.");
			document.getElementById('fiscalPeriodYear').value = '';//Borro el campo a	o
			document.getElementById('fiscalPeriodYear').focus();
			return;
		}
	}
}

function beforeSave(){
	
	fecha = new Date();
	var anho = fecha.getYear()+1900;
	var anhoform = getValueFormatless('fiscalPeriodYear');	
	
	var v120 = removeCommas(document.getElementById("c120").value);
	if(v120!='' && v120.length != 4){
		alert('El año debe tener cuatro dígitos.');
		return false;
	}
	
	if(parseInt(v120)< 1900){
		alert('El año debe ser mayor al 1900.');
		return false;		
	}
	
	var server = document.getElementById("serverActualDate").value;
	sp = server.split('/');
	if(v120.replace(' ','') > sp[2].replace(' ','')){
		alert('El valor del campo 120 debe ser menor que el año actual.');
		return false;
	}

	if(!(
		(
			(document.getElementById('declarationType').value == '| 5 | CLAUSURA') 
			&&(anho == anhoform)
		) 
	   || (anhoform < anho)  )
	){
		alert('Año de presentación incorrecto. El año debe ser menor al año corriente. En el caso de CLAUSURA, el año puede ser el mismo que el corriente.');
		document.getElementById('fiscalPeriodYear').focus();
		return false;
	}
	
	/*REsolucion general nro 107 --> NO se pueden presentar declaraciones sin movimiento*/
	var isEmpty = true;
	for (i = 10 ; i <= 121 ; i++) // Recorrer todas las celdas
	{
		if(document.getElementById("c"+i) != null) 
			if (document.getElementById("c"+i).value != ''){ // hay ALGO en el campo
				if (document.getElementById("c"+i).value != '0' ){ // Hay un monto diferente a 0 
					isEmpty = false; // existe un mvto.
					break;
				}
			}		
	}
	if (isEmpty){//Sin movimientos
		alert ('Sr. usuario, les informamos que por disposición de la resolución general nro. 107 del Ministerio de Hacienda, no se pueden presentar declaraciones juradas SIN MOVIMIENTO por este medio.');
		return false; 
	}
	if (document.getElementById("estado-ruc").value == "SUSPENSION TEMPORAL"){
		alert ('Sr. usuario, les informamos que por disposición de la resolución general nro. 107 del Ministerio de Hacienda, los contribuyentes cuyos RUCs se encuentren en estado de Suspensión Temporal, no podrán presentar DDJJ por este medio.');
		return false; 
	}

	return true;
}

function mustBeMinor()
{
	var tmp_29= parseInt(removeCommas(document.getElementById('c29').value));
	var tmp_30= parseInt(removeCommas(document.getElementById('c30').value));
	
	if (tmp_30 > tmp_29) 
	{
		alert("El campo 30 no puede exceder el valor del campo 29");
		document.getElementById("c30").value='';
	}
}

function setMinorValue(campo1,campo2,campo3)
{
	var tmp1= getValueFormatless(campo2);
	var tmp2= getValueFormatless(campo3);

	if (tmp1 <= tmp2){
	   document.getElementById(campo1).value= document.getElementById(campo2).value;
	 
	}else{
	   document.getElementById(campo1).value= document.getElementById(campo3).value;
	 }
	 
	 reCalculate(campo1);
}

/*
Retorna el mes valido de presentacion
para el formulario (que es anual)
Para el 101 el mes es Abril(4)
*/
function getValidMonth(){
	return 4;
}

function reCalculate(campo){
	refreshVars();
	if (campo == 'c91'){
		TRGc92();
		TRGc92_0();
	}else if (campo == 'c93'){
		TRGc94();
		TRGc94_0;
	}

}



function giveFormType(){
 return 'anual';
}
