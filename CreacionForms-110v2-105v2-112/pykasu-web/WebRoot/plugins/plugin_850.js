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
		document.getElementById('R7_IE_C2').value =  CONTRAVENSION_CMOV*norectificativa;
		if(document.getElementById('R7_IE_C2').value != null)
  		   colocarpuntos(document.getElementById('R7_IE_C2'));
	}
	
	var tmp115 = removeCommas(document.getElementById('R7_IH_C2').value);
	var tmp113 = removeCommas(document.getElementById('R7_IE_C2').value);
	var op = tmp115 - tmp113
	if(op < 0){
		op = 0
	}
		
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('R7_II_C2').value =  (PORC_MORA * op).toFixed(0);//*norectificativa;
		if(document.getElementById('R7_II_C2').value != null)
  		   colocarpuntos(document.getElementById('R7_II_C2'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('R7_IJ_C2').value =  (PORC_INTERES * op).toFixed(0);//*norectificativa;
		if(document.getElementById('R7_IJ_C2').value != null)
  		   colocarpuntos(document.getElementById('R7_IJ_C2'));
	}

	refreshVars();
	TRGS7L62();
	TRGS7L71();
	TRGS7L72();
	TRGS7L82();
	TRG_MORA();
	TRG_INTERES();
	TRGS7L911();
	TRGS7L921();
	TRGS7L912();
	TRGS7L922();
	//TRtotalAmount();
	var tmp = (0).toFixed(0);
}

function getFormType(){
	return '850';
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
