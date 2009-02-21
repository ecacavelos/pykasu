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
				<link href="../../style/css/bd-azul.css" type="text/css" rel="stylesheet"/>
			</head>
			<body>
				<div class="areaimpresion" id="top" heigth="5%">
					<img id="printimage" src="/pycasu/images/printer.jpg" onclick="window.print();"/>
					<a onclick="window.print();">Imprimir</a>
				</div>
				
				<p class="contenido_areaimpresion">Identificador de formulario web:<strong><xsl:value-of select="declaracion/detalle/numeroDocumento"/></strong></p>
				<table class="declaracion">
					<link href="../../style/css/bd-verde.css" type="text/css" rel="stylesheet"/>
					<tbody>
						<tr>
							<td>
								<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">104</xsl:with-param><xsl:with-param name="pVersion">V.1 Enero/2007</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA DEL SERVICIO DE CARACTER PERSONAL DECLARACION ANUAL DEL IMPUESTO</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
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
															<th class="bordevacio">PARA PERSONAS FISICAS Y SOCIEDADES SIMPLES QUE REALICEN OPERACIONES GRAVADAS POR EL IMPUESTO </th>
															<td>
																<table class="declaracion" style="; width: 200px">
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
																				<xsl:call-template name="itemActividadEconomica"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor">
																						<xsl:value-of select="declaracion/detalle/C6"/>
																					</xsl:with-param><xsl:with-param name="pModo">
																						<xsl:value-of select="$Modo"/>
																					</xsl:with-param></xsl:call-template>
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
															<th class="bordevacio">INC</th>
															<th class="bordevacio" style="width: 90%">
																<p align="left">RUBRO 1 INGRESOS </p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">personas fisicas -i-</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">sociedades simples -ii-</p>
															</th>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="2">
																<p align="left">
																	<strong>INGRESOS OBTENIDOS BAJO RELACION DE DEPENDENCIA</strong>
																</p>
															</th>
															<th class="bordevacio"/>
															<th class="bordevacio"/>
															<th class="bordevacio"/>
															<th class="bordevacio"/>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">Sueldos, salarios, jornales y similares</td>
															<td class="borde">10</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Sobre sueldos, horas extras y similares</td>
															<td class="borde">11</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Primas, premios, bonos, gratificaciones y similares</td>
															<td class="borde">12</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">Asignaciones por alquiler, vivienda y otros similares</td>
															<td class="borde">13</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">Sueldos y otras remuneraciones por funciones fuera del país</td>
															<td class="borde">14</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">Otras denominaciones</td>
															<td class="borde">15</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="2">
																<p align="left">
																	<strong>INGRESOS OBTENIDOS EN FORMA INDEPENDIENTE</strong>
																</p>
															</th>
															<th class="bordevacio"/>
															<th class="bordevacio"/>
															<th class="bordevacio"/>
															<th class="bordevacio"/>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde">Remuneraciones y honorarios</td>
															<td class="borde">16</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">17</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">h</td>
															<td class="borde">Comisiones y participaciones</td>
															<td class="borde">18</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">19</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">i</td>
															<td class="borde">Derechos de autor y otras retribuciones</td>
															<td class="borde">20</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">21</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="2">
																<p align="left">
																	<strong>OTROS INGRESOS GRAVADOS</strong>
																</p>
															</th>
															<th class="bordevacio"/>
															<th class="bordevacio"/>
															<th class="bordevacio"/>
															<th class="bordevacio"/>
														</tr>
														<tr>
															<td class="borde">j</td>
															<td class="borde">Dividendos percibidos de sociedades comerciales o agropecuarias por actividades gravadas por IRACIS o IMAGRO; registrar el 50% y trasladar el saldo al Rubro 2, Inc. a</td>
															<td class="borde">22</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">23</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">k</td>
															<td class="borde">Utilidades, excedentes o rendimientos de actividades gravadas por IRACIS o IMAGRO o provenientes de Cooperativas: Registrar el 50% y trasladar el saldo al Rubro 2 Inc. b</td>
															<td class="borde">24</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">25</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">l</td>
															<td class="borde">Dividendos, utilidades, rendimientos o excedentes de actividades no gravadas por IRACIS o IMAGRO, incluidos los préstamos recibidos de la entidad acreditadora: Registrar el 100%</td>
															<td class="borde">26</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">27</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">m</td>
															<td class="borde">Créditos y otros préstamos obtenidos de terceros declarados incobrables por el acreedor: saldo impago, sus intereses y recargos: Registrar el 100%</td>
															<td class="borde">29</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">30</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">n</td>
															<td class="borde">Ingresos por venta ocasional de inmuebles, no gravados por IRACIS, IMAGRO o IRPC: Registrar el 100%</td>
															<td class="borde">31</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">32</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">o </td>
															<td class="borde">Ingresos por venta o cesión de derechos, títulos, acciones o cuotas de capital de sociedades, no gravados por IRACIS, IMAGRO o IRPC: Registrar el 100%</td>
															<td class="borde">33</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">34</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">p</td>
															<td class="borde">Intereses, comisiones o rendimientos de capitales, no gravados por IRACIS, IMAGRO o IRPC: Registrar el 100%</td>
															<td class="borde">35</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">36</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">q</td>
															<td class="borde">Otros ingresos gravados, distintos de los anteriores</td>
															<td class="borde">37</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">38</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">r</td>
															<td class="borde">TOTAL INGRESOS BRUTOS O RENTA BRUTA</td>
															<td class="borde">39</td>
															<td class="borde">
																<p>
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</p>
															</td>
															<td class="borde">40</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<th class="bordevacio">INC</th>
															<th class="bordevacio" style="width: 90%">
																<p align="left">RUBRO 2 ingresos no gravados</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">personas fisicas -i-</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">sociedades simples -ii-</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">
																<p>Dividendos percibidos de sociedades comerciales o agropecuarias por actividades gravadas por IRACIS o IMAGRO; y préstamos recibidos de dichas sociedades asimilados a estos Dividendos (50%)</p>
															</td>
															<td class="borde">41</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">42</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Utilidades, excedentes o rendimientos de actividades gravadas por IRACIS o IMAGRO o provenientes de Cooperativas (50%)</td>
															<td class="borde">43</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">44</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Créditos y otros préstamos obtenidos de terceros</td>
															<td class="borde">46</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">47</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">Ingresos por venta ocasional de inmuebles, gravados por IRACIS, IMAGRO o IRPC: Registrar el 100%</td>
															<td class="borde">48</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">49</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">Ingresos por venta o cesión de derechos, títulos, acciones o cuotas de capital de sociedades, gravados por IRACIS, IMAGRO O IRPC: Registrar el 100%    </td>
															<td class="borde">50</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">51</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">Intereses, comisiones o rendimientos de capitales, gravados por IRACIS, IMAGRO o IRPC: Registrar el 100%</td>
															<td class="borde">52</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">53</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde">Colocaciones de no aportantes a un seguro social obligatorio recuperadas, y sus rendimientos</td>
															<td class="borde">54</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">h</td>
															<td class="borde">Otros ingresos no gravados, tales como aguinaldo, herencias, ingresos por juegos de azar y los demás ingresos a que se refiere el Art. 35 del Decreto Nº 6665/05 modificado por el Decreto Nº 6672/05</td>
															<td class="borde">55</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">56</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">i</td>
															<td class="borde">Otros ingresos no gravados distintos de los anteriores</td>
															<td class="borde">57</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">58</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">j</td>
															<td class="borde">TOTAL INGRESOS NO GRAVADOS</td>
															<td class="borde">59</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C59</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C59"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
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
															<th class="bordevacio" style="width: 90%">
																<p align="left">RUBRO 3 deducciones: gastos incurridos</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">personas fisicas</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">sociedades simples</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">Pagos de préstamos (capital) recibidos de entidades que realizan actividades no gravadas por IRACIS o IMAGRO (100%)</td>
															<td class="borde">63</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C63</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C63"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">64</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C64</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C64"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Intereses y otros cargos pagados, excepto capital, por préstamos recibidos. Registrar el 100%</td>
															<td class="borde">66</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C66</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C66"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">67</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C67</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C67"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Pago de créditos y otros préstamos obtenidos de terceros en su momento declarados incobrables por el acreedor, monto declarado como ingreso a tiempo de la declaración de incobrabilidad por concepto de saldo impago, sus intereses y recargos (100%)</td>
															<td class="borde">68</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C68</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C68"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">69</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C69</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C69"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">Impuesto similar al IRSCP pagado en el exterior (100%)</td>
															<td class="borde">70</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">Costo de la enajenación o transferencia de inmuebles, cesión de derechos, títulos, acciones o cuotas de capital de sociedades, regalías y otros similares: 70% del valor de la venta respectiva o el precio de compra del bien, el monto mayor</td>
															<td class="borde">71</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">72</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">Costo de la enajenación o cesión de títulos, acciones o cuotas de capital de sociedades, cuando el adquiriente es contribuyente de IRACIS: valor de adquisición del bien o derecho</td>
															<td class="borde">73</td>
															<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">74</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">g</td>
														<td class="borde">Descuentos por aportes al IPS y Cajas de Jubilaciones y Pensiones. Registrar el 100%</td>
														<td class="borde">75</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">h</td>
														<td class="borde">Donaciones al Estado, Municipalidades, entidades religiosas y otras de asistencia social y similares no más del 10% del Total de Ingresos Brutos del Ejercicio</td>
														<td class="borde">76</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">77</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">i</td>
														<td class="borde">Gastos directamente relacionados con la actividad gravada, realizados en el país y en el exterior. Registrar el 100%</td>
														<td class="borde">78</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C78</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C78"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">79</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C79</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C79"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">j</td>
														<td class="borde">Gastos indirectos (proporción correspondiente a la actividad gravada) realizados en el país y en el exterior. Registrar el 100%</td>
														<td class="borde">80</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C80</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C80"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">81</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C81</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C81"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">k</td>
														<td class="borde">Gastos personales y familiares</td>
														<td class="borde">82</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C82</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C82"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">l</td>
														<td class="borde">Colocaciones de no aportantes a un seguro social obligatorio: no más del 15% del Total de Ingresos Brutos del ejercicio</td>
														<td class="borde">83</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C83</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C83"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Otros gastos deducibles. Los que no se acomoden a ninguno de los conceptos anteriores</td>
													<td class="borde">84</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C84</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C84"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">85</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C85</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C85"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">TOTAL GASTOS INCURRIDOS</td>
													<td class="borde">86</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C86</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C86"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">87</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C87</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C87"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 90%">
														<p align="left">RUBRO 4 deducciones: inversiones realizadas    </p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">personas fisicas</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">sociedades simples</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Inversiones directamente relacionadas con la actividad gravada</td>
													<td class="borde">88</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C88</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C88"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">89</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C89</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C89"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Inversiones personales y familiares</td>
													<td class="borde">90</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C90</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C90"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">TOTAL INVERSIONES REALIZADAS</td>
													<td class="borde">91</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C91</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C91"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">92</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C92</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C92"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 90%">
														<p align="left">RUBRO 5 determinacion de la renta neta del ejercicio</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">personas fisicas</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">sociedades simples</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Total de Renta  Bruta del ejercicio (Trasladar importe de  Inc. r Rubro 1)</td>
													<td class="borde">93</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C93</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C93"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">94</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C94</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C94"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Total de gastos incurridos (Trasladar importe del , Inc. n Col. I Rubro 3, Casilla 86; si es mayor a , Inc. r Col. I Rubro 1, Casilla 39; escribir este último)</td>
													<td class="borde">95</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C95</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C95"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">96</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C96</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C96"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Diferencia (Restar Inc. a menos Inc. b)</td>
													<td class="borde">97</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C97</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C97"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">98</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C98</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C98"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Total de Inversiones realizadas durante el ejercicio (Trasladar  Inc. c Rubro 4)</td>
													<td class="borde">99</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C99</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C99"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">100</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C100</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C100"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">RENTA NETA IMPONIBLE (Inc. c menos Inc. d, si el resultado es negativo registrar en números positivos en Inc. f y marcar 0 (cero) en este inciso)</td>
													<td class="borde">101</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C101</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C101"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">102</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C102</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C102"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">PERDIDA FISCAL DEL EJERCICIO (Inc. c menos Inc. d, si es positivo registrar 0 (cero))</td>
													<td class="borde">103</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C103</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C103"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">104</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C104</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C104"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">PERDIDA FISCAL TRASLADABLE A EJERCICIOS SIGUIENTES: Monto de Inc. d que excede a Inc. c, si Inc. c es positivo  ó importe de Inc. d si Inc. c es negativo. NOTA: Llenar esta casilla solamente si Inc. f es mayor a 0 (cero); caso contrario, registrar 0 (cero)</td>
													<td class="borde">105</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C105</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C105"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">106</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C106</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C106"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 90%">
														<p align="left">RUBRO 6 liquidacion del impuesto</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">personas fisicas</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">sociedades simples</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Renta Neta del ejercicio (Copiar  Inc. e Rubro 5)</td>
													<td class="borde">107</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C107</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C107"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">108</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C108</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C108"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Pérdida Fiscal de ejercicios anteriores (No puede ser mayor al 20% del Inc. r Rubro 1 )</td>
													<td class="borde">109</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C109</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C109"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">110</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C110</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C110"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">BASE IMPONIBLE (Inc. a menos Inc. b)</td>
													<td class="borde">111</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C111</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C111"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">112</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C112</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C112"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">LIQUIDACION: 10% de Inc. c, si Inc. r Rubro 1 es mayor a 120 (ciento veinte) salarios mínimos ó 8% del Inc.c si  Inc. r Rubro 1 es igual o menor a 120 (ciento veinte) salarios mínimos</td>
													<td class="borde">113</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C113</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C113"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">114</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C114</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C114"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 90%">
														<p align="left">RUBRO 7 liquidacion final</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">personas fisicas</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">SOCIEDADES SIMPLES</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">
														<strong>Importe del rango no incidido del ejercicio</strong>: Registrar en guaraníes el importe correspondiente al ejercicio que se declara 
												</td>
													<td class="borde">115</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C115</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C115"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">
														<strong>Impuesto Determinado </strong>(Persona Física: si Inc. r Rubro 1 es igual o menor al Inc. a Rubro 7, escriba 0; si es mayor o si es una Sociedad Simple, copie Inc. d Rubro 6) 
												</td>
													<td class="borde">116</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C116</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C116"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">117</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C117</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C117"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Saldo a favor del Contribuyente del periodo anterior</td>
													<td class="borde">118</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C118</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C118"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">119</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C119</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C119"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Pago Previo</td>
													<td class="borde">120</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C120</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C120"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">121</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C121</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C121"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Pago con Créditos Fiscales Disponibles, Certificados de Créditos Tributario, Nota de Crédito Tributario y Bonos del Tesoro </td>
													<td class="borde">122</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C122</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C122"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">123</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C123</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C123"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Anticipos Ingresados</td>
													<td class="borde">124</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C124</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C124"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">125</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C125</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C125"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
													<td class="borde">126</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C126</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C126"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">127</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C127</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C127"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Saldo a favor del Contribuyente (Inc. c+d+e+f-b-g; si el resultado es negativo escriba 0)</td>
													<td class="borde">128</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C128</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C128"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">129</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C129</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C129"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Saldo a Favor del Fisco (Inc. b+g-c-d-e-f; si el resultado es negativo escriba 0)</td>
													<td class="borde">130</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C130</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C130"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">131</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C131</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C131"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="6">
														<p align="center">
															<strong>PAGOS</strong>
														</p>
													</th>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Multa por Mora (.........% del resultado del Inc. i menos el Inc. g)  (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
													<td class="borde">132</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C132</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C132"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">133</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C133</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C133"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Intereses (.........% del resultado del Inc. i menos el Inc. g) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
													<td class="borde">134</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C134</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C134"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">135</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C135</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C135"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Saldo definitivo a pagar a favor del Fisco (Inc. i+j+k)</td>
													<td class="borde">136</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C136</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C136"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">137</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C137</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C137"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
