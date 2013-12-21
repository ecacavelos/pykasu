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
	
	//El form 104 es anual. Y el mes (fijo) de vencimiento es 6.
	document.getElementById('fiscalPeriodMounth').value = 6;
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
/*	
	if((salaryAmount == null)||(salaryAmount == 0)){
		retriveSalary();
	}

	if(document.getElementById('c76').value > salaryAmount){
		document.getElementById('c90').value = document.getElementById('c76').value;	
	}else{
		document.getElementById('c90').value = '';
	}
*/	
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
		document.getElementById('c103').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c103').value != null)
  		   colocarpuntos(document.getElementById('c103'));
	}
	
	var tmp1 = removeCommas(document.getElementById('c107').value);
	var tmp2 = removeCommas(document.getElementById('c103').value);
	var op = tmp1 - tmp2;
	if(op < 0){
		op = 0;
	}

	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c108').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c108').value < 0){
			document.getElementById('c18').value  = 0;
		}
		if(document.getElementById('c108').value != null)
  		   colocarpuntos(document.getElementById('c108'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c109').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c109').value < 0){
			document.getElementById('c109').value  = 0;
		}
		if(document.getElementById('c109').value != null)
  		   colocarpuntos(document.getElementById('c109'));
	}
	
	refreshVars();
	TRGc105();
	TRGc106();
	TRGc106_0();
	TRGc107();
	TRGc107_0();
	TRGc110();
	
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

/*
* Calcula el valor del campo 83.
*/
function calculateC83(){

	var campo82 = getValueFormatless('c82');
	var campo83 = getValueFormatless('c83');

	var campo34 = getValueFormatless('c34');
	var campo45 = getValueFormatless('c45');
	
	var calc = ((campo34 + campo45)*0.3).toFixed(0);

	if(calc <= campo82){
		document.getElementById('c83').value = calc;
  	   	colocarpuntos(document.getElementById('c83'));
	}else if(campo83 > campo82){//Si c83<=c82 se queda el valor de c83, sino pongo en blanco
		alert('El valor del campo 83 no puede superar al valor del campo 82');
		document.getElementById('c83').value = "";
  	   	colocarpuntos(document.getElementById('c83'));
	}
	
}

function getFormType(){
	return '104';
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
		//Si es clausura tiene que ser el a?o actual
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
Usamos la funcion elMenor
function calculateC71(){
	campo71 = getValueFormatless('c71');
	campo31 = getValueFormatless('c31');
	
	if(campo31 < campo71)
		document.getElementById('c71').value = document.getElementById('31').value;
}*/

/*
campoDest toma el valor del menor
entre campo1 y campo2
*/
function elMenor(campoDest, campo1, campo2){
	if(campo1 < campo2)
		document.getElementById(campoDest).value = document.getElementById(campo1).value;
	else
		document.getElementById(campoDest).value = document.getElementById(campo2).value;
}


/*
#SI(C[76]>C[39]*0.1,C[39]*0.1,C[76])
*/
function calculateC76(){
	campo76 = getValueFormatless('c76');
	campo39 = getValueFormatless('c39');
	
	if(campo76 > (campo39 * 0.1)){
		document.getElementById('c76').value = (campo39 * 0.1).toFixed(0);
		colocarPuntos(document.getElementById('c76'));
	}
}

/*
#SI(C[77]>C[40]*0.1,C[40]*0.1,C[77])
*/
function calculateC77(){

	campo77 = getValueFormatless('c77');
	campo40 = getValueFormatless('c40');
	
	if(campo77 > (campo40 * 0.1)){
		document.getElementById('c77').value = (campo40 * 0.1).toFixed(0);
		colocarPuntos(document.getElementById('c77'));
	}
}

/*
#SI(C[83]>C[39]*0.15,C[39]*0.15,C[83])
*/
function calculateC83(){
	campo83 = getValueFormatless('c83');
	campo39 = getValueFormatless('c39');
	
	if(campo83 > (campo39 * 0.15)){
		document.getElementById('c83').value = (campo39 * 0.15).toFixed(0);
		colocarPuntos(document.getElementById('c83'));
	}
}

/*
#SI(C[109]>C[39]*0.2,C[39]*0.2,C[109])
*/
function calculateC109(){

	campo109 = getValueFormatless('c109');
	campo39 = getValueFormatless('c39');
	
	if(campo109 > (campo39 * 0.2)){
		document.getElementById('c109').value = (campo39 * 0.2).toFixed(0);
		colocarPuntos(document.getElementById('c109'));
	}
}

/*
#SI(C[110]>C[40]*0.2,C[40]*0.2,C[110])
*/
function calculateC110(){

	campo110 = getValueFormatless('c110');
	campo40 = getValueFormatless('c40');
	
	if(campo110 > (campo40 * 0.2)){
		document.getElementById('c110').value = (campo40 * 0.2).toFixed(0);
		colocarPuntos(document.getElementById('c110'));
	}
}


/*
si c103 > 0
ver si c97>0
entonces
se hace c99-c97
sino el resultado es c99
*/
function calculateC105(){

	campo103 = getValueFormatless('c103');
	campo97 = getValueFormatless('c97');
	campo99 = getValueFormatless('c99');
	
	if(campo103 > 0){
		if(campo97 > 0){
			document.getElementById('c105').value = document.getElementById('c99').value - document.getElementById('c97').value;
		}else{
			document.getElementById('c105').value = document.getElementById('c99').value;
		}
	}
}

/*
VEr si c104 > 0 entonces
ver si c98 > 0 entonces
resultado = c100- c98
sino
resultado = c100
*/
function calculateC106(){

	campo104 = getValueFormatless('c104');
	campo98 = getValueFormatless('c98');
	campo100 = getValueFormatless('c100');
	
	if(campo104 > 0){
		if(campo98 > 0){
			document.getElementById('c106').value = document.getElementById('c100').value - document.getElementById('c98').value;
		}else{
			document.getElementById('c106').value = document.getElementById('c100').value;
		}
	}
}

/*
#SI(C[39]>120*#BUSCARVALOR(1),C[111]*0.1,C[111]*0.08)
*/
function calculateC113(){
	campo39 = getValueFormatless('c39');
	campo111 = getValueFormatless('c111');

	if((salaryAmount == null)||(salaryAmount == 0)){
		retriveSalary();
	}
	
	var calculo = 120 * salaryAmount;
	
	if(campo39 > calculo)
		document.getElementById('c113').value = (campo111 *0.1).toFixed(0);
	else
		document.getElementById('c113').value = (campo111 *0.08).toFixed(0);
}

/*
#SI(C[39]>120*#BUSCARVALOR(1),C[112]*0.1,C[112]*0.08)
*/
function calculateC114(){
	campo39 = getValueFormatless('c39');
	campo112 = getValueFormatless('c112');

	if((salaryAmount == null)||(salaryAmount == 0)){
		retriveSalary();
	}
	
	var calculo = 120 * salaryAmount;
	
	if(campo39 > calculo)
		document.getElementById('c114').value = (campo112 *0.1).toFixed(0);
	else
		document.getElementById('c114').value = (campo112 *0.08).toFixed(0);

}

