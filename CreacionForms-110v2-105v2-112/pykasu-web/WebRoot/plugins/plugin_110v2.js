var salaryAmount;

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
	
	//El form 110 es anual. Y el mes (fijo) de vencimiento es 5.
	document.getElementById('fiscalPeriodMounth').value = 5;
	checkIfContent(document.getElementById('c103'),'c104');
	checkIfContent(document.getElementById('c105'),'c106');
	checkIfContent(document.getElementById('c107'),'c108');
	checkIfContent(document.getElementById('c109'),'c110');
	checkIfContent(document.getElementById('c111'),'c112');
	checkIfContent(document.getElementById('c113'),'c114');
	checkIfContent(document.getElementById('c115'),'c116');
	checkIfContent(document.getElementById('c117'),'c118');
	checkIfContent(document.getElementById('c119'),'c120');
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
	var tmp39= getValueFormatless('c39');
	var tmp35= getValueFormatless('c35');
	var tmp54= getValueFormatless('c54');
/*	
	if (tmp39 > 0){
		//document.getElementById('c35').value=getValueFormatless('c83');
		document.getElementById('c35').value=document.getElementById('c83').value;
	}else{
		document.getElementById('c35').value='';
		if (tmp39 == 0){
			//document.getElementById('c54').value=getValueFormatless('c83');
			document.getElementById('c54').value=document.getElementById('c83').value;
		}
	}	
	
	if((salaryAmount == null)||(salaryAmount == 0)){
		retriveSalary();
	}

	if(document.getElementById('c76').value > salaryAmount){
		document.getElementById('c90').value = document.getElementById('c76').value;	
	}else{
		document.getElementById('c90').value = '';
	}
*/

//reCalc();	
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
		document.getElementById('c48').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c48').value != null)
  		   colocarpuntos(document.getElementById('c48'));
	}
	
	var tmp1 = removeCommas(document.getElementById('c52').value);
	var tmp2 = removeCommas(document.getElementById('c48').value);
	var op = tmp1 - tmp2;
	if(op < 0){
		op = 0;
	}

	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c53').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c53').value < 0){
			document.getElementById('c18').value  = 0;
		}
		if(document.getElementById('c53').value != null)
  		   colocarpuntos(document.getElementById('c53'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c54').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c54').value < 0){
			document.getElementById('c54').value  = 0;
		}
		if(document.getElementById('c54').value != null)
  		   colocarpuntos(document.getElementById('c54'));
	}
	
	refreshVars();
	TRGc50();
	TRGc51();
	TRGc51_0();
	TRGc52();
	TRGc52_0();
	TRGc55();
	
	var tmp = (0).toFixed(0);

}
//Funcion que se realizo para esta regla //# SI (C[137]=0, 0, C[138]). 
function checkIfContent(cellToTest, targetCellId){
	
	var cellCondition = document.getElementById(targetCellId);
	
	if(cellToTest.value == null || cellToTest.value == 0){
		cellCondition.value=0;
		cellCondition.disabled = 'true';
	}
	else {
		cellCondition.value="";
		cellCondition.disabled = '';
		cellCondition.focus();
	}
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
	if(campo1 < campo2){
		alert('El valor de la casilla '+ c2 + ' no puede ser mayor al valor de la casilla ' + c1);
		document.getElementById(c2).value = "";
	}		
}
/*Controla si c1 es 0 entonces en c2 se pone 0, de lo contrario, no se toca c2*/
function controlIfZero(c1, c2){
	var campo1 = getValueFormatless(c1);
	var campo2 = getValueFormatless(c2);
	if (campo1 == 0){
	 	document.getElementById(c2).value='0';
	 	return;
	}		
}

/*
* Calcula el valor del campo 83.
*/
//function calculateC83(){
//
//	var campo82 = getValueFormatless('c82');
//	var campo83 = getValueFormatless('c83');
//
//	var campo34 = getValueFormatless('c34');
//	var campo45 = getValueFormatless('c45');
//	
//	var calc = ((campo34 + campo45)*0.3).toFixed(0);
//
//	if(calc <= campo82){
//		document.getElementById('c83').value = calc;
//  	   	colocarpuntos(document.getElementById('c83'));
//	}else if(campo83 > campo82){//Si c83<=c82 se queda el valor de c83, sino pongo en blanco
//		alert('El valor del campo 83 no puede superar al valor del campo 82');
//		document.getElementById('c83').value = "";
//  	   	colocarpuntos(document.getElementById('c83'));
//	}
//	
//}

function getFormType(){
	return '110v2';
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


/*
function retriveSalary(){
	
	request= GetXmlHttpObject();
	
	request= new XMLHttpRequest();
	if (request == null){
		alert('El sitio no soporta AJAX');
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
		if(document.getElementById('c76').value > salaryAmount){
			document.getElementById('c90').value = document.getElementById('c76').value;	
		}else{
			document.getElementById('c90').value = '';
		}
		
	}
	*/
	
	
/*
* Para ddjj ORIGINALES y RECTIFICATIVAS: 
*	a–o tiene que ser menor al actual
* Para ddjj CLAUSURA:
*	a–o igual
*/
function controlaAnho(){
	var fiscalYear = getValueFormatless('fiscalPeriodYear');
	var declaType = document.getElementById('declarationType').value;
	var fecha = new Date();
	var anhoActual = getActualYear();
	
	if(fiscalYear != 0){
		//Si es clausura tiene que ser el a–o actual
		if(declaType == '| 5 | CLAUSURA'){
			if(fiscalYear != anhoActual){
				alert('Para las ddjj de tipo CLAUSURA, el anho debe ser el anho actual');
				document.getElementById('fiscalPeriodYear').value = "";
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
		}else{//Si no es clausura, el a–o tiene que ser menor al actual
			if(fiscalYear >= anhoActual){
				alert('Para las ddjj ORIGINALES y RECTIFICATIVAS, el anho debe ser menor al anho actual');
				document.getElementById('fiscalPeriodYear').value = "";
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
		} 
	}
	getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		  
}

/*
Retorna el mes valido de presentacion
para el formulario (que es anual)
Para el 110 el mes es Mayo(5)
*/
function getValidMonth(){
	return 5;
}

/*
Si el campo 39 tiene algun valor
al campo 35 se le coloca el valor del 
campo 83

function calculateC35(){

	var campo39 = getValueFormatless('c39');

	if(campo39 != 0){
		document.getElementById('c35').value = getValueFormatless('c83').toFixed(0);
		colocarpuntos(document.getElementById('c35'));
	}else{
		document.getElementById('c35').value = "";
	}
}
*/
/*
Si no hay valor en el campo 39 
al campo 54 toma el valor del 
campo 83

function calculateC54(){

	var campo39 = getValueFormatless('c39');

	if(campo39 == 0){
		document.getElementById('c54').value = getValueFormatless('c83').toFixed();
		colocarpuntos(document.getElementById('c54'));
	}else{
		document.getElementById('c54').value = "";
		}
}
*/
/*Toma el valor del campo 93
function calculateC70(){

	document.getElementById('c70').value = getValueFormatless('c93');
}
/*
Diferencia de los valores del campo 82 con el campo 83. 
Si el resultado de la diferencia es 
negativo, el campo 84 es cero (0).

function calculateC84(){

	var campo82 = getValueFormatless('c82');
	var campo83 = getValueFormatless('c83');
	
	var dif = campo82 - campo83;
	
	if(dif < 0){
		document.getElementById('c84').value = 0;
	}else{
		document.getElementById('c84').value = dif;
	}

}

/*
Diferencia de los valores del campo 87 con el campo 88. 
Si el resultado de la diferencia es negativo, 
el campo 89 es cero (0).

function calculateC89(){

	var campo87 = getValueFormatless('c87');
	var campo88 = getValueFormatless('c88');
	
	var dif = campo87 - campo88;
	
	if(dif < 0){
		document.getElementById('c89').value = 0;
	}else{
		document.getElementById('c89').value = dif;
	}

}

/*
Diferencia de los valores del campo 92 con el campo 93. 
Si el resultado de la diferencia es negativo, 
el campo 94 es cero (0).

function calculateC94(){

	var campo92 = getValueFormatless('c92');
	var campo93 = getValueFormatless('c93');
	
	var dif = campo92 - campo93;
	
	if(dif < 0){
		document.getElementById('c94').value = 0;
	}else{
		document.getElementById('c94').value = dif;
	}

}

/*
* Se calcula el 2,5% del valor del campo 39.
* c95= c39 *(2,5/100)

function calculateC95(){
	document.getElementById('c95').value = getValueFormatless('c39') * 0.025;
}

function calculateC96(){
	document.getElementById('c96').value = getValueFormatless('c81') * 0.1;
}

function calculateC102(){
	document.getElementById('c102').value = getValueFormatless('c88');

}

function calculateC104(){
	document.getElementById('c104').value = getValueFormatless('c97')+getValueFormatless('c98')+
getValueFormatless('c99')+getValueFormatless('c100')+getValueFormatless('c101')+getValueFormatless('c102');

}

function calculateC105(){
	document.getElementById('c105').value = getValueFormatless('c95')+getValueFormatless('c96')+
getValueFormatless('c103');

}

/*Diferencia de los valores del campo104 
con el campo 105. Si el resultado de la 
diferencia es negativo, el campo 106 es cero (0).
function calculateC106(){
	var dif = getValueFormatless('c104')-getValueFormatless('c105');
	if(dif < 0){
		document.getElementById('c106').value = 0;
	}else{
		document.getElementById('c106').value = dif;
}
}

/*Diferencia de los valores del campo105  
con el campo 104. Si el resultado de la diferencia 
es negativo, el campo 107 es cero (0).
function calculateC107(){
	var dif = getValueFormatless('c105')-getValueFormatless('c104');
	if(dif < 0){
		document.getElementById('c107').value = 0;
	}else{
		document.getElementById('c107').value = dif;
}
}

/*Operaci?n: Diferencia de los valores del campo107  con el campo 103. 
Si el resultado de la operaci?n  es negativo, entonces es cero (0).
Luego, aplicarle la tasa 
de multa al resultado de la operaci?n.
function calculateC108(){
	var dif = getValueFormatless('c107')-getValueFormatless('c103');
	if(dif < 0){
		document.getElementById('c108').value = 0;
	}else{
		document.getElementById('c108').value = dif * tasa_multa; //VER
}
}

function calculateC109(){
	var dif = getValueFormatless('c107')-getValueFormatless('c103');
	if(dif < 0){
		document.getElementById('c109').value = 0;
	}else{
		document.getElementById('c109').value = dif * tasa_interes; //VER
}
}

function calculateC110(){
document.getElementById('c110').value = getValueFormatless('c107')+getValueFormatless('c108')+ getValueFormatless('c109');
}

*/
/**
function reCalc(){
	refreshVars();
	
	TRGc39();
	TRGc39_0();
	TRGc35();
	TRGc35_0();
	TRGc35_1();
	TRGc37();
	TRGc54();
	TRGc54_0();
	TRGc62();
	TRGc64();
	TRGc72();
	TRGc72_0();
	TRGc74();
	TRGc74_0();
	TRGc76();
	TRGc78();
	TRGc80();
	TRGc80_0();
	
}
**/

function beforeSave(){

//  var tmp_c35 = notNullVaule(parseInt(removeCommas(document.getElementById('c35').value)));
//  var tmp_c39 = notNullVaule(parseInt(removeCommas(document.getElementById('c39').value)));
//  var tmp_c54 = notNullVaule(parseInt(removeCommas(document.getElementById('c54').value)));
//  var tmp_c83 = notNullVaule(parseInt(removeCommas(document.getElementById('c83').value)));
//	
//	if (tmp_c83 > 0){
//			if (tmp_c39 != null && tmp_c39 > 0){
//			
//					if (tmp_c35 == null || tmp_c35 != tmp_c83){
//						alert("Error\n El campo 35 debe ser igual al valor del campo 83");
//						document.getElementById('c35').value='';
//						return false;
//					}
//					
//					if (!controlThirtySeven()){
//						return false;			
//					}
//					
//					if (!controlThirtyNine()){
//						return false;
//					}
//				
//			}else{
//					if (!controlThirtySeven()){
//						return false;			
//					}
//					
//					if (!controlThirtyNine()){
//						return false;
//					}
//					
//					if(tmp_c35 == tmp_c83){
//						alert("Error\n El campo 35 debe ser cero");
//						return false;			
//					}
//					if(tmp_c54 == null || tmp_c54 != tmp_c83){
//						alert("Error\n El campo 54 debe ser igual al valor del  campo 83");
//						document.getElementById('c54').value='';
//						return false;			
//					}
//			}
//			 
//	}else{
//			if (!controlThirtySeven()){
//				return false;			
//			}
//								
//			if (!controlThirtyNine()){
//				return false;
//			}
//	}	
	return true;
 }		

function notNullVaule(value){
if (value > 0 ){
	return value;
}else{
	return 0;
}
	
}

function controlThirtyNine(){
//	var tmp_c37 = notNullVaule(parseInt(removeCommas(document.getElementById('c37').value)));
//	var tmp_c38 = notNullVaule(parseInt(removeCommas(document.getElementById('c38').value)));
//	var tmp_c39 = notNullVaule(parseInt(removeCommas(document.getElementById('c39').value)));
//	var op= tmp_c38 - tmp_c37; 			
//			
//	if (op > 0){
//			if (tmp_c39 != op){
//					alert("Error\n El campo 39 debe ser igual a la diferencia de los  campos 38 y 37");
//					document.getElementById('c39').value='';
//					return false;			
//			}
//	}else{
//		if (tmp_c39 != 0){
//			alert("Error\n El campo 39 debe ser cero.");
//			document.getElementById('c39').value='';
//			return false;			
//		}
//	}
//	return true;
//}
//
//function controlThirtySeven(){
//	var tmp_c35 = notNullVaule(parseInt(removeCommas(document.getElementById('c35').value)));
//	var tmp_c36 = notNullVaule(parseInt(removeCommas(document.getElementById('c36').value)));
//	var tmp_c37 = notNullVaule(parseInt(removeCommas(document.getElementById('c37').value)));
//	var op= tmp_c35 + tmp_c36; 	
//
//	if (tmp_c37 == null || tmp_c37 != op){
//		alert("Error\n El campo 37 debe ser igual a la suma de los  campos 35 y 36");
//		document.getElementById('c37').value='';
//		return false;
//	}
//	return true;
}

