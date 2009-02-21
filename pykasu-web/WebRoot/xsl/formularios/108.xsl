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
				<link href="../../style/css/bd-verde.css" type="text/css" rel="stylesheet"/>
			</head>
			<body>
				<div class="areaimpresion" id="top" heigth="5%">
					<img id="printimage" src="/pycasu/images/printer.jpg" onclick="window.print();"/>
					<a onclick="window.print();">Imprimir</a>
				</div>
				
				<p class="contenido_areaimpresion">Identificador de formulario web:<strong><xsl:value-of select="declaracion/detalle/numeroDocumento"/></strong></p>
			<table class="declaracion">

				<tbody><!--DWLayoutTable-->
					<tr>
						<td width="654" height="13">
							<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">108</xsl:with-param><xsl:with-param name="pVersion">V.1   Enero/2007</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
								</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
						</td>
					</tr>
					<tr>
						<td vAlign="top">
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
														<th class="bordevacio">PARA EMPRESAS O ENTIDADES QUE REALICEN ACTIVIDADES GRAVADAS POR EL IMPUESTO QUE NO CUENTEN CON REGISTROS CONTABLES, QUE DETERMINEN POR EL REGIMEN SIMPLIFICADO O PRESUNTO, Y QUE REALICEN EXCLUSIVAMENTE OPERACIONES NO GRAVADAS</th>
														<td>
															<table class="declaracion" style="; width: 200px; height: 100%">
																<tbody>
																	<tr>
																		<th class="bordevacio" colSpan="2">
																			<p align="center">ACTIVIDAD ECONOMICA PRINCIPAL</p>
																		</th>
																	</tr>
																	<tr>
																		<th class="bordevacio" colSpan="2">
																			<p align="center">CODIGO</p>
																		</th>
																	</tr>
																	<tr>
																		<td class="borde" style="width: 1%">06</td>
																		<td class="borde">
																			<xsl:call-template name="itemActividadEconomica"><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C6"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																		</td>
																	</tr>
																</tbody>
															</table>
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
														<th class="bordevacio" rowSpan="2" style="width: 90%">
															<p align="left">RUBRO 1 DETERMINACION DE LA RENTA NETA PRESUNTA PARA QUIENES OBTENGAN INGRESOS GRAVADOS Y LOS QUE NO LLEVEN REGISTROS CONTABLES</p>
														</th>
														<th class="bordevacio" colSpan="6">
															<p align="center">IMPORTE</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">INGRESOS -I-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">TASA -II-</p>
														</th>
														<th class="bordevacio" colSpan="2">
															<p align="center">BASE IMPONIBLE -III-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Ingresos netos devengados provenientes de la actividad de construcción de obras en general</td>
														<td class="borde">10</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">14</td>
														<td class="borde">.........</td>
														<td class="borde">17</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Otros ingresos netos obtenidos gravados por el Impuesto</td>
														<td class="borde">11</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">15</td>
														<td class="borde">.........</td>
														<td class="borde">18</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Ingresos netos provenientes por el desarrollo de actividades gravadas que no cuenten con registros contables</td>
														<td class="borde">12</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">16</td>
														<td class="borde">.........</td>
														<td class="borde">19</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">Total Base Imponible del Impuesto (Inc. a+b+c)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">20</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<p align="left">RUBRO 2 RESULTADO DEL EJERCICIO Y DETERMINACION DE LA BASE IMPONIBLE PARA LOS QUE DETERMINEN POR EL REGIMEN SIMPLIFICADO</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">IMPORTE</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">EGRESO/PERDIDA -I-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">INGRESO/GANANCIA -II-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Total Ingresos Brutos provenientes de Actividades Gravadas</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">23</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">
															<p>Total de Egresos directamente relacionados a Actividades Gravadas, incluyendo la proporción de gastos afectados indistintamente a operaciones no gravadas</p>
														</td>
														<td class="borde">21</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Resultado del Ejercicio (Inc. a-b)</td>
														<td class="borde">22</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">24</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">Monto resultante de aplicar el porcentaje del 30% sobre el Inc. a Col. II</td>
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
														<th class="bordevacio" rowSpan="2">INC</th>
														<th class="bordevacio" rowSpan="2" style="width: 95%">
															<p align="left">RUBRO 3 RESULTADO DEL EJERCICIO para los que realicen actividades exclusivamente exoneradas</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">IMPORTE</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">EGRESO/PERDIDA -I-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">INGRESO/GANANCIA -II-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Total Ingresos Brutos provenientes de Actividades exentas o exoneradas del Tributo</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">28</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">
															<p>Total de Egresos realizados en el ejercicio</p>
														</td>
														<td class="borde">26</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Resultado del Ejercicio (Inc. a-b)</td>
														<td class="borde">27</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">29</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<p align="left">RUBRO 4 liquidacion y saldo del impuesto</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">importe</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">CONTRIBUYENTE -I-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">FISCO -II-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Impuesto Liquidado  .........% sobre el monto del Rubro 1 Inc. d Col. III</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">37</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Impuesto Liquidado .........% sobre el monto del Inc. c o Inc. d, Col.II del Rubro 2 (el que resulte menor)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">38</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Saldo a favor del Contribuyente del período anterior.</td>
														<td class="borde">30</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">Pago previo o pago a cuenta</td>
														<td class="borde">31</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">e</td>
														<td class="borde">Pago con Créditos Fiscales Disponibles, Certificados de Créditos Tributario, Nota de Crédito Tributario y Bonos del Tesoro </td>
														<td class="borde">32</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">f</td>
														<td class="borde">Retenciones y Percepciones computables a favor del Contribuyente</td>
														<td class="borde">33</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">g</td>
														<td class="borde">Anticipos ingresados</td>
														<td class="borde">34</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">h</td>
														<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">39</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">i</td>
														<td class="borde">SUB TOTALES:  (Inc.c+d+e+f+g, Col. I); (Inc. a+h, Col. II) ó (Inc. b+h, Col. II)</td>
														<td class="borde">35</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">40</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">j</td>
														<td class="borde">Saldo a favor del Contribuyente para el siguiente período (Diferencia entre Columnas del Inc. i, cuando Col. I sea mayor que Col. II)</td>
														<td class="borde">36</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">k</td>
														<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. i, cuando Col. II sea mayor que Col. I)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">41</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="6">
															<p align="center">PAGOS</p>
														</th>
													</tr>
													<tr>
														<td class="borde">l</td>
														<td class="borde">Multa por Mora (.........% del resultado del Inc. k menos el Inc. h) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">42</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">m</td>
														<td class="borde">Intereses (.........% del resultado del Inc. k menos el Inc. h) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">43</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">n</td>
														<td class="borde">Saldo definitivo a pagar a favor del Fisco (Inc. k+l+m)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">44</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
					<!--<tr><td class="saltoPagina"></td></tr>-->
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
														<th class="bordevacio">inc</th>
														<th class="bordevacio" style="width: 95%">
															<p align="left">Rubro 5 determinacion de anticipo para el siguiente ejercicio fiscal</p>
														</th>
														<th class="bordevacio" colSpan="2">
															<p align="center">importe</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
													<td class="borde">Impuesto liquidado del ejercicio (proviene del Inc. a o Inc. b, Col. II del Rubro 4)</td>
													<td class="borde">45</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Retenciones y Percepciones computables (proviene del Inc. f, Col. I del Rubro 4)</td>
													<td class="borde">46</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Anticipo a ingresar para el siguiente ejercicio (Inc. a-b)</td>
													<td class="borde">47</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Saldo a favor del Contribuyente del ejercicio que se liquida (proviene del Inc. j, Col. I del Rubro 4. Consignar hasta el monto del Anticipo Liquidado)</td>
													<td class="borde">48</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Cuotas a ingresar ((Inc. c-d)/4)</td>
													<td class="borde">49</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
					<td height="236">
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
														<p align="left">RUBRO 6 otros datos complementarios (para quienes utilicen el Rubro 2 y 3)</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Total de las Donaciones y Aportes en general percibidos en dinero, a nivel local.</td>
													<td class="borde">50</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Total de las Donaciones y Aportes percibidos en dinero del exterior</td>
													<td class="borde">51</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Total de las Donaciones y Aportes percibidos en bienes tangibles a nivel local</td>
													<td class="borde">52</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Total de las Donaciones y Aportes percibidos en bienes tangibles del exterior</td>
													<td class="borde">53</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Total de los subsidios recibidos por parte del Estado</td>
													<td class="borde">54</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Total de otros ingresos no gravados por el impuesto, excluidos los indicados en los Inc. a al Inc. e</td>
													<td class="borde">55</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Monto pagado en concepto de Remuneraciones Brutas por sueldos y jornales</td>
													<td class="borde">56</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Monto pagado en concepto de Aportes Patronales sobre remuneraciones al personal</td>
													<td class="borde">57</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Monto pagado en concepto de honorarios profesionales</td>
													<td class="borde">58</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Monto pagado en concepto de Remuneraciones realizadas al Personal Superior, no sujetos al régimen de seguridad social</td>
													<td class="borde">59</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C59</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C59"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Monto total de otros egresos realizados, incluyendo los afectados a operaciones o actividades no gravadas, excluidos los señalados en los Inc. g al Inc. j</td>
													<td class="borde">60</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C60</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C60"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
					<td height="13">
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
