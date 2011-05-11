<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaa</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C10)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C6)"].value)+parseFloat(formu["dynamicProps(C7)"].value)+parseFloat(formu["dynamicProps(C8)"].value)+parseFloat(formu["dynamicProps(C9)"].value)-parseFloat(formu["dynamicProps(C11)"].value)-parseFloat(formu["dynamicProps(C12)"].value)-parseFloat(formu["dynamicProps(C13)"].value)-parseFloat(formu["dynamicProps(C14)"].value)-parseFloat(formu["dynamicProps(C15)"].value)-parseFloat(formu["dynamicProps(C16)"].value)-parseFloat(formu["dynamicProps(C17)"].value)-parseFloat(formu["dynamicProps(C18)"].value)-parseFloat(formu["dynamicProps(C19)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C11)"].value = nvl(Math.round(si(parseFloat(formu["dynamicProps(C6)"].value)>0,0,parseFloat(formu["dynamicProps(C11)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C6)"].value = nvl(Math.round(si(parseFloat(formu["dynamicProps(C11)"].value)>0,0,parseFloat(formu["dynamicProps(C6)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C20)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C11)"].value)+parseFloat(formu["dynamicProps(C12)"].value)+parseFloat(formu["dynamicProps(C13)"].value)+parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)+parseFloat(formu["dynamicProps(C19)"].value)-parseFloat(formu["dynamicProps(C6)"].value)-parseFloat(formu["dynamicProps(C7)"].value)-parseFloat(formu["dynamicProps(C8)"].value)-parseFloat(formu["dynamicProps(C9)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C21)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C20)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C22)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C10)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C23)"].value = nvl(Math.round(elegir(mayor(parseFloat(formu["dynamicProps(C4)"].value),1993),1993,0,parseFloat(formu["dynamicProps(C23)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C24)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C22)"].value)+parseFloat(formu["dynamicProps(C23)"].value)-parseFloat(formu["dynamicProps(C21)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C25)"].value = nvl(Math.round(mayor(menor(parseFloat(formu["dynamicProps(C25)"].value),parseFloat(formu["dynamicProps(C21)"].value)-(parseFloat(formu["dynamicProps(C22)"].value)+parseFloat(formu["dynamicProps(C23)"].value))),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C26)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C21)"].value)-parseFloat(formu["dynamicProps(C22)"].value)-parseFloat(formu["dynamicProps(C23)"].value)-parseFloat(formu["dynamicProps(C25)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C27)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C25)"].value) * 0.10));} catch(e){errores++;}
	try { formu["dynamicProps(C28)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C26)"].value) * 0.30));} catch(e){errores++;}
	try { formu["dynamicProps(C29)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C29)"].value),parseFloat(formu["dynamicProps(C26)"].value) * 0.05)));} catch(e){errores++;}
	try { formu["dynamicProps(C30)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C27)"].value)+parseFloat(formu["dynamicProps(C28)"].value)+parseFloat(formu["dynamicProps(C29)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C33)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C33)"].value),parseFloat(formu["dynamicProps(C20)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C37)"].value = nvl(Math.round(elegir(calcularmulta(111,parseFloat(formu["dynamicProps(C30)"].value)),0,si(parseFloat(formu["dynamicProps(C37)"].value)>0,50000,0),calcularmulta(111,parseFloat(formu["dynamicProps(C30)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C38)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C31)"].value)+parseFloat(formu["dynamicProps(C32)"].value)+parseFloat(formu["dynamicProps(C33)"].value)+parseFloat(formu["dynamicProps(C34)"].value)+parseFloat(formu["dynamicProps(C35)"].value)+parseFloat(formu["dynamicProps(C36)"].value)-parseFloat(formu["dynamicProps(C30)"].value)-parseFloat(formu["dynamicProps(C37)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C39)"].value = nvl(Math.round(calcularmora(mayor((parseFloat(formu["dynamicProps(C30)"].value))-(parseFloat(formu["dynamicProps(C31)"].value)+parseFloat(formu["dynamicProps(C32)"].value)+parseFloat(formu["dynamicProps(C33)"].value)+parseFloat(formu["dynamicProps(C34)"].value)+parseFloat(formu["dynamicProps(C35)"].value)+parseFloat(formu["dynamicProps(C36)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C40)"].value = nvl(Math.round(calcularinteres(mayor((parseFloat(formu["dynamicProps(C30)"].value))-(parseFloat(formu["dynamicProps(C31)"].value)+parseFloat(formu["dynamicProps(C32)"].value)+parseFloat(formu["dynamicProps(C33)"].value)+parseFloat(formu["dynamicProps(C34)"].value)+parseFloat(formu["dynamicProps(C35)"].value)+parseFloat(formu["dynamicProps(C36)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C41)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C30)"].value)-parseFloat(formu["dynamicProps(C31)"].value)-parseFloat(formu["dynamicProps(C32)"].value)-parseFloat(formu["dynamicProps(C33)"].value)-parseFloat(formu["dynamicProps(C34)"].value)-parseFloat(formu["dynamicProps(C35)"].value)-parseFloat(formu["dynamicProps(C36)"].value)+parseFloat(formu["dynamicProps(C37)"].value)+parseFloat(formu["dynamicProps(C39)"].value)+parseFloat(formu["dynamicProps(C40)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C55)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C55)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C56)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C42)"].value)+parseFloat(formu["dynamicProps(C43)"].value)+parseFloat(formu["dynamicProps(C44)"].value)+parseFloat(formu["dynamicProps(C45)"].value)+parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C47)"].value)+parseFloat(formu["dynamicProps(C48)"].value)+parseFloat(formu["dynamicProps(C49)"].value)+parseFloat(formu["dynamicProps(C50)"].value)+parseFloat(formu["dynamicProps(C51)"].value)+parseFloat(formu["dynamicProps(C52)"].value)+parseFloat(formu["dynamicProps(C53)"].value)+parseFloat(formu["dynamicProps(C54)"].value)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C32)"].value == "") formu["dynamicProps(C32)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C21)"].value == "") formu["dynamicProps(C21)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C54)"].value == "") formu["dynamicProps(C54)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C43)"].value == "") formu["dynamicProps(C43)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C44)"].value == "") formu["dynamicProps(C44)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C37)"].value == "") formu["dynamicProps(C37)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C4)"].value == "") formu["dynamicProps(C4)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C29)"].value == "") formu["dynamicProps(C29)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C53)"].value == "") formu["dynamicProps(C53)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C49)"].value == "") formu["dynamicProps(C49)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C34)"].value == "") formu["dynamicProps(C34)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C42)"].value == "") formu["dynamicProps(C42)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C12)"].value == "") formu["dynamicProps(C12)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C7)"].value == "") formu["dynamicProps(C7)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C40)"].value == "") formu["dynamicProps(C40)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C46)"].value == "") formu["dynamicProps(C46)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C13)"].value == "") formu["dynamicProps(C13)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C51)"].value == "") formu["dynamicProps(C51)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C35)"].value == "") formu["dynamicProps(C35)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C47)"].value == "") formu["dynamicProps(C47)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C50)"].value == "") formu["dynamicProps(C50)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C36)"].value == "") formu["dynamicProps(C36)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C48)"].value == "") formu["dynamicProps(C48)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C33)"].value == "") formu["dynamicProps(C33)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C55)"].value == "") formu["dynamicProps(C55)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C9)"].value == "") formu["dynamicProps(C9)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C30)"].value == "") formu["dynamicProps(C30)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C45)"].value == "") formu["dynamicProps(C45)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C39)"].value == "") formu["dynamicProps(C39)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C52)"].value == "") formu["dynamicProps(C52)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C8)"].value == "") formu["dynamicProps(C8)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C31)"].value == "") formu["dynamicProps(C31)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C6)"].value == "") formu["dynamicProps(C6)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C54');
	ponerPuntosEnCampo('C43');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C29');
	ponerPuntosEnCampo('C37');
	ponerPuntosEnCampo('C44');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C49');
	ponerPuntosEnCampo('C34');
	ponerPuntosEnCampo('C56');
	ponerPuntosEnCampo('C7');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C46');
	ponerPuntosEnCampo('C13');
	ponerPuntosEnCampo('C24');
	ponerPuntosEnCampo('C50');
	ponerPuntosEnCampo('C26');
	ponerPuntosEnCampo('C55');
	ponerPuntosEnCampo('C9');
	ponerPuntosEnCampo('C11');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C30');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C39');
	ponerPuntosEnCampo('C8');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C6');
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C32');
	ponerPuntosEnCampo('C4');
	ponerPuntosEnCampo('C41');
	ponerPuntosEnCampo('C53');
	ponerPuntosEnCampo('C42');
	ponerPuntosEnCampo('C40');
	ponerPuntosEnCampo('C51');
	ponerPuntosEnCampo('C35');
	ponerPuntosEnCampo('C47');
	ponerPuntosEnCampo('C14');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C36');
	ponerPuntosEnCampo('C33');
	ponerPuntosEnCampo('C48');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C45');
	ponerPuntosEnCampo('C38');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C52');
	ponerPuntosEnCampo('C31');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C54');
	quitarPuntosDeCampo('C43');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C29');
	quitarPuntosDeCampo('C37');
	quitarPuntosDeCampo('C44');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C49');
	quitarPuntosDeCampo('C34');
	quitarPuntosDeCampo('C56');
	quitarPuntosDeCampo('C7');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C46');
	quitarPuntosDeCampo('C13');
	quitarPuntosDeCampo('C24');
	quitarPuntosDeCampo('C50');
	quitarPuntosDeCampo('C26');
	quitarPuntosDeCampo('C55');
	quitarPuntosDeCampo('C9');
	quitarPuntosDeCampo('C11');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C30');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C39');
	quitarPuntosDeCampo('C8');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C20');
	quitarPuntosDeCampo('C6');
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C32');
	quitarPuntosDeCampo('C4');
	quitarPuntosDeCampo('C41');
	quitarPuntosDeCampo('C53');
	quitarPuntosDeCampo('C42');
	quitarPuntosDeCampo('C40');
	quitarPuntosDeCampo('C51');
	quitarPuntosDeCampo('C35');
	quitarPuntosDeCampo('C47');
	quitarPuntosDeCampo('C14');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C36');
	quitarPuntosDeCampo('C33');
	quitarPuntosDeCampo('C48');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C45');
	quitarPuntosDeCampo('C38');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C52');
	quitarPuntosDeCampo('C31');
}

function Calcular(formu) {
	var errores=0;
	try{
		errores = Cerar(formu);
		quitarTodosLosPuntos(formu);
		errores += Sumar(formu);
		ponerTodosLosPuntos(formu);
	} catch(e){alert('El formulario contiene errores.');}
}
  ]]></SCRIPT>
		<table class="declaracion">
			<link href="../../style/css/bd-verde.css" type="text/css" rel="stylesheet"/>
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">805</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA CAP. I LEY 125/91</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-verde.gif" width="4"/>
									</td>
								</tr>
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio" rowSpan="2" style="width: 90%">
														<p align="left">PARA CONTRIBUYENTES QUE REALICEN ACTIVIDADES COMERCIALES, INDUSTRIALES O DE SERVICIOS Y LLEVEN REGISTROS CONTABLES </p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">MES DE CIERRE</p>
													</th>
												</tr>
												<tr>
													<td class="borde">05</td>
													<td class="borde">
														<xsl:call-template name="itemMesCierre"><xsl:with-param name="pNombre">C5</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C5"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-verde.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-verde.gif" width="4"/>
									</td>
								</tr>
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio" rowSpan="2">INC</th>
													<th class="bordevacio" rowSpan="2" style="width: 95%">
														<p align="left">RUBRO 1 DETERMINACION DEL RESULTADO FISCAL DEL EJERCICIO</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">IMPORTE</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">PERDIDA -I-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">BENEFICIO -II-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Resultado del ejercicio según Balance</td>
													<td class="borde">06</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C6"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">11</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Amortizaciones</td>
													<td class="borde">07</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C7</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C7"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">12</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Enajenación de bienes muebles e inmuebles del activo fijo y diferencia de valuación de aquellos que hayan sido recibidos en pago</td>
													<td class="borde">08</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C8</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C8"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">13</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Remuneraciones del dueño, socios, gerentes o directores y honorarios profesionales o similares.</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">14</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Gastos de movilidad o viáticos y gastos en el exterior</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">15</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Retiro de bienes para uso particular de dueños, socios o accionistas de la empresa o entregados a los mismos como pago</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">16</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Distribución de utilidades en especie</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">17</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Impuesto a la Renta</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">18</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Otros gastos o conceptos no admitidos como deducción</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">19</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Rentas no alcanzadas por el Tributo</td>
													<td class="borde">09</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C9</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C9"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">SUB TOTALES</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Diferencia entre Columnas del Inc. k ( a Col. I si ésta es mayor que Col. II; a Col. II si ésta es mayor que Col. I)</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Pérdida Fiscal del ejercicio (Inc. l Col. I)</td>
													<td class="borde">10</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">Renta Neta del Ejercicio (Inc. I Col. II)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">20</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-verde.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-verde.gif" width="4"/>
									</td>
								</tr>
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio" rowSpan="2">INC</th>
													<th class="bordevacio" rowSpan="2" style="width: 95%">
														<p align="left">RUBRO 2 determinacion de la renta neta gravada</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">columna -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">columna -II-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Renta Neta del Ejercicio (Rubro 1 Inc. n)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">21</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Pérdida fiscal del Ejercicio (Rubro 1 Inc. m)</td>
													<td class="borde">22</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Pérdidas fiscales de ejercicios anteriores</td>
													<td class="borde">23</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">SUB TOTALES (Inc. b+c, a Col. I; Inc. a, a Col. II</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Diferencia entre Columnas del Inc. d (a Col. I si ésta es mayor que Col. II; a Col. II si ésta es mayor que Col. I)</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Pérdida (Inc. e Col. I)</td>
													<td class="borde">24</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Rentas del Inc. e Col. II destinadas a reinversiones</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">25</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Rentas del Inc. e Col. II no reinvertidas (Inc. e Col. II menos Inc. g)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">26</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-verde.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<!--<tr><td class="saltoPagina"></td></tr>-->
				<tr>
					<td>
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-verde.gif" width="4"/>
									</td>
								</tr>
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio" rowSpan="2">INC</th>
													<th class="bordevacio" rowSpan="2" style="width: 95%">
														<p align="left">RUBRO 3 saldo del impuesto</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">a favor del</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">contribuyente -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">fisco -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Impuesto liquidado sobre rentas destinadas a reinversiones (10% del Rubro 2 Inc. g)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">27</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Impuesto liquidado sobre rentas no reinvertidas (30% del Rubro 2 Inc. h)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">28</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Retención por acreditamiento a Casa Matriz del exterior (5% del Rubro 2 Inc. h)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">29</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">SUB TOTAL (Inc. a+b+c)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">30</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Saldo a favor del Contribuyente del período anterior</td>
													<td class="borde">31</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Anticipos ingresados</td>
													<td class="borde">32</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Exoneración Ley 60/90</td>
													<td class="borde">33</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Retenciones de Impuesto a la Renta computables</td>
													<td class="borde">34</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Pago realizado mediante Certificados de Crédito expedidos por la SET</td>
													<td class="borde">35</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Pago previo</td>
													<td class="borde">36</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">37</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">SUB TOTALES (Inc. e+f+g+h+i+j a Col. I; Inc. d+k, a Col. II)</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Saldo a favor del Contribuyente (Diferencia entre Columnas del Inc. l, cuando Col. I es mayor que Col. II)</td>
													<td class="borde">38</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. l, cuando Col. II es mayor que Col. I)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">o</td>
													<td class="borde">Multa por mora .........% del resultado de Inc. n menos Inc. k (Sólo se calculará cuando Inc. n sea mayor que Inc. k)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">39</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">p</td>
													<td class="borde">Intereses del resultado de Inc. n menos Inc. k (Sólo se calculará cuando Inc. n sea mayor que Inc. k)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">40</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">q</td>
													<td class="borde">Saldo definitivo a favor del Fisco (Inc. n+o+p)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">41</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-verde.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-verde.gif" width="4"/>
									</td>
								</tr>
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 4 datos complementarios del ejercicio -detalle-</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">importe o cantidad</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Remuneraciones brutas por sueldos y jornales u otras gratificaciones al personal</td>
													<td class="borde">42</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Aportes patronales sobre remuneraciones</td>
													<td class="borde">43</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Total de gastos que representan efectivas erogaciones, excluídos los indicados en Inc. a, e Inc. b</td>
													<td class="borde">44</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Existencia inicial de mercaderías y materias primas</td>
													<td class="borde">45</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Existencia final de mercaderías y materias primas</td>
													<td class="borde">46</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Compras en el país de bienes de activo fijo</td>
													<td class="borde">47</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Importación de bienes de activo fijo</td>
													<td class="borde">48</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Total de importaciones, excluídas las correspondientes a bienes de activo fijo del Inc. g</td>
													<td class="borde">49</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Deudas comerciales (proveedores) al cierre del ejercicio</td>
													<td class="borde">50</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Deudas bancarias al cierre del ejercicio</td>
													<td class="borde">51</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Deudores comerciales (clientes) al cierre del ejercicio</td>
													<td class="borde">52</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Total al Activo al cierre del ejercicio</td>
													<td class="borde">53</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Total del Pasivo al cierre del ejercicio</td>
													<td class="borde">54</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">Cantidad de personal ocupado al cierre del ejercicio (obreros y empleados)</td>
													<td class="borde">55</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">o</td>
													<td class="borde">Total de control (Inc. a+b+c+d+e+f+g+h+i+j+k+l+m+n)</td>
													<td class="borde">56</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-verde.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-verde.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
