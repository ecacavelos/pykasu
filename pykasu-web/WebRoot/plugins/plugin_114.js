
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

	document.getElementById('fiscalPeriodMounth').value =getValidMonth();
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
	calcPorcentajeMoras();
}


function calcPorcentajeMoras(){
	var c73 = removeCommas(document.getElementById('c73').value);

	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('c73').value =  CONTRAVENSION_CMOV;//*norectificativa;
		if(document.getElementById('c73').value != null)
  		   colocarpuntos(document.getElementById('c73'));
	}
	c73 = removeCommas(document.getElementById('c73').value);
	
}

function getFormType(){
	return '114';
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
		//
	}	

}

function giveFormType(){
 return 'anual';
}

function isValidPeriod(nombreCampoPeriodo){
	periodValue = getValueFormatless(nombreCampoPeriodo);
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
	for (i = 10 ; i <= 229 ; i++) // Recorrer todas las celdas
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

function getValidMonth(){
	return 10;
}
function controlaAnho(){
	if(  (document.getElementById('fiscalPeriodYear') != null) 
	  && (document.getElementById('fiscalPeriodYear').value != 0)
	){
		
		fecha = new Date();
		var anho = getActualYear();
		var anhoform = getValueFormatless('fiscalPeriodYear');
		
		if(
			(
				(document.getElementById('declarationType').value == '| 5 | CLAUSURA') 
				&&((anhoform - anho <2) && (anhoform - anho >=0))
			) 
		   || (anhoform < anho)  
		){

			getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		  

		}else{
			alert("Año de presentación incorrecto. El año debe ser menor al año corriente. En el caso de CLAUSURA, el año puede ser el mismo que el corriente.");
			document.getElementById('fiscalPeriodYear').value = '';//Borro el campo a?o
			document.getElementById('fiscalPeriodYear').focus();
			return;
		}
	}
}

//Funcion que se realizo para esta regla //# SI (C[137]=0, 0, C[138]).
function checkIfContent(cellToTest, targetCellId){//c15 c21
	
	var cellCondition = document.getElementById(targetCellId).value;
	if(cellCondition==""){
		cellCondition = 0;
	}
	
	var cellTest = document.getElementById(cellToTest).value;
	if(cellTest==""){
		cellTest = 0;
	} 
	if(cellTest == null ||  cellCondition < cellTest){
		cellCondition.disabled = '';
	}
	else {
		cellCondition.value="";
		cellCondition.disabled = 'true';
	}

	
}

function mustBeMinor(a, b)
{
	var tmp_a= parseInt(removeCommas(document.getElementById(a).value));
	var tmp_b= parseInt(removeCommas(document.getElementById(b).value));
	
	if (tmp_a > tmp_b) 
	{
		alert("El campo " +  a + " no puede exceder el valor del campo " + b);
		document.getElementById(a).value='';
	}
}

function checkIfContentM(cellToTest, targetCellId){//c20 c49
	
	var cellCondition = document.getElementById(targetCellId).value;
	if(cellCondition==""){
		cellCondition = 0;
	}
	
	var cellTest = document.getElementById(cellToTest).value;
	if(cellTest==""){
		cellTest = 0;
	}

	if(cellTest == null ||  cellTest <= cellCondition ){
		cellCondition.disabled = '';
	}
	else {
		document.getElementById(cellToTest).value="";
		cellCondition.disabled = 'true';
	}
}

function checkIfContentNotZero(cellToTest, targetCellId){//c20 c49
	
	var cellCondition = document.getElementById(targetCellId).value;
	if(cellCondition==""){
		cellCondition = 0;
	}
	
	var cellTest = document.getElementById(cellToTest).value;
	if(cellTest==""){
		cellTest = 0;
	}
	if(cellTest == null ||  cellTest > 0 ){
		cellCondition.disabled = '';
	}
	else {
		document.getElementById(targetCellId).value="";
		cellCondition.disabled = 'true';
	}
}

function checkIfSumGreatOrEq(cellSum1, cellSum2, targetCellId){
	console.log(document.getElementById(cellSum1).value);
	console.log(document.getElementById(cellSum2).value);
	console.log(document.getElementById(targetCellId).value);
	if(document.getElementById(cellSum1).value == null || document.getElementById(cellSum1).value == ''){
		document.getElementById(cellSum1).value = 0;
	}
	if(document.getElementById(cellSum2).value == null || document.getElementById(cellSum2).value == ''){
		document.getElementById(cellSum2).value = 0;
	}
	if(document.getElementById(targetCellId).value == null || document.getElementById(targetCellId).value == ''){
		document.getElementById(targetCellId).value = 0;
	}
	var cell1 = parseInt(removeCommas(document.getElementById(cellSum1).value));
	var cell2 = parseInt(removeCommas(document.getElementById(cellSum2).value));
	var cell3 = parseInt(removeCommas(document.getElementById(targetCellId).value));
	var sumCell = cell1 + cell2;
	// Si existe un valor, habilitamos la celda dependiente.
	
	if(sumCell <= cell3){
		document.getElementById(cellSum1).disabled = '';
	}
	else {
		document.getElementById(cellSum1).value="";
		alert("La suma de los campos " +  cellSum1 + " y " + cellSum2 + " no puede exceder el valor del campo " + targetCellId);
		document.getElementById(cellSum2).value="";
		
	}
}
