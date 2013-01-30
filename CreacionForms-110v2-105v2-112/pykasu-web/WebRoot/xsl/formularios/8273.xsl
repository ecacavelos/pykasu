<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Obligacion">1512</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaamm</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C28)"].value = nvl(Math.round(elegir(calcularmulta(151,parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value)),0,si(parseFloat(formu["dynamicProps(C28)"].value)>0,50000,0),calcularmulta(151,parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C29)"].value = nvl(Math.round(calcularmora(mayor((parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value))-(parseFloat(formu["dynamicProps(C27)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C30)"].value = nvl(Math.round(calcularinteres(mayor((parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value))-(parseFloat(formu["dynamicProps(C27)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C32)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value)-parseFloat(formu["dynamicProps(C27)"].value)+parseFloat(formu["dynamicProps(C28)"].value)+parseFloat(formu["dynamicProps(C29)"].value)+parseFloat(formu["dynamicProps(C30)"].value)-parseFloat(formu["dynamicProps(C31)"].value)),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C30)"].value == "") formu["dynamicProps(C30)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C31)"].value == "") formu["dynamicProps(C31)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C29)"].value == "") formu["dynamicProps(C29)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C32');
	ponerPuntosEnCampo('C30');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C31');
	ponerPuntosEnCampo('C29');
	ponerPuntosEnCampo('C26');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C32');
	quitarPuntosDeCampo('C30');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C31');
	quitarPuntosDeCampo('C29');
	quitarPuntosDeCampo('C26');
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
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">827</xsl:with-param><xsl:with-param name="pRubro">Rubro 3</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">
					RETENCION IMAGRO					
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
													<p align="left">RUBRO 3 liquidacion y saldo del imagro</p>
												</th>
												<th colSpan="4" class="bordevacio">
													<p align="center">a favor del</p>
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
												<td class="borde">Retenciones por pago o acreditamiento a proveedores del Estado ( Total hoja anexa - Form. Nº 829 - Rubro 2 Inc. c, Col. III )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">25</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Retenciones por pago o acreditamiento a enajenaciones en Ferias de Ganado ( Total Hoja anexa For. Nº 829 - Rubro 2, Inciso c, col. III )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">26</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Pago previo</td>
												<td class="borde">27</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Multa por presentar la Declaracion Jurada con posterioridad al vencimiento</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">28</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">SUB TOTALES ( Inc. c, Col. I; Inc. a+b+d, Col. II )</td>
												<td class="vacio"/>
												<td class="borde"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">f</td>
												<td class="borde">Saldo a favor del Fisco ( Diferencia entre Columnas del Inc. e, cuando Col.II es mayor que Col. I )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">Multa por mora .....% del resultado de Inc. f menos Inc. d ( Soló se calculará cuando Inc. f sea mayor que Inc. d )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">29</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">Intereses del resultado de Inc. f menos Inc. d ( Soló se calculará cuando Inc. f sea mayor que Inc. d )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">30</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">i</td>
												<td class="borde">Pago realizado mediante Certificados de Crédito expedidos por la SET</td>
												<td class="borde">31</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">j</td>
												<td class="borde">Saldo definitivo a favor del Fisco ( Diferencia cuando los Inc. f+g+h de la Col. II es mayor que el Inc. i Col. I )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">32</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
				<tr>
					<td>
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
