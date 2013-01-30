<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaamm</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C7)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C5)"].value) * parseFloat(formu["dynamicProps(C6)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C8)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C8)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C9)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C9)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C12)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C10)"].value)+parseFloat(formu["dynamicProps(C11)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C17)"].value = nvl(Math.round(elegir(calcularmulta(113,parseFloat(formu["dynamicProps(C13)"].value)),0,si(parseFloat(formu["dynamicProps(C17)"].value)>0,50000,0),calcularmulta(113,parseFloat(formu["dynamicProps(C13)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C18)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)-parseFloat(formu["dynamicProps(C13)"].value)-parseFloat(formu["dynamicProps(C17)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C19)"].value = nvl(Math.round(calcularmora(mayor((parseFloat(formu["dynamicProps(C13)"].value))-(parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C20)"].value = nvl(Math.round(calcularinteres(mayor((parseFloat(formu["dynamicProps(C13)"].value))-(parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C21)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C13)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C19)"].value)+parseFloat(formu["dynamicProps(C20)"].value)-parseFloat(formu["dynamicProps(C14)"].value)-parseFloat(formu["dynamicProps(C15)"].value)-parseFloat(formu["dynamicProps(C16)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C22)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C7)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C24)"].value = nvl(Math.round((parseFloat(formu["dynamicProps(C22)"].value)+parseFloat(formu["dynamicProps(C23)"].value)) * 0.1));} catch(e){errores++;}
	try { formu["dynamicProps(C30)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value)+parseFloat(formu["dynamicProps(C27)"].value)+parseFloat(formu["dynamicProps(C28)"].value)-parseFloat(formu["dynamicProps(C24)"].value)-parseFloat(formu["dynamicProps(C29)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C33)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C24)"].value)+parseFloat(formu["dynamicProps(C29)"].value)-parseFloat(formu["dynamicProps(C25)"].value)-parseFloat(formu["dynamicProps(C26)"].value)-parseFloat(formu["dynamicProps(C27)"].value)-parseFloat(formu["dynamicProps(C28)"].value),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C5)"].value == "") formu["dynamicProps(C5)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C29)"].value == "") formu["dynamicProps(C29)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C9)"].value == "") formu["dynamicProps(C9)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C7)"].value == "") formu["dynamicProps(C7)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C8)"].value == "") formu["dynamicProps(C8)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C13)"].value == "") formu["dynamicProps(C13)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C24)"].value == "") formu["dynamicProps(C24)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C6)"].value == "") formu["dynamicProps(C6)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C5');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C29');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C7');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C13');
	ponerPuntosEnCampo('C24');
	ponerPuntosEnCampo('C14');
	ponerPuntosEnCampo('C25');
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
	ponerPuntosEnCampo('C8');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C6');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C5');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C29');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C7');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C13');
	quitarPuntosDeCampo('C24');
	quitarPuntosDeCampo('C14');
	quitarPuntosDeCampo('C25');
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
	quitarPuntosDeCampo('C8');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C20');
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
			<link href="../../style/css/bd-verde.css" type="text/css" rel="stylesheet"/>
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">821</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
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
													<th>
														<p align="left">PARA QUIENES REALICEN OPERACIONES GRAVADAS Y LIQUIDEN POR REGIMEN EXTRAORDINARIO</p>
													</th>
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
				<xsl:if test="$Modo=1">
					<tr>
						<td><table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-verde.gif" width="4" height="4"/></td>
									<td class="fondo"></td>
									<td align="right" valign="bottom"><img src="../../style/images/top-r-verde.gif" width="4" height="4"/></td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top"><table class="declaracion">
											<tbody>
												<tr>
													<th colspan="6" class="bordevacio"><p align="left">RUBRO 1 DETERMINACION DE LA BASE PRESUNTA IMPONIBLE</p></th>
												</tr>
												<tr>
													<th class="bordevacio"/>
													<th class="bordevacio" style="width: 65%"><p align="left">NUMERO DE UNIDADES QUE SE PAGA</p></th>
													<th colSpan="2" class="bordevacio"><p align="center">BASE PRESUNTA POR VEHICULO</p></th>
													<th colSpan="2" class="bordevacio"><p align="center">TOTAL BASE PRESUNTA</p></th>
												</tr>
												<tr>
													<td class="borde">05</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C5</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C5"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">06</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C6"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">07</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C7</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C7"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table></td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-verde.gif" width="4" height="4"/></td>
									<td class="fondo"></td>
									<td align="right" valign="bottom"><img src="../../style/images/bot-r-verde.gif" width="4" height="4"/></td>
								</tr>
							</table></td>
					</tr>
				</xsl:if>
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
														<p align="left">RUBRO 2 LIQUIDACION Y SALDO DEL IMPUESTO A LA RENTA</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">A FAVOR DEL </p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">Contribuyente -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">fisco -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Ingresos presuntos por enajenación de bienes o prestación de servicios</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">08</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C8</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C8"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Otros ingresos netos devengados.                                                                        </td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">09</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C9</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C9"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Renta Neta .........% del Inc. a)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">10</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Renta Neta .........% del Inc. b)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">11</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Renta Neta Total (Inc. c+d)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">12</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Impuesto Liquidado.........% del Inc. e)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">13</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Retenciones de Impuesto a la Renta computables</td>
													<td class="borde">14</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Saldo a favor del Contribuyente resultante del período anterior</td>
													<td class="borde">15</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Pago Previo</td>
													<td class="borde">16</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">17</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">SUB TOTALES (Inc. g+h+i, Col. I; Inc. f+j, Col. II)</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Saldo a favor del Contribuyente que se trasladará al período fiscal siguiente (Diferencia entre Columnas del Inc. k, cuando Col. I es mayor que Col. II)</td>
													<td class="borde">18</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">
														<p>Saldo a favor del Fisco (Diferencia entre Columnas del Inc. k, cuando Col. II es mayor que Col. I)</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">Multa por mora........% del resultado de Inc. m menos Inc. j (Sólo se calculará cuando Inc. m sea mayor que Inc. j)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">19</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">o</td>
													<td class="borde">Intereses del resultado de Inc. m menos Inc. j (Sólo se calculará cuando Inc. m sea mayor que Inc. j)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">20</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">p</td>
													<td class="borde">Saldo definitivo a favor del Fisco (Inc. m+n+o)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">21</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
