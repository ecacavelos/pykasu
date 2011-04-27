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
	addValue();
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
	
	var norectificativa = 1;
	if (document.getElementById('declarationType').value=='| 2 | RECTIFICATIVA'){
		norectificativa = 0;
	}
	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('c29').value =  CONTRAVENSION_CMOV * norectificativa;
		if(document.getElementById('c29').value != null)
  		   colocarpuntos(document.getElementById('c29'));
	}
	
	var tmp1 = removeCommas(document.getElementById('c33').value);
	var tmp2 = removeCommas(document.getElementById('c29').value);
	var op = tmp1 - tmp2;
	if(op < 0){
		op = 0;
	}
		
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c34').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c34').value != null)
  		   colocarpuntos(document.getElementById('c34'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c35').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c35').value != null)
  		   colocarpuntos(document.getElementById('c35'));
	}
	
	refreshVars();
	TRGc31();
	TRGc33();
	TRGc33_0();
	TRGc36();

	var tmp = (0).toFixed(0);
	
}


function getFormType(){
	return '123';
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
function controlPeriodo(){
	var month= getValueFormatless('fiscalPeriodMounth');
	var year= getValueFormatless('fiscalPeriodYear');
	
	if (month != 4 && month != 8 && month != 12 )
	{
		alert('Formulario cuatrimestral. Valor de mes incorrecto');
		document.getElementById('fiscalPeriodMounth').value='';
		document.getElementById('fiscalPeriodMounth').focus();
	}
		
	
}


function addValue(){
	document.getElementById('c73_0').value='7.3';
	document.getElementById('c73_1').value='7.3';
	document.getElementById('c73_2').value='7.3';
	document.getElementById('c73_3').value='7.3';
	document.getElementById('c73_4').value='7.3';
}

function giveFormType(){
 return 'cuatrimestral';
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