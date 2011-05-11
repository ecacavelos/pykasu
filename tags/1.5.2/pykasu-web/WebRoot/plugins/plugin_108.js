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
	
	//El form 108 es anual. Y el mes (fijo) de vencimiento es 4.
	document.getElementById('fiscalPeriodMounth').value = 4;
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

	if(salaryAmount=='undefined' || (salaryAmount == null)||(salaryAmount == 0)){
		retriveSalary();
	}
	CalcularVerdaderamenteAl45();
	
	refreshVars();
	TRGc38();
	TRGc38_0();
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
	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){//Si es rectificativa no hay contravención
		document.getElementById('c39').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c39').value != null)
  		   colocarpuntos(document.getElementById('c39'));//NUevo
	}
	refreshVars();
	TRGc40();
	TRGc40_0();
	TRGc41();
	TRGc41_0();
	
	var tmp1 = removeCommas(document.getElementById('c41').value);
	var tmp2 = removeCommas(document.getElementById('c39').value);
	var op = tmp1 - tmp2;
	if(op < 0){
		op = 0;
	}

	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c42').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c42').value != null)
  		   colocarpuntos(document.getElementById('c42'));
	}		
	
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c43').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c43').value != null)
  		   colocarpuntos(document.getElementById('c43'));
	}
	
	refreshVars();
	TRGc44();
	
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
	return '108';
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



function retriveSalary(){
	
	request= GetXmlHttpObject();
	
	//request= new XMLHttpRequest();
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
	
	request.onreadystatechange=calculateC45;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);
}

	
	
/*
* Para ddjj ORIGINALES y RECTIFICATIVAS: 
*	a?o tiene que ser menor al actual
* Para ddjj CLAUSURA:
*	a?o igual
*/
function controlaAnho(){
	var fiscalYear = getValueFormatless('fiscalPeriodYear');
	var declaType = document.getElementById('declarationType').value;
	var fecha = new Date();
	var anhoActual = getActualYear();
	
	if(fiscalYear != 0){
		//Si es clausura tiene que ser menor o igual q el a?o actual
		if(declaType == '| 5 | CLAUSURA'){
			if(fiscalYear > anhoActual){//Mayor o igual? O solo igual se permite
				alert('Para las ddjj de tipo CLAUSURA, el año debe ser el menor o igual al año actual.');
				document.getElementById('fiscalPeriodYear').value = "";
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
		}else{//Si no es clausura, el a?o tiene que ser menor al actual
			if(fiscalYear >= anhoActual){
				alert('Para las ddjj ORIGINALES y RECTIFICATIVAS, el año debe ser menor al año actual.');
				document.getElementById('fiscalPeriodYear').value = "";
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
		} 
	}
	//getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		  
}

/*
Retorna el mes valido de presentacion
para el formulario (que es anual)
Para el 108 el mes es Abril(4)
*/
function getValidMonth(){
	return 4;
}

/*
#MENOR(C[24],C[25])*#BUSCARTASA(38)/100

function calculateC38(){

	var campo24 = getValueFormatless('c24');
	var campo25 = getValueFormatless('c25');
	
	if (campo24 < campo25){
		document.getElementById('c38').value = (campo24 * 0.10).toFixed(0);
	}else {
		document.getElementById('c38').value = (campo25 * 0.10).toFixed(0);
	}
	colocarpuntos(document.getElementById('c38'));
}
*/
/*
#MAYOR(C[37],C[38])+C[39]

function calculateC40(){

	var campo37 = getValueFormatless('c37');
	var campo38 = getValueFormatless('c38');
	var campo39 = getValueFormatless('c39');
	
	if  (campo37 > campo38){
		document.getElementById('c40').value = campo37 + campo39;
	}else{
		document.getElementById('c40').value = campo38 + campo39;
	}
	colocarpuntos(document.getElementById('c40'));
}
*/
/*
Este campo solo se calcula si la 
declaraci?n NO es de tipo Clausura.
*/
function calculateC45(){
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
			CalcularVerdaderamenteAl45();
	}
}	


function CalcularVerdaderamenteAl45(){
			var tipoDecla = document.getElementById('declarationType').value;
			
			if(tipoDecla != '| 5 | CLAUSURA'){
				var campo37 = getValueFormatless('c37');
				var campo38 = getValueFormatless('c38');
				
				if((salaryAmount == 'undefined') || (salaryAmount == null)||(salaryAmount == 0)){
					retriveSalary();
				}
				
				var mayor=0;
					
				if (campo37 > campo38){
				 	mayor = campo37;
				}else{
					mayor  = campo38;
				}					
				
				if (mayor > salaryAmount){
					document.getElementById('c45').value = mayor;
					colocarpuntos(document.getElementById('c45'));
				}else{
					document.getElementById('c45').value = 0;
				}
			}
	refreshVars();
	TRGc47();
	TRGc47_0();
	TRGc48();
	TRGc48_0();
	TRGc49();
	TRGc49_0();

}

/*
Se escoge el menor entre el 
valor del campo 33 y el campo 45.

function calculateC46(){

	var campo33= getValueFormatless('c33');
	var campo45= getValueFormatless('c45');

	if (campo33 < campo45){
		document.getElementById('c46').value = document.getElementById('c33').value;
	}else{
		document.getElementById('c46').value = document.getElementById('c45').value;
	}
}
*/
/*
Se escoge el menor entre el valor 
del campo 36 y el campo 47.

function calculateC48(){

	var campo36 = getValueFormatless('c36');
	var campo47 = getValueFormatless('c47');
	
	if (campo36 < campo47){
		document.getElementById('c48').value = 	document.getElementById('c36').value;
	}else{
		document.getElementById('c48').value = document.getElementById('c47').value;
	}

}
*/
/*################################################################################*/


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
		
	return true;

}

