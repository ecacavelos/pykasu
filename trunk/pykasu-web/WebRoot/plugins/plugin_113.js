var c7;
var c8;
	
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
	var tipoDeclaracion = document.getElementById('contribuyenteType').value;
	disabledCells();
	c7 = 1;
	c8 = 0;
}


function calculateBeforePlugin(){
	
}

function medContribuyente(){
	refreshVars();
	TRGc18();
	TRGc33();
	TRGc34();
	TRGc35();
	TRGc36();
	TRGc36_0();
	TRGc37();
	TRGc40();
	TRGc41();
	TRGc41_0();
	
	TRGc45();
	TRGc46();
	TRGc46_0();
	var c_36 = document.getElementById('c36').value;
	var c_37 = document.getElementById('c37').value;
	if(c_36 == "" || c_36 == null){
		c_36 = '0';
	}
	if(c_37 == "" || c_37 == null){
		c_37 = '0';
	}
	c_36 = parseInt(removeCommas(c_36));
	c_37 = parseInt(removeCommas(c_37));
	var a = parseInt(c_37*0.1);
	var redondeo = c_37*0.1 - parseInt(c_37*0.1);
	if(redondeo > 0.4){
		a = a+1;
	}
	
	if(c8 != 0){
		a = 0;
	}
	
	if(c_36 < a){
		document.getElementById('c42').value = c_36;
	}else{
		document.getElementById('c42').value = a;
	}
	var b = parseInt(c_37*0.1);
	if(c7 != 0){
		b = 0;
	}
	
	if(c_36 < b){
		document.getElementById('c43').value = c_36;
	}else{
		document.getElementById('c43').value = b;
	}
	refreshVars();
	TRGc18();
	TRGc33();
	TRGc34();
	TRGc35();
	TRGc36();
	TRGc36_0();
	TRGc37();
	TRGc40();
	TRGc41();
	TRGc41_0();
	
	TRGc45();
	TRGc46();
	TRGc46_0();
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


function calcular(){
	tipoDeclaracion = document.getElementById('contribuyenteType').value;
	if(tipoDeclaracion == "| 7 | PEQUEÑO CONTRIBUYENTE RURAL (PCR)"){
		c7 = 1;
		c8 = 0;
		disabledCells();
	}
	else if(tipoDeclaracion == "| 8 | MEDIANO CONTRIBUYENTE RURAL (MCR)"){
		c7 = 0;
		c8 = 1;
		enableCells();
	}
	medContribuyente();
}



function calcPorcentajeMoras(){
	var c44 = removeCommas(document.getElementById('c44').value);

	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('c44').value =  CONTRAVENSION_CMOV;//*norectificativa;
		if(document.getElementById('c44').value != null)
  		   colocarpuntos(document.getElementById('c44'));
	}
	var c44 = removeCommas(document.getElementById('c44').value);
	
}

function getFormType(){
	return '113';
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
 return 'anual';
}

function isValidPeriod(nombreCampoPeriodo){
	
	periodValue = getValueFormatless(nombreCampoPeriodo);
	
	/*if(!(parseInt(periodValue,10) == 3 || parseInt(periodValue,10) == 6 || parseInt(periodValue,10) == 9 || parseInt(periodValue,10) == 12)){
		alert('El mes de declaración solo puede ser marzo, junio, septiembre, o diciembre.');
		document.getElementById(nombreCampoPeriodo).value = "";
	}*/

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
	
	/*REsolucion general nro 107 --> NO se pueden presentar declaraciones sin movimiento*/
	var isEmpty = true;
	for (i = 10 ; i <= 177 ; i++) // Recorrer todas las celdas
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
		document.getElementById(targetCellId).value="";
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
	var cell1 = parseInt(document.getElementById(cellSum1).value);
	var cell2 = parseInt(document.getElementById(cellSum2).value);
	var cell3 = parseInt(document.getElementById(targetCellId).value);
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

function disabledCells(){
	document.getElementById('c47').disabled = true;
	document.getElementById('c48').disabled = true;
	document.getElementById('c49').disabled = true;
	document.getElementById('c50').disabled = true;
	document.getElementById('c51').disabled = true;
	document.getElementById('c53').disabled = true;
	document.getElementById('c54').disabled = true;
	document.getElementById('c55').disabled = true;
	document.getElementById('c56').disabled = true;
	document.getElementById('c57').disabled = true;
	document.getElementById('c60').disabled = true;
	document.getElementById('c61').disabled = true;
	document.getElementById('c62').disabled = true;
	document.getElementById('c63').disabled = true;
	document.getElementById('c64').disabled = true;
	document.getElementById('c65').disabled = true;
	document.getElementById('c67').disabled = true;
	document.getElementById('c68').disabled = true;
	document.getElementById('c69').disabled = true;
	document.getElementById('c70').disabled = true;
	document.getElementById('c71').disabled = true;
	document.getElementById('c74').disabled = true;
	document.getElementById('c75').disabled = true;
	document.getElementById('c76').disabled = true;
	document.getElementById('c77').disabled = true;
	document.getElementById('c78').disabled = true;
	document.getElementById('c79').disabled = true;
	document.getElementById('c81').disabled = true;
	document.getElementById('c82').disabled = true;
	document.getElementById('c83').disabled = true;
	document.getElementById('c84').disabled = true;
	document.getElementById('c85').disabled = true;
	document.getElementById('c88').disabled = true;
	document.getElementById('c89').disabled = true;
	document.getElementById('c90').disabled = true;
	document.getElementById('c91').disabled = true;
	document.getElementById('c92').disabled = true;
	document.getElementById('c93').disabled = true;	
	document.getElementById('c95').disabled = true;
	document.getElementById('c96').disabled = true;
	document.getElementById('c97').disabled = true;
	document.getElementById('c98').disabled = true;
	document.getElementById('c99').disabled = true;
	document.getElementById('c102').disabled = true;
	document.getElementById('c103').disabled = true;
	document.getElementById('c104').disabled = true;
	document.getElementById('c105').disabled = true;
	document.getElementById('c106').disabled = true;
	document.getElementById('c107').disabled = true;
	document.getElementById('c109').disabled = true;
	document.getElementById('c110').disabled = true;
	document.getElementById('c111').disabled = true;
	document.getElementById('c112').disabled = true;
	document.getElementById('c113').disabled = true;
	document.getElementById('c116').disabled = true;
	document.getElementById('c117').disabled = true;
	document.getElementById('c118').disabled = true;
	document.getElementById('c119').disabled = true;
	document.getElementById('c120').disabled = true;
	document.getElementById('c121').disabled = true;
	document.getElementById('c123').disabled = true;
	document.getElementById('c124').disabled = true;
	document.getElementById('c125').disabled = true;
	document.getElementById('c126').disabled = true;
	document.getElementById('c127').disabled = true;
	document.getElementById('c130').disabled = true;
	document.getElementById('c131').disabled = true;
	document.getElementById('c132').disabled = true;
	document.getElementById('c133').disabled = true;
	document.getElementById('c134').disabled = true;
	document.getElementById('c135').disabled = true;
	document.getElementById('c137').disabled = true;
	document.getElementById('c138').disabled = true;
	document.getElementById('c139').disabled = true;
	document.getElementById('c140').disabled = true;
	document.getElementById('c141').disabled = true;
	document.getElementById('c144').disabled = true;
	document.getElementById('c145').disabled = true;
	document.getElementById('c146').disabled = true;
	document.getElementById('c147').disabled = true;
	document.getElementById('c148').disabled = true;
	document.getElementById('c149').disabled = true;
	document.getElementById('c151').disabled = true;
	document.getElementById('c152').disabled = true;
	document.getElementById('c153').disabled = true;
	document.getElementById('c154').disabled = true;
	document.getElementById('c155').disabled = true;
	document.getElementById('c158').disabled = true;
	document.getElementById('c159').disabled = true;
	document.getElementById('c160').disabled = true;
	document.getElementById('c161').disabled = true;
	document.getElementById('c162').disabled = true;
	document.getElementById('c163').disabled = true;
	document.getElementById('c164').disabled = true;
	document.getElementById('c165').disabled = true;
	document.getElementById('c166').disabled = true;
	document.getElementById('c167').disabled = true;
	document.getElementById('c168').disabled = true;
	document.getElementById('c169').disabled = true;
	document.getElementById('c170').disabled = true;
	document.getElementById('c171').disabled = true;
	document.getElementById('c172').disabled = true;
	document.getElementById('c173').disabled = true;
	document.getElementById('c174').disabled = true;
}

function enableCells(){
	document.getElementById('c47').disabled = '';
	document.getElementById('c48').disabled = '';
	document.getElementById('c49').disabled = '';
	document.getElementById('c50').disabled = '';
	document.getElementById('c51').disabled = '';
	document.getElementById('c53').disabled = '';
	document.getElementById('c54').disabled = '';
	document.getElementById('c55').disabled = '';
	document.getElementById('c56').disabled = '';
	document.getElementById('c57').disabled = '';
	document.getElementById('c60').disabled = '';
	document.getElementById('c61').disabled = '';
	document.getElementById('c62').disabled = '';
	document.getElementById('c63').disabled = '';
	document.getElementById('c64').disabled = '';
	document.getElementById('c65').disabled = '';
	document.getElementById('c67').disabled = '';
	document.getElementById('c68').disabled = '';
	document.getElementById('c69').disabled = '';
	document.getElementById('c70').disabled = '';
	document.getElementById('c71').disabled = '';
	document.getElementById('c74').disabled = '';
	document.getElementById('c75').disabled = '';
	document.getElementById('c76').disabled = '';
	document.getElementById('c77').disabled = '';
	document.getElementById('c78').disabled = '';
	document.getElementById('c79').disabled = '';
	document.getElementById('c81').disabled = '';
	document.getElementById('c82').disabled = '';
	document.getElementById('c83').disabled = '';
	document.getElementById('c84').disabled = '';
	document.getElementById('c85').disabled = '';
	document.getElementById('c88').disabled = '';
	document.getElementById('c89').disabled = '';
	document.getElementById('c90').disabled = '';
	document.getElementById('c91').disabled = '';
	document.getElementById('c92').disabled = '';
	document.getElementById('c93').disabled = '';	
	document.getElementById('c95').disabled = '';
	document.getElementById('c96').disabled = '';
	document.getElementById('c97').disabled = '';
	document.getElementById('c98').disabled = '';
	document.getElementById('c99').disabled = '';
	document.getElementById('c102').disabled = '';
	document.getElementById('c103').disabled = '';
	document.getElementById('c104').disabled = '';
	document.getElementById('c105').disabled = '';
	document.getElementById('c106').disabled = '';
	document.getElementById('c107').disabled = '';
	document.getElementById('c109').disabled = '';
	document.getElementById('c110').disabled = '';
	document.getElementById('c111').disabled = '';
	document.getElementById('c112').disabled = '';
	document.getElementById('c113').disabled = '';
	document.getElementById('c116').disabled = '';
	document.getElementById('c117').disabled = '';
	document.getElementById('c118').disabled = '';
	document.getElementById('c119').disabled = '';
	document.getElementById('c120').disabled = '';
	document.getElementById('c121').disabled = '';
	document.getElementById('c123').disabled = '';
	document.getElementById('c124').disabled = '';
	document.getElementById('c125').disabled = '';
	document.getElementById('c126').disabled = '';
	document.getElementById('c127').disabled = '';
	document.getElementById('c130').disabled = '';
	document.getElementById('c131').disabled = '';
	document.getElementById('c132').disabled = '';
	document.getElementById('c133').disabled = '';
	document.getElementById('c134').disabled = '';
	document.getElementById('c135').disabled = '';
	document.getElementById('c137').disabled = '';
	document.getElementById('c138').disabled = '';
	document.getElementById('c139').disabled = '';
	document.getElementById('c140').disabled = '';
	document.getElementById('c141').disabled = '';
	document.getElementById('c144').disabled = '';
	document.getElementById('c145').disabled = '';
	document.getElementById('c146').disabled = '';
	document.getElementById('c147').disabled = '';
	document.getElementById('c148').disabled = '';
	document.getElementById('c149').disabled = '';
	document.getElementById('c151').disabled = '';
	document.getElementById('c152').disabled = '';
	document.getElementById('c153').disabled = '';
	document.getElementById('c154').disabled = '';
	document.getElementById('c155').disabled = '';
	document.getElementById('c158').disabled = '';
	document.getElementById('c159').disabled = '';
	document.getElementById('c160').disabled = '';
	document.getElementById('c161').disabled = '';
	document.getElementById('c162').disabled = '';
	document.getElementById('c163').disabled = '';
	document.getElementById('c164').disabled = '';
	document.getElementById('c165').disabled = '';
	document.getElementById('c166').disabled = '';
	document.getElementById('c167').disabled = '';
	document.getElementById('c168').disabled = '';
	document.getElementById('c169').disabled = '';
	document.getElementById('c170').disabled = '';
	document.getElementById('c171').disabled = '';
	document.getElementById('c172').disabled = '';
	document.getElementById('c173').disabled = '';
	document.getElementById('c174').disabled = '';
}



