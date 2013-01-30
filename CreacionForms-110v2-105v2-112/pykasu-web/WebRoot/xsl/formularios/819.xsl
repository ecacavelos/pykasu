<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaammdd</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C9)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C6)"].value)+parseFloat(formu["dynamicProps(C7)"].value)+parseFloat(formu["dynamicProps(C8)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C10)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C6)"].value),parseFloat(formu["dynamicProps(C10)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C11)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C7)"].value) * (buscartasa(11)) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C12)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C8)"].value) * (buscartasa(12)) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C13)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C10)"].value)+parseFloat(formu["dynamicProps(C11)"].value)+parseFloat(formu["dynamicProps(C12)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C24)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)+parseFloat(formu["dynamicProps(C19)"].value)+parseFloat(formu["dynamicProps(C20)"].value)+parseFloat(formu["dynamicProps(C21)"].value)+parseFloat(formu["dynamicProps(C22)"].value)+parseFloat(formu["dynamicProps(C23)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C36)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value)+parseFloat(formu["dynamicProps(C27)"].value)+parseFloat(formu["dynamicProps(C28)"].value)+parseFloat(formu["dynamicProps(C29)"].value)+parseFloat(formu["dynamicProps(C30)"].value)+parseFloat(formu["dynamicProps(C31)"].value)+parseFloat(formu["dynamicProps(C32)"].value)+parseFloat(formu["dynamicProps(C33)"].value)+parseFloat(formu["dynamicProps(C34)"].value)+parseFloat(formu["dynamicProps(C35)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C37)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C13)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C38)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C36)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C40)"].value = nvl(Math.round(elegir(calcularmulta(411,(parseFloat(formu["dynamicProps(C37)"].value)+parseFloat(formu["dynamicProps(C38)"].value))),0,si(parseFloat(formu["dynamicProps(C40)"].value)>0,50000,0),calcularmulta(411,(parseFloat(formu["dynamicProps(C37)"].value)+parseFloat(formu["dynamicProps(C38)"].value))))));} catch(e){errores++;}
	try { formu["dynamicProps(C41)"].value = nvl(Math.round(calcularmora(mayor((parseFloat(formu["dynamicProps(C37)"].value)+parseFloat(formu["dynamicProps(C38)"].value))-(parseFloat(formu["dynamicProps(C39)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C42)"].value = nvl(Math.round(calcularinteres(mayor((parseFloat(formu["dynamicProps(C37)"].value)+parseFloat(formu["dynamicProps(C38)"].value))-(parseFloat(formu["dynamicProps(C39)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C43)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C37)"].value)+parseFloat(formu["dynamicProps(C38)"].value)+parseFloat(formu["dynamicProps(C40)"].value)+parseFloat(formu["dynamicProps(C41)"].value)+parseFloat(formu["dynamicProps(C42)"].value))-parseFloat(formu["dynamicProps(C39)"].value),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C21)"].value == "") formu["dynamicProps(C21)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C32)"].value == "") formu["dynamicProps(C32)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C37)"].value == "") formu["dynamicProps(C37)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C29)"].value == "") formu["dynamicProps(C29)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C41)"].value == "") formu["dynamicProps(C41)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C34)"].value == "") formu["dynamicProps(C34)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C42)"].value == "") formu["dynamicProps(C42)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C12)"].value == "") formu["dynamicProps(C12)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C7)"].value == "") formu["dynamicProps(C7)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C40)"].value == "") formu["dynamicProps(C40)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C13)"].value == "") formu["dynamicProps(C13)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C35)"].value == "") formu["dynamicProps(C35)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C36)"].value == "") formu["dynamicProps(C36)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C33)"].value == "") formu["dynamicProps(C33)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C30)"].value == "") formu["dynamicProps(C30)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C39)"].value == "") formu["dynamicProps(C39)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C38)"].value == "") formu["dynamicProps(C38)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C8)"].value == "") formu["dynamicProps(C8)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C31)"].value == "") formu["dynamicProps(C31)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C6)"].value == "") formu["dynamicProps(C6)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C32');
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C43');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C29');
	ponerPuntosEnCampo('C37');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C41');
	ponerPuntosEnCampo('C34');
	ponerPuntosEnCampo('C7');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C42');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C40');
	ponerPuntosEnCampo('C13');
	ponerPuntosEnCampo('C24');
	ponerPuntosEnCampo('C35');
	ponerPuntosEnCampo('C14');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C36');
	ponerPuntosEnCampo('C33');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C26');
	ponerPuntosEnCampo('C9');
	ponerPuntosEnCampo('C11');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C30');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C38');
	ponerPuntosEnCampo('C39');
	ponerPuntosEnCampo('C8');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C31');
	ponerPuntosEnCampo('C6');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C32');
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C43');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C29');
	quitarPuntosDeCampo('C37');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C41');
	quitarPuntosDeCampo('C34');
	quitarPuntosDeCampo('C7');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C42');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C40');
	quitarPuntosDeCampo('C13');
	quitarPuntosDeCampo('C24');
	quitarPuntosDeCampo('C35');
	quitarPuntosDeCampo('C14');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C36');
	quitarPuntosDeCampo('C33');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C26');
	quitarPuntosDeCampo('C9');
	quitarPuntosDeCampo('C11');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C30');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C38');
	quitarPuntosDeCampo('C39');
	quitarPuntosDeCampo('C8');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C20');
	quitarPuntosDeCampo('C31');
	quitarPuntosDeCampo('C6');
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
			<link href="../../style/css/bd-ocre.css" rel="stylesheet" type="text/css"/>
			<tbody>
				<tr>
					<td/>
					<td>
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">819</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">ACTOS Y DOCUMENTOS AGENTES DE RETENCION</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
					</td>
				</tr>
				<tr>
					<td/>
					<td><table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-ocre.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-ocre.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th>
													<p>PARA QUIENES REALICEN OPERACIONES VINCULADAS A LA INTERMEDIACION
								    FINANCIERA</p>
												</th>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-ocre.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-ocre.gif" width="4" height="4"/></td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td/>
					<td>
						<table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-ocre.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-ocre.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th class="bordevacio">INC</th>
												<th class="bordevacio" style="width: 90%">
													<p align="left">RUBRO 1 actos vinculados a la intermediacion financiera - detalle</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">base imponible -i-</p>
												</th>
												<th class="bordevacio">
													<p align="center">tasa (%) -ii-</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">importe retenido -iii-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Préstamos en dinero o en especie y créditos concedidos.</td>
												<td class="borde">06</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C6"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="borde">10</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Transferencias de fondos dentro del país.</td>
												<td class="borde">07</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C7</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C7"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">.........</p>
												</td>
												<td class="borde">11</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Transferencias de fondos o de divisas al exterior</td>
												<td class="borde">08</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C8</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C8"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">.........</p>
												</td>
												<td class="borde">12</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Totales (Inc. a+b+c)</td>
												<td class="borde">09</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C9</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C9"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="borde">13</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-ocre.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-ocre.gif" width="4" height="4"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-ocre.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-ocre.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th class="bordevacio">INC</th>
												<th class="bordevacio" style="width: 90%">
													<p align="left">RUBRO 2 actos efectuados por escribanos publicos</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">base imponible -i-</p>
												</th>
												<th class="bordevacio">
													<p align="center">tasa (%) -ii-</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">importe retenido -iii-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Escrituras con valor determinado no previstas en la Ley</td>
												<td class="borde">14</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">1</p>
												</td>
												<td class="borde">25</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Contratos de concesiones otorgados por el Estado</td>
												<td class="borde">15</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">2</p>
												</td>
												<td class="borde">26</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Contratos de constitución de sociedades, sus prórrogas y las ampliaciones de capital</td>
												<td class="borde">16</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">1</p>
												</td>
												<td class="borde">27</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Contratos de locación o sublocación de inmuebles o a falta del mismo, sobre los recibos</td>
												<td class="borde">17</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">2</p>
												</td>
												<td class="borde">28</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">Escrituras de división de condominio de usufructo, servidumbre y uso, cesiones de créditos hipotecarios y de derechos y acciones sobre inmuebles</td>
												<td class="borde">18</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">2</p>
												</td>
												<td class="borde">29</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">f</td>
												<td class="borde">Contratos de compra-venta de inmuebles y los compromisos de transferencia.</td>
												<td class="borde">19</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">1</p>
												</td>
												<td class="borde">30</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">Escrituras Públicas de transferencia de inmuebles de contado o a crédito.</td>
												<td class="borde">20</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">2</p>
												</td>
												<td class="borde">31</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">Contratos y obligaciones sobre compra-venta y permuta de bienes muebles, división de condominios.</td>
												<td class="borde">21</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">2</p>
												</td>
												<td class="borde">32</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">i</td>
												<td class="borde">Contratos sobre transmisión de propiedad de embarcaciones.</td>
												<td class="borde">22</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">2</p>
												</td>
												<td class="borde">33</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">j</td>
												<td class="borde">Obligaciones de pagar sumas de dinero entre particulares, por actos no vinculados a actividades comerciales o industriales.</td>
												<td class="borde">23</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">
													<p align="center">1,75</p>
												</td>
												<td class="borde">34</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">k</td>
												<td class="borde">Actuaciones notariales con impuesto fijo (Num. 8º - 9º - 10º - 11º - 12º - Art. 128º y 133º y otros (ver instructivo)) Ley 125/91</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">35</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">l</td>
												<td class="borde">Totales (Inc. a+b+c+d+e+f+g+h+i+j+k)</td>
												<td class="borde">24</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="borde">36</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-ocre.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-ocre.gif" width="4" height="4"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-ocre.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-ocre.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th rowSpan="2" class="bordevacio">INC</th>
												<th rowSpan="2" class="bordevacio" style="width: 95%">
													<p align="left">RUBRO 3 liquidacion y saldo del impuesto</p>
												</th>
												<th colSpan="4" class="bordevacio">
													<p align="center">a favor del </p>
												</th>
											</tr>
											<tr>
												<th colSpan="2" class="bordevacio">
													<p align="center">contribuyente -i-</p>
												</th>
												<th colSpan="2" class="bordevacio" style="width: 90%">
													<p align="center">fisco -ii-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Actos vinculados a la intermediación financiera (Rubro 1 Inc. d Col. III)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">37</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Actos efectuados por Escribanos Públicos (Rubro 2 Inc. I Col. III)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">38</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Pago previo</td>
												<td class="borde">39</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">40</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">SUB TOTALES (Inc. c, a Col. I; Inc. a+b+d, a Col. II)</td>
												<td class="vacio"/>
												<td class="borde"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">f</td>
												<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. e)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">Multa por mora.........% del resultado de Inc. f menos Inc. d (Solo se calculará cuando Inc. f sea mayor que Inc. d)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">41</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">Intereses.........% del resultado de Inc. f menos Inc. d ( Solo se calculará cuando Inc. f sea mayor que Inc. d)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">42</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">i</td>
												<td class="borde">Saldo definitivo a favor del Fisco (Inc. f+g+h)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">43</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-ocre.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-ocre.gif" width="4" height="4"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<!--<tr><td class="saltoPagina"></td></tr>-->
				<tr>
					<td colSpan="6">
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
