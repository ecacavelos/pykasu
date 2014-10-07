
function onloadForm(){
	loadScript('js/pykFiscalComun.js');
	loadScript('js/pykasu_util.js');
	var valueOld;
	if(document.getElementById('formStatus').value == 'insert_mode'){
		document.getElementById('paymentDate').value = document.getElementById('suggestedPaymentDate').value;
	}
	v_onload = 1;
	orirecti();
	v_onload = 0; 
	calcularC34();

}

//Funcion que se realizo para esta regla //# #SI(C[15]>0,(C[33]*(C[15]/C[18])),0)
function calcularC34(){//c15 c23
	var result = 0;
	var c15 = removeCommas(document.getElementById('c15').value); //removeCommas
	if(c15 == ''){
		c15 = 0;
	}
	if(c15 > 0){
		//(C[33]*(C[15]/C[18]))
		var c33 = removeCommas(document.getElementById('c33').value); //removeCommas
		if(c33 == ''){
			c33 = 0;
		}
		var c18 = removeCommas(document.getElementById('c18').value); //removeCommas
		if(c18 == ''){
			c18 = 0;
		} 
		result = c33*(c15/c18);
		result = Math.round(result);
		//colocarpuntos();
		document.getElementById('c34').value = result;
	}
	//document.getElementById('c34').value = colocarpuntos(result);
	
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
	//calcPorcentajeMoras();
}


function calcPorcentajeMoras(){
	//document.getElementById('c56').value = "50.000";
	var c47 = removeCommas(document.getElementById('c47').value);

	//var c55 = removeCommas(document.getElementById('c55').value);

	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('c47').value =  CONTRAVENSION_CMOV;//*norectificativa;
		if(document.getElementById('c47').value != null)
  		   colocarpuntos(document.getElementById('c47'));
	}
	var c56 = removeCommas(document.getElementById('c47').value);
	refreshVars();
	TRGS4L4();
	TRGS4L5();
	TRGS4L5_2();
	
}

function getFormType(){
	return '126';
}

function orirecti(){

	try{
		var decType = document.getElementById('declarationType');
//		var rectPPN = document.getElementById('rectificativePPN');
		
//		rectPPN.disabled = 'true';
//		
//		if (decType.value == "| 2 | RECTIFICATIVA"){			
//			rectPPN.disabled = '';
//		}
//		else{			
//			rectPPN.value = '';
//			rectPPN.disabled = 'true';
//		}
	
		pm_called = 1;//para que no llame al servidor..
		
		calcPorcentajeMoras();	
	
	}catch(e){
		//alert('error al calcular Origen');
	}	

}

//
function giveFormType(){
 return 'trimestral';
}

function isValidPeriod(nombreCampoPeriodo){
	
	periodValue = getValueFormatless(nombreCampoPeriodo);
	
	if(!(parseInt(periodValue,10) == 3 || parseInt(periodValue,10) == 6 || parseInt(periodValue,10) == 9 || parseInt(periodValue,10) == 12)){
		alert('El mes de declaración solo puede ser marzo, junio, septiembre, o diciembre.');
		document.getElementById(nombreCampoPeriodo).value = "";
	}

}

function periodControl(){
	if (!controlFiscalPeriod(giveFormType())){
		return false;
	}
	return true;
}

function beforeSave(){
	if (checkC57()<0){
		return false;
	}
	
	if (!periodControl()){
		return false;
		}
	
	/*REsolucion general nro 107 --> NO se pueden presentar declaraciones sin movimiento*/
	var isEmpty = true;
	for (i = 10 ; i <= 66 ; i++) // Recorrer todas las celdas
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
		alert ('Sr. usuario, les informamos que por disposici\u00f3n de la resoluci\u00f3n general nro. 107 del Ministerio de Hacienda, no se pueden presentar declaraciones juradas SIN MOVIMIENTO por este medio.');
		return false; 
	}
	if (document.getElementById("estado-ruc").value == "SUSPENSION TEMPORAL"){
		alert ('Sr. usuario, les informamos que por disposici\u00f3n de la resoluci\u00f3n general nro. 107 del Ministerio de Hacienda, los contribuyentes cuyos RUCs se encuentren en estado de Suspensi\u00f3n Temporal, no podr\u00e1n presentar DDJJ por este medio.');
		return false; 
	}
//	if(document.getElementById("declarationType").value =="| 5 | CLAUSURA"){
//		isValidPeriod('fiscalPeriodMounth');
//		//return false;
//	}
	
	/*REsolucion general nro 107 --> NO se pueden presentar declaraciones sin movimiento*/
	return true;

}

