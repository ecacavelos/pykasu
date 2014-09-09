function inicializar(){
	pm_called = 0;
	PORC_MORA = 0;	
	PORC_INTERES = 0;
	CONTRAVENSION_SMOV = 0;
	CONTRAVENSION_CMOV = 0;
}

/*plugins*/

var fpMonth = null;
var fpYear = null;
var onload = 1;
var pm_called = 0;
var pm_paymentDate = null;
var pm_ruc = null;
if(pm_fiscalPeriodMounth == null){
	var pm_fiscalPeriodMounth = null;
}	
var pm_fiscalPeriodYear = null;


var PORC_MORA = 0;
var PORC_INTERES = 0;
var CONTRAVENSION_CMOV = 0;
var CONTRAVENSION_SMOV = 0;
var ajaxProccessTerminate = true;

function getPorcentajeMoras(component){
	ajaxProccessTerminate = false;
	
	if (component.value == valueOld){
		valueOld = null;
		ajaxProccessTerminate = true;
		return;
	}
	if (component.id == 'ruc'){
		pm_ruc = component.value.toUpperCase();

		pm_paymentDate = document.getElementById('paymentDate').value;
		pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
		pm_fiscalPeriodYear = document.getElementById('fiscalPeriodYear').value;

	}else if(component.id == 'paymentDate'){
		pm_paymentDate = component.value;

		pm_ruc = document.getElementById('ruc').value.toUpperCase();
		pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
		pm_fiscalPeriodYear = document.getElementById('fiscalPeriodYear').value;

	}else if (component.id == 'fiscalPeriodMounth'){
		pm_fiscalPeriodMounth = component.value;

		pm_ruc = document.getElementById('ruc').value.toUpperCase();
		pm_paymentDate = document.getElementById('paymentDate').value;
		pm_fiscalPeriodYear = document.getElementById('fiscalPeriodYear').value;
		
	}else if (component.id == 'fiscalPeriodYear'){
		pm_fiscalPeriodYear = component.value;

		pm_ruc = document.getElementById('ruc').value.toUpperCase();
		pm_paymentDate = document.getElementById('paymentDate').value;
		pm_fiscalPeriodMounth = document.getElementById('fiscalPeriodMounth').value;
	}
	
	if(document.getElementById('ruc').value == ""
 	|| document.getElementById('paymentDate').value == ""
 	|| document.getElementById('fiscalPeriodYear').value == "" 	 	
 	|| document.getElementById('fiscalPeriodMounth').value == ""
	){
		ajaxProccessTerminate = true;
		return;
	}
		
	getFiscalMoraInfo();
}


function isCorrectHead(){
	return (document.getElementById('ruc').value != "") 
	&&  (document.getElementById('dv').value != "")
	&&  (document.getElementById('fiscalPeriodMounth').value != "")
	&&  (document.getElementById('fiscalPeriodYear').value != "")
	&&  (document.getElementById('paymentDate').value != "")
	&&  (document.getElementById('nroCedula').value != "");
			
}


function getFiscalMoraInfo(){
	request= GetXmlHttpObject();


	if (request == null){
		alert('El sitio no soporta AJAX');
		return;
	}
	pm_ruc = document.getElementById('ruc').value.toUpperCase();
	if(document.getElementById('declarationType') != null){
		pm_declaration_type = document.getElementById('declarationType').value.toUpperCase();
	}
	
	if(document.getElementById('paymentDate') != null)//Le puse este if xq estaba matando algo cuando era null(Mirna)
		pm_paymentDate = document.getElementById('paymentDate').value;
	else
		pm_paymentDate = null;
		
	if (pm_paymentDate == null 
		|| pm_ruc == null 
		|| pm_fiscalPeriodMounth == null
		|| pm_fiscalPeriodYear == null 
		|| pm_fiscalPeriodYear == 0){
		
		return ;
	}
	
	var url = 'getMoraInfo.do'
	url = url + '?id='+Math.random();
	url = url + '&ruc='+pm_ruc;
	url = url + '&fiscalInfoType=expiring'
	url = url + '&form=' + getFormType();
	url = url + '&paymentDate='+pm_paymentDate;
	url = url + '&fiscalPeriodMounth='+pm_fiscalPeriodMounth;
	url = url + '&fiscalPeriodYear='+pm_fiscalPeriodYear;
	url = url + '&declarationType='+pm_declaration_type;
	//alert(url);
	request.onreadystatechange=changeMoraInfo;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);
}


function changeMoraInfo(){


	if (request.readyState == 4 || request.readyState == 'complete'){

		var xmlDoc = request.responseXML;
	
		var values = xmlDoc.getElementsByTagName("fiscal-info");
		
				
		for (i=0; i<values[0].childNodes.length; i++){
			if (values[0].childNodes[i].nodeName == 'info'){
				
				var key = values[0].childNodes[i].getAttributeNode('key').value;
				var value = values[0].childNodes[i].getAttributeNode('value').value;

				if (key == 'DECLARATION_DATE_NOT_VALID'){
					alert('Fecha de declaraci\u00f3n no v\u00e1lida');
					try{
						document.getElementById('fiscalPeriodMounth').value = getValidMonth();
					}catch(e){
						document.getElementById('fiscalPeriodMounth').value = "";						
					}
					document.getElementById('fiscalPeriodYear').value = "";
					document.getElementById('fiscalPeriodYear').focus();
					return;
				}

				if (key == 'PORC_MORA'){
					PORC_MORA = parseFloat(value);		
					if (PORC_MORA==0 || PORC_MORA==null){
						PORC_MORA = parseFloat(value).toFixed(0);
					}
				}
				
				if (key == 'PORC_INTERES'){
					PORC_INTERES = parseFloat(value);
					if (PORC_INTERES==0 || PORC_INTERES==null){
						PORC_INTERES = parseFloat(value).toFixed(0);
					}
					
				}
				if (key == 'CONTRAVENSION_CMOV'){
					CONTRAVENSION_CMOV = parseFloat(value).toFixed(0);		
				}
				if (key == 'CONTRAVENSION_SMOV'){
					CONTRAVENSION_SMOV = parseFloat(value).toFixed(0);	
				}
				
				

			}//if comentario
			if (values[0].childNodes[i].nodeName == 'message'){
				
				var key = values[0].childNodes[i].getAttributeNode('key').value;
				var value = values[0].childNodes[i].getAttributeNode('value').value;

				if (key == 'PAYMENT_DATE_NOT_VALID'){
					alert('Fecha incorrecta. Puede que la fecha prevista de pago sea menor a la actual, o sea una fecha no v\u00e1lida');
					document.getElementById('paymentDate').focus();
				}
				if (key == 'DECLARATION_DATE_NOT_VALID'){
					alert('Fecha de declaraci\u00f3n no v\u00e1lida');
					try{
						document.getElementById('fiscalPeriodMounth').value = getValidMonth();
					}catch(e){
						document.getElementById('fiscalPeriodMounth').value = "";
					}
					document.getElementById('fiscalPeriodYear').value = "";
					document.getElementById('fiscalPeriodYear').focus();

					return;

				}
				if (key == 'ERROR'){
					alert(value);
				}

			}//if comentario
		}//for i
		pm_called = 1;
		calcPorcentajeMoras();
		
		ajaxProccessTerminate = true;
	}//if complete
	
}


function submitForm(action){
	var form = document.GenericForm;

	if(action == "send"){
		if(!ajaxProccessTerminate){
			alert('A\u00fan se est\u00e1n procesando datos, no se puede guardar el formulario.\nIntente en unos momentos.');
			return;
		}
		
		if(!confirm('Está a punto de Guardar el Formulario.\nSe encuentra seguro de realizar esta operaci\u00f3n?')){
			return;
		}
		
		if(document.getElementById('ruc').value == ""){
			alert('El RUC no es v\u00e1lido');
			document.getElementById('ruc').focus();
			return;
		}
		
		if(document.getElementById('dv').value == ""){
			alert('El RUC no es v\u00e1lido');
			document.getElementById('ruc').focus();
			return;
		}
		if(document.getElementById('declarationType') != null){
			//hay que ver si es rectificativa, si es, controlar que este cargado el campo
			/*comentarios agregados por David Ayala y Esteban Cacavelos para eliminar el problema que se tiene cuando se elimina la opcion de RECTIFICATIVA en los forms.
				Lineas afectadas: 251, 253, 257-260. 
			*/
			if((document.getElementById('declarationType').value == '| 2 | RECTIFICATIVA')/*&&(document.getElementById('rectificativePPN').value == "")*/){
				alert('El tipo de Declaraci\u00f3n Jurada es RECTIFICATIVA. Precisa un n\u00famero de orden de la declaraci\u00f3n a rectificar.');
				//document.getElementById('rectificativePPN').focus(); // Comentario agregado por D ayala y E cacavelos 
				return;
			}
			
			//hay que ver si NO es rectificativa, en caso de que no sea, poner un valor nulo en el campo rectificativePPN
/*			if((document.getElementById('declarationType').value == '| 1 | ORIGINAL')||(document.getElementById('declarationType').value == '| 5 | CLAUSURA')|| (document.getElementById('declarationType').value=='| 3 | CLAUSURA')){
					document.getElementById('rectificativePPN').value = "";
			}*/
		}

		if(document.getElementById('fiscalPeriodYear') != null){
			fpYear = (document.getElementById('fiscalPeriodYear'));
		}
		
		if((fpYear.value == "")||(document.getElementById('fiscalPeriodYear').value == "")){
			alert('La Declaraci\u00f3n Jurada requiere tener un Periodo de Declaraci\u00f3n');
			fpYear.focus();
			return;
		}
		
		if(document.getElementById('fiscalPeriodMounth') != null){		
			fpMonth = (document.getElementById('fiscalPeriodMounth'));
		}
		
		if((fpMonth.value == "")||(document.getElementById('fiscalPeriodMounth').value == "")){
			alert('La Declaraci\u00f3n Jurada requiere tener un Periodo de Declaraci\u00f3n');
			fpMonth.focus();
			return;
		}
		
		if(!isValidDate(document.getElementById('paymentDate').value)){
			alert('La fecha prevista de pago es inv\u00e1lida.');
			document.getElementById('paymentDate').focus();
			return;
		}		
		
		if(!validatePaymentDate()){
			alert('La fecha prevista de pago es anterior a la fecha actual.');
			document.getElementById('paymentDate').focus();
			return;
		}

		//intenta ejecutar validaciones particulares de cada formularios definidas 
		//en la funcion beforeSave que debe retornar un valor booleano 
		//para determinar o no la continuacion de la ejecucion del script
		try{
			var validBeforeSave = true;
			eval('validBeforeSave = beforeSave()');
			if(!validBeforeSave){
				return;
			}
		}catch(e){
			//la funcion no esta definida
			//alert('no se encontro : !beforeSave()  ' + e);
		}
		

		form.submit();	
	}else if(action == "cancel"){
		if(!confirm('Est\u00e1 a punto de Cancelar la edicion del presente Formulario.\nSi presiona el boton Aceptar NO se guardar\u00e1n los cambios\n Est\u00e1 seguro de realizar esta operaci\u00f3n?')){
			return;
		}else{
			document.location = '../pycasu/';
		}
	}
}



function removeZeros(el){
	try{
	var newValue = '';
	var oldValue = el.value;
	var continuar = true;
	var i=0
	while (i<oldValue.length && continuar == true){
		if (oldValue.charAt(i)!='0'){
			continuar = false;
		}else{
			i++;
		}
	}
	for (j=i;j<oldValue.length; j++){
		newValue = newValue + oldValue.charAt(j);
	}
	el.value=newValue;
	}catch(e){
		alert('error al Borrar Ceros');
	}	
}

function isValidDate(dateStr, format) {
   dateStr = dateStr.replace('.','');	
   if (format == null) { format = "DMY"; }
   format = format.toUpperCase();
   if (format.length != 3) { format = "DMY"; }
   if ( (format.indexOf("M") == -1) || (format.indexOf("D") == -1) || (format.indexOf("Y") == -1) ) { format = "MDY"; }
   if (format.substring(0, 1) == "Y") { // If the year is first
      var reg1 = /^\d{2}(\-|\/|\.)\d{1,2}\1\d{1,2}$/
      var reg2 = /^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/
   } else if (format.substring(1, 2) == "Y") { // If the year is second
      var reg1 = /^\d{1,2}(\-|\/|\.)\d{2}\1\d{1,2}$/
      var reg2 = /^\d{1,2}(\-|\/|\.)\d{4}\1\d{1,2}$/
   } else { // The year must be third
      var reg1 = /^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{2}$/
      var reg2 = /^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{4}$/
   }
   // If it doesn't conform to the right format (with either a 2 digit year or 4 digit year), fail
   if ( (reg1.test(dateStr) == false) && (reg2.test(dateStr) == false) ) { return false; }
   var parts = dateStr.split(RegExp.$1); // Split into 3 parts based on what the divider was
   // Check to see if the 3 parts end up making a valid date
   if (format.substring(0, 1) == "M") { var mm = parts[0]; } 
	else if (format.substring(1, 2) == "M") { var mm = parts[1]; } else { var mm = parts[2]; }
   if (format.substring(0, 1) == "D") { var dd = parts[0]; }
	else if (format.substring(1, 2) == "D") { var dd = parts[1]; } else { var dd = parts[2]; }
   if (format.substring(0, 1) == "Y") { var yy = parts[0]; }
	else if (format.substring(1, 2) == "Y") { var yy = parts[1]; } else { var yy = parts[2]; }
   if (parseFloat(yy) <= 50) { yy = (parseFloat(yy) + 2000).toString(); }
   if (parseFloat(yy) <= 99) { yy = (parseFloat(yy) + 1900).toString(); }
   var dt = new Date(parseFloat(yy), parseFloat(mm)-1, parseFloat(dd), 0, 0, 0, 0);
   if (parseFloat(dd) != dt.getDate()) { return false; }
   if (parseFloat(mm)-1 != dt.getMonth()) { return false; }
   return true;
}


function validatePaymentDate(){

	var payment = document.getElementById('paymentDate').value;
	var server  = document.getElementById('suggestedPaymentDate').value;

	var sd = server.split('/');
	var serdate = new Date();
	serdate.setDate(parseInt(sd[0],10)); 
	serdate.setMonth(parseInt(sd[1],10)-1);
	serdate.setFullYear(parseInt(sd[2],10));

	var pd = payment.split('/');
	var paydate = new Date();
	paydate.setDate(parseInt(pd[0],10)); 
	paydate.setMonth(parseInt(pd[1],10)-1);
	paydate.setFullYear(parseInt(pd[2],10));
		
	return (serdate.getTime() <= paydate.getTime());
}

function getServerDate(){
	var server  = document.getElementById('serverActualDate').value;

	if(server == null){
		return
	}
	var sd = server.split('/');
	var serdate = new Date();
	serdate.setDate(parseInt(sd[0],10)); 
	serdate.setMonth(parseInt(sd[1],10)-1);
	serdate.setFullYear(parseInt(sd[2],10));
	serdate.setHours(0,0,0,0);

	return serdate;	
}

function getSuggestedPaymentDate(){
	var server  = document.getElementById('suggestedPaymentDate').value;

	if(server == null){
		return
	}
	var sd = server.split('/');
	var serdate = new Date();
	serdate.setDate(parseInt(sd[0],10)); 
	serdate.setMonth(parseInt(sd[1],10)-1);
	serdate.setFullYear(parseInt(sd[2],10));
	serdate.setHours(0,0,0,0);

	return serdate;	
}

function getPaymentDate(){
	var server  = document.getElementById('paymentDate').value;

	if(server == null){
		return
	}
	var sd = server.split('/');
	var serdate = new Date();
	serdate.setDate(parseInt(sd[0],10)); 
	serdate.setMonth(parseInt(sd[1],10)-1);
	serdate.setFullYear(parseInt(sd[2],10));
	serdate.setHours(0,0,0,0);

	return serdate;	
}


function updateRuc (el){
	
	if (el.value == valueOld){
		valueOld = null;
		return;
	}

	request= GetXmlHttpObject();
	if (request == null){
		alert('El sitio no soporta AJAX');
		return;
	}
	var url = 'getInformationsByRuc.do'
	url = url + '?id='+Math.random();
	url = url + '&ruc='+document.getElementById('ruc').value.toUpperCase();
	url = url + '&formType=' + getFormType();
	
	request.onreadystatechange=confirmComentSender;
	request.open('POST',url,true);
	request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	request.send(null);
	
}

function confirmComentSender(){

	if (request.readyState == 4 || request.readyState == 'complete'){
		
		var xmlDoc = request.responseXML;
	
		var values = xmlDoc.getElementsByTagName("contributor-info");

		var table = null;
		var row = null;
		var field = null;
		var additionalInfo = false;
		var excludedByrucActivoOrTipoSociedad = false;
		
		document.getElementById('firstLastName').value = '';
		document.getElementById('secondLastName').value = '';
		document.getElementById('firstName').value = '';
		document.getElementById('middleName').value = '';

				
		for (i=0; i<values[0].childNodes.length; i++){
			
			if (values[0].childNodes[i].nodeName == 'field'){
				for (j = 0; j<values[0].childNodes[i].childNodes.length; j++){
					if (values[0].childNodes[i].childNodes[j].nodeName == 'field-id'){
						field = values[0].childNodes[i].childNodes[j].firstChild.nodeValue;
					}
					
					if (values[0].childNodes[i].childNodes[j].nodeName == 'field-value'){
						try{
							if (field == 'estado'){
								document.getElementById("estado-ruc").value = values[0].childNodes[i].childNodes[j].firstChild.nodeValue;
								if (document.getElementById("estado-ruc").value != 'ACTIVO'){
									alert('Estimado usuario, le comunicamos que los RUCs que no est\u00e9n ACTIVOS, no podr\u00e1n presentar declaraciones por este medio.');
									excludedByrucActivoOrTipoSociedad = true;
								}
							}
							if (field == 'tipo_sociedad'){
								document.getElementById("tipo-sociedad").value = values[0].childNodes[i].childNodes[j].firstChild.nodeValue;
								if (document.getElementById("tipo-sociedad").value === 'SRL' || document.getElementById("tipo-sociedad").value === 'SOCIEDAD_ANONIMA'){
									alert('Estimado usuario, le comunicamos que los RUCs correspondientes a S.A o S.R.L no podr\u00e1n presentar declaraciones juradas por este medio.');
									excludedByrucActivoOrTipoSociedad = true;
								}

							}
							if (field == 'additionalInfo'){
								if (values[0].childNodes[i].childNodes[j].firstChild.nodeValue == 'false'){
									additionalInfo = false;
				
								}else if (values[0].childNodes[i].childNodes[j].firstChild.nodeValue == 'true'){
									additionalInfo = true;
								}
								
							}else{
								if (field != 'status'){
									document.getElementById(field).value = values[0].childNodes[i].childNodes[j].firstChild.nodeValue;
									document.getElementById(field).readOnly = 'true';
								}
							}
						}catch(e){}
					}
				}//for j
				
			}//if comentario
			
			if (values[0].childNodes[i].nodeName == 'message'){
				
				var key = values[0].childNodes[i].getAttributeNode('key').value;
				var value = values[0].childNodes[i].getAttributeNode('value').value;
				if (key == 'DECLARATION_RUC_EXLUDED' && value == 'true'){
					document.getElementById('ruc').value = '';					
					document.getElementById('firstLastName').readOnly = '';
					document.getElementById('secondLastName').readOnly = '';
					document.getElementById('firstName').readOnly = '';
					document.getElementById('middleName').readOnly = '';

					alert('El ruc ingresado queda excluido del servicio de presentaci\u00f3n por CAJA. Solo puede presentar DDJJ por Sistema Web de Hacienda Resoluci\u00f3n de la SET para las ERAS');
					return;
				}

		
				if (key == 'RUCINFO_NOT_FOUND' && value == 'true'){
					document.getElementById('firstLastName').readOnly = '';
					document.getElementById('secondLastName').readOnly = '';
					document.getElementById('firstName').readOnly = '';
					document.getElementById('middleName').readOnly = '';
					alert('No se encontro informaci\u00f3n de RUC');
					document.getElementById('ruc').value='';
				}
				
			}//if comentario
			
		}//for i
		
		if (excludedByrucActivoOrTipoSociedad){

			document.getElementById('firstLastName').readOnly = '';
			document.getElementById('secondLastName').readOnly = '';
			document.getElementById('firstName').readOnly = '';
			document.getElementById('middleName').readOnly = '';
			document.getElementById('firstLastName').value = '';
			document.getElementById('dv').value='';
			document.getElementById('ruc').readOnly = '';
			document.getElementById('ruc').value='';
			document.getElementById('ruc').focus();
//			return;

		}
		if (additionalInfo == false){
//			if (confirm('No tiene informacion sobre'+document.getElementById('ruc').value+'. Llenar ahora mismo?')){
//					window.open('showForm.do?FORM=ClientData','Imprimir','status=1,location=0,toolbar=0, resizable=1, scrollbars=2, width=700, height=500');
//			}
		}
		getFiscalMoraInfo();
		
	}//if complete
}

function GetXmlHttpObject(handler){ 
	var objXMLHttp=null
	
	if (window.XMLHttpRequest){
		objXMLHttp=new XMLHttpRequest()
	}
	else if (window.ActiveXObject){
		objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP")
	}
	return objXMLHttp
}
//fecha de pago mayor o igual que actual


//setLoaded(true);


function disabledByCondition(cell, cellConditionId){

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

/*��������������������������������������������������������������������
Cesquivel 1/09/2007:
Bloque de controles de periodo en cabecera para todos los formularios.-
Control de meses para formularios mensuales.
Control de a�o para formularios mensuales y anuales.
��������������������������������������������������������������������*/
function validateMonthValue(){
/*
	Verifica que el dato de mes ingresado sea v�lido
*/
	var monthValue = getValueFormatless('fiscalPeriodMounth');

	if( monthValue > 0) {
		if (monthValue > 12) {
			//alert("Valor para mes incorrecto!");
			return false;
		}
	}else{
		if (monthValue == 0 || monthValue < 0 || monthValue == null){ 
			//alert("Valor para mes incorrecto! Debe ser un valor mayor a cero.");
			return false;
		}
	}
	
	return true;
	
}


function validateMonthByType(monthValue, specialType){
/*
	Funcion para ser invocada en el onblur del campo mes de la cabecera
	cuando el formulario a presentar sea Semestral o Cuatrimestral.-
*/
	if (specialType=='semestral'){
		if (monthValue != 6 && monthValue != 12){
			alert("Periodo incorrecto! \n S\u00f3lo v\u00e1lido para Junio y Diciembre");
			document.getElementById('fiscalPeriodMounth').value='';
			return false;
		}
		
	}else if(specialType=='cuatrimestral'){
		if (monthValue != 4 && monthValue != 8 &&  monthValue!=12 ){
			alert("Periodo incorrecto! \n S\u00f3lo v\u00e1lido para Abril, Agosto y Diciembre");
			document.getElementById('fiscalPeriodMounth').value='';
			return false;
		}
	}
	else if(specialType=='trimestral'){
		if (monthValue != 3 && monthValue != 6 && monthValue != 8 &&  monthValue!=12 ){
			alert("Periodo incorrecto! \n Sólo válido para Marzo, Junio, Septiembre y Diciembre");
			document.getElementById('fiscalPeriodMounth').value='';
			return false;
		}
	}
	return true;
}

function validateYearForMonthly(){//VALIDACI�N DE A�O PARA FORMULARIOS MENSUALES.-
	var yearValue = getValueFormatless('fiscalPeriodYear');
	var declarationType = document.getElementById('declarationType').value;
	
	//var actualDate = new Date();
	//actualDate=getServerDate();
	var actualYear=getActualYear();
	if(yearValue == 0){
		return;
	}
	
	
	if (yearValue > actualYear){
		alert("Error! \nEl a\u00f1o no puede ser mayor que el a\u00f1o actual!");
		document.getElementById('fiscalPeriodYear').value='';
		return false;
	}
	return true;
}


function validateMonthlyForm(specialType){ //EXCLUSIVO PARA CONTROL DE FORMULARIOS MENSUALES.-
/*
Funcion que verifica el campo de mes de la declaraci�n en la cabecera,
Para ser invocado en el OnBlur del campo mes de la cabecera y en el BeforeSave del formulario.
*/
	var declarationType = document.getElementById('declarationType').value;
	var periodDate		= new Date();
	var actualDate 		= new Date();
	var actualYear		= getActualYear();
	var monthValue 		= getValueFormatless('fiscalPeriodMounth');
	var yearValue 		= getValueFormatless('fiscalPeriodYear');
	
	actualDate=getServerDate();
	periodDate.setFullYear(yearValue,monthValue-1,periodDate.getDate());
	periodDate.setHours(actualDate.getHours());
	periodDate.setMinutes(actualDate.getMinutes());
	periodDate.setSeconds(actualDate.getSeconds());
	periodDate.setMilliseconds(actualDate.getMilliseconds());
	
	
// si el caso es que no se tiene uno de los dos campos?
	if(monthValue == 0 || yearValue == 0){
		alert("Error!, Datos de periodo incompletos");
		return false;
	//retorna falso si falta algun dato de periodo.-
	}
	
	if(!validateMonthValue()){
		alert("Error!\n Valor incorrecto para mes de presentaci\u00f3n.");
		document.getElementById('fiscalPeriodMounth').value='';
		return false;
	}
	
	if (declarationType=='| 3 | CLAUSURA' || declarationType=='| 5 | CLAUSURA'){
			if (periodDate > actualDate){
				alert("ERROR!\n EL mes de presentaci\u00f3n no puede ser mayor al mes actual");
				document.getElementById('fiscalPeriodMounth').value='';
				return false;
			}
	}else{
			 if (periodDate >= actualDate){
				alert("ERROR!\n Para Declaraciones Originales y Rectificativas, el mes de presentaci\u00f3n debe ser menor al mes actual");
				document.getElementById('fiscalPeriodMounth').value='';
				return false;
			 }
	}
	
	
/*
	if(!validateYearValue(yearValue)){
		return false;
	}
	
	//2008				2007	
	if(actualYear >= yearValue){
		
		if (declarationType=='| 3 | CLAUSURA'){
			if (monthValue > actualDate.getMonth()+1){
				alert("ERROR!\n EL mes de presentaci�n no puede ser mayor al mes actual");
				document.getElementById('fiscalPeriodMounth').value='';
				return false;
			}
		}else{
			 if (monthValue >= actualDate.getMonth()+1){
				alert("ERROR!\n Para Declaraciones Originales y Rectificativas, el mes de presentaci�n debe ser menor al mes actual");
				document.getElementById('fiscalPeriodMounth').value='';
				return false;
			 }
		}
	}
*/	
	if(specialType=='semestral' || specialType=='cuatrimestral' || specialType=='trimestral')
	{
		if (!validateMonthByType(monthValue, specialType)){
			return false;
		}
	}
	return true;
}


function validateFormYear() //EXCLUSIVO PARA CONTROL DE FORMULARIOS ANUALES.-
{
	/*
	Funcion que controla la validez del a�o de presentaci�n en la cabecera,
	 para ser invocada en el evento Onblur del a�o de declaraci�n y en el Before Save.-
	*/
	var yearValue = getValueFormatless('fiscalPeriodYear');
	var declarationType = document.getElementById('declarationType').value;
	
	var actualDate= new Date();
	actualDate= getServerDate();
	var actualYear=getActualYear();
	
	if (!validateYearValue(yearValue)){
		alert("Error!\n Valor incorrecto para a\u00f1o de presenaci\u00f3n");
		document.getElementById('fiscalPeriodYear').value='';
		return false;
	}
	
	
	if ((declarationType=='| 3 | CLAUSURA') || (declarationType=='| 5 | CLAUSURA')){
		if (yearValue > actualYear){
			alert("Error!\n El valor del a\u00f1o no debe ser mayor al a\u00f1o actual")
			document.getElementById('fiscalPeriodYear').value='';
			return false;
		}
	}else if(yearValue >= actualYear){
		alert("Error!\n El valor del a\u00f1o debe ser menor al a\u00f1o actual")
		document.getElementById('fiscalPeriodYear').value='';
		return false;
	}
	return true;
}


/* ver si vale la pena hacerse*/
function validateYearValue(yearValue){
	if (yearValue == 0 || yearValue == null || yearValue < 1950 ){
		return false;
	}
	return true;
}


function controlFiscalPeriod(formType){
	switch (formType){
	case 'mensual':
		if(!validateMonthlyForm(formType)){
			return false;
		}else{
			if (!validateYearForMonthly()){
				return false;
			}
		}
		return true;	
		break;

	case 'trimestral':
		if(!validateMonthlyForm(formType)){
			return false;
		}else{
			if (!validateYearForMonthly()){
				return false;
			}
		}
		return true;	
		break;
		
	case 'cuatrimestral':
		if(!validateMonthlyForm(formType)){
			return false;
		}else{
			if (!validateYearForMonthly()){
				return false;
			}
		}
		return true;	
		break;
	
	case'semestral':
		if(!validateMonthlyForm(formType)){
			return false;
		}else{
			if (!validateYearForMonthly()){
				return false;
			}
		}
		return true;	
		break;
	
	case 'anual':
		if (!validateFormYear()){
		return false;
		
		}
		return true;
		break;
	}

}