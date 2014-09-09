
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

}

function refresh49(){
	var c48 = removeCommas(document.getElementById("c48").value);
	var c49 = removeCommas(document.getElementById("c49").value);
	c55 = c48 - c49;
	if(c55<0){
		c55 = "";
	}
	var c53 = removeCommas(document.getElementById("c53").value);
	var c56 = removeCommas(document.getElementById("c56").value);
	if(c56 != ""){
		c57 = c56 + c55;
	}else{
		c57 = c55;
	}
	var r = "";
	if(c53 >c57){
		r = c53 - c57;
	}
//	addCommas(r);
//	console.log(r);
	document.getElementById("c54").value = r;


}

function refresh58(){
	refreshvars();
	TRGS4L105_2();
}
//function refresh54(){
//	var c53 = removeCommas(document.getElementById("c53").value);
//	var c57 = removeCommas(document.getElementById("c57").value);
//	var r = "";
//	if(c53 >c57){
//		r = c53 - c57;
//	}
//	document.getElementById("c54").value = r;// colocarpuntos(r);
//	console.log("r: " + r); 
//}

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
	var c53 = removeCommas(document.getElementById('c53').value);

	var c55 = removeCommas(document.getElementById('c55').value);

	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('c56').value =  CONTRAVENSION_CMOV;//*norectificativa;
		if(document.getElementById('c56').value != null)
  		   colocarpuntos(document.getElementById('c56'));
	}
	var c56 = removeCommas(document.getElementById('c56').value);
	refreshVars();
	TRGS4L104();
	TRGS4L105();
	TRGS4L105_2();
}

function getFormType(){
	return '120v3';
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
	
	/*REsolucion general nro 107 --> NO se pueden presentar declaraciones sin movimiento*/
	return true;

}

