<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Obligacion">151</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaamm</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C20)"].value = nvl(Math.round(elegir(calcularmulta(151,parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)),0,si(parseFloat(formu["dynamicProps(C20)"].value)>0,50000,0),calcularmulta(151,parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C21)"].value = nvl(Math.round(calcularmora(mayor((parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value))-(parseFloat(formu["dynamicProps(C19)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C22)"].value = nvl(Math.round(calcularinteres(mayor((parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value))-(parseFloat(formu["dynamicProps(C19)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C24)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)-parseFloat(formu["dynamicProps(C19)"].value)+parseFloat(formu["dynamicProps(C20)"].value)+parseFloat(formu["dynamicProps(C21)"].value)+parseFloat(formu["dynamicProps(C22)"].value)-parseFloat(formu["dynamicProps(C23)"].value)),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C21)"].value == "") formu["dynamicProps(C21)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C14');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C24');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C14');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C20');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C15');
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
			<link href="../../style/css/bd-azul.css" rel="stylesheet" type="text/css"/>
			<thead>
			</thead>
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">827</xsl:with-param><xsl:with-param name="pRubro">Rubro 2</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">
					RETENCION IMPUESTO A LA RENTA 
						
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
													<p align="left">RUBRO 2 liquidacion y saldo del impuesto a la renta</p>
												</th>
												<th colSpan="4" class="bordevacio">
													<p align="center">a favor del </p>
												</th>
											</tr>
											<tr>
												<th colSpan="2" class="bordevacio">
													<p align="center">Contribuyente -i-</p>
												</th>
												<th colSpan="2" class="bordevacio" style="width: 90%">
													<p align="center">fisco -ii-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Retenciones con caracter de pago definitivo por acreditamiento de retribuciones a personas o entidades del exterior que no posean sucursales en el pais</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">14</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Retenciones con caracter de pago definitivo por acreditamientos de fletes a empresas del exterior que no posean sucursales, agencias o establecimientos en el pais</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">15</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Retenciones con caracter de pago definitivo por acreditamientos de primas de seguro a empresas del exterior que no posean sucursales, agencias o establecimientos en el pais</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">16</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Retenciones en caracter de pago unico y definitivo, no incluidos en los incisos anteriores</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">17</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">Retenciones por pago o acreditamiento a proveedores del Estado ( Total Hoja Anexo - For. 829 - Rub.2 Inc. c Col. II )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">18</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">f</td>
												<td class="borde">Pago Previo</td>
												<td class="borde">19</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">Multa por presentar la Declaracion Jurada con posterioridad al vencimiento</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">20</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">SUB TOTALES ( Inc. f, col. I; Inc. a+b+c+d+e+g, Col. II )</td>
												<td class="vacio"/>
												<td/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">i</td>
												<td class="borde">Saldo a favor del Fisco  ( Diferencia entre columnas  del Inc. h cuando  col. II es mayor que col. I )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">j</td>
												<td class="borde">Multa por mora .......% del resultado Inc. i menos Inc. g ( Solo se calculará cuando Inc. i sea mayor que el Inc. g )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">21</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">k</td>
												<td class="borde">Intereses del resultado Inc. i menos Inc. g ( Solo se calculará cuando Inc. i sea mayor que el Inc. g )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">22</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">l</td>
												<td class="borde">Pago realizado mediante Certificados de Crédito expedidos por la SET</td>
												<td class="borde">23</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">m</td>
												<td class="borde">Saldo definitivo a favor del Fisco ( Diferencia cuando los Inc. i+j+k de la Col. II es mayor que el inc. l col. I )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">24</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
