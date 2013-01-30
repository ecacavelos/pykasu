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
		document.getElementById('c18').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c18').value != null)
  		   colocarpuntos(document.getElementById('c18'));
	}
	
	/*
		28-Jul -2007: Cesquivel
		C?lculos de operaci?n para c?lculo de multa e inter?s.
	*/
	var tmp15 = getValueFormatless('c15');
	var tmp16 = getValueFormatless('c16');
	var tmp17 = getValueFormatless('c17');
	
	var op= tmp15 - (tmp16 + tmp17);
	
	if (op <0) 
	{
		op=0;		
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c22').value =  (PORC_MORA * op).toFixed(0) ;
		if(document.getElementById('c22').value < 0){
			document.getElementById('c22').value  = 0;
		}
		if(document.getElementById('c22').value != null)
  		   colocarpuntos(document.getElementById('c22'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c23').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c23').value < 0){
			document.getElementById('c23').value  = 0;
		}
		if(document.getElementById('c23').value != null)
  		   colocarpuntos(document.getElementById('c23'));
	}
	
	refreshVars();
	TRGc20();
	TRGc21();
	TRGc21_0();	
	TRGc24(); 

	var tmp = (0).toFixed(0);

}


function getFormType(){
	return '122';
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
	function controlaAnho()
	{
		if(  (document.getElementById('fiscalPeriodYear') != null) 
		  && (document.getElementById('fiscalPeriodYear').value != 0)
		){
			
			fecha = new Date();
			var anho = getActualYear();
			
			if( document.getElementById('fiscalPeriodYear').value >= anho){
				alert("Año de presentación incorrecto. El año debe ser menor al año corriente");
				document.getElementById('fiscalPeriodYear').focus();
				return;
			}
			
			//getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		  
		}
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