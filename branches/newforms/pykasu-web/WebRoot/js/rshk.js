function eliminar(){
	if (confirm("Seguro que desea eliminar el registro actual?")){
		
		alert("El registro ha sido eliminado.");		
	}
}


function deleteDetail(obj){
	alert(obj.name)
}

function addDetail(){
	var table1 = document.getElementById('table_detalles');
	var index = table1.rows.length-1;		
	var row = table1.insertRow(table1.rows.length);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	var cell4 = row.insertCell(3);

	cell1.innerHTML = '<input type="text" name="formType('+index+')" value="" id="detalle_id_'+index+'" onfocus="elegirFila(this)">';
	cell2.innerHTML = '<input type="text" name="charFrom('+index+')" value="" id="detalle_descripcion_'+index+'"  onfocus="elegirFila(this)">';
	cell3.innerHTML = '<input type="text" name="charTo('+index+')" value=""   id="detalle_descripcion_'+index+'" onfocus="elegirFila(this)">';
	cell4.innerHTML = '<input type="text" name="date('+index+')" value=""     id="detalle_importe_'+index+'" onfocus="elegirFila(this)">';
	setTimeout("document.getElementById(\'detalle_id_"+index+"\').focus()",100);
}
