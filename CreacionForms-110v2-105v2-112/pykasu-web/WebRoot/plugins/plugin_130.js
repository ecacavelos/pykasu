var salaryAmount;
var applyPercentTargetField = 0;
var numFieldName=0;
var pm_fiscalPeriodMounth = null;
var oriRectiFlag=false;

function disabledByCondition101(cell, cellConditionId){

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
	oriRectiFlag=false;
	orirecti();
	
	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	pm_paymentDate = document.getElementById('paymentDate').value;
	pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
	pm_fiscalPeriodYear = removeCommas(document.getElementById('fiscalPeriodYear').value);
	pm_called = 1;
		
	if( (PORC_MORA == 0 || 
		PORC_INTERES == 0 || 
		CONTRAVENSION_CMOV == 0 ||
		CONTRAVENSION_SMOV == 0)
		&&(applyPercentTargetField == -1)
		)
	{
		pm_called = 0;	
	}
	reviewFieldPercent('c93','c113','c123');
	reviewFieldPercent('c94','c114','c124');
	reviewFieldPercent('c95','c115','c125');
	reviewFieldPercent('c96','c116','c126');
	reviewFieldPercent('c97','c117','c127');
	reviewFieldPercent('c98','c118','c128');
	reviewFieldPercent('c99','c119','c129');
	reviewFieldPercent('c100','c120','c130');
	reviewFieldPercent('c101','c121','c131');
	reviewFieldPercent('c102','c122','c132');
	refreshVars();
	TRGc60();
	TRGc72();
	TRGc80();
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
		document.getElementById('c78').value =  CONTRAVENSION_CMOV * norectificativa;		
		if(document.getElementById('c78').value != null)
  		   colocarpuntos(document.getElementById('c78'));
	}else{
	
		if(oriRectiFlag){
			document.getElementById('c78').value = norectificativa;
		
		}
	}
	refreshVars();
	TRGc80();
	TRGc82();
	TRGc82_0();
	var tmp72 = getValueFormatless('c72');
	var tmp73 = getValueFormatless('c73');	
	var tmp74 = getValueFormatless('c74');	
	var tmp75 = getValueFormatless('c75');	
	var tmp76 = getValueFormatless('c76');	
	var tmp77 = getValueFormatless('c77');	
	
	var op = tmp72 - (tmp73+tmp74+tmp75+tmp76+tmp77);
	if(op < 0){
		op = 0;
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c83').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c83').value < 0){
			document.getElementById('c83').value  = 0;
		}
		if(document.getElementById('c83').value != null)
  		   colocarpuntos(document.getElementById('c83'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c84').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c84').value < 0){
			document.getElementById('c84').value  = 0;
		}
		if(document.getElementById('c84').value != null)
  		   colocarpuntos(document.getElementById('c84'));
	}
	
	refreshVars();
	
	TRGc85();
		
	var tmp = (0).toFixed(0);
}


function getFormType(){
	return '130';
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
			rectPPN.value='';
			rectPPN.disabled = 'true';
			oriRectiFlag=false;
		}
	
		pm_called = 1;//para que no llame al servidor..
		
		calcPorcentajeMoras();	
	
	}catch(e){
		//alert('error al calcular Origen');
	}	
}

function getPercentByFieldContent(fieldName,fieldValue, targetField){
	if (fieldValue==null||fieldValue==''){
		return;
	}else{
	
		fieldValue=removeCommas(fieldValue);

		request= GetXmlHttpObject();
	
		if (request == null){
			alert('El sitio no soporta AJAX.');
			return;
		}
	
		var fpMonth = document.getElementById('fiscalPeriodMounth').value.toUpperCase();
		var fpYear  = getValueFormatless('fiscalPeriodYear');
	
		if((fpMonth == null)||(fpYear==null)||(fpMonth == '')||(fpYear == '')){		
			return;
		}
	
		var url = 'getFee.do'
		url = url + '?id='+Math.random();
		url = url + '&form=130';
		url = url + '&field='+ fieldValue;
		url = url + '&month='+ fpMonth;
		url = url + '&year=' + fpYear;
		
		applyPercentTargetField = targetField;
		numFieldName = fieldName;
		
		request.onreadystatechange=setPercent;
		request.open('POST',url,true);
		request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		request.send(null);
	}	
}


function setPercent(){
	if(request.readyState == 4 || request.readyState == 'complete'){
		
		var xmlDoc = request.responseXML;
	
		var values = xmlDoc.getElementsByTagName("fee-info");
		
		var percent = 0;
				
		for (i=0; i<values[0].childNodes.length; i++){
			if (values[0].childNodes[i].nodeName == 'fee'){
				for (j = 0; j<values[0].childNodes[i].childNodes.length; j++){
					if (values[0].childNodes[i].childNodes[j].nodeName == 'fee-percent'){					
						percent = values[0].childNodes[i].childNodes[j].firstChild.nodeValue;
					}
				}
			}//if comentario
		}
		if(percent != "NOT_EXIST" && applyPercentTargetField != -1){
			document.getElementById(applyPercentTargetField).value = percent;
		}
		if(percent == "NOT_EXIST" && applyPercentTargetField != -1){
			document.getElementById(applyPercentTargetField).value = "";
			alert("El valor numérico ingresado no existe o es inválido!");
			document.getElementById(numFieldName).value = "";
			
		}
		applyPercentTargetField = -1;
	}
}


function reviewFieldPercent(field,targetField,calculatedField){

	if( (field==null || targetField==null)||(field=='' || targetField=='')){
		return;
	}

	if( document.getElementById(field).value==''||document.getElementById(field).value==null){
	
		document.getElementById(targetField).value='';
		document.getElementById(calculatedField).value='';
		
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

