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
	try { formu["dynamicProps(C9)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C7)"].value)+parseFloat(formu["dynamicProps(C8)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C65)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C48)"].value)+parseFloat(formu["dynamicProps(C49)"].value)+parseFloat(formu["dynamicProps(C50)"].value)+parseFloat(formu["dynamicProps(C51)"].value)+parseFloat(formu["dynamicProps(C52)"].value)+parseFloat(formu["dynamicProps(C53)"].value)+parseFloat(formu["dynamicProps(C54)"].value)+parseFloat(formu["dynamicProps(C55)"].value)+parseFloat(formu["dynamicProps(C56)"].value)+parseFloat(formu["dynamicProps(C57)"].value)+parseFloat(formu["dynamicProps(C58)"].value)+parseFloat(formu["dynamicProps(C59)"].value)+parseFloat(formu["dynamicProps(C60)"].value)+parseFloat(formu["dynamicProps(C61)"].value)+parseFloat(formu["dynamicProps(C62)"].value)+parseFloat(formu["dynamicProps(C63)"].value)+parseFloat(formu["dynamicProps(C64)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C84)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C67)"].value)+parseFloat(formu["dynamicProps(C68)"].value)+parseFloat(formu["dynamicProps(C69)"].value)+parseFloat(formu["dynamicProps(C70)"].value)+parseFloat(formu["dynamicProps(C71)"].value)+parseFloat(formu["dynamicProps(C72)"].value)+parseFloat(formu["dynamicProps(C73)"].value)+parseFloat(formu["dynamicProps(C74)"].value)+parseFloat(formu["dynamicProps(C75)"].value)+parseFloat(formu["dynamicProps(C76)"].value)+parseFloat(formu["dynamicProps(C77)"].value)+parseFloat(formu["dynamicProps(C78)"].value)+parseFloat(formu["dynamicProps(C79)"].value)+parseFloat(formu["dynamicProps(C80)"].value)+parseFloat(formu["dynamicProps(C81)"].value)+parseFloat(formu["dynamicProps(C82)"].value)+parseFloat(formu["dynamicProps(C83)"].value)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C54)"].value == "") formu["dynamicProps(C54)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C76)"].value == "") formu["dynamicProps(C76)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C59)"].value == "") formu["dynamicProps(C59)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C82)"].value == "") formu["dynamicProps(C82)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C60)"].value == "") formu["dynamicProps(C60)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C53)"].value == "") formu["dynamicProps(C53)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C64)"].value == "") formu["dynamicProps(C64)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C75)"].value == "") formu["dynamicProps(C75)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C49)"].value == "") formu["dynamicProps(C49)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C70)"].value == "") formu["dynamicProps(C70)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C56)"].value == "") formu["dynamicProps(C56)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C78)"].value == "") formu["dynamicProps(C78)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C7)"].value == "") formu["dynamicProps(C7)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C63)"].value == "") formu["dynamicProps(C63)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C68)"].value == "") formu["dynamicProps(C68)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C79)"].value == "") formu["dynamicProps(C79)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C57)"].value == "") formu["dynamicProps(C57)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C73)"].value == "") formu["dynamicProps(C73)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C51)"].value == "") formu["dynamicProps(C51)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C62)"].value == "") formu["dynamicProps(C62)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C83)"].value == "") formu["dynamicProps(C83)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C72)"].value == "") formu["dynamicProps(C72)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C61)"].value == "") formu["dynamicProps(C61)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C50)"].value == "") formu["dynamicProps(C50)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C48)"].value == "") formu["dynamicProps(C48)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C77)"].value == "") formu["dynamicProps(C77)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C69)"].value == "") formu["dynamicProps(C69)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C71)"].value == "") formu["dynamicProps(C71)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C55)"].value == "") formu["dynamicProps(C55)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C58)"].value == "") formu["dynamicProps(C58)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C81)"].value == "") formu["dynamicProps(C81)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C74)"].value == "") formu["dynamicProps(C74)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C52)"].value == "") formu["dynamicProps(C52)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C8)"].value == "") formu["dynamicProps(C8)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C67)"].value == "") formu["dynamicProps(C67)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C80)"].value == "") formu["dynamicProps(C80)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C54');
	ponerPuntosEnCampo('C65');
	ponerPuntosEnCampo('C76');
	ponerPuntosEnCampo('C59');
	ponerPuntosEnCampo('C82');
	ponerPuntosEnCampo('C60');
	ponerPuntosEnCampo('C64');
	ponerPuntosEnCampo('C53');
	ponerPuntosEnCampo('C49');
	ponerPuntosEnCampo('C75');
	ponerPuntosEnCampo('C70');
	ponerPuntosEnCampo('C56');
	ponerPuntosEnCampo('C78');
	ponerPuntosEnCampo('C63');
	ponerPuntosEnCampo('C7');
	ponerPuntosEnCampo('C68');
	ponerPuntosEnCampo('C79');
	ponerPuntosEnCampo('C84');
	ponerPuntosEnCampo('C57');
	ponerPuntosEnCampo('C73');
	ponerPuntosEnCampo('C51');
	ponerPuntosEnCampo('C62');
	ponerPuntosEnCampo('C72');
	ponerPuntosEnCampo('C83');
	ponerPuntosEnCampo('C61');
	ponerPuntosEnCampo('C50');
	ponerPuntosEnCampo('C48');
	ponerPuntosEnCampo('C71');
	ponerPuntosEnCampo('C69');
	ponerPuntosEnCampo('C77');
	ponerPuntosEnCampo('C55');
	ponerPuntosEnCampo('C9');
	ponerPuntosEnCampo('C58');
	ponerPuntosEnCampo('C81');
	ponerPuntosEnCampo('C74');
	ponerPuntosEnCampo('C8');
	ponerPuntosEnCampo('C52');
	ponerPuntosEnCampo('C67');
	ponerPuntosEnCampo('C80');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C54');
	quitarPuntosDeCampo('C65');
	quitarPuntosDeCampo('C76');
	quitarPuntosDeCampo('C59');
	quitarPuntosDeCampo('C82');
	quitarPuntosDeCampo('C60');
	quitarPuntosDeCampo('C64');
	quitarPuntosDeCampo('C53');
	quitarPuntosDeCampo('C49');
	quitarPuntosDeCampo('C75');
	quitarPuntosDeCampo('C70');
	quitarPuntosDeCampo('C56');
	quitarPuntosDeCampo('C78');
	quitarPuntosDeCampo('C63');
	quitarPuntosDeCampo('C7');
	quitarPuntosDeCampo('C68');
	quitarPuntosDeCampo('C79');
	quitarPuntosDeCampo('C84');
	quitarPuntosDeCampo('C57');
	quitarPuntosDeCampo('C73');
	quitarPuntosDeCampo('C51');
	quitarPuntosDeCampo('C62');
	quitarPuntosDeCampo('C72');
	quitarPuntosDeCampo('C83');
	quitarPuntosDeCampo('C61');
	quitarPuntosDeCampo('C50');
	quitarPuntosDeCampo('C48');
	quitarPuntosDeCampo('C71');
	quitarPuntosDeCampo('C69');
	quitarPuntosDeCampo('C77');
	quitarPuntosDeCampo('C55');
	quitarPuntosDeCampo('C9');
	quitarPuntosDeCampo('C58');
	quitarPuntosDeCampo('C81');
	quitarPuntosDeCampo('C74');
	quitarPuntosDeCampo('C8');
	quitarPuntosDeCampo('C52');
	quitarPuntosDeCampo('C67');
	quitarPuntosDeCampo('C80');
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
  ]]></SCRIPT><link href="../../style/css/bd-ocre.css" rel="stylesheet" type="text/css"/>
		<table class="declaracion">
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaracionesDeclarativa"><xsl:with-param name="pFormulario">930</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO AL VALOR AGREGADO GOBIERNOS DEPARTAMENTALES</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
					</td>
				</tr>
				<tr>
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
												<th rowSpan="2" class="bordevacio" style="width: 90%">
													<p align="left">IMPUESTO AL VALOR AGREGADO POR DISTRIBUCIÃ¿N GEOGRAFICA - PARA PERSONAS Y/O EMPRESAS QUE OBTENGAN INGRESOS POR ENAJENACIONES Y PRESTACIONES DE SERVICIOS</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">anexo al formulario NÂº</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">NÂº de orden del formulario</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">PerÃ­odo Fiscal</p>
												</th>
											</tr>
											<tr>
												<td class="borde">04</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C05</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C05"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">05</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C06</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C06"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">06</td>
												<td class="borde">
													<xsl:choose>
														<xsl:when test="$Modo='1' or $Modo='2'">
															<xsl:call-template name="itemPeriodo">
																<xsl:with-param name="pValor">
																	<xsl:choose>
																		<xsl:when test="$pPeriodo &gt; 0">
																			<xsl:value-of select="$Periodo"/>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="declaracion/detalle/C4"/>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:with-param>
																<xsl:with-param name="pNombre">C4</xsl:with-param>
																<xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="itemPeriodo"><xsl:with-param name="pModo">
																	<xsl:value-of select="$Modo"/>
																</xsl:with-param><xsl:with-param name="pValor">
																	<xsl:value-of select="$Periodo"/>
																</xsl:with-param><xsl:with-param name="pNombre">C4</xsl:with-param></xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
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
				</tr>
				<tr>
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
												<th class="bordevacio" style="width: 95%">
													<p align="left">RUBRO 1 ingresos</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">importe</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Total neto gravado devengado</td>
												<td class="borde">07</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C07</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C07"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Total ventas exentas</td>
												<td class="borde">08</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C08</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C08"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Total de ventas  ( Inc. a+b )</td>
												<td class="borde">09</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C09</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C09"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<p align="left">RUBRO 2 division territorial</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">matriz(A)</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">suc (B)</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">ventas netas gravadas -i-</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">debito fiscal -ii-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">
													<p align="center">CAPITAL</p>
												</td>
												<td class="borde">10</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">28</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">47</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">66</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C66</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C66"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">
													<p align="center">DEPARTAMENTOS</p>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">I Departamento - ConcepciÃ³n</td>
												<td class="borde">11</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">29</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">48</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">67</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C67</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C67"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">II Departamento - San Pedro</td>
												<td class="borde">12</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">30</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">49</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">68</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C68</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C68"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">III Departamento - La Cordillera</td>
												<td class="borde">13</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">31</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">50</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">69</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C69</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C69"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">f</td>
												<td class="borde">IV Departamento - GuairÃ¡</td>
												<td class="borde">14</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">32</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">51</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">70</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">V Departamento - CaaguazÃº</td>
												<td class="borde">15</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">33</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">52</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">71</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">VI Departamento - CaazapÃ¡</td>
												<td class="borde">16</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">34</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">53</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">72</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">i</td>
												<td class="borde">VII Departamento - ItapÃºa</td>
												<td class="borde">17</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">35</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">54</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">73</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">j</td>
												<td class="borde">VIII Departamento - Misiones</td>
												<td class="borde">18</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">36</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">55</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">74</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">k</td>
												<td class="borde">IX Departamento - ParaguarÃ­</td>
												<td class="borde">19</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">37</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">56</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">75</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">l</td>
												<td class="borde">X Departamento - Alto ParanÃ¡</td>
												<td class="borde">20</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">38</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">57</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">76</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">m</td>
												<td class="borde">XI Departamento - Central</td>
												<td class="borde">21</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">39</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">58</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">77</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">n</td>
												<td class="borde">XII Departamento - Ã¿eembucÃº</td>
												<td class="borde">22</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">40</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">59</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C59</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C59"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">78</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C78</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C78"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">o</td>
												<td class="borde">XIII Departamento - Amambay</td>
												<td class="borde">23</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">41</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">60</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C60</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C60"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">79</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C79</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C79"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">p</td>
												<td class="borde">XIV Departamento - CanindeyÃº</td>
												<td class="borde">24</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">42</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">61</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C61</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C61"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">80</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C80</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C80"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">q</td>
												<td class="borde">XV Departamento - Presidente Hayes</td>
												<td class="borde">25</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">43</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">62</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C62</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C62"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">81</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C81</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C81"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">r</td>
												<td class="borde">XVI Departamento - BoquerÃ³n</td>
												<td class="borde">26</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">44</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">63</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C63</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C63"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">82</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C82</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C82"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">s</td>
												<td class="borde">XVII Departamento - Alto Paraguay</td>
												<td class="borde">27</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">45</td>
												<td class="borde">
													<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">64</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C64</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C64"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">83</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C83</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C83"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">t</td>
												<td class="borde">Totales</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">46</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">65</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C65</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C65"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>   
							  </td>
												<td class="borde">84</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C84</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C84"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="930.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->
