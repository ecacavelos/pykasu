var salaryAmount;

var pm_fiscalPeriodMounth = null;
var isOnLoad = false;

function modifyEnableSection(section, enableMode){

	var enableModeValue = 'true';
	if(enableMode == 'ENABLE'){
		enableModeValue = '';
	}

	
	if(section == 'A'){
		if(!isOnLoad){
			document.getElementById('c15').value = '';
			document.getElementById('c16').value = '';
			document.getElementById('c17').value = '';
			document.getElementById('c18').value = '';				
			document.getElementById('c19').value = '';				
		}

		document.getElementById('c15').disabled = enableModeValue;
		document.getElementById('c16').disabled = enableModeValue;
		document.getElementById('c17').disabled = enableModeValue;
		document.getElementById('c18').disabled = enableModeValue;				
		document.getElementById('c19').disabled = enableModeValue;
						
	}else if(section == 'B'){
		if(!isOnLoad){
			document.getElementById('c20').value = '';
			document.getElementById('c21').value = '';
		}
		document.getElementById('c20').disabled = enableModeValue;
		document.getElementById('c21').disabled = enableModeValue;
		
	}else if(section == 'C'){
		if(!isOnLoad){
			document.getElementById('c22').value = '';
			document.getElementById('c23').value = '';
			document.getElementById('c24').value = '';
			document.getElementById('c25').value = '';
			document.getElementById('c26').value = '';
			document.getElementById('c27').value = '';
			document.getElementById('c28').value = '';
			document.getElementById('c29').value = '';
		}
		document.getElementById('c22').disabled = enableModeValue;
		document.getElementById('c23').disabled = enableModeValue;
		document.getElementById('c24').disabled = enableModeValue;
		document.getElementById('c25').disabled = enableModeValue;
		document.getElementById('c26').disabled = enableModeValue;
		document.getElementById('c27').disabled = enableModeValue;
		document.getElementById('c28').disabled = enableModeValue;
		document.getElementById('c29').disabled = enableModeValue;
		
	}else if(section == 'D'){
		if(!isOnLoad){
			document.getElementById('c30').value = '';
			document.getElementById('c31').value = '';
		}
		document.getElementById('c30').disabled = enableModeValue;
		document.getElementById('c31').disabled = enableModeValue;

	}else if(section == 'E'){
		if(!isOnLoad){
			document.getElementById('c32').value = '';
			document.getElementById('c33').value = '';
			document.getElementById('c38').value = '';
		}		
		document.getElementById('c32').disabled = enableModeValue;
		document.getElementById('c33').disabled = enableModeValue;
		document.getElementById('c38').disabled = enableModeValue;
	}		 
}

function changeEnableSections(section){
	var option = section.options[section.selectedIndex].value;
	option = trim(option);
	option = trim(option.substr(2, 2));

	modifyEnableSection('A', 'DISABLE');
	modifyEnableSection('B', 'DISABLE');
	modifyEnableSection('C', 'DISABLE');	
	modifyEnableSection('D', 'DISABLE');
	modifyEnableSection('E', 'DISABLE');	

	modifyEnableSection(option, 'ENABLE');	
	
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

	v_onload = 0; 
	
	var s = document.getElementById('liqMotive');
	isOnLoad = true;
	changeEnableSections(s);
	isOnLoad = false;	
}

function calculateBeforePlugin(){

}

function getFiscalInfoToForm90(){

	request= GetXmlHttpObject();


	if (request == null){
		alert('El sitio no soporta AJAX');
		return;
	}

	var section = document.getElementById('liqMotive');
//	changeEnableSections(section);	
	var option = section.options[section.selectedIndex].value;
	option = trim(option);
	option = trim(option.substr(2, 2));
	
//	if(option != 'A' && option != 'C' && option != 'D'){
//		return;
//	}
	
	var fecha = null;
	if(option == 'A'){
		if(document.getElementById('c19').value == ''){
			return;
		}
		fecha = document.getElementById('c19').value;
	}else if(option == 'C'){
		if(document.getElementById('c29').value == ''){
			return;
		}
		fecha = document.getElementById('c29').value;
	}else if(option == 'D'){
		if(document.getElementById('fiscalPeriodDay').value == '' || document.getElementById('fiscalPeriodMounth').value == '' || document.getElementById('fiscalPeriodYear').value == ''){
			return;
		}
		fecha = getValueFormatless('fiscalPeriodDay') +'/'+ getValueFormatless('fiscalPeriodMounth') + '/' + getValueFormatless('fiscalPeriodYear');

	}else if(option == 'B' || option == 'E'){
		PORC_MORA = 0; 
		PORC_INTERES = 0; 
		CONTRAVENSION_CMOV = 0;
		CONTRAVENSION_SMOV = 0;	
		return;
	}
	
	var url = 'getMoraInfoForm90.do?section=' + option;
	url = url + '&initialDate=' + fecha;
	url = url + '&paymentDate=' + document.getElementById('paymentDate').value;
	url = url + '&ruc=' + document.getElementById('ruc').value;	
	
	//alert('URL = ' + url);
	
	request.onreadystatechange=changeMoraInfo;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);	

}

function calculateAfterPlugin(){

	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	pm_paymentDate = document.getElementById('paymentDate').value;
	pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
	pm_fiscalPeriodYear = removeCommas(document.getElementById('fiscalPeriodYear').value);
	pm_called = 1;
	
	calcPorcentajeMoras();
/*	

	if( PORC_MORA == 0 || 
		PORC_INTERES == 0 || 
		CONTRAVENSION_CMOV == 0 ||
		CONTRAVENSION_SMOV == 0)
	{
		pm_called = 0;	
	}
*/	

}


function calcPorcentajeMoras(){

	if (pm_called == 0){
		getFiscalMoraInfo();
		return;
	}
	
	if(CONTRAVENSION_SMOV && CONTRAVENSION_SMOV != null){
		document.getElementById('c39').value =  CONTRAVENSION_SMOV;		
		if(document.getElementById('c39').value != null)
  		   colocarpuntos(document.getElementById('c39'));
	}
	refreshVars();
	TRGc40();
	var tmp40 = document.getElementById('c40').value;
	var tmp39 = document.getElementById('c39').value;	
	var tmp35 = document.getElementById('c35').value;		
	
	var op = removeCommas(tmp40) - removeCommas(tmp39) - removeCommas(tmp35);
	if(op < 0){
		op = 0;
	}
	
	if (PORC_MORA && PORC_MORA != null){
		document.getElementById('c41').value =  (PORC_MORA * op).toFixed(0);
		if(document.getElementById('c41').value != null)
  		   colocarpuntos(document.getElementById('c41'));
	}		
	if (PORC_INTERES && PORC_INTERES != null){
		document.getElementById('c42').value =  (PORC_INTERES * op).toFixed(0);
		if(document.getElementById('c42').value != null)
  		   colocarpuntos(document.getElementById('c42'));
	}
	refreshVars();
	TRGc43();

/*
	TRGc85();
	TRGc86();
	TRGc86_0();
	TRGc89();
*/	
	var tmp = (0).toFixed(0);
}


function getFormType(){
	return '90';
}


function periodControl(){
	
	/*
	Pablo, ac� agrega las lineas para que el periodo fiscal no sea 
	mayor al PaymentDate
	*/
	return true;
}

function beforeSave(){
	if (!periodControl()){
		return false;
		}
		
	return true;
}



function validDate(dateCell){
	if(!isValidDate(dateCell.value)){
		alert(dateCell.value + ' es una fecha invalida');
		return -1;
	}
}

function validYear(){
	var year = getValueFormatless('c31');
	
	if(year != 2006 && year != 2005){
		alert('El valor del campo 31 debe ser 2005 o 2006');
		return -1;
	}
}

function mustBeMinor(){
	var tmp_c32=getValueFormatless('c32');
	var tmp_c38=getValueFormatless('c38');
	
	if (tmp_c38 > tmp_c32){
		alert('El valor del campo 38 debe ser menor o igual al valor del campo 32');
		document.getElementById('c38').value='';
	}

}

function validBeforeSave(){
	
}

function datesControl(){
	var day   = document.getElementById('fiscalPeriodDay');
	var month = document.getElementById('fiscalPeriodMounth');
	var year  = document.getElementById('fiscalPeriodYear');
	year.value = removeCommas(year.value);
	
	if(
		(day.value   == '' ||
		 month.value == '' ||
		 year.value  == ''
		)||(!validatePaymentDate())
	){
		return false;
	}
	
	//fecha fiscal declarada
	var fpdate = new Date();
	fpdate.setDate(parseInt(day.value,10)); 
	fpdate.setMonth(parseInt(month.value,10)-1);
	fpdate.setFullYear(parseInt(year.value,10));
	fpdate.setHours(0,0,0,0);
	//fecha servidor
	//serverDate = getServerDate();
	serverDate =  document.getElementById('suggestedPaymentDate').value;
	
	//fecha prevista de presentacion
	var paymentDate  = document.getElementById('paymentDate').value;
	
	var sd = paymentDate.split('/');
	var paydate = new Date();
	paydate.setDate(parseInt(sd[0],10)); 
	paydate.setMonth(parseInt(sd[1],10)-1);
	paydate.setFullYear(parseInt(sd[2],10));
	paydate.setHours(0,0,0,0);
	
	
	//la fecha de declaracion tiene que ser mayor a la del servidor y menor que la prevista de pago
//	var b = (fpdate >= serverDate) && (fpdate <= paydate);
	var b = (fpdate <= paydate);
	if(!b){
		alert('La fecha declarada en el perido fiscal debe ser  menor o igual a la fecha prevista de pago');
		day.value = '';
		month.value = '';
		year.value = '';
		day.focus();
	} 
	 
	return b; 
}
