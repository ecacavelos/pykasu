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
	document.getElementById('fiscalPeriodMounth').value = 3;
	
	/*No hace falta porque ya es readonly
	document.getElementById('c19').disabled = '';
	document.getElementById('c20').disabled = '';
	document.getElementById('c21').disabled = '';*/		
}

function calculateBeforePlugin(){

}

function enabledByDate(){
	/*No hace falta deshabilitar porque ya son readonly los campos
	var year = getValueFormatless('fiscalPeriodYear');
	if(year == 2006){
		document.getElementById('c19').disabled = '';
		document.getElementById('c20').disabled = '';
		document.getElementById('c21').disabled = '';		
	}else{
		document.getElementById('c19').disabled = 'true';
		document.getElementById('c20').disabled = 'true';
		document.getElementById('c21').disabled = 'true';		
	}*/
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


function calcPorcentajeMoras(){
	if (pm_called == 0){
		getFiscalMoraInfo();
		return;
	}
	
	var norectificativa = 1;
	if (document.getElementById('declarationType').value=='| 2 | RECTIFICATIVA'){
		norectificativa = 0;
	}
	if(CONTRAVENSION_CMOV && CONTRAVENSION_CMOV != null){
		document.getElementById('c25').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c25').value != null)
  		   colocarpuntos(document.getElementById('c25'));
	}
	
	var op = getValueFormatless('c23') - getValueFormatless('c24') - getValueFormatless('c26');
	if(op < 0){
		op = 0;
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c27').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c27').value < 0){
			document.getElementById('c27').value  = 0;
		}
		if(document.getElementById('c27').value != null)
  		   colocarpuntos(document.getElementById('c27'));
	}		
	
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c28').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c28').value < 0){
			document.getElementById('c28').value  = 0;
		}
		if(document.getElementById('c28').value != null)
  		   colocarpuntos(document.getElementById('c28'));
	}
	
	refreshVars();
	TRGc29();
	TRGc29_0();
	var tmp = (0).toFixed(0);
	
}


function getFormType(){
	return '804';
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
/*
	if(  (document.getElementById('fiscalPeriodYear') != null) 
	  && (document.getElementById('fiscalPeriodYear').value != 0)
	){
		
		fecha = new Date();
		var anho = fecha.getYear()+1900;
		
		if(anho >= document.getElementById('fiscalPeriodYear').value){
			alert("Anho de presentacion incorrecto. El anho debe ser menor al anho corriente");
			document.getElementById('fiscalPeriodYear').focus();
			return;
		}
		
		getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		  
	}
	*/
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
	function controlaAnho(){
		if(  (document.getElementById('fiscalPeriodYear') != null) 
		  && (document.getElementById('fiscalPeriodYear').value != 0)
		){
			
			fecha = new Date();
			var anho = fecha.getYear()+1900;
			
			if(anho >= document.getElementById('fiscalPeriodYear').value){
				alert("Anho de presentacion incorrecto. El anho debe ser menor al anho corriente");
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
			
			getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		  
		}
	}

}
*/	

/*
Valida el valor ingresado en el campo 26
*/
function validateDeclaredAmount(nombreCampo){

	//var tmp1 = document.getElementById(nombreCampo).value;//var1
	var tmp1 = getValueFormatless(nombreCampo);//var1
	var tc22 = getValueFormatless('c22');
	var tc23 = getValueFormatless('c23');
	var tc24 = getValueFormatless('c24');
	var tc25 = getValueFormatless('c25');
	
	var tmp2 = tc22 * 0.5;//var2 TODO : VER SI ASI ES LA COMA
	var tmp3 = tc23 + tc25 - tc24;
	
	if (tmp3 < 0 ){
		tmp3=0;
	}	
			
	if (tmp2 < tmp3 ){
		if (tmp1 > tmp2){
			alert('El valor declarado no puede superar el 50% del campo 22');
			document.getElementById(nombreCampo).value='';
		}
	}else{
		if (tmp1 > tmp3){
		    alert('El valor declarado no puede superar la suma de los campos 23+25-24');
		    document.getElementById(nombreCampo).value='';
		}
	}	
}

function calculateC23(){
var op=0;
var campo8 = getValueFormatless('c8');
var campo9 = getValueFormatless('c9');
var campo10 = getValueFormatless('c10');
var campo11 = getValueFormatless('c11');
var campo12 = getValueFormatless('c12');
var campo13 = getValueFormatless('c13');

var tasa = getTasa(document.getElementById('fiscalPeriodYear').value);

	if(tasa != 0){
	
		var calc=(campo8 + campo9 + campo10 + campo11 + campo12)		 
	
	 	if (calc > campo13){
			op= calc * tasa;
		 	document.getElementById('c23').value = op.toFixed(0) ;
		}else{
		 	op= campo13* tasa;
		 	document.getElementById('c23').value = op.toFixed(0) ;
		}
			colocarpuntos(document.getElementById('c23'));
	}

}

/*
Calcula la tasa:
- es 3%, si el periodo de declaraci?n est?
entre el 01/01/1990 al 31/12/1997
- es 4% entre 01/01/1998 hasta ahora
*/
function getTasa(periodYear){
	var tasa = 0;
	var anhoActual = new Date();
	
	if(periodYear != ""){
		var periodYear = parseInt(removeCommas(periodYear), 10);
		

		if(periodYear >= 1990 && periodYear <= 1997){
			tasa = 0.03;	
		}else if(periodYear >= 1998 && periodYear <= anhoActual.getYear()+1900){
			tasa = 0.04;
		}
	}

	return tasa;
}
/*
Funciones que calculan los campos 19, 20 y 21.
(tres funciones iguales por si el calculo de alguno de los campos var?a.)
*/
function calculateC19(){
	var year = getValueFormatless('fiscalPeriodYear');
	if(year < 2006){
		document.getElementById('c19').value = getValueFormatless('c15') * 0.1;
		colocarpuntos(document.getElementById('c19'));
	}else{
		document.getElementById('c19').value = '0';
		document.getElementById('c19').readOnly = true;
		document.getElementById('c19').className = "readonly";
	}
}

function calculateC20(){
	var year = getValueFormatless('fiscalPeriodYear');
	if(year < 2006){
		document.getElementById('c20').value = getValueFormatless('c16') * 0.1;
		colocarpuntos(document.getElementById('c20'));
	}else{
		document.getElementById('c20').value = '0';
		document.getElementById('c20').readOnly = true;
		document.getElementById('c20').className = "readonly";
	}
}

function calculateC21(){
	var year = getValueFormatless('fiscalPeriodYear');
	if(year < 2006){
		document.getElementById('c21').value = getValueFormatless('c17') * 0.1;
		colocarpuntos(document.getElementById('c21'));
	}else{
		document.getElementById('c21').value = '0';
		document.getElementById('c21').readOnly = true;
		document.getElementById('c21').className = "readonly";
	}
	
}
/*
Retorna el mes valido de presentacion
para el formulario (que es anual)
Para el 804 el mes es Marzo(3)
*/
function getValidMonth(){
	return 3;
}

function verifySum(){
	refreshVars();
	TRGc22();
	validateDeclaredAmount('c26');
}


