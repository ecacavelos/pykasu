var salaryAmount;

var pm_fiscalPeriodMounth = null;
function onloadForm(){
	loadScript('js/pykFiscalComun.js');
	
	var valueOld;
	var salaryAmount = '';
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
//	anual = true;
	
	document.getElementById('paymentDate').value;
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
* Si la declaracion es RECTIFICATIVA no se calcula contravención
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
	}
	refreshVars();
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

/*
* La casilla 1 (c1) es la casilla con menor nro
* (entre c19 y c20, c19 = c1 y c20 = c2)
* Si c1 es mayor que c2 hay error, y c2 se pone en blanco.
*/
function controlIfValid(c1, c2){
	var campo1 = getValueFormatless(c1);
	var campo2 = getValueFormatless(c2);
	if (campo1 == 0){
	 	document.getElementById(c2).value='';
	 	return;
	}
	if(campo1 <= campo2){
		alert('El valor de la casilla '+ c2 + ' no puede ser mayor al valor de la casilla ' + c1);
		document.getElementById(c2).value = "";
	}		
}


function getFormType(){
	return '109';
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

