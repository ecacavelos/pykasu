<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Obligacion">131</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaa</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C7)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C5)"].value)+parseFloat(formu["dynamicProps(C6)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C8)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C5)"].value) * 0.4));} catch(e){errores++;}
	try { formu["dynamicProps(C9)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C6)"].value) * 0.45));} catch(e){errores++;}
	try { formu["dynamicProps(C29)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C29)"].value),parseFloat(formu["dynamicProps(C7)"].value) * 0.30)));} catch(e){errores++;}
	try { formu["dynamicProps(C10)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C29)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C12)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C7)"].value)-(parseFloat(formu["dynamicProps(C8)"].value)+parseFloat(formu["dynamicProps(C9)"].value)+parseFloat(formu["dynamicProps(C10)"].value)+parseFloat(formu["dynamicProps(C11)"].value)),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C13)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C12)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C14)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C13)"].value) * 0.25));} catch(e){errores++;}
	try { formu["dynamicProps(C19)"].value = nvl(Math.round(elegir(calcularmulta(131,parseFloat(formu["dynamicProps(C13)"].value)),0,si(parseFloat(formu["dynamicProps(C19)"].value)>0,50000,0),calcularmulta(131,parseFloat(formu["dynamicProps(C13)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C20)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)-parseFloat(formu["dynamicProps(C14)"].value)-parseFloat(formu["dynamicProps(C19)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C21)"].value = nvl(Math.round(calcularmora(mayor(parseFloat(formu["dynamicProps(C14)"].value)-(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C22)"].value = nvl(Math.round(calcularinteres(mayor(parseFloat(formu["dynamicProps(C14)"].value)-(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C24)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)+parseFloat(formu["dynamicProps(C23)"].value)-parseFloat(formu["dynamicProps(C14)"].value)-parseFloat(formu["dynamicProps(C19)"].value)-parseFloat(formu["dynamicProps(C21)"].value)-parseFloat(formu["dynamicProps(C22)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C25)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C14)"].value)-parseFloat(formu["dynamicProps(C15)"].value)-parseFloat(formu["dynamicProps(C16)"].value)-parseFloat(formu["dynamicProps(C17)"].value)-parseFloat(formu["dynamicProps(C18)"].value)-parseFloat(formu["dynamicProps(C23)"].value)+parseFloat(formu["dynamicProps(C19)"].value)+parseFloat(formu["dynamicProps(C21)"].value)+parseFloat(formu["dynamicProps(C22)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C28)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C26)"].value)+parseFloat(formu["dynamicProps(C27)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C30)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C28)"].value)-parseFloat(formu["dynamicProps(C29)"].value),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C21)"].value == "") formu["dynamicProps(C21)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C5)"].value == "") formu["dynamicProps(C5)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C29)"].value == "") formu["dynamicProps(C29)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C9)"].value == "") formu["dynamicProps(C9)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C7)"].value == "") formu["dynamicProps(C7)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C8)"].value == "") formu["dynamicProps(C8)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C12)"].value == "") formu["dynamicProps(C12)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C13)"].value == "") formu["dynamicProps(C13)"].value = 0;} catch(e) {errores++;} 
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
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C26');
	ponerPuntosEnCampo('C9');
	ponerPuntosEnCampo('C11');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C30');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C8');
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
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C26');
	quitarPuntosDeCampo('C9');
	quitarPuntosDeCampo('C11');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C30');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C8');
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
		<table>
			<link href="../../style/css/bd-verde.css" type="text/css" rel="stylesheet"/>
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">840</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">
								<xsl:if test="$Obligacion = 131 or $Modo = 1">
					IMPUESTO A LA RENTA - CAP. II
					ACTIVIDADES AGROPECUARIAS
					</xsl:if>
								<xsl:if test="$Obligacion = 162">
					ANTICIPO IMPUESTO A LA RENTA - CAP. II
					ACTIVIDADES AGROPECUARIAS
					</xsl:if>
							</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
					</td>
				</tr>
				<xsl:if test="$Obligacion=131 or $Modo = 1">
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
														<th class="bordevacio" colSpan="2" rowSpan="2" style="width: 90%">
															<p align="left">rubro 1 determinacion de la renta neta - detalle</p>
														</th>
														<th class="bordevacio" colSpan="6">
															<p align="center">importes</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">renta bruta -i-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">(%)deduccion -ii-</p>
														</th>
														<th class="bordevacio" colSpan="2">
															<p align="center">deducciones -iii-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">
															<font size="1">Propietario o Poseedor a cualquier titulo</font>
														</td>
														<td class="borde"> Trasladar resultado de  la Hoja de Cálculo en la Col. I, deducir la tasa de la Col. II, y consignar el resultado en Col. III</td>
														<td class="borde">05</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C5</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C5"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">
															<p align="center">40</p>
														</td>
														<td class="borde">08</td>
														<td class="borde" colSpan="2">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C8</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C8"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">
															<font size="1">No Propietario</font>
														</td>
														<td class="borde">Arrendatario de inmuebles rurales. Trasladar resultado de la Hoja de Cálculo, aplicar la tasa y consignar resultado en la Col. III</td>
														<td class="borde">06</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C6"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">
															<p align="center">45</p>
														</td>
														<td class="borde">09</td>
														<td class="borde" colSpan="2">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C9</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C9"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde" colSpan="2">TOTAL RENTA BRUTA ( Inc. a+b, a Col. I)</td>
														<td class="borde">07</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C7</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C7"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="vacio" colSpan="2"/>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde" colSpan="2">DEDUCCION DEL I.V.A.: Consignará resultado del Rubro 3 Inc. d, correspondiente a la adquisición de bienes o servicios.</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">..............................</td>
														<td class="borde">10</td>
														<td class="borde" colSpan="2">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">e</td>
														<td class="borde" colSpan="2">DEDUCCION POR PERDIDAS EXTRAORDINARIAS - Porcentaje que establece el Poder Ejecutivo. (Inc. c x Col II Inc. e) Col III</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">..............................</td>
														<td class="borde">11</td>
														<td class="borde" colSpan="2">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">f</td>
														<td class="borde" colSpan="2">SUB TOTALES ( Inc. c, Col. I; Inc. a+b+d+e, Col. III)</td>
														<td class="vacio"/>
														<td class="borde"/>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde" colSpan="2"/>
													</tr>
													<tr>
														<td class="borde">g</td>
														<td class="borde" colSpan="2">RENTA NETA (Diferencia entre la Col. I y II del Inc. f, Col. III)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">12</td>
														<td class="borde" colSpan="2">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<p align="left">RUBRO 2 liquidacion del impuesto</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">a favor del </p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">contribuyente (I)</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">fisco (II)</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Total Renta Neta (Monto del Inc. g del Rubro 1)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">13</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Impuesto liquidado (25% de la Renta Neta - Rub. 2 Inc. a Col. II)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">14</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Saldo a favor del Contribuyente del período anterior</td>
														<td class="borde">15</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">Pago previo</td>
														<td class="borde">16</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">e</td>
														<td class="borde">Anticipos ingresados</td>
														<td class="borde">17</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">f</td>
														<td class="borde">Retenciones de Impuesto a la Renta Computables</td>
														<td class="borde">18</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">g</td>
														<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">19</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">h</td>
														<td class="borde">SUB TOTALES ( Inc. c+d+e+f Col. I; Inc. b+g Col. II)</td>
														<td class="vacio"/>
														<td class="borde"/>
														<td class="vacio"/>
														<td class="borde"/>
													</tr>
													<tr>
														<td class="borde">i</td>
														<td class="borde">Saldo a favor del Contribuyente (Diferencia entre Columnas del Inc. h, cuando Col. I es mayor que Col. II)</td>
														<td class="borde">20</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">j</td>
														<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. h, cuando Col. II es mayor que Col. I)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde"/>
													</tr>
													<tr>
														<td class="borde">k</td>
														<td class="borde">Multa por mora ............% del resultado del Inc. j menos Inc. g (Solo se calculará cuando Inc. j sea mayor que Inc. g)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">21</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">l</td>
														<td class="borde">Intereses del resultado de Inc. j menos Inc. g (Solo se calculará cuando Inc. j sea mayor que Inc. g)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">22</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">m</td>
														<td class="borde">Pago realizado mediante Certificados de Crédito expedidos por la SET</td>
														<td class="borde">23</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">n</td>
														<td class="borde">Saldo a favor del Contribuyente para el siguiente período (Diferencia cuando el Inc. m Col. I es mayor que los inc. j+k+l de la Col. II)</td>
														<td class="borde">24</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">o</td>
														<td class="borde">Saldo definitivo a favor del Fisco (Diferencia cuando los Inc. j+k+l de la Col. II es mayor que el Inc. m Col. I)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">25</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
														<th class="bordevacio">INC</th>
														<th class="bordevacio" style="width: 95%">
															<p align="left">RUBRO 3 compras y gastos del periodo gravados con IVA</p>
														</th>
														<th class="bordevacio" colSpan="2">
															<p align="center">importe iva</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Monto total del IVA incluido en las facturas correspondientes a los gastos y compras, afectados a las actividades agropecuarias.</td>
														<td class="borde">26</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Saldo de IVA a favor del Contribuyente, correspondiente al período fiscal anterior (Proviene del Rubro 3 Inc. e del periodo anterior)</td>
														<td class="borde">27</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Totales (Inc. a+b)</td>
														<td class="borde">28</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">IVA a descontar (.......% que se traslada al Rubro 1 Inc. d Col. III) El monto a deducir no podrá ser superior al 30% de la Renta Bruta del Rubro 1 Inc. c Col. I</td>
														<td class="borde">29</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">e</td>
														<td class="borde">Saldo a favor del Contribuyente que se trasladará al período fiscal siguiente (A trasladarse en el Rubro 3 Inc. b del periodo siguiente) (Inc. c - Inc. a)</td>
														<td class="borde">30</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
				</xsl:if>
				<xsl:if test="$Obligacion=162 or $Modo = 1">
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
															<p align="left">B- ANTICIPO IMPUESTO A LA RENTA - ACTIVIDADES AGROPECUARIAS</p>
														</th>
														<th class="bordevacio" colSpan="2">
															<p align="center">Fecha de Vencimiento</p>
														</th>
														<th class="bordevacio" colSpan="2">
															<p align="center">Anticipo nº</p>
														</th>
													</tr>
													<tr>
														<td class="borde">31</td>
														<td class="borde">
															<xsl:call-template name="itemFechaVencimiento"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">32</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<p align="left">RUBRO 4 LIQUIDACION Y SALDO DEL ANTICIPO</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">A FAVOR DEL</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">CONTRIBUYENTE -i-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">FISCO -ii-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Anticipo liquidado (25% del impuesto liquidado en el ejercicio anterior)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">33</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Saldo a favor del Contribuyente del período anterior</td>
														<td class="borde">34</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Pago previo</td>
														<td class="borde">35</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">Retenciones de Impuesto a la Renta computables</td>
														<td class="borde">36</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">e</td>
														<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">37</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">f</td>
														<td class="borde">SUB TOTALES (Inc. b+c+d a Col. I; Inc. a+e a Col.II)</td>
														<td class="vacio"/>
														<td class="borde"/>
														<td class="vacio"/>
														<td class="borde"/>
													</tr>
													<tr>
														<td class="borde">g</td>
														<td class="borde">Saldo a favor del Contribuyente (Diferencia entre Columnas del Inc. f, cuando Col. I es mayor que Col. II)</td>
														<td class="borde">38</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">h</td>
														<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. f cuando Col. II es mayor que Col. I)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde"/>
													</tr>
													<tr>
														<td class="borde">i</td>
														<td class="borde">Multa por mora ...........% del resultado de Inc. h menos Inc. e (Solo se calculará cuando Inc. h sea mayor que Inc. e)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">39</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">j</td>
														<td class="borde">Intereses del resultado de Inc. h menos Inc. e (Solo se calculará cuando Inc. h sea mayor que Inc. e)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">40</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">k</td>
														<td class="borde">Pago realizado mediante Certificados de Créditos expedidos por la SET</td>
														<td class="borde">41</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">l</td>
														<td class="borde">Saldo a favor del Contribuyente para el siguiente período (Diferencia cuando el Inc. k de la Col. I sea mayor que los Inc. h+i+j de la Col. II)</td>
														<td class="borde">42</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">m</td>
														<td class="borde">Saldo definitivo a favor del Fisco (Diferencia cuando la sumatoria de los Inc. h+i+j de la Col. II es mayor que el Inc. k Col. I)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">43</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
				</xsl:if>
				<tr>
					<td>
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="840.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="840.xml" srcSchemaRoot="declaracion" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="table/tbody/tr/td/xsl:call&#x2D;template" x="288" y="90"/><block path="table/tbody/xsl:if/=[0]" x="282" y="88"/><block path="table/tbody/xsl:if" x="328" y="90"/><block path="table/tbody/xsl:if/tr[1]/td/table/tbody/tr[2]/td[4]/xsl:call&#x2D;template" x="248" y="90"/><block path="table/tbody/xsl:if/tr[1]/td/table/tbody/tr[2]/td[7]/xsl:call&#x2D;template" x="208" y="90"/><block path="table/tbody/xsl:if/tr[1]/td/table/tbody/tr[3]/td[4]/xsl:call&#x2D;template" x="168" y="90"/><block path="table/tbody/xsl:if/tr[1]/td/table/tbody/tr[3]/td[7]/xsl:call&#x2D;template" x="128" y="90"/><block path="table/tbody/xsl:if/tr[1]/td/table/tbody/tr[4]/td[3]/xsl:call&#x2D;template" x="88" y="90"/><block path="table/tbody/xsl:if/tr[1]/td/table/tbody/tr[5]/td[6]/xsl:call&#x2D;template" x="48" y="90"/><block path="table/tbody/xsl:if/tr[1]/td/table/tbody/tr[6]/td[6]/xsl:call&#x2D;template" x="328" y="130"/><block path="table/tbody/xsl:if/tr[1]/td/table/tbody/tr[8]/td[6]/xsl:call&#x2D;template" x="368" y="130"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[2]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[3]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[4]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[5]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[6]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[7]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[8]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[10]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[12]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[13]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[14]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[15]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[2]/td/table/tbody/tr[16]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[3]/td/table/tbody/tr[1]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[3]/td/table/tbody/tr[2]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[3]/td/table/tbody/tr[3]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[3]/td/table/tbody/tr[4]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if/tr[3]/td/table/tbody/tr[5]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/=[0]" x="322" y="88"/><block path="table/tbody/xsl:if[1]" x="368" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[2]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[3]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[4]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[5]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[6]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[8]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[10]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[11]/td[5]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[12]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[13]/td[3]/xsl:call&#x2D;template" x="328" y="90"/><block path="table/tbody/xsl:if[1]/tr[1]/td/table/tbody/tr[14]/td[5]/xsl:call&#x2D;template" x="328" y="90"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->
