
function onloadForm(){
	loadScript('js/pykFiscalComun.js');
	var valueOld;
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
	//alert("calcPorcentajeMoras() CONTRAVENSION_CMOV:" + CONTRAVENSION_CMOV + "  PORC_MORA:" + PORC_MORA + "  PORC_INTERES: "+ PORC_INTERES);
	var norectificativa = 1;
	if (document.getElementById('declarationType').value=='| 2 | RECTIFICATIVA'){
		norectificativa = 0;
	}
	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('c113').value =  CONTRAVENSION_CMOV*norectificativa;
		if(document.getElementById('c113').value != null)
  		   colocarpuntos(document.getElementById('c113'));
	}
	
	var tmp115 = removeCommas(document.getElementById('c115').value);
	var tmp113 = removeCommas(document.getElementById('c113').value);
	var op = tmp115 - tmp113
	if(op < 0){
		op = 0
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c116').value =  (PORC_MORA * op).toFixed(0);//*norectificativa;
		if(document.getElementById('c116').value != null)
  		   colocarpuntos(document.getElementById('c116'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c117').value =  (PORC_INTERES * op).toFixed(0);//*norectificativa;
		if(document.getElementById('c117').value != null)
  		   colocarpuntos(document.getElementById('c117'));
	}

	//alert("calcPorcentajeMoras() c113:" + document.getElementById('c113').value + "  c116:" + document.getElementById('c116').value + "  c117: "+ document.getElementById('c117').value);	
	refreshVars();
	TRG_C114();
	TRG_C111_1();
	TRG_C111_2();
	TRG_C115_1();
	TRG_C115_2();
	TRG_C116();
	TRG_C117();
	TRG_C118();

	//alert("calcPorcentajeMoras() c113:" + document.getElementById('c113').value + "  c116:" + document.getElementById('c116').value + "  c117: "+ document.getElementById('c117').value);	

	var tmp = (0).toFixed(0);
}


function getFormType(){
	return '120v2';
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

