var salaryAmount;

var pm_fiscalPeriodMounth = null;
function onloadForm() {
	loadScript('js/pykFiscalComun.js');

	var valueOld;
	var salaryAmount = '';
	var dateField = document.getElementById('paymentDate');

	if (document.getElementById('formStatus').value == 'insert_mode') {
		document.getElementById('paymentDate').value = document
				.getElementById('suggestedPaymentDate').value;
	}
	v_onload = 1;
	orirecti();
	v_onload = 0;

	// El form 112 es anual. Y el mes (fijo) de vencimiento es 5.
	document.getElementById('fiscalPeriodMounth').value = 5;
	
	document.getElementById('c59').disabled = 'true';
	document.getElementById('c60').disabled = 'true';
	document.getElementById('c61').disabled = 'true';
	document.getElementById('c62').disabled = 'true';
	document.getElementById('c63').disabled = 'true';
	document.getElementById('c64').disabled = 'true';
	document.getElementById('c65').disabled = 'true';
	document.getElementById('c66').disabled = 'true';
	document.getElementById('c67').disabled = 'true';
}

function calculateBeforePlugin() {

}

function calculateAfterPlugin() {

	orirecti();
	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	pm_paymentDate = document.getElementById('paymentDate').value;
	pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
	pm_fiscalPeriodYear = removeCommas(document.getElementById('fiscalPeriodYear').value);
	pm_called = 1;
	if (PORC_MORA == 0 || PORC_INTERES == 0 || CONTRAVENSION_CMOV == 0	|| CONTRAVENSION_SMOV == 0) {
		pm_called = 0;
	}

	calcPorcentajeMoras();
	/*
	 * var tmp39 = getValueFormatless('c39'); var tmp35 =
	 * getValueFormatless('c35'); var tmp54 = getValueFormatless('c54');
	 */

	/*
	 * if (tmp39 > 0) { //
	 * document.getElementById('c35').value=getValueFormatless('c83');
	 * document.getElementById('c35').value =
	 * document.getElementById('c83').value; } else {
	 * document.getElementById('c35').value = ''; if (tmp39 == 0) { //
	 * document.getElementById('c54').value=getValueFormatless('c83');
	 * document.getElementById('c54').value = document
	 * .getElementById('c83').value; } }
	 * 
	 * if ((salaryAmount == null) || (salaryAmount == 0)) { retriveSalary(); }
	 * 
	 * if (document.getElementById('c76').value > salaryAmount) {
	 * document.getElementById('c90').value =
	 * document.getElementById('c76').value; } else {
	 * document.getElementById('c90').value = ''; }
	 */

	// reCalc();
}

/*
 * Si la declaracion es RECTIFICATIVA no se calcula contravenci?n
 */
function calcPorcentajeMoras() {

	if (pm_called == 0) {
		getFiscalMoraInfo();
		return;
	}

	var norectificativa = 1;
	if (document.getElementById('declarationType').value == '| 2 | RECTIFICATIVA') {
		norectificativa = 0;
	}

	if (CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null) {
		//multa
		document.getElementById('c22').value = CONTRAVENSION_CMOV
				* norectificativa;
		if(document.getElementById('c22').value == 0){
			document.getElementById('c22').value = "";
		}
		if (document.getElementById('c22').value != null)
			colocarpuntos(document.getElementById('c22'));
	}

//	var tmp1 = removeCommas(document.getElementById('c26').value);
//	var tmp2 = removeCommas(document.getElementById('c22').value);
//	var op = tmp1 - tmp2;
//	if (op < 0) {
//		op = 0;
//	}

//	if (PORC_MORA && PORC_MORA != null) {
//		document.getElementById('c22').value = (PORC_MORA * op).toFixed(0);
//		if (document.getElementById('c22').value < 0) {
//			document.getElementById('c22').value = 0;
//		}
//		if (document.getElementById('c22').value != null)
//			colocarpuntos(document.getElementById('c22'));
//	}
//	if (PORC_INTERES && PORC_INTERES != null) {
//		document.getElementById('c28').value = (PORC_INTERES * op).toFixed(0);
//		if (document.getElementById('c28').value < 0) {
//			document.getElementById('c28').value = 0;
//		}
//		if (document.getElementById('c28').value != null)
//			colocarpuntos(document.getElementById('c28'));
//	}

	refreshVars();
//	TRGc24();
//	TRGc26a();
//	TRGc26b();
//	TRGc29();

	var tmp = (0).toFixed(0);

}

// Funcion que se realizo para esta regla //# SI (C[N]=0, 0, C[N+10]). 
function checkIfContent(cellToTest, targetCellId){
	var cellCondition = document.getElementById(targetCellId);
	// Si el valor de la celda es nulo o cero, desabilitamos la celda dependiente.
	if(cellToTest.value == null || cellToTest.value == 0){
	        cellCondition.value="";
	        cellCondition.disabled = 'true';
	}
	// Si existe un valor, habilitamos la celda dependiente.
	else {
//	        cellCondition.value="";
	        cellCondition.disabled = '';
	        cellCondition.focus();
	}
	refreshVars();
//	TRGc72();
//	TRGc73();
	
}

function getFormType() {
	return '112v2';
}

function orirecti() {

	try {
		var decType = document.getElementById('declarationType');
		// var rectPPN = document.getElementById('rectificativePPN');

		rectPPN.disabled = 'true';

		/*
		 * if (decType.value == "| 2 | RECTIFICATIVA") { rectPPN.disabled = ''; }
		 * else { rectPPN.value = ''; rectPPN.disabled = 'true'; }
		 */

		pm_called = 1; // Para que no llame al servidor.

		calcPorcentajeMoras();

	} catch (e) {
		// alert('error al calcular Origen');
	}

}

/*
 * Para ddjj ORIGINALES y RECTIFICATIVAS: a?o tiene que ser menor al actual Para
 * ddjj CLAUSURA: a?o igual
 */
function controlaAnho() {
	var fiscalYear = getValueFormatless('fiscalPeriodYear');
	var declaType = document.getElementById('declarationType').value;
	var fecha = new Date();
	var anhoActual = getActualYear();

	if (fiscalYear != 0) {
		// Si es clausura tiene que ser el a?o actual
		if (declaType == '| 5 | CLAUSURA') {
			if (fiscalYear != anhoActual) {
				alert('Para las ddjj de tipo CLAUSURA, el anho debe ser el año actual');
				document.getElementById('fiscalPeriodYear').value = "";
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
		} else {// Si no es clausura, el a?o tiene que ser menor al actual
			if (fiscalYear >= anhoActual) {
				alert('Para las ddjj ORIGINALES y RECTIFICATIVAS, el año debe ser menor al año actual');
				document.getElementById('fiscalPeriodYear').value = "";
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
		}
	}
	getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));
}

/*
 * Retorna el mes valido de presentacion para el formulario (que es anual) Para
 * el 112 el mes es Mayo(5)
 */
function getValidMonth() {
	return 5;
}

/**
 * function reCalc(){ refreshVars();
 * 
 * TRGc39(); TRGc39_0(); TRGc35(); TRGc35_0(); TRGc35_1(); TRGc37(); TRGc54();
 * TRGc54_0(); TRGc62(); TRGc64(); TRGc72(); TRGc72_0(); TRGc74(); TRGc74_0();
 * TRGc76(); TRGc78(); TRGc80(); TRGc80_0(); }
 */

function beforeSave() {
	/*REsolucion general nro 107 --> NO se pueden presentar declaraciones sin movimiento*/
	var isEmpty = true;
	for (i = 10 ; i <= 73 ; i++) // Recorrer todas las celdas
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

function notNullVaule(value) {
	if (value > 0) {
		return value;
	} else {
		return 0;
	}
}
