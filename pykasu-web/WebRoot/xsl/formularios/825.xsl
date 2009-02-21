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
	try { formu["dynamicProps(C9)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C5)"].value)+parseFloat(formu["dynamicProps(C6)"].value)+parseFloat(formu["dynamicProps(C7)"].value)+parseFloat(formu["dynamicProps(C8)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C10)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C5)"].value) * buscartasa(10) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C11)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C6)"].value) * buscartasa(11) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C12)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C7)"].value) * buscartasa(12) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C13)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C8)"].value) * buscartasa(13) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C14)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C10)"].value)+parseFloat(formu["dynamicProps(C11)"].value)+parseFloat(formu["dynamicProps(C12)"].value)+parseFloat(formu["dynamicProps(C13)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C15)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C14)"].value) * buscartasa(15) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C20)"].value = nvl(Math.round(elegir(calcularmulta(111,parseFloat(formu["dynamicProps(C15)"].value)),0,si(parseFloat(formu["dynamicProps(C20)"].value)>0,50000,0),calcularmulta(111,parseFloat(formu["dynamicProps(C15)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C21)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)+parseFloat(formu["dynamicProps(C19)"].value)-parseFloat(formu["dynamicProps(C15)"].value)-parseFloat(formu["dynamicProps(C20)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C22)"].value = nvl(Math.round(calcularmora(mayor((parseFloat(formu["dynamicProps(C15)"].value))-(parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)+parseFloat(formu["dynamicProps(C19)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C23)"].value = nvl(Math.round(calcularinteres(mayor((parseFloat(formu["dynamicProps(C15)"].value))-(parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)+parseFloat(formu["dynamicProps(C19)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C25)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C15)"].value)-parseFloat(formu["dynamicProps(C16)"].value)-parseFloat(formu["dynamicProps(C17)"].value)-parseFloat(formu["dynamicProps(C18)"].value)-parseFloat(formu["dynamicProps(C19)"].value)+parseFloat(formu["dynamicProps(C20)"].value)+parseFloat(formu["dynamicProps(C22)"].value)+parseFloat(formu["dynamicProps(C23)"].value)-parseFloat(formu["dynamicProps(C24)"].value),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C5)"].value == "") formu["dynamicProps(C5)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C7)"].value == "") formu["dynamicProps(C7)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C8)"].value == "") formu["dynamicProps(C8)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C12)"].value == "") formu["dynamicProps(C12)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C13)"].value == "") formu["dynamicProps(C13)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C24)"].value == "") formu["dynamicProps(C24)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C6)"].value == "") formu["dynamicProps(C6)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C14');
	ponerPuntosEnCampo('C5');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C9');
	ponerPuntosEnCampo('C11');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C8');
	ponerPuntosEnCampo('C7');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C13');
	ponerPuntosEnCampo('C24');
	ponerPuntosEnCampo('C6');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C14');
	quitarPuntosDeCampo('C5');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C9');
	quitarPuntosDeCampo('C11');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C8');
	quitarPuntosDeCampo('C7');
	quitarPuntosDeCampo('C20');
	quitarPuntosDeCampo('C13');
	quitarPuntosDeCampo('C24');
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
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">825</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
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
														<p align="left">PARA EMPRESAS UNIPERSONALES, CONSTRUCTORAS, CONSULTORAS Y FISCALIZADORAS DE OBRAS PUBLICAS O DE OBRAS DE ENTIDADES BINACIONALES.</p>
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
													<th class="bordevacio" rowSpan="2">INC</th>
													<th class="bordevacio" rowSpan="2" style="width: 90%">
														<p align="left">RUBRO 1 determinacion de la renta neta</p>
													</th>
													<th class="bordevacio" colSpan="5">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">ingresos -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">tasa (%) -II-</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">renta neta -iii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Ingresos netos devengados provenientes de la actividad de construcción de obras en general (Ingresos Netos = Ingresos Brutos menos descuentos y devoluciones)</td>
													<td class="borde">05</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C5</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C5"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">
														<p align="center">.........</p>
													</td>
													<td class="borde">10</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Ingresos Netos devengados por Servicios de Fiscalización o Consultoría de Obras Públicas o de Obras de Entidades Binacionales</td>
													<td class="borde">06</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C6"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<td class="borde">Ingresos Netos cobrados por las actividades de construcción, refacción o demolición de obras públicas o de obras en Entidades Binacionales adjudicadas en los llamados a licitación o concurso de precios, por ofertas anteriores al 01/07/92</td>
													<td class="borde">07</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C7</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C7"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<td class="borde">Ingresos netos devengados por otras actividades. obtenidos conjuntamente con los Inc. a,b y c del Rubro 1</td>
													<td class="borde">08</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C8</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C8"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">
														<p align="center">.........</p>
													</td>
													<td class="borde">13</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Totales (Inc. a+b+c+d)</td>
													<td class="borde">09</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C9</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C9"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="borde">14</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
														<p align="center">a favor de</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">contribuyente -i- </p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">fisco -II-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Impuesto liquidado (30% del Inc. e Col. III Rubro 1)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">15</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Saldo a favor del Contribuyente del período anterior</td>
													<td class="borde">16</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Pago Previo</td>
													<td class="borde">17</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Anticipos ingresados</td>
													<td class="borde">18</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Retenciones de Impuesto a la Renta Computables</td>
													<td class="borde">19</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">20</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">SUB TOTALES (Inc. b+c+d+e a Col. I; Inc. a+f a Col. II)</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Saldo a favor del Contribuyente (Diferencia entre Columnas del Inc. g, cuando Col. I es mayor que Col. II)</td>
													<td class="borde">21</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. g, cuando Col. II es mayor que Col. I)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Multa por mora ............% del resultado de Inc. i menos Inc. f (Solo se calculará cuando Inc. i sea mayor que Inc. f)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">22</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Intereses ............% del resultado de Inc. i menos Inc. f (Solo se calculará cuando Inc. i sea mayor que Inc. f)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">23</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Pago realizado mediante Certificados de Crédito expedidos por la SET</td>
													<td class="borde">24</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Saldo definitivo a favor del Fisco (Inc. i+j+k-l)</td>
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
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
