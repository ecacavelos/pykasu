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
	//document.getElementById('fiscalPeriodMounth').value = 3;
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
	TRGc46();
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
		document.getElementById('c40').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c40').value != null)
  		   colocarpuntos(document.getElementById('c40'));
	}else{
	
		if(oriRectiFlag){
			document.getElementById('c40').value = norectificativa;
		
		}
	}
	refreshVars();
	TRGc41();
	TRGc42();
	TRGc43();
	TRGc43_0();
	
	var tmp1 = removeCommas(document.getElementById('c43').value);
	var tmp2 = removeCommas(document.getElementById('c40').value);
	
	var op = tmp1 - tmp2;
	if(op < 0){
		op = 0;
	}

	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c44').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c44').value != null)
  		   colocarpuntos(document.getElementById('c44'));
	}		

	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c45').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c45').value != null)
  		   colocarpuntos(document.getElementById('c45'));
	}
	
	refreshVars();
	TRGc46();

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
/*
Retorna el mes valido de presentacion
para el formulario (que es anual)
Para el 125 el mes es ABRIL(4)
*/


function getFormType(){
	return '111';
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
	if (!periodControl()){
		return false;
	}
		
	return true;

}
