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
	try { formu["dynamicProps(C10)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C10)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C16)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C11)"].value) * buscartasa(16) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C17)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C12)"].value) * buscartasa(17) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C18)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C19)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C18)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C22)"].value = nvl(Math.round(elegir(calcularmulta(411,parseFloat(formu["dynamicProps(C22)"].value)),0,si(parseFloat(formu["dynamicProps(C22)"].value)>0,50000,0),calcularmulta(411,parseFloat(formu["dynamicProps(C22)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C23)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C20)"].value)+parseFloat(formu["dynamicProps(C21)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C24)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C19)"].value)+parseFloat(formu["dynamicProps(C22)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C25)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C24)"].value)-parseFloat(formu["dynamicProps(C23)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C26)"].value = nvl(Math.round(calcularmora(mayor(parseFloat(formu["dynamicProps(C19)"].value)-(parseFloat(formu["dynamicProps(C20)"].value)+parseFloat(formu["dynamicProps(C21)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C27)"].value = nvl(Math.round(calcularinteres(mayor(parseFloat(formu["dynamicProps(C19)"].value)-(parseFloat(formu["dynamicProps(C20)"].value)+parseFloat(formu["dynamicProps(C21)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C28)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value)+parseFloat(formu["dynamicProps(C27)"].value)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C21)"].value == "") formu["dynamicProps(C21)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C12)"].value == "") formu["dynamicProps(C12)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C24)"].value == "") formu["dynamicProps(C24)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C26');
	ponerPuntosEnCampo('C11');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C24');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C26');
	quitarPuntosDeCampo('C11');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C20');
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
			<link href="../../style/css/bd-ocre.css" type="text/css" rel="stylesheet"/>
			<tbody>
				<tr>
					<td/>
					<td>
						<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">140</xsl:with-param><xsl:with-param name="pVersion">V.1   Enero/2007</xsl:with-param><xsl:with-param name="pImpuesto">ACTOS Y DOCUMENTOS AGENTES DE RETENCION</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
									</td>
								</tr>
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th>
														<p align="left">PARA EMPRESAS O ENTIDADES QUE REALICEN RETENCIONES GRAVADAS POR EL IMPUESTO</p>
													</th>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
									</td>
								</tr>
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 90%">
														<p align="left">RUBRO 1 ACTOS VINCULADOS A LA INTERMEDIACION FINANCIERA</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">base imponible -i-</p>
													</th>
													<th class="bordevacio">
														<p align="center">tasa (%) -ii-</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">importe retenido -iii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Préstamos en dinero o en especie y créditos concedidos.</td>
													<td class="borde">10</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="borde">15</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Transferencias de fondos dentro del país.</td>
													<td class="borde">11</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">
														<p align="left">.........</p>
													</td>
													<td class="borde">16</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Transferencias de fondos o de divisas al exterior</td>
													<td class="borde">12</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">
														<p align="left">.........</p>
													</td>
													<td class="borde">17</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Totales (Inc. a+b+c de la Col. III)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">18</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
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
														<p align="left">RUBRO 2 liquidacion y saldo del impuesto</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">a favor del </p>
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
													<td class="borde">Actos vinculados a la intermediación financiera (Rubro 1 Inc. d Col. III)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">19</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Pago previo o pago a cuenta</td>
													<td class="borde">20</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Pago con Créditos Fiscales Disponibles, Certificados de Créditos Tributario, Nota de Crédito Tributario y Bonos del Tesoro</td>
													<td class="borde">21</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">22</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Subtotales (Inc. b+c Col. I; Inc. a+d Col. II)</td>
													<td class="borde">23</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">24</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. e)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">25</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="6">
														<p align="center">PAGOS</p>
													</th>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Multa por Mora (.........% del resultado del Inc. f menos el Inc. d) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">26</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Intereses (.........% del resultado del Inc. f menos el Inc. d) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">27</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">
														<p>Saldo definitivo a pagar a favor de Fisco (Casillas f+g+h)</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">28</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td colSpan="6">
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
