var salaryAmount;
var oriRectiFlag=false;
var pm_fiscalPeriodMounth = null;

/*function disabledByCondition101(cell, cellConditionId){

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
*/
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
	
	
	//estos elementos dependen de otras celdas para activarse
	
}

function calculateBeforePlugin(){

}

function calculateAfterPlugin(){
	oriRectiFlag=false;	
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
	refreshVars();
	calcPorcentajeMoras();
	
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
		document.getElementById('c78').value =  CONTRAVENSION_CMOV*norectificativa;
		if(document.getElementById('c78').value != null)
  		   colocarpuntos(document.getElementById('c78'));
	}else{
	
		if(oriRectiFlag){
			document.getElementById('c78').value = norectificativa;
		
		}
	}
	refreshVars();
	TRGc79();
	TRGc79_0();
	TRGc80();
	TRGc80_0();
		
	//C[69]+C[70]+C[71]+C[72]+C[73]-C[74]-C[75]-C[76]-C[77]
	var tmp69 = getValueFormatless('c69');
	var tmp70 = getValueFormatless('c70');	
	var tmp71 = getValueFormatless('c71');	
	var tmp72 = getValueFormatless('c72');	
	var tmp73 = getValueFormatless('c73');	
	var tmp74 = getValueFormatless('c74');	
	var tmp75 = getValueFormatless('c75');	
	var tmp76 = getValueFormatless('c76');	
	var tmp77 = getValueFormatless('c77');	
	
	var op = tmp69 + tmp70 + tmp71 + tmp72 + tmp73 - tmp74 -tmp75 -tmp76 -tmp77;

	if(op < 0){
		op = 0;
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c81').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c81').value < 0){
			document.getElementById('c81').value  = 0;
		}
		if(document.getElementById('c81').value != null)
  		   colocarpuntos(document.getElementById('c81'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c82').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c82').value < 0){
			document.getElementById('c82').value  = 0;
		}
		if(document.getElementById('c82').value != null)
  		   colocarpuntos(document.getElementById('c82'));
	}

	refreshVars();
	TRGc84();
	TRGc84_0();
	TRGc85();
	TRGc85_0();
	
	var tmp = (0).toFixed(0);
}


function getFormType(){
	return '848';
}

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

function checkValidMonth(){

 	var tmpFiscalMonth= getValueFormatless('fiscalPeriodMounth');
 	
 	if ( tmpFiscalMonth != 4 && tmpFiscalMonth != 6 && tmpFiscalMonth != 12){
 		
 		alert("Mes de presentación inválido!.\n Sólo válido para Abril, Junio y Diciembre");
 		document.getElementById('fiscalPeriodMounth').value='';
 		return;
 	}
}
/*
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
			document.getElementById('fiscalPeriodYear').value = '';//Borro el campo año
			document.getElementById('fiscalPeriodYear').focus();
			return;
		}
	}
}


function setMinorValue(campo1,campo2,campo3)
{
	var tmp1= getValueFormatless(campo2);
	var tmp2= getValueFormatless(campo3);

	if (tmp1 <= tmp2){
	   document.getElementById(campo1).value= document.getElementById(campo2).value;
	 
	}else{
	   document.getElementById(campo1).value= document.getElementById(campo3).value;
	 }
	 
	 reCalculate(campo1);
}
function mustBeMinor()
{
	var tmp_29= parseInt(removeCommas(document.getElementById('c29').value));
	var tmp_30= parseInt(removeCommas(document.getElementById('c30').value));
	
	if (tmp_30 > tmp_29) 
	{
		alert("El campo 30 no puede exceder el valor del campo 29");
		document.getElementById("c30").value='';
	}
}

function beforeSave(){

	fecha = new Date();
	var anho = fecha.getYear()+1900;
	var anhoform = getValueFormatless('fiscalPeriodYear');	
	
	var v120 = removeCommas(document.getElementById("c120").value);
	if(v120!='' && v120.length != 4){
		alert('El año debe tener cuatro dígitos.');
		return false;
	}
	
	if(parseInt(v120)< 1900){
		alert('El año debe ser mayor al 1900.');
		return false;		
	}
	
	var server = document.getElementById("serverActualDate").value;
	sp = server.split('/');
	if(v120.replace(' ','') > sp[2].replace(' ','')){
		alert('El valor del campo 120 debe ser menor que el año actual.');
		return false;
	}

	if(!(
		(
			(document.getElementById('declarationType').value == '| 5 | CLAUSURA') 
			&&(anho == anhoform)
		) 
	   || (anhoform < anho)  )
	){
		alert('Año de presentación incorrecto. El año debe ser menor al año corriente. En el caso de CLAUSURA, el año puede ser el mismo que el corriente.');
		document.getElementById('fiscalPeriodYear').focus();
		return false;
	}

	return true;
}

*/