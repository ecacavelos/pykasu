var salaryAmount;

var pm_fiscalPeriodMounth = null;

function disabledByCondition105(cell, cellConditionId){

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
}

//Funcion que se realizo para esta regla //# SI (C[137]=0, 0, C[138]). 
function checkIfContent(cellToTest, targetCellId){
	
	var cellCondition = document.getElementById(targetCellId);
	
	if(cellToTest.value == null || cellToTest.value == 0){
		cellCondition.value=0;
		cellCondition.disabled = 'true';
	}
	else {
//		cellCondition.value="";
		cellCondition.disabled = '';
		cellCondition.focus();
	}
	refreshVars();
	TRGc155();
	TRGc156();

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
	
	
	
	disabledByCondition105(document.getElementById('c15'), 'c23');
	disabledByCondition105(document.getElementById('c15'), 'c24');
	disabledByCondition105(document.getElementById('c40'), 'c53');

	
	document.getElementById('c138').disabled = 'true';
	document.getElementById('c140').disabled = 'true';
	document.getElementById('c142').disabled = 'true';
	document.getElementById('c144').disabled = 'true';
	document.getElementById('c146').disabled = 'true';
	document.getElementById('c148').disabled = 'true';
	document.getElementById('c150').disabled = 'true';
	document.getElementById('c152').disabled = 'true';
	document.getElementById('c154').disabled = 'true';
	
	
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
		document.getElementById('c82').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c82').value != null)
  		   colocarpuntos(document.getElementById('c82'));
	}
	refreshVars();

	var tmp82 =	getValueFormatless('c82');
	var tmp86 = getValueFormatless('c86');	
	var op = tmp86 - tmp82;
	if(op < 0){
		op = 0;
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c87').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c87').value < 0){
			document.getElementById('c87').value  = 0;
		}
		if(document.getElementById('c87').value != null)
  		   colocarpuntos(document.getElementById('c87'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c88').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c88').value < 0){
			document.getElementById('c88').value  = 0;
		}
		if(document.getElementById('c88').value != null)
  		   colocarpuntos(document.getElementById('c88'));
	}
	
	refreshVars();
	TRGc84();
	TRGc83();
	TRGc86();
	TRGc89();
	
	

	var tmp = (0).toFixed(0);
}


function getFormType(){
	return '105v2';
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
function calculateC78(){

	var campo77 = getValueFormatless('c77');
	var campo78 = getValueFormatless('c78');

	var campo15 = getValueFormatless('c15');

	var calc = campo15*0.3;

	if (campo78 <= calc){
		if(campo78 > campo77){
			alert('El valor del campo 78 no puede superar al valor del campo 77');
			document.getElementById('c78').value = "";
	  	   	colocarpuntos(document.getElementById('c78'));
	  	}
	}else{
		if (calc <= campo77){
			document.getElementById('c78').value = calc;
	  	   	colocarpuntos(document.getElementById('c78'));
		}else{
			document.getElementById('c78').value = "";
	  	   	colocarpuntos(document.getElementById('c78'));
		}
	}
	
}
*/
// Segun documento de Referencia: Impuesto resultante (Inc. d x 10 %)
function calculateC72(){

	var campo71 = getValueFormatless('c71');
	
	document.getElementById('c72').value = campo71*0.1;
	colocarpuntos(document.getElementById('c72'));
	   	
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
/*#########################################################
	FUNCIONES SIN USO.
#########################################################

function beforeSave(){

	fecha = new Date();
	var anho = getActualYear();
	var anhoform = getValueFormatless('fiscalPeriodYear');	
	
	var v120 = removeCommas(document.getElementById("c120").value);
	if(v120!='' && v120.length != 4){
		alert('El a�o debe tener cuatro d�gitos.');
		return false;
	}
	
	if(parseInt(v120)< 1900){
		alert('El a�o debe ser mayor al 1900.');
		return false;		
	}
	
	var server = document.getElementById("serverActualDate").value;
	sp = server.split('/');
	if(v120.replace(' ','') > sp[2].replace(' ','')){
		alert('El valor del campo 120 debe ser menor que el a�o actual.');
		return false;
	}

	if(!(
		(
			(document.getElementById('declarationType').value == '| 5 | CLAUSURA') 
			&&(anho == anhoform)
		) 
	   || (anhoform < anho)  )
	){
		alert('A�o de presentaci�n incorrecto. El a�o debe ser menor al a�o corriente. En el caso de CLAUSURA, el a�o puede ser el mismo que el corriente.');
		document.getElementById('fiscalPeriodYear').focus();
		return false;
	}

	return true;
}

function retriveSalary(){
	
	request= GetXmlHttpObject();

	//request= new XMLHttpRequest();

	if (request == null){
		alert('El sitio no soporta AJAX.');
		return;
	}

	var fpMonth = document.getElementById('fiscalPeriodMounth').value.toUpperCase();
	var fpYear  = document.getElementById('fiscalPeriodYear').value.toUpperCase();

	if((fpMonth == null)||(fpYear==null)||(fpMonth == '')||(fpYear == '')){		
		return;
	}

	var url = 'getSalary.do'
	url = url + '?id='+Math.random();
	url = url + '&fpMonth='+fpMonth;
	url = url + '&fpYear=' + fpYear;
	
	request.onreadystatechange=calculateC90;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);
}

function calculateC90(){
	if(request.readyState == 4 || request.readyState == 'complete'){
		
		var xmlDoc = request.responseXML;
	
		var values = xmlDoc.getElementsByTagName("salary-info");
		
				
		for (i=0; i<values[0].childNodes.length; i++){
			if (values[0].childNodes[i].nodeName == 'salary'){
				for (j = 0; j<values[0].childNodes[i].childNodes.length; j++){
					if (values[0].childNodes[i].childNodes[j].nodeName == 'salary-amount'){					
						salaryAmount = values[0].childNodes[i].childNodes[j].firstChild.nodeValue;
					}
				}
			}//if comentario
		}
	//	alert('salaryAmount: ' + salaryAmount);
		if(getValueFormatless('c76') > parseInt(salaryAmount)){
			document.getElementById('c90').value = document.getElementById('c76').value;	
		}else{
			document.getElementById('c90').value = '';
		}
	}
}

*/