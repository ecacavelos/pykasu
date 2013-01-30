<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Obligacion">211</xsl:param>
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

		<table class="declaracion">
			<tbody>
				<tr>
					<td colSpan="3">
						<xsl:call-template name="cabeceraDeclaraciones">
							<xsl:with-param name="pFormulario">801</xsl:with-param>
							<xsl:with-param name="pVersion">V.1</xsl:with-param>
							<xsl:with-param name="pImpuesto">
								<xsl:if test="$Obligacion = 211 or $Modo = 1">IMPUESTO AL VALOR AGREGADO</xsl:if>
								<xsl:if test="$Obligacion = 161">ANTICIPO DE IMPUESTO A LA RENTA</xsl:if>
							</xsl:with-param>
							<xsl:with-param name="pNombres">
								<xsl:value-of select="$Nombre"/>
							</xsl:with-param>
							<xsl:with-param name="pNumero">
								<xsl:value-of select="declaracion/detalle/C901"/>
							</xsl:with-param>
							<xsl:with-param name="pNumeroRectifica">
								<xsl:value-of select="declaracion/detalle/C3"/>
							</xsl:with-param>
							<xsl:with-param name="pPeriodo">
								<xsl:value-of select="$Periodo"/>
							</xsl:with-param>
							<xsl:with-param name="pPrimerApellido">
								<xsl:value-of select="$PrimerApellido"/>
							</xsl:with-param>
							<xsl:with-param name="pSegundoApellido">
								<xsl:value-of select="$SegundoApellido"/>
							</xsl:with-param>
							<xsl:with-param name="pRuc">
								<xsl:value-of select="$Ruc"/>
							</xsl:with-param>
							<xsl:with-param name="pModo">
								<xsl:value-of select="$Modo"/>
							</xsl:with-param>
							<xsl:with-param name="pDv">
								<xsl:value-of select="$Dv"/>
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<xsl:if test="$Obligacion=211 or $Modo = 1">
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<th>PARA QUIENES REALICEN OPERACIONES GRAVADAS Y EXONERADAS INCLUIDAS
							    LAS EXPORTACIONES</th>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<th rowSpan="2" class="bordevacio">INC</th>
													<th rowSpan="2" class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 1 DETALLE DE INGRESOS DEL PERIODO Y DEL ACUMULADO DE LOS ULTIMOS SEIS MESES INCLUYENDO EL QUE SE LIQUIDA</p>
													</th>
													<th colSpan="4" class="bordevacio">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<th colSpan="2" class="bordevacio">
														<p align="center">del periodo - i-</p>
													</th>
													<th colSpan="2" class="bordevacio" style="width: 90%">
														<p align="center">acumulado -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Ingresos netos devengados por enajenaciones de bienes y presentación de servicios realizados en el país, gravados con el tributo</td>
													<td class="borde">05</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C5</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C5"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">10</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C10</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C10"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Ingresos netos devengados por exportaciones</td>
													<td class="borde">06</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C6</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C6"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">11</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C11</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C11"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Ingresos netos devengados por enajenaciones exoneradas realizadas en el país, de productos agropecuarios en estado natural</td>
													<td class="borde">07</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C7</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C7"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">12</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C12</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C12"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Ingresos netos devengados por operaciones exoneradas realizadas en el pais, excepto aquellas comprendidas en el Inc. c</td>
													<td class="borde">08</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C8</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C8"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">13</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C13</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C13"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Totales ( Inc. a+b+c+d )</td>
													<td class="borde">09</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C9</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C9"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">14</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C14</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C14"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<th rowSpan="2" class="bordevacio">INC</th>
													<th rowSpan="2" class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 2 detalle de compras del periodo y su credito fiscal</p>
													</th>
													<th colSpan="4" class="bordevacio">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<th colSpan="2" class="bordevacio">
														<p align="center">de compras -i-</p>
													</th>
													<th colSpan="2" class="bordevacio" style="width: 90%">
														<p align="center">del credito fiscal -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Monto neto de compras en el país y base imponible de las importaciones de bienes y servicios gravados, afectados directamente a actos alcanzados por el tributo</td>
													<td class="borde">15</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C15</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C15"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">22</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C22</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C22"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Monto neto de compras en el país y base imponible de las importaciones de bienes y servicios gravados, afectados indistintamente a actos alcanzados por el tributo y exonerados o de exportación</td>
													<td class="borde">16</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C16</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C16"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">23</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C23</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C23"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Monto neto de compras en el país y base imponible de las importaciones de bienes y servicios gravados, afectados directamente a exportaciones</td>
													<td class="borde">17</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C17</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C17"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">24</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C24</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C24"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Monto neto de compras en el país y base imponible de las importaciones de bienes y servicios gravados, afectados directamente a actividades agropecuarias comprendidas en el Capitulo II del Impuesto a la Renta</td>
													<td class="borde">18</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C18</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C18"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">25</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C25</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C25"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Monto neto de compras en el país y base imponible de las importaciones de bienes y servicios gravados, afectados directamente a operaciones exoneradas no incluidas en los incisos anteriores</td>
													<td class="borde">19</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C19</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C19"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Monto neto de compras en el pais y valor aduanero de las importaciones de bienes y servicios exonerados del tributo</td>
													<td class="borde">20</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C20</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C20"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Totales ( Inc. a+b+c+d+e+f  a Col. I; a+b+c+d a Col. II)</td>
													<td class="borde">21</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C21</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C21"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">26</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C26</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C26"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 3 determinacion del debito fiscal</p>
													</th>
													<th colSpan="2" class="bordevacio">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Débito fiscal por operaciones gravadas ( .......... % del Rubro 1 Inc. a Col. I )</td>
													<td class="borde">27</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C27</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C27"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Débito por devoluciones realizadas; descuentos, bonificaciones y rebajas que se obtienen en el período y recupero de impuesto por actos gravados declarados incobrables</td>
													<td class="borde">28</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C28</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C28"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Total débito fiscal ( Inc. a+b )</td>
													<td class="borde">29</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C29</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C29"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 4 determinacion del credito fiscal computable</p>
													</th>
													<th colSpan="2" class="bordevacio">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Crédito Fiscal directo por operaciones en el país ( Rubro 2 Inc. a Col. II )</td>
													<td class="borde">30</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C30</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C30"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Crédito fiscal proporcional por operaciones en el país ( Rubro 2 Inc. b Col. II ) x ( Rubro 1 Inc. a Col. II / Rubro 1 Inc. e Col. II )</td>
													<td class="borde">31</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C31</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C31"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Crédito Fiscal por devoluciones recibidas, descuentos, bonificaciones y rebajas que se otorgaron en el período y por actos gravados considerados incobrables</td>
													<td class="borde">32</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C32</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C32"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">SUB TOTAL Crédito Fiscal por operaciones en el mercado interno ( Inc. a+b+c )</td>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Crédito Fiscal directo por operaciones de exportación ( Rubro 2 Inc. c Col. II )</td>
													<td class="borde">33</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C33</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C33"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Crédito Fiscal proporcional por operaciones de exportación ( Rubro 2 Inc. b Col. II ) x ( Rubro 1 Inc. b Col. II / Rubro I Inc. e Col. II )</td>
													<td class="borde">34</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C34</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C34"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Crédito Fiscal directo de productores agropecuarios ( 50% del Rubro 2 Inc. d Col. II )</td>
													<td class="borde">35</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C35</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C35"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Crédito Fiscal proporcional de productores agropecuarios 50 % de ( Rubro 2 Inc. b Col. II ) x ( Rubro 1 Inc. c Col. II / Rubro 1 Inc. e Col. II )</td>
													<td class="borde">36</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C36</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C36"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Subtotal Crédito Fiscal por operaciones de exportación y de productos agropecuarios ( Inc. e+f+g+h )</td>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Total Crédito Fiscal ( Inc. a+b+c+e+f+g+h)</td>
													<td class="borde">37</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C37</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C37"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<!--<tr><td class="saltoPagina"></td></tr>-->
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<th rowSpan="2" class="bordevacio">INC</th>
													<th rowSpan="2" class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 5 liquidacion y saldo del impuesto</p>
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
													<td class="borde">Débito Fiscal ( Rubro 3 inc. c )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">38</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C38</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C38"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Crédito Fiscal por operaciones en el mercado interno ( Rubro 4 inc. d )</td>
													<td class="borde">39</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C39</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C39"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Saldo a favor del contribuyente del periodo anterior</td>
													<td class="borde">40</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C40</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C40"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Retenciones de IVA computables</td>
													<td class="borde">41</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C41</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C41"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Pago realizado mediante Certificados de Crédito expedidos por la SET</td>
													<td class="borde">42</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C42</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C42"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Pago previo</td>
													<td class="borde">43</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C43</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C43"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Multa por presentación de Declaración Jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">44</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C44</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C44"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">SUB TOTAL ( Inc. b+c+d+e+f, Col. I; Inc. a+g , Col. II)</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Saldo a favor del Contribuyente que se trasladará al periodo fiscal siguiente ( Diferencia entre Columnas del Inc. h , cuando Col. I es mayor que Col. II )</td>
													<td class="borde">45</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C45</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C45"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Saldo a favor del Fisco ( Diferencia entre Columnas del Inc. h, cuando Col. II es mayor que Col. I )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Crédito Fiscal por operaciones de exportación y productos agropecuarios ( Rubro 4 Inc. i ) No podrá exceder el importe del Inc. j )</td>
													<td class="borde">46</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C46</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C46"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Diferencia ( Inc. j menos Inc. k )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Multa por mora .......% del resultado de Inc. l menos Inc. g ( Sólo se calculara cuando Inc. l sea mayor que Inc. g )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">47</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C47</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C47"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">Intereses del resultado de Inc. l menos Inc. g ( Solo se calculará cuando Inc. l sea mayor que Inc. g )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">48</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C48</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C48"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">o</td>
													<td class="borde">Saldo definitivo a favor del Fsco ( Inc. l+m+n)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">49</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C49</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C49"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<td class="borde">Excedente de crédito fiscal por operaciones de exportación o de productos agropecuarios ( Rubro 4 Inc. i menos Rubro 5 Inc. k )</td>
													<td class="borde">50</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C50</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C50"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="$Obligacion = 161 or $Modo = 1">
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<th rowSpan="2" class="bordevacio" style="width: 90%">
														<p align="left">B- Impuesto a la renta - actividades comerciales, industriales o de servicios</p>
													</th>
													<th colSpan="2" class="bordevacio">
														<p align="center">ANTICIPO Nº</p>
													</th>
													<th colSpan="2" class="bordevacio">
														<p align="center">FECHA DE VENCIMIENTO</p>
													</th>
													<th colSpan="2" class="bordevacio">
														<p align="center">MES DE CIERRE</p>
													</th>
												</tr>
												<tr>
													<td class="borde">51</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C51</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C51"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">52</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C52</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C52"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="borde">53</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C53</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C53"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<th>ACTIVIDADES COMERCIALES, INDUSTRIALES O DE SERVICIOS</th>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="640" class="declaracion1">
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/top-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/top-r-1.gif" width="4" height="4"/>
									</td>
								</tr>
								<tr>
									<td width="1" align="left" valign="top" class="fondo"></td>
									<td width="636" valign="top">
										<table class="declaracion">
											<tbody>
												<tr>
													<th rowSpan="2" class="bordevacio">INC</th>
													<th rowSpan="2" class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 7 LIQUIDACION Y SALDO DEL ANTICIPO</p>
													</th>
													<th colSpan="4" class="bordevacio">
														<p align="center">A FAVOR DE</p>
													</th>
												</tr>
												<tr>
													<th colSpan="2" class="bordevacio">
														<p align="center">CONTRIBUYENTE -i</p>
													</th>
													<th colSpan="2" class="bordevacio" style="width: 90%">
														<p align="center">FISCO -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Anticipo liquidado ( .........% del impuesto liquidado en el ejercicio anterior )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">54</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C54</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C54"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Saldo a favor del contribuyente de Declaración Jurada anterior</td>
													<td class="borde">55</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C55</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C55"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Retenciones de impuesto a la Renta Computable</td>
													<td class="borde">56</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C56</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C56"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Pago realizado mediante certificados de crédito expedidos por la SET</td>
													<td class="borde">57</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C57</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C57"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Pago previo</td>
													<td class="borde">58</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C58</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C58"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Multa por presentar la declaración jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">59</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C59</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C59"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">SUB TOTALES ( Inc. b+c+d+e , a Col. I ; Inc. a+f ,  a Col. II )</td>
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
													<td class="borde">h</td>
													<td class="borde">Saldo a favor del contribuyente ( Diferencia entre Columnas del Inc. g cuando Col. I es mayor que col. II )</td>
													<td class="borde">60</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C60</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C60"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Saldo a favor del fisco ( Diferencia entre Columnas del Inc. g cuando Col. II es mayor que Col. I ) </td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Multa por mora ......% del resultado de Inc. i menos Inc. f ( Solo se calculará cuando Inc. i sea mayor que inc. f )</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">61</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C61</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C61"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Interes del resultado de Inc. i menos Inc. f ( Solo se calculará cuando Inc. i sea mayor que Inc. f)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">62</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C62</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C62"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Saldo definitivo a favor del fisco ( Inc. (a+f+j+k)-(b+c+d+e)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">63</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C63</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C63"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td width="1" align="right" valign="top" class="fondo"></td>
								</tr>
								<tr>
									<td height="4" align="left" valign="bottom">
										<img src="../../style/images/bot-l-1.gif" width="4" height="4"/>
									</td>
									<td class="fondo"></td>
									<td align="right" valign="bottom">
										<img src="../../style/images/bot-r-1.gif" width="4" height="4"/>
									</td>
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
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
