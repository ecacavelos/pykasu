
<%@ page contentType="text/html" language="java"
%>
<jsp:directive.page import="py.com.roshka.pykasu.web.Globals"/>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<title>Sistema</title>
		<script LANGUAGE="JavaScript" SRC="menus.js"></script>
		<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
		function showmessage()
		{			
			<logic:present name="PYKASU.MESSAGE">
				//alert('<bean:write name="PYKASU.MESSAGE" filter="false"/>')
			</logic:present>
			<logic:present name="PYKASU.ERROR">
				alert('<bean:write name="PYKASU.ERROR" filter="false"/>')
			</logic:present>			
		}
		
		function whichButton(event)
		{
			if(document.getElementById('login_button') != null && event.keyCode==13){
				encryp();
			}
			
		}
		</script>
	</head>
	
	<body onload="showmessage()" onkeyup="whichButton(event)">
		<br><jsp:include page="header.jsp"/> 
		
		<jsp:include page="menu.jsp"/> 
		
		<div id="main">
			<jsp:include page="messages.jsp"/> 
			<logic:notPresent name="<%=py.com.roshka.pykasu.web.Globals.LOGIN_USER%>">
				<div style="background-color:#444444; font-family:tahoma;font-size:12px;font-weight:bolder;padding:14px;width:550px" >
					<label style="color: silver; font-size: 16px;">Estimado Cliente/Contribuyente:</label><br/><br/>
					<label style="color: silver;  font-size: 14px;">Le informamos que hemos realizado mejoras en el Servicio de Tributos vía Internet, las mismas contribuirán a darle agilidad y mayor seguridad al proceso, para lo cual deberá registrar los datos solicitados, ingresando a la opción "Registrar una cuenta nueva" para el servicio de PRESENTACIÓN DE DECLARACIÓN JURADA.<br/><br/>
					Su usuario y contraseña para PAGO DE IMPUESTO, seguirán vigentes.<br/><br/>
					Ponemos a su disposición un instructivo que lo ayudará a obtener mas detalles del servicio.<br/><br/>
					Ante consultas, le invitamos a comunicarse con nosotros al 414 3000 de 08:00 a 18:00 hs.</label>
				</div>
				
			</logic:notPresent>
			
			<logic:present name="<%=py.com.roshka.pykasu.web.Globals.LOGIN_USER%>"> 
				<div id="welcome">
					<%if( //si es tiempo de rifa y es cliente
						py.com.roshka.pykasu.util.Utils.isRaffleTime(
							new java.util.Date(System.currentTimeMillis())) 
						&& 
						((py.com.roshka.pykasu.persistence.users.User)
							request.getSession().getAttribute(Globals.LOGIN_USER))
								.getBusinessCompany().getClient().booleanValue()){%>
						<div id="showRaffleInfo" style="padding: 10px;">
							<label style="font-weight: bold">Sorteo electrónico de 5 notebook con internet movil gratis por 1 año</label>
							<br />
							<label>Para observar sus cupones, presione <a href="showraffleticketlist.do" >aqui</a></label>
						</div>
					<%}%>
					
					<%-- <p class="msg-title">Bienvenido al Sistema de Tributos Web</p> --%>
					<p class="msg-title"><b>Instrucciones básicas.</b></p>
					<p class="msg-text">A la izquierda encontrará un menú. </p>
					<p class="msg-text">1. Para cargar un formulario, mueva el cursor al formulario que desea cargar. </p>		
					<p class="msg-text">2. Se le aparecerá un menu contextual. Elija, "Nuevo Formulario" </p>		
					<p class="msg-text">3. Se despliega el formulario indicado en blanco, listo para ser cargado. </p>
					<p class="msg-text">4. Una vez que termine de cargar el formulario, encontratá al final del documento el cuadro de diálogo <i>Estado del presente documento</i>, 
					Si todavía no terminó de cargar o quiere seguir en otro momento dar la opción de <b>PROCESO</b>  y Si quiere enviar el documento dar la opción de confirmado 
					y luego presione el botón <b>Enviar</b> ubicado al final del formulario</p>				
					<br><br>Para más detalles, puede remitirse a las <a href="/pycasu/html/FAQ.htm" target="_blank">preguntas más frecuentes</a>.
				</div>
			</logic:present>
		</div> <!-- div main -->
	</body>
</html>
