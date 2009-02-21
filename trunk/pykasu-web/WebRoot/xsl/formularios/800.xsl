<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">1</xsl:param>
	<xsl:param name="Ruc"><xsl:value-of select="declaracion/detalle/ruc"/></xsl:param>
	<xsl:param name="Dv"><xsl:value-of select="declaracion/detalle/dv"/></xsl:param>
	<xsl:param name="Periodo"><xsl:value-of select="declaracion/detalle/periodo"/></xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"><xsl:value-of select="declaracion/detalle/PrimerApellido"/></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
				<link href="../../style/css/bd-azul.css" rel="stylesheet" type="text/css"/>
				<script type="text/javascript">
					function sendtoprint(){
						/*document.getElementById('top').style.visibility='hidden';
						document.getElementById('top').style.height='0px';
						document.getElementById('top').style.width='0px';*/				
						window.print();
					}				
				</script>
			</head>
			<body>
				<div class="areaimpresion" id="top" heigth="5%">
					<img id="printimage" src="/pycasu/images/printer.jpg" onclick="sendtoprint()"/>
					<a onclick="sendtoprint()">Imprimir</a>
				</div>
				

			<table class="principal">
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">800</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO AL VALOR AGREGADO</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
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
												<th>PARA QUIENES REALICEN UNICAMENTE OPERACIONES GRAVADAS</th>
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
													<p align="left">RUBRO 1 DETERMINACION DEL DEBITO FISCAL</p>
												</th>
												<th colSpan="4" class="bordevacio">
													<p align="center">IMPORTE</p>
												</th>
											</tr>
											<tr>
												<th colSpan="2" class="bordevacio">
													<p align="center">COLUMNA I</p>
												</th>
												<th colSpan="2" class="bordevacio" style="width: 90%">
													<p align="center">COLUMNA II</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Ingresos netos devengados por enajenación de bienes y prestación de servicios.</td>
												<td class="borde">05</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C5</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C5"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Débito Fiscal (.........% del Inc. a)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">06</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C6"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Débito por devoluciones realizadas; descuentos, bonificaciones y rebajas que se obtuvieron en el período y recupero de impuesto por actos gravados declarados incobrables.</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">07</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C7</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C7"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Total Débito Fiscal (Inc. b+c)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">08</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C8</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C8"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<p align="left">RUBRO 2 determinacion del credito fiscal</p>
												</th>
												<th colSpan="4" class="bordevacio">
													<p align="center">importe</p>
												</th>
											</tr>
											<tr>
												<th colSpan="2" class="bordevacio">
													<p align="center">columna i</p>
												</th>
												<th colSpan="2" class="bordevacio" style="width: 90%">
													<p align="center">columna ii</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Monto neto de compras realizadas en el país y base imponible de las importaciones de bienes y servicios gravados.</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">09</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C9</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C9"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Crédito Fiscal por operaciones gravadas con el tributo (.........% del Inc. a)</td>
												<td class="borde">10</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Crédito Fiscal por devoluciones recibidas; descuentos, bonificaciones y rebajas que se otorgaron en el período y por actos gravados considerados incobrables.</td>
												<td class="borde">11</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Total Crédito Fiscal (Inc. b+c)</td>
												<td class="borde">12</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
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
													<p align="left">RUBRO 3 liquidacion y saldo del impuesto</p>
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
													<p align="center">fisco -II-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Débito Fiscal (Rubro 1 Inc. d)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">13</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Crédito Fiscal (Rubro 2 Inc. d)</td>
												<td class="borde">14</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
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
												<td class="borde">Retenciones de IVA computables</td>
												<td class="borde">16</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">Pago realizado mediante Certificados de Créditos expedidos por la SET</td>
												<td class="borde">17</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">f</td>
												<td class="borde">Pago previo</td>
												<td class="borde">18</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento.</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">19</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">Subtotales (Inc. b+c+d+e+f, a Col. I; Inc. a+g a Col. II)
												</td>
												<td class="vacio"/>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">st1</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/cst1"/>
														</xsl:with-param>
														<xsl:with-param name="pModo">
															<xsl:value-of select="$Modo"/>
														</xsl:with-param>
													</xsl:call-template>												
												</td>
												<td class="vacio"/>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">st2</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/cst2"/>
														</xsl:with-param>
														<xsl:with-param name="pModo">
															<xsl:value-of select="$Modo"/>
														</xsl:with-param>
													</xsl:call-template>												
												
												</td>
											</tr>
											<tr>
												<td class="borde">i</td>
												<td class="borde">Saldo a favor del Contribuyente que se trasladará al período fiscal siguiente (Diferencia entre Columnas del Inc. h, cuando Col. I es mayor que Col. II)</td>
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
												<td class="borde">Multa por mora .........% del resultado de Inc. j menos Inc. g (Solo se calculará cuando Inc. j sea mayor que Inc. g)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">21 </td>
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
												<td class="borde">Saldo definitivo a favor del Fisco (Inc. j+k+l)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">23</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
