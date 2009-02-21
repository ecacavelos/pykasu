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
	// cesquivel 17/8/2007: verifica si el campo 15 debe ser o no habilitado.-
	disabledByYear();
	//document.getElementById('c15').disabled='true';
		
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
		document.getElementById('c19').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c19').value != null)
  		   colocarpuntos(document.getElementById('c19'));
	}
	
	var tmp1 = removeCommas(document.getElementById('c23').value);
	var tmp2 = removeCommas(document.getElementById('c19').value);
	var op = tmp1 - tmp2
	if(op < 0){
		op = 0
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c24').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c24').value < 0){
			document.getElementById('c24').value  = 0;
		}
		if(document.getElementById('c24').value != null)
  		   colocarpuntos(document.getElementById('c24'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c25').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c25').value < 0){
			document.getElementById('c25').value  = 0;
		}
		if(document.getElementById('c25').value != null)
  		   colocarpuntos(document.getElementById('c25'));
	}
	
	refreshVars();
	
	TRGc21();
	TRGc22();
	TRGc22_0();
	TRGc23();
	TRGc23_0();
	TRGc26();


	var tmp = (0).toFixed(0);
	
}


function getFormType(){
	return '117';
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
	function controlaAnho(){
		if(  (document.getElementById('fiscalPeriodYear') != null) 
		  && (document.getElementById('fiscalPeriodYear').value != 0)
		){
			
			fecha = new Date();
			var anho = getActualYear();
			
//			if(anho >= document.getElementById('fiscalPeriodYear').value){
			if(getValueFormatless('fiscalPeriodYear') > anho){
				alert("A�o de presentacion incorrecto. El a�o debe ser menor al a�o corriente.");
				document.getElementById('fiscalPeriodYear').focus();
				return false;
			}
			
			//getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		  
		}
		
	}
	

function disabledByYear(){
		
	var periodYear= removeCommas(document.getElementById('fiscalPeriodYear').value)
	var periodMounth= removeCommas(document.getElementById('fiscalPeriodMounth').value)
	if(periodYear == 2007 && periodMounth==1){
		document.getElementById('c15').value='0';
//		document.getElementById('c15').disabled='true';
		document.getElementById('c15').readOnly = true;
		document.getElementById('c15').className = "readonly";
	}else{
//		document.getElementById('c15').disabled='';
		document.getElementById('c15').readOnly = false;
		document.getElementById('c15').className = "default";
	}
	verifySum();

}

function verifySum(){
	refreshVars();
	TRGc20();
	TRGc21();
	TRGc22();
	TRGc22_0();
	TRGc23();
	TRGc23_0();
	TRGc26();			
}

function giveFormType(){
 return 'mensual';
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
