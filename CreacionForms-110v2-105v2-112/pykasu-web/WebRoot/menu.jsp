<%@ page contentType="text/html" language="java"

%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>

<script LANGUAGE="JavaScript" src="js/sha1.js">
</script>

<script LANGUAGE="JavaScript">

var menus = new Array()
var tds = new Array()

function addTd(td2){
	tds[tds.length] = td2;
}
function addDiv(menu){
	menus[menus.length] = menu;

}
function addMenu(menu,td2){
	tds[tds.length] = td2;
}
function mostrarError(){
	var d = document.getElementById('error1');
	alert(d.style.visibility);
	d.style.visibility = 'visible';
	d.style.heigth = '20px';
}
function hideAll(){

	for (i=0; i<tds.length; i++){
		var d2 = tds[i];
		d2.style.backgroundColor = '#EEEEEE';
		
	}
	
	for (i=0; i<menus.length; i++){
		var d = menus[i];
		d.style.visibility = 'hidden';
		d.style.height = '0px';
		d.style.padding = '0px';
	}


}
function showCuadro(it,td){
		var d = document.getElementById(it);
		if (d == null)
			return;	
		hideAll();
		var d2 = document.getElementById(td);
		//d2.style.backgroundColor = '#FF0000';
		d2.style.backgroundColor = '#A4B6FF';
		d.style.visibility = 'visible';
		d.style.width = '120px';
		d.style.margin='0px';
}
function colorear(seleccionar, td){
		//var d = document.getElementById(id);
		if(seleccionar == 'true'){
			td.style.backgroundColor = '#A4B6FF';
		}else{
			td.style.backgroundColor = '#EEEEEE';
		}
}	



function encryp(){
	tmp_pass = document.getElementById("tmp_password");
	pass = document.getElementById("j_password");
	pass.value = hex_sha1(tmp_pass.value);
	var form = document.getElementById("login");
	form.submit();
	
}
</script>
<noscript>
	Este sitio requiere javascript para su correcto funcionamiento.<br>
	Su navegador actual o bien, no soporta javascript, o no lo tiene activado.<br>
	Usted no podrá ingresar a este servicio.<br>	
</noscript>
<div id="menu">
	<br>
	<logic:present name="<%=py.com.roshka.pykasu.web.Globals.LOGIN_USER%>">
	<table cellspacing="1">
		<tr>
			<th><bean:write name="<%=py.com.roshka.pykasu.web.Globals.LOGIN_USER%>" property="fullName"/></th>
		</tr>
	</table>
	</logic:present>
	<logic:notPresent name="<%=py.com.roshka.pykasu.web.Globals.LOGIN_USER%>">
	<form action="login.do" method="post" id="login">
	<table cellspacing="1" cellpadding="2">
		<tr>
			<th>Sistema</th>
		</tr>
		<tr>
			<td>Usuario</td>
		</tr>
		<tr>
			<td><input type="text" name="j_username" id="username"></td>
		</tr>
		<tr>			
			<td>Password</td>
		</tr>
		<tr>			
			<td>
				<input type="password" name="tmp_password" id="tmp_password"/>
			    <input type="hidden"   name="j_password" id="j_password"/>
			</td>
		</tr>
		<tr>			
			<td><input type="button" value="Ingresar" onclick="encryp()" id="login_button"/></td>
		</tr>
		<tr><td><hr/></td></tr>		
		<tr>			
			<td><a href="admissionform.do">Registrar una cuenta nueva</a></td>
		</tr>
		<tr><td><hr/></td></tr>
		<tr><td><a href="/pycasu/html/procesoSolicitud.htm" target="_blank">Conozca más sobre el proceso de Solicitud de Cuenta</a></td></tr>
	</table>
	</form>
	</logic:notPresent>
	<br>
	<logic:present name="<%=py.com.roshka.pykasu.web.Globals.LOGIN_USER %>">
		<%
			try{//
			java.util.Iterator programs = ((java.util.List<py.com.roshka.pykasu.ui.menu.Program>)request.getSession(false).getAttribute(py.com.roshka.pykasu.web.Globals.USER_PROGRAMS)).iterator();
			int actionCount = 1;
			while (programs.hasNext()){
				py.com.roshka.pykasu.ui.menu.Program program = (py.com.roshka.pykasu.ui.menu.Program)programs.next();
		%>
	<table cellspacing="1">
		<tr>
			<th><%=program.getName()%></th></tr>
		<%

			java.util.Iterator actions = ((java.util.Set<py.com.roshka.pykasu.ui.menu.Action>)program.getActions()).iterator();
			
			while (actions.hasNext())
			{	
			   	actionCount++;
				String actionId = "action_"+actionCount;
				py.com.roshka.pykasu.ui.menu.Action action = (py.com.roshka.pykasu.ui.menu.Action)actions.next();
				    
		%>	
		<tr>
			<td id="<%="td_"+actionId%>" onMouseOut="hideAll();" onMouseover="showCuadro('<%="div_"+actionId%>','<%="td_"+actionId%>')">
			<div style="position: relative;">
			<img src="images/puntero.gif"><a href="/pycasu/<%=action.getUrl()%>" ><%=action.getName()%></a>
				<%if (action.getSubactions()!=null){	
				    java.util.Iterator subActions = action.getSubactions().iterator();
				    int indexSubAction =0;%>
				    <div ID="<%="div_"+actionId%>"  STYLE="border:0px; position:absolute;visibility:hidden;top: -10px;left:100px;z-index:3;"  onMouseOut="hideAll();">
				    <table  cellspacing="0"  class="options" cellspacing="0">
<%		    	while (subActions.hasNext()){
		    	    py.com.roshka.pykasu.ui.menu.Action action2 = (py.com.roshka.pykasu.ui.menu.Action)subActions.next();
		    	    
%>
<%-- 					<tr><td id="<%="td2_"+actionId+"_"+indexSubAction%>" onmouseover="colorear('true','<%="td2_"+actionId+"_"+indexSubAction%>')" onmouseout="colorear('false','<%="td2_"+actionId+"_"+indexSubAction%>');" class="options"><img src="images/puntero.gif"><a href="<%=action2.getUrl()%>"><%=action2.getName()%> --%>
					<tr><td id="<%="td2_"+actionId+"_"+indexSubAction%>" onmouseover="colorear('true',this)" onmouseout="colorear('false',this);" class="options"><img src="images/puntero.gif"><a href="<%=action2.getUrl()%>"><%=action2.getName()%>
			</td></tr>
			<%}//iterador de subacionts%>
		</table>
	</div>
<script LANGUAGE="JavaScript">
				addDiv(document.getElementById('<%="div_"+actionId%>'));
			</script>
<%			}//si hay sub actions%>

			
			<div>
		</td>
			<script LANGUAGE="JavaScript">
				addTd(document.getElementById('<%="td_"+actionId%>'));
			</script>
		
		</tr>
		<%}//iterador de actions%>
	</table>
		<%}//iterador de programas 
			}catch(Throwable e){
				e.printStackTrace();
			}
		%>
	</logic:present>
</div>
