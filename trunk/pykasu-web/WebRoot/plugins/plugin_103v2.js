var salaryAmount;
oriRectiFlag=false;
var pm_fiscalPeriodMounth = null;

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

/*
* Si la declaracion es RECTIFICATIVA no se calcula contravenci?n
*/
function calcPorcentajeMoras(){

	if (pm_called == 0){
		getFiscalMoraInfo();
		return;
	}

	var norectificativa = 1;
	if (document.getElementById('declarationType').value=='| 2 | RECTIFICATIVA'){
		norectificativa = 0;
	}
	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){//Si es rectificativa no hay contravenci?n
		document.getElementById('c32').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c32').value != null)
			colocarpuntos(document.getElementById('c32'));
	}else{
	
		if(oriRectiFlag){
			document.getElementById('c32').value = norectificativa;
		
		}
	}
	refreshVars();
	/*TRGc26();
	TRGc27();*/
	TRGc34();
	TRGc35();
	TRGc35_0();
	TRGc36();
	TRGc36_0();
	
	
	var tmp1 = removeCommas(document.getElementById('c36').value);
	var tmp2 = removeCommas(document.getElementById('c32').value);
	var op = tmp1 - tmp2;
	if(op < 0){
		op = 0;
	}

	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c37').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c37').value != null)
  		   colocarpuntos(document.getElementById('c37'));
	}		

	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c38').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c38').value != null)
  		   colocarpuntos(document.getElementById('c38'));
	}
	
	refreshVars();
	TRGc39();
	
	
	
	var tmp = (0).toFixed(0);
}

function orirecti(){

	try{
		var decType = document.getElementById('declarationType');
		var rectPPN = document.getElementById('rectificativePPN');
		
		rectPPN.disabled = 'true';
		
		if (decType.value == "| 2 | RECTIFICATIVA"){			
			rectPPN.disabled = '';
			oriRectiFlag=true;
		}
		else{	
			rectPPN.value = '';				
			rectPPN.disabled = 'true';
			oriRectiFlag=false;
		}
	
		pm_called = 1;//para que no llame al servidor..
		
		calcPorcentajeMoras();	
	
	}catch(e){
		//alert('error al calcular Origen');
	}	

}

function TRGc26(){
	var tmpC14= getValueFormatless('c14');
	var tmpC27= getValueFormatless('c27');
	var value = getValueFormatless('c26');
	var op=0;
	
	if(tmpC27 == null || tmpC27==0){
		if( tmpC14 != null) {
			op= Math.round(tmpC14 * 0.1);
		}
			
		if(value <= op){
			document.getElementById('c26').value=addCommas(value);
		}else{
			document.getElementById('c26').value=addCommas(op);
		}
	}else{
		//alert('No se puede declarar el campo 26, si el campo 27 es mayor a cero');
		document.getElementById('c26').value=0;
	}
	refreshVars();
	
	TRGc34();
	TRGc36();
	TRGc36_0();
	pm_called = 1;
	calcPorcentajeMoras();
	
}


function TRGc27(){
	var tmpC14= getValueFormatless('c14');
	var tmpC26= getValueFormatless('c26');
	var value = getValueFormatless('c27');
	var op=0;
	
	if(tmpC26== null || tmpC26==0){
		if( tmpC14 != null) {
			op= Math.round(tmpC14 * 0.3);
		}
		
		if(value <= op){
			document.getElementById('c27').value=addCommas(value);
		}else{
			document.getElementById('c27').value=addCommas(op);
		}
	}else{
		//alert('No se puede declarar el campo 27, si el campo 26 es mayor a cero');
		document.getElementById('c27').value=0;
	}
	refreshVars();
/*	pm_called = 1;
	calcPorcentajeMoras();*/
	TRGc34();
	TRGc36();
	TRGc36_0();
	pm_called = 1;
	calcPorcentajeMoras();
	//calculateAfterPlugin();
}

function validateC26_C27(){
	var	campo14= getValueFormatless('c14');	
	var campo26= getValueFormatless('c26');
	var campo27= getValueFormatless('c27');
	
	if (campo14 != null && campo14 >0){
		if((campo26==null || campo26==0) && (campo27==null || campo27==0)){
			alert('Debe declarar un valor para el campo 26 y el 27 del RUBRO 2');
			return false;
		}
	}
	return true;
}


function getFormType(){
	return '103v2';
}
/**##########################################################################################**/
function giveFormType(){
 return 'mensual';
}

function periodControl(){
	if (!controlFiscalPeriod(giveFormType())){
		return false;
	}
	
	return true;
}

function beforeSave(){
	
	
	if(!validateC26_C27()){
		return false;
	}
	
	if (!periodControl()){
		return false;
	}
	
	/*REsolucion general nro 107 --> NO se pueden presentar declaraciones sin movimiento*/
	var isEmpty = true;
	for (i = 10 ; i <= 39 ; i++) // Recorrer todas las celdas
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
	
	/*REsolucion general nro 107 --> NO se pueden presentar declaraciones sin movimiento*/
	
	return true;

}
