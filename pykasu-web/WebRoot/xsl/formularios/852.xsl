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
	try { formu["dynamicProps(C10)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C8)"].value)+parseFloat(formu["dynamicProps(C9)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C12)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C10)"].value)+parseFloat(formu["dynamicProps(C11)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C13)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C10)"].value) * (buscartasa(13) / 100)));} catch(e){errores++;}
	try { formu["dynamicProps(C14)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C11)"].value) * (buscartasa(14) / 100)));} catch(e){errores++;}
	try { formu["dynamicProps(C18)"].value = nvl(Math.round(elegir(calcularmulta(143,parseFloat(formu["dynamicProps(C13)"].value)+parseFloat(formu["dynamicProps(C14)"].value)),0,si(parseFloat(formu["dynamicProps(C18)"].value)>0,50000,0),calcularmulta(143,parseFloat(formu["dynamicProps(C13)"].value)+parseFloat(formu["dynamicProps(C14)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C19)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)-parseFloat(formu["dynamicProps(C13)"].value)-parseFloat(formu["dynamicProps(C14)"].value)-parseFloat(formu["dynamicProps(C18)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C20)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C13)"].value)+parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C18)"].value)-parseFloat(formu["dynamicProps(C15)"].value)-parseFloat(formu["dynamicProps(C16)"].value)-parseFloat(formu["dynamicProps(C17)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C21)"].value = nvl(Math.round(calcularmora(mayor(parseFloat(formu["dynamicProps(C13)"].value)+parseFloat(formu["dynamicProps(C14)"].value)-(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C22)"].value = nvl(Math.round(calcularinteres(mayor(parseFloat(formu["dynamicProps(C13)"].value)+parseFloat(formu["dynamicProps(C14)"].value)-(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C24)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C23)"].value)-parseFloat(formu["dynamicProps(C13)"].value)-parseFloat(formu["dynamicProps(C14)"].value)-parseFloat(formu["dynamicProps(C18)"].value)-parseFloat(formu["dynamicProps(C21)"].value)-parseFloat(formu["dynamicProps(C22)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C25)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C13)"].value)+parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C18)"].value)+parseFloat(formu["dynamicProps(C21)"].value)+parseFloat(formu["dynamicProps(C22)"].value)-parseFloat(formu["dynamicProps(C15)"].value)-parseFloat(formu["dynamicProps(C16)"].value)-parseFloat(formu["dynamicProps(C17)"].value)-parseFloat(formu["dynamicProps(C23)"].value),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C21)"].value == "") formu["dynamicProps(C21)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C9)"].value == "") formu["dynamicProps(C9)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C8)"].value == "") formu["dynamicProps(C8)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C13)"].value == "") formu["dynamicProps(C13)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C14');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C11');
	ponerPuntosEnCampo('C9');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C8');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C13');
	ponerPuntosEnCampo('C24');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C14');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C11');
	quitarPuntosDeCampo('C9');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C8');
	quitarPuntosDeCampo('C20');
	quitarPuntosDeCampo('C13');
	quitarPuntosDeCampo('C24');
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
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">852</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">TRIBUTO UNICO MAQUILA</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
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
														<p align="left">PARA EMPRESAS QUE REALICEN ACTIVIDADES DE MAQUILA O SUBMAQUILA POR CAPACIDAD OCIOSA</p>
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
														<p align="left">RUBRO 1 determinacion de la base imponible</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Valor factura por servicios de Maquila</td>
													<td class="borde">08</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C8</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C8"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Valor factura por servicios de Sub Maquila</td>
													<td class="borde">09</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C9</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C9"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Sub Total ( Inc. a+b)</td>
													<td class="borde">10</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">........% de los ingresos provenientes de venta realizadas en el mercado interno</td>
													<td class="borde">11</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Total de Base Imponible (Inc. c+d)</td>
													<td class="borde">12</td>
													<td class="borde">
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
														<p align="left">RUBRO 2 liquidacion y saldo del impuesto</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">contribuyente -I-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">fisco -II-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Tributo Unico Maquila o Sub Maquila ( ....... % del Rubro 1 Inc. c )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">13</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Tributo Unico ( ........ % del Rubro 1, Inc. d, en concepto de Impuesto a la Renta )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">14</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Saldo a favor del Contribuyente del periodo anterior</td>
													<td class="borde">15</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Retenciones computables a favor del Contribuyente</td>
													<td class="borde">16</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Pago Previo o pago a Cuenta</td>
													<td class="borde">17</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">18</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">SUB TOTALES ( Inc. c+d+e, Col. I , Inc. a+b+f, Col. II )</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Saldo a favor del Contribuyente ( Diferencia entre Columnas del Inc. g cuando la Col. I es mayor que la Col.II )</td>
													<td class="borde">19</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Saldo a favor del Fisco ( Diferencia entre Columnas del Inc. g , cuando Col. II es mayor que Col. I )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">20</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Multa por mora ...... % del resultado del Inc. i menos Inc. f ( Solo se calculará cuando Inc. i sea mayor que el Inc. f )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">21</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Intereses ........ % del resultado del Inc. i menos Inc. f ( Solo se calculará cuando en Inc. i sea mayor que el Inc. f )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">22</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Pago realizado mediante Certificado de Crédito expedidos por la SET</td>
													<td class="borde">23</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">SUB TOTALES ( Inc. I a Col. I ; Inc. i+j+k a Col. II )</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">Saldo definitivo a favor del Contribuyente ( Diferencia entre Columnas del Inc. m, cuando Col. I es mayor que la Col. II </td>
													<td class="borde">24</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">o</td>
													<td class="borde">Saldo definitivo a favor del Fisco ( Diferencia entre Columnas del Inc. m , cuando Col. II es mayor que la Col. I ) </td>
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
													<th class="bordevacio" style="width: 95%">
														<p align="left">uso interno - identificación del credito tributario</p>
													</th>
													<th class="bordevacio" colSpan="2"/>
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
					<td/>
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
													<td class="borde" width="33%">
														<p align="center">NUMERO DE RECIBO</p>
													</td>
													<td class="borde" width="33%">
														<p align="center">FECHA</p>
													</td>
													<td class="borde" width="33%">
														<p align="center">FIRMA Y SELLO DEL RESPONSABLE</p>
													</td>
												</tr>
												<tr>
													<td class="borde" width="33%">
														<p> </p>
														<p> </p>
														<p> </p>
													</td>
													<td class="borde" width="33%">
														<br/>
													</td>
													<td class="borde" width="33%">
														<br/>
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
					<td/>
				</tr>
				<!--<tr><td class="saltoPagina"></td></tr>-->
				<tr>
					<td>
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
