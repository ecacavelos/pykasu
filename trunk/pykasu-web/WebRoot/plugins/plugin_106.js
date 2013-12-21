var salaryAmount;
oriRectiFlag=false;
var pm_fiscalPeriodMounth = null;
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
	//document.getElementById('c19').readOnly = true;
	//document.getElementById('c19').className = "readonly";
	//El form 106 es anual. Y el mes (fijo) de vencimiento es 3.
	document.getElementById('fiscalPeriodMounth').value = 3;
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
* Si la declaracion es RECTIFICATIVA no se calcula contravenci?n
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
		document.getElementById('c23').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c23').value != null)
  		   colocarpuntos(document.getElementById('c23'));
	}else{
	
		if(oriRectiFlag){
			document.getElementById('c23').value = norectificativa;
		
		}
	}
	
	var tmp1 = removeCommas(document.getElementById('c27').value);
	var tmp2 = removeCommas(document.getElementById('c23').value);
	var op = tmp1 - tmp2;
	if(op < 0){
		op = 0;
	}

	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c28').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c28').value != null)
  		   colocarpuntos(document.getElementById('c28'));
	}		

	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c29').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c29').value != null)
  		   colocarpuntos(document.getElementById('c29'));
	}
	
	refreshVars();
	
	TRGc25();
	TRGc26();
	TRGc26_0();
	TRGc27();
	TRGc27_0();
	TRGc30();
	
	var tmp = (0).toFixed(0);

}

/*
* La casilla 1 (c1) es la casilla con menor nro
* (entre c19 y c20, c19 = c1 y c20 = c2)
* Si c1 es mayor que c2 hay error, y c2 se pone en blanco.

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
*/

function orirecti(){

	try{
		var decType = document.getElementById('declarationType');
		var rectPPN = document.getElementById('rectificativePPN');
		
		rectPPN.disabled = 'true';
		
		if (decType.value == "| 2 | RECTIFICATIVA"){			
			rectPPN.disabled = '';
			oriRectiFlag=true;
		}
		else{	
			rectPPN.value = '';				
			rectPPN.disabled = 'true';
			oriRectiFlag=false;
		}
	
		pm_called = 1;//para que no llame al servidor..
		
		calcPorcentajeMoras();	
	
	}catch(e){
		//alert('error al calcular Origen');
	}	

}




function controlaAnho(){
	var anhoform = getValueFormatless('fiscalPeriodYear');

	if(anhoform != 0){
		fecha = new Date();
		var anho = getActualYear();

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
			document.getElementById('fiscalPeriodYear').value = '';//Borro el campo a�o
			document.getElementById('fiscalPeriodYear').focus();
			return;
		}
	}
}
/*
function controlaAnho(){
	var fiscalYear = getValueFormatless('fiscalPeriodYear');
	var declaType = document.getElementById('declarationType').value;
	var fecha = new Date();
	var anhoActual = getActualYear();
	
	if(fiscalYear != 0){
		//Si es clausura tiene que ser menor o igual q el a�o actual
		if(declaType == '| 5 | CLAUSURA'){
			if(fiscalYear > anhoActual){//Mayor o igual? O solo igual se permite
				alert('Para las ddjj de tipo CLAUSURA, el a�o debe ser el menor o igual al a�o actual.');
				document.getElementById('fiscalPeriodYear').value = "";
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
		}else{//Si no es clausura, el a�o tiene que ser menor al actual
			if(fiscalYear >= anhoActual){
				alert('Para las ddjj ORIGINALES y RECTIFICATIVAS, el a�o debe ser menor al a�o actual.');
				document.getElementById('fiscalPeriodYear').value = "";
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
		} 
	}
	getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		 
}


Retorna el mes valido de presentacion
para el formulario (que es anual)
Para el 106 el mes es Marzo(3)
*/
function getValidMonth(){
	return 3;
}

function getFormType(){
	return '106';
}
/*CESQUIVEL 3-11-2007
NO HACE FALTA HACER ESTA FUNCION
function calculateC16(){

	var campo13= getValueFormatless('c13');
	var campo15= getValueFormatless('c15');
	
	if (campo13 < campo15){
		document.getElementById('c16').value = document.getElementById('c13').value;
	}else{
		document.getElementById('c16').value = document.getElementById('c15').value;
	}
}
*/
/*
Si el anho de declaracion es 2007,
entonces se inhabilita el campo 19
*/
function controlInhabilitaCampo19(){
	var anio = getValueFormatless('fiscalPeriodYear');
	
	if(anio == 2007){//Si es abril de 2007, se inhabilita
		document.getElementById('c19').readOnly = true;
		document.getElementById('c19').className = "readonly";
		
	}else{//Ya esta con estos valores por defecto, pero por si se vuelve a habilitar lo ponemos.
		document.getElementById('c19').readOnly = false;
		document.getElementById('c19').className = "default";
	}

}

/**##########################################################################################**/
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
	for (i = 10 ; i <= 30 ; i++) // Recorrer todas las celdas
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
