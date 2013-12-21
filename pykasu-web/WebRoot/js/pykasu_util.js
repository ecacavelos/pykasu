var loaded = false;

function setLoaded(value){
	if(value == 'fail'){
		alert("Problema al cargar componentes JavaScript");
		return;
	}
	loaded = value;
	
}

function isDigit(e) 
{
	var key = window.event ? e.keyCode : e.which;
	if (key == 8 || key == 9 || key == 13) return true;
	var keychar = String.fromCharCode(key);
	reg = /\d/;
	return reg.test(keychar);
}


function isLoaded(){
	return loaded;
}
function loadScript(scriptName){
	var place = "pykJS_";
	var i = 1;
	for (i = 2; i <= 5; i++){
		if(document.getElementById(place + i).src == ""){
			document.getElementById(place + i).src = scriptName;
//			setLoaded(false);
//			var i = 0;
//			while(!isLoaded() && i<10000){
							
			return;
		}
	}
	alert("Imposible cargar script: " + scriptName);
}

function colocarpuntos(field){
	var value = field.value;
	field.value = addCommas(removeCommas(value));

}	
function chequearCaraceteresValidos(field){ // Verifica si el nro ingresado es negativo
	var value = field.value;
	value = removeCommas(value);
	if (isNaN(value)){ // si no es un numero
		alert("Caracter no permitido, debe ingresar un numero positivo");
		field.value = "";
	}
	else if (value < 0 ) {
		alert("Debe ingresar un numero positivo");
		field.value = "";
	}
}	

function addCommas(nStr)
{

	nStr += '';
	x = nStr.split(',');
	x1 = x[0];
	x2 = x.length > 1 ? ',' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + '.' + '$2');
	}
	return x1 + x2;
}
function removeCommas(str){
	var number = '';
	if(str != '' && str.match('.')){ 
		var s = str.split('.');

		for (i=0;i<s.length;i++){
			number = number + s[i];
		}
	}
	return number;
	
}

var ShowPopupMessage;
function pykOpenWindow(url, winName, winWidth, winHeight){
	var winFeatures = "width=" +  winWidth + ", height="+ winHeight + ", scrollbars=yes, toolbars=no, resizable=yes";
	if(ShowPopupMessage){
		ShowPopupMessage.close();
	}

	ShowPopupMessage = window.open(url,winName,winFeatures);
}

function getValueFormatless(nombreCampo){
	if(document.getElementById(nombreCampo) != null){
		var valueFormatted = document.getElementById(nombreCampo).value;

		var valueFormatless = removeCommas(valueFormatted);
		if(valueFormatless != "")
			return parseInt(valueFormatless, 10);//Devuelve 0 si no tiene valor.
		else 
			return 0;
	}else{
		alert('El campo '+nombreCampo+' no existe.');
	}
}

/*
Devuelve el año actual.
(Patch para distintas interpretaciones
de los navegadores...)
*/
function getActualYear(){

	var fecha = new Date();
	fecha= getServerDate();
	
	if(fecha.getYear() < 1900){
		return (fecha.getYear()+1900);
	}else{
		return fecha.getYear();
	}
}

function trim(cadena){
	for(i=0; i<cadena.length; )
	{
		if(cadena.charAt(i)==" ")
			cadena=cadena.substring(i+1, cadena.length);
		else
			break;
	}

	for(i=cadena.length-1; i>=0; i=cadena.length-1)
	{
		if(cadena.charAt(i)==" ")
			cadena=cadena.substring(0,i);
		else
			break;
	}
	
	return cadena;
}	