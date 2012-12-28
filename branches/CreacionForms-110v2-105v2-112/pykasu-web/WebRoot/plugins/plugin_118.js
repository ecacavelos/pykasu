var pm_fiscalPeriodMounth = null;
function onloadForm(){
	loadScript('js/pykFiscalComun.js');
	
	var valueOld;
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

	if( PORC_MORA == 0 || 
		PORC_INTERES == 0 || 
		CONTRAVENSION_CMOV == 0 ||
		CONTRAVENSION_SMOV == 0)
	{
		pm_called = 0;	
	}
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
	
	var tmp1 = document.getElementById('c23').value;
	var tmp2 = document.getElementById('c19').value;	
	var op = removeCommas(tmp1) - removeCommas(tmp2);
	if(op < 0){
		op = 0;
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
	return '118';
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

/*Se controla que año de declaración sea mayor o igual a 2007
* Se controla que año de presentacion y declaración sean:
*	- iguales si mes de declaración es 04, 08
*	- el año de pres es año sigte si mes de declaración es 12
*/
function controlaAnho(){
	/*var mes = getValueFormatless('fiscalPeriodMounth');
	var anhoDecla = getValueFormatless('fiscalPeriodYear');
	var anho = document.getElementById('paymentDate').value;
	var partsAnho = anho.split('/');
	var anhoPago = partsAnho[2];
	
	//Controla que año sea mayor o igual a 2007
	if (anhoDecla == 0 || anhoDecla == null){
	return;
	}
	if(anhoDecla >= 2007){
		if(mes == 12){
			if(anhoPago <= anhoDecla)
				alert('El año de declaración no puede ser posterior al de pago.');			
		}else if(mes == 4 || mes == 8){
			/*
				=== voy a comentar algo del código, por eso traigo a colación la fuente de est0
			18/01/2008
			Carlos: 
			sale una alerta al salir del campo del periodo fiscal que dice "El año de pago debe ser igual a la de declaración"
			Es una Observación nomás
			porque se grabo el form sin inconvenientes
			
			Pablo: 
			entiendo. y qué debería hacer?
			
			Carlos: 
			el tema es que
			se declaro como 8/2007
			y la fecha de pago era 18/01/2008
			la verdad que no entiendo el porqué del mensaje
			en todo caso lo que no se debería dar es
			fecha de pago: 20/12/2006
			perdon
			fecha de pago: 20/12/2007
			periodo fiscal: 08/2008
			o sea
			no podes poner que vas a pagar ayer algo de mañana
			entre parentesis
			esta de más ese mensaje me parece
			
			Pablo: 
			eso último entiendo.
			
			Carlos: 
			en lineas generales el form está ok
			sólo ese tema
			
			Pablo: 
			perfecto, eso habría que hacerlo en el plugin_118.js,
			
			Carlos: 
			ok
			te paso el prinscreen si queres
			
			Pablo: 
			ahora, dos cosas,
			1. solo hay que quitar el mensaje y controlar que la fecha de pago no sea menor a la actual.
			
			Carlos: 
			asi mismo
				
			
			
			//===== aqui viene el comentario del código
//			if(anhoPago != anhoDecla)
//				alert('El año de pago debe ser igual que el año de declaración.');
		}		
	}else {
		alert('El año de declaración no puede ser anterior al 2007.');
	}		

	/*if(  (document.getElementById('fiscalPeriodYear') != null) 
	  && (document.getElementById('fiscalPeriodYear').value != 0)
	){
		
		fecha = new Date();
		var anho = fecha.getYear()+1900;
		var anhoform = document.getElementById('fiscalPeriodYear').value;
		anhoform = removeCommas(anhoform);
		
		if(
			(
				(document.getElementById('declarationType').value == '| 5 | CLAUSURA') 
				&&(anho == anhoform)
			) 
		   || (anhoform < anho)  
		){

			getPorcentajeMoras(document.getElementById('fiscalPeriodYear'));  		  

		}else{
			alert("Anho de presentacion incorrecto. El anho debe ser menor al anho corriente. En el caso de CLAUSURA, el anho puede ser el mismo que el corriente.");
			document.getElementById('fiscalPeriodYear').focus();
			return;
		}
		
	}*/
}



/*
Si el periodo de declaraci?n es abril de 2007,
habilita el campo 15
*/
function controlHabilitaCampo15(campoMes, campoAnio){
	var mes = getValueFormatless(campoMes);
	var anio = getValueFormatless(campoAnio);
	
	//Si los campos de fecha estan completos
	if(mes == 4 && anio == 2007){//Si es abril de 2007, se habilita
		document.getElementById('c15').value = '0';
		document.getElementById('c15').readOnly = true;
		document.getElementById('c15').className = "readonly";
		
	}else{//Ya esta con estos valores por defecto, pero por si se vuelve a inhabilitar lo ponemos.
		document.getElementById('c15').readOnly = false;
		document.getElementById('c15').className = "default";
	}
	verifySum()
}

/*
Controla que el periodo de declaraci?n sea v?lido.
(como es cuatrimestral, los meses v?lidos son 04, 08, y 12)
*/
function isValidPeriod(nombreCampoPeriodo){
	
	periodValue = getValueFormatless(nombreCampoPeriodo);
	
	if(!(parseInt(periodValue,10) == 4 || parseInt(periodValue,10) == 8 || parseInt(periodValue,10) == 12)){
		alert('El mes de declaración solo puede ser abril, agosto, o diciembre.');
		document.getElementById(nombreCampoPeriodo).value = "";
	}

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
 return 'cuatrimestral';
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