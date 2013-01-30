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
	try { formu["dynamicProps(C70)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C70)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C73)"].value = nvl(Math.round(elegir(calcularmulta(151,parseFloat(formu["dynamicProps(C70)"].value)+parseFloat(formu["dynamicProps(C71)"].value)),0,si(parseFloat(formu["dynamicProps(C73)"].value)>0,50000,0),calcularmulta(151,parseFloat(formu["dynamicProps(C70)"].value)+parseFloat(formu["dynamicProps(C71)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C74)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C70)"].value)+parseFloat(formu["dynamicProps(C71)"].value)+parseFloat(formu["dynamicProps(C73)"].value)-parseFloat(formu["dynamicProps(C72)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C75)"].value = nvl(Math.round(calcularmora(mayor(parseFloat(formu["dynamicProps(C70)"].value)+parseFloat(formu["dynamicProps(C71)"].value)-parseFloat(formu["dynamicProps(C72)"].value),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C76)"].value = nvl(Math.round(calcularinteres(mayor(parseFloat(formu["dynamicProps(C70)"].value)+parseFloat(formu["dynamicProps(C71)"].value)-parseFloat(formu["dynamicProps(C72)"].value),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C78)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C70)"].value)+parseFloat(formu["dynamicProps(C71)"].value)+parseFloat(formu["dynamicProps(C73)"].value)+parseFloat(formu["dynamicProps(C75)"].value)+parseFloat(formu["dynamicProps(C76)"].value)-parseFloat(formu["dynamicProps(C72)"].value)-parseFloat(formu["dynamicProps(C77)"].value),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C72)"].value == "") formu["dynamicProps(C72)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C75)"].value == "") formu["dynamicProps(C75)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C70)"].value == "") formu["dynamicProps(C70)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C76)"].value == "") formu["dynamicProps(C76)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C73)"].value == "") formu["dynamicProps(C73)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C77)"].value == "") formu["dynamicProps(C77)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C71)"].value == "") formu["dynamicProps(C71)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C72');
	ponerPuntosEnCampo('C75');
	ponerPuntosEnCampo('C70');
	ponerPuntosEnCampo('C78');
	ponerPuntosEnCampo('C74');
	ponerPuntosEnCampo('C76');
	ponerPuntosEnCampo('C73');
	ponerPuntosEnCampo('C71');
	ponerPuntosEnCampo('C77');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C72');
	quitarPuntosDeCampo('C75');
	quitarPuntosDeCampo('C70');
	quitarPuntosDeCampo('C78');
	quitarPuntosDeCampo('C74');
	quitarPuntosDeCampo('C76');
	quitarPuntosDeCampo('C73');
	quitarPuntosDeCampo('C71');
	quitarPuntosDeCampo('C77');
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
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">845</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA CAP. I - LEY 125/91 AGENTES DE RETENCION</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param><xsl:with-param name="pRubro">Rubro 2</xsl:with-param></xsl:call-template>
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
												<th>PARA EMPRESAS LOTEADORAS E INTERMEDIARIAS</th>
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
													<p align="left">RUBRO 2 liquidacion y saldo del impuesto </p>
												</th>
												<th colSpan="4" class="bordevacio">
													<p align="center">a favor del</p>
												</th>
											</tr>
											<tr>
												<th colSpan="2" class="bordevacio">
													<p align="center">contribuyente -I-</p>
												</th>
												<th colSpan="2" class="bordevacio" style="width: 90%">
													<p align="center">fisco -ii-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Impuesto Retenido en carácter de pago a cuenta del Impuesto a la Renta</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">70</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Impuesto Retenido en carácter de pago único y definitivo (4,5% del monto total cobrado por la venta de bienes inmuebles loteados)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">71</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Pago previo</td>
												<td class="borde">72</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento.</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">73</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">SUB TOTALES (Inc. c, Col. I; Inc. a+b+d, Col. II)</td>
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
												<td class="borde">74</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">Multa por mora .........% del resultado de Inc. f menos Inc. d</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">75</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">Intereses.........% del resultado de Inc. f menos Inc. d</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">76</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">i</td>
												<td class="borde">Pago realizado mediante Certificados de Crédito expedidos por la SET</td>
												<td class="borde">77</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">j</td>
												<td class="borde">Saldo definitivo a favor del Fisco (Inc. f+g+h-i)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">78</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C78</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C78"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
