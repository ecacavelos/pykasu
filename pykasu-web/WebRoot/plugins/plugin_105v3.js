var salaryAmount;

var pm_fiscalPeriodMounth = null;

function disabledByCondition(cell, cellConditionId){

	var cellCondition = document.getElementById(cellConditionId);
	
	if(cellCondition == null){
		return
	} 

	var valueCondition = cell.value;	
	if((valueCondition == null) || (valueCondition <= 0)){
		cellCondition.value = "";
		cellCondition.disabled = 'true';
	}else{
		cellCondition.disabled = '';
		
	}
	refreshVars();
	
}

//Funcion que se realizo para esta regla //# SI (C[137]=0, 0, C[138]). 
function checkIfContent(cellToTest, targetCellId){//c15 c23
	
	var cellCondition = document.getElementById(targetCellId);
	
	if(cellToTest.value == null || cellToTest.value == 0){
		cellCondition.value="";
		cellCondition.disabled = 'true';
	}
	else {
		cellCondition.disabled = '';
		cellCondition.focus();
	}
	refreshVars();
	TRGc137();
	TRGc149();
	if(cellToTest == c128){
		TRGc137();
	}
	if(cellToTest == c15){
		TRGc16();
	}
	
}

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
	
	
	
	disabledByCondition(document.getElementById('c15'), 'c23');
	disabledByCondition(document.getElementById('c15'), 'c24');
	disabledByCondition(document.getElementById('c40'), 'c53');
	
	disabledByCondition(document.getElementById('c128'), 'c138');
	disabledByCondition(document.getElementById('c129'), 'c139');
	disabledByCondition(document.getElementById('c130'), 'c140');
	disabledByCondition(document.getElementById('c131'), 'c141');
	disabledByCondition(document.getElementById('c132'), 'c142');
	disabledByCondition(document.getElementById('c133'), 'c143');
	disabledByCondition(document.getElementById('c134'), 'c144');
	disabledByCondition(document.getElementById('c135'), 'c145');
	disabledByCondition(document.getElementById('c136'), 'c146');
	
	disabledByCondition(document.getElementById('c138'), 'c150');
	disabledByCondition(document.getElementById('c139'), 'c151');
	disabledByCondition(document.getElementById('c140'), 'c152');
	disabledByCondition(document.getElementById('c141'), 'c153');
	disabledByCondition(document.getElementById('c142'), 'c154');
	disabledByCondition(document.getElementById('c143'), 'c155');
	disabledByCondition(document.getElementById('c144'), 'c156');
	disabledByCondition(document.getElementById('c145'), 'c157');
	disabledByCondition(document.getElementById('c146'), 'c158');
	disabledByCondition(document.getElementById('c147'), 'c159');
	disabledByCondition(document.getElementById('c148'), 'c160');
	
	document.getElementById('fiscalPeriodMounth').value =getValidMonth();
	pm_fiscalPeriodMounth = getValidMonth(); 				
	
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

// Funcion retocada del formulario 105, adaptada para 105v2.
function calcPorcentajeMoras(){

	if (pm_called == 0){
		getFiscalMoraInfo();
		return;
	}
	
	var norectificativa = 1;
	if (document.getElementById('declarationType').value=='| 2 | RECTIFICATIVA'){
		norectificativa = 0;
	}
	if(CONTRAVENSION_SMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('c76').value =  CONTRAVENSION_CMOV * norectificativa;	
		if(document.getElementById('c76').value == 0){
			document.getElementById('c76').value == "";
		}
		if(document.getElementById('c76').value != null)
  		   colocarpuntos(document.getElementById('c76'));
	}
	refreshVars();
	TRGc78();
	TRGc80();
	TRGc80_0();
	var tmp = (0).toFixed(0);
}


function getFormType(){
	return '105v3';
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
				&&(anho == anhoform)
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

function mustBeMinor()
{
	var tmp_82= parseInt(removeCommas(document.getElementById('c82').value));
	var tmp_83= parseInt(removeCommas(document.getElementById('c83').value));
	
	if (tmp_83 > tmp_82) 
	{
		alert("El campo 83 no puede exceder el valor del campo 82");
		document.getElementById("c83").value='';
	}
}


/*
Retorna el mes valido de presentacion
para el formulario (que es anual)
Para el 105 el mes es Mayo(4)
*/
function getValidMonth(){
	return 5;
}

/*##################################################################
	ULTIMOS CONTROLES ANTES DEL SUBMIT
####################################################################*/

function giveFormType(){
 return 'anual';
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
	for (i = 10 ; i <= 159 ; i++) // Recorrer todas las celdas
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