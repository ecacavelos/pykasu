<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Obligacion">221</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaamm</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C9)"].value = nvl(Math.round(elegir(calcularmulta(221,parseFloat(formu["dynamicProps(C6)"].value)+parseFloat(formu["dynamicProps(C7)"].value)),0,si(parseFloat(formu["dynamicProps(C9)"].value)>0,50000,0),calcularmulta(221,parseFloat(formu["dynamicProps(C6)"].value)+parseFloat(formu["dynamicProps(C7)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C10)"].value = nvl(Math.round(calcularmora(mayor(parseFloat(formu["dynamicProps(C6)"].value)+parseFloat(formu["dynamicProps(C7)"].value)-parseFloat(formu["dynamicProps(C8)"].value),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C11)"].value = nvl(Math.round(calcularinteres(mayor(parseFloat(formu["dynamicProps(C6)"].value)+parseFloat(formu["dynamicProps(C7)"].value)-parseFloat(formu["dynamicProps(C8)"].value),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C13)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C6)"].value)+parseFloat(formu["dynamicProps(C7)"].value)-parseFloat(formu["dynamicProps(C8)"].value)+parseFloat(formu["dynamicProps(C9)"].value)+parseFloat(formu["dynamicProps(C10)"].value)+parseFloat(formu["dynamicProps(C11)"].value))-parseFloat(formu["dynamicProps(C12)"].value),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C12)"].value == "") formu["dynamicProps(C12)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C8)"].value == "") formu["dynamicProps(C8)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C7)"].value == "") formu["dynamicProps(C7)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C9)"].value == "") formu["dynamicProps(C9)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C6)"].value == "") formu["dynamicProps(C6)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C7');
	ponerPuntosEnCampo('C8');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C13');
	ponerPuntosEnCampo('C6');
	ponerPuntosEnCampo('C9');
	ponerPuntosEnCampo('C11');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C7');
	quitarPuntosDeCampo('C8');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C13');
	quitarPuntosDeCampo('C6');
	quitarPuntosDeCampo('C9');
	quitarPuntosDeCampo('C11');
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
			<link href="../../style/css/bd-azul.css" rel="stylesheet" type="text/css"/>
			<thead>
			</thead>
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">827</xsl:with-param><xsl:with-param name="pRubro">Rubro 1</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">
					RETENCIONES IMPUESTO AL VALOR AGREGADO
					
					</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
					</td>
				</tr>
				<tr>
					<td><table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-1.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-1.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th>PARA QUIENES ACTUEN COMO AGENTES DE RETENCION</th>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-1.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-1.gif" width="4" height="4"/></td>
							</tr>
						</table></td>
				</tr>
				<xsl:if test="$Obligacion=221 or $Modo = 1">
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-1.gif" width="4" height="4"/></td>
									<td class="fondo"></td>
									<td align="right" valign="bottom"><img src="../../style/images/top-r-1.gif" width="4" height="4"/></td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top"><table class="declaracion">
											<tbody>
												<tr>
													<th rowSpan="2" class="bordevacio">INC</th>
													<th rowSpan="2" class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 1 DETALLE</p>
													</th>
													<th colSpan="4" class="bordevacio">
														<p align="center">A FAVOR DEL:</p>
													</th>
												</tr>
												<tr>
													<th colSpan="2" class="bordevacio">
														<p align="center">CONTRIBUYENTE -I-</p>
													</th>
													<th colSpan="2" class="bordevacio" style="width: 90%">
														<p align="center">FISCO -II-</p>
													</th>
												</tr>
												<tr>
													<td class="bordevacio">a</td>
													<td class="bordevacio">Retenciones con carácter de pago definitivo por acrecentamiento de retribuciones a personas o entidades del exterior que no posean sucrusales en el país</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">06</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C6"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="bordevacio">b</td>
													<td class="bordevacio">Retenciones por pago o acreditamiento a proveedores del Estado (Proviene del Rubro 2 Inc. c Formulario 829)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">07</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C7</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C7"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="bordevacio">c</td>
													<td class="borde">Pago previo</td>
													<td class="borde">08</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C8</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C8"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="bordevacio">d</td>
													<td class="bordevacio">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">09</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C9</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C9"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="bordevacio">e</td>
													<td class="bordevacio">SUB TOTALES (Inc. c, Col. I ; Inc. a+b+d, Col. II)</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="bordevacio">f</td>
													<td class="bordevacio">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. e cuando Col. II es mayor que Col. I)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="bordevacio">g</td>
													<td class="bordevacio">Multa por Mora .........% del resultado Inc. f menos el Inc. d (Sólo se calculará cuando Inc. f sea mayor que el Inc. d)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">10</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="bordevacio">h</td>
													<td class="bordevacio">Intereses.........% del resultado Inc. f menos el Inc. d (Sólo se calculará cuando Inc. f sea mayor que el Inc. d)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">11</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="bordevacio">i </td>
													<td class="bordevacio">Pago realizado mediante Certificados de Crédito expedidos por la SET</td>
													<td class="borde">12</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="bordevacio">j</td>
													<td class="bordevacio">Saldo definitivo a favor del Fisco (Diferencia cuando los Inc. f+g+h de la Col. II es mayor que el Inc. i Col. I)</td>
													<td class="vacio"/>
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
									<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-1.gif" width="4" height="4"/></td>
									<td class="fondo"></td>
									<td align="right" valign="bottom"><img src="../../style/images/bot-r-1.gif" width="4" height="4"/></td>
								</tr>
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
