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
				
				<p class="contenido_areaimpresion">Identificador de formulario web:<strong><xsl:value-of select="declaracion/detalle/numeroDocumento"/></strong></p>
				<table class="declaracion">
					<tbody>
						<tr>
							<td colSpan="2">
								<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">110</xsl:with-param><xsl:with-param name="pVersion">V.1   Enero/2007</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA ACTIVIDADES AGROPECUARIAS (REGIMENES ESPECIALES)</xsl:with-param><xsl:with-param name="pNombres">
										<xsl:value-of select="$Nombre"/>
									</xsl:with-param><xsl:with-param name="pNumero">
										<xsl:value-of select="declaracion/detalle/C901"/>
									</xsl:with-param><xsl:with-param name="pNumeroRectifica">
										<xsl:value-of select="declaracion/detalle/C3"/>
									</xsl:with-param><xsl:with-param name="pPeriodo">
										<xsl:value-of select="$Periodo"/>
									</xsl:with-param><xsl:with-param name="pPrimerApellido">
										<xsl:value-of select="$PrimerApellido"/>
									</xsl:with-param><xsl:with-param name="pSegundoApellido">
										<xsl:value-of select="$SegundoApellido"/>
									</xsl:with-param><xsl:with-param name="pRuc">
										<xsl:value-of select="$Ruc"/>
									</xsl:with-param><xsl:with-param name="pModo">
										<xsl:value-of select="$Modo"/>
									</xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
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
													<tbody><!--DWLayoutTable-->
														<tr>
															<th class="bordevacio" vAlign="middle" width="478" height="67">PARA EMPRESAS O ENTIDADES QUE REALICEN OPERACIONES GRAVADAS POR EL IMPUESTO</th>
															<td vAlign="top" align="right" width="150">
																<table class="declaracion" style="; width: 160px">
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
																				<xsl:call-template name="itemActividadEconomica"><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor">
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
												<table class="declaracion" border="0">
													<tbody>
														<tr>
															<th class="bordevacio">INC</th>
															<th class="bordevacio" style="width: 90%">
																<p align="left">RUBRO 1 determinacion de la base imponible por el regimen presunto</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">zona 1 - granera o soja</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">zona 2 - fibra o algodon</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">zona 3 - ganadero alto rend.</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">zona 4 - ganadero rend. medio</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">SAU computable</td>
															<td class="borde">10</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">16</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">22</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">28</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Productividad Kg/Ha.</td>
															<td class="borde">11</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">17</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">23</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">29</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Precio por Kilo</td>
															<td class="borde">12</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">18</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">24</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">30</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">SUB TOTALES (Inc. a x b x c)</td>
															<td class="borde">13</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">19</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">25</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">31</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">Liquidación proporcional por la no tenencia efectiva del inmueble en el ejercicio</td>
															<td class="borde">14</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">20</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">26</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">32</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">
																<p>f</p>
															</td>
															<td class="borde">
																<strong>TOTAL RENTA BRUTA (Inc. d-e)</strong>
															</td>
															<td class="borde">15</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">21</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">27</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">33</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
																<p align="left">RUBRO 2 determinacion de la renta neta por el regimen presunto</p>
															</th>
															<th class="bordevacio" colSpan="4">
																<p align="center">importe</p>
															</th>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="2">
																<p align="center">contribuyente -I-</p>
															</th>
															<th class="bordevacio" colSpan="2" style="width: 90%">
																<p align="center">fisco -II-</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">
																<strong>TOTAL RENTA BRUTA</strong> (Suma de los montos del Inc. f Rubro 1 ) 
														</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">34</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Deducción del IVA por saldos provenientes de la ley 125/01 (proviene del  Inc. b Rubro 6)</td>
															<td class="borde">35</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Deducción por Pérdidas Extraordinarias establecidas por el Poder Ejecutivo</td>
															<td class="borde">36</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">SUB TOTALES (Inc. b+c, Col. I); (Inc. a, Col. II)</td>
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
															<td class="borde">e</td>
															<td class="borde">RENTA NETA DEL EJERCICIO (Inc. d Col. II menos Inc. d Col. I)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">39</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<th class="bordevacio" colspan="2">
																<p align="left">RUBRO 3 RESULTADO DEL EJERCICIO POR REGIMEN SIMPLIFICADO</p>
															</th>
														</tr>
														<tr>
															<td colSpan="2">
																<table style="; width: 333px">
																	<tbody><!--DWLayoutTable-->
																		<tr>
																			<td vAlign="top" width="329">
																				<table class="declaracion" style="; width: 333px; height: 230px">
																					<tbody>
																						<tr>
																							<th class="bordevacio" colSpan="3" style="width: 100%">
																								<p align="center">INGRESOS</p>
																							</th>
																						</tr>
																						<tr>
																							<td class="borde">Venta de ganado bovino</td>
																							<td class="borde">40</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">Ventas de otros tipos de ganado (equino, caprino, ovino y otros)</td>
																							<td class="borde">41</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">Venta de productos derivados de la ganadería (lana, cueros y cerdas) y venta de embriones</td>
																							<td class="borde">42</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">Venta de productos agrícolas en general</td>
																							<td class="borde">43</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">Otros ingresos relacionados con la actividad agropecuaria, excluídos los establecidos en el Art. 13 de la Resol. 449/05</td>
																							<td class="borde">44</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">
																								<strong>A - TOTAL INGRESOS GRAVADOS</strong>
																							</td>
																							<td class="borde">45</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																			<td vAlign="top">
																				<table class="declaracion" border="0" style="; width: 307px; height: 171px">
																					<tbody>
																						<tr>
																							<th class="bordevacio" colSpan="3" style="width: 100%">
																								<p align="center">gastos (continuacion)</p>
																							</th>
																						</tr>
																						<tr>
																							<td class="borde">Amortización proporcional por el agotamiento de la fuente productiva</td>
																							<td class="borde">57</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">Castigo por malos créditos</td>
																							<td class="borde">58</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">Donaciones</td>
																							<td class="borde">59</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C59</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C59"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">Gastos y contribuciones a favor del personal</td>
																							<td class="borde">60</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C60</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C60"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">Gastos generales, incluye gastos de movilidad y otros</td>
																							<td class="borde">61</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C61</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C61"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">
																								<strong>B - TOTAL GASTOS</strong>
																							</td>
																							<td class="borde">62</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C62</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C62"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">
																								<strong>Menos:</strong> Gastos no deducibles 
																						</td>
																							<td class="borde">63</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C63</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C63"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																						<tr>
																							<td class="borde">
																								<strong>C - TOTAL GASTOS DEDUCIBLES</strong>
																							</td>
																							<td class="borde">64</td>
																							<td class="borde">
																								<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C64</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C64"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>
														<!--<tr><td class="saltoPagina"></td></tr>-->
														<tr>
															<td colspan="2">
																<tbody>
																	<tr>
																		<td>
																			<table class="declaracion" style="; width: 333px; height: 389px">
																				<tbody>
																					<tr>
																						<th colSpan="3" style="width: 100%" class="bordevacio">
																							<p align="center">GASTOS DIRECTOS E INDIRECTOS AFECTADOS A LA ACTIVIDAD</p>
																						</th>
																					</tr>
																					<tr>
																						<td class="borde">Costos relacionados a la obtención de ingresos gravados</td>
																						<td class="borde">46</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Sueldos y Salarios</td>
																						<td class="borde">47</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Remuneraciones al personal superior</td>
																						<td class="borde">48</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Honorarios Profesionales</td>
																						<td class="borde">49</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Intereses financieros</td>
																						<td class="borde">50</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Alquileres y cesión de otros bienes</td>
																						<td class="borde">51</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Pérdidas extraordinarias y delitos por terceros</td>
																						<td class="borde">52</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Contratación de profesional técnico rural a través de autofactura</td>
																						<td class="borde">53</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">IVA Crédito computable por saldos existentes al 31 de diciembre del 2004 (Proviene del  Inc. b Rubro 6)</td>
																						<td class="borde">54</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Amortización proporcional de bienes incorporales</td>
																						<td class="borde">55</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Amortización proporcional en concepto de gastos de constitución y organización</td>
																						<td class="borde">56</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</td>
																		<td>
																			<table class="declaracion" style="; width: 307px; height: 390px">
																				<tbody>
																					<tr>
																						<th class="bordevacio" colSpan="3" style="width: 100%">
																							<p align="center">OTRAS DEDUCCIONES (CORRESPONDE DEDUCIR EN CASO DE OBTENER UTILIDAD Y DE SURGIR PÉRDIDA POR LA APLICACIÓN, NO ES ARRASTRABLE AL SIGUIENTE EJERCICIO)</p>
																						</th>
																					</tr>
																					<tr>
																						<td class="borde">Gastos personales y familiares</td>
																						<td class="borde">65</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C65</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C65"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Gastos en concepto de ayuda a personas físicas de fincas colindantes (incluído el IVA), proviene del Libro de Egresos</td>
																						<td class="borde">66</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C66</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C66"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Gastos e inversiones directamente relacionadas con la actividad (incluye la capitalización en las sociedades cooperativas y fondos destinados a los mismos)</td>
																						<td class="borde">67</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C67</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C67"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																						<td class="borde">Pérdidas de inventario por mortandad (hasta el 3%)</td>
																						<td class="borde">68</td>
																						<td class="borde">
																							<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C68</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C68"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																						</td>
																					</tr>
																					<tr>
																					<td class="borde">Depreciación de ganado hembra (hasta el 8%)</td>
																					<td class="borde">69</td>
																					<td class="borde">
																						<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C69</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C69"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																					</td>
																				</tr>
																				<tr>
																					<td class="borde">Depreciación de mejoras e instalaciones realizadas incluídas las reparaciones extraordinarias y construcciones en terreno de terceros (Proviene del Inc. d Rubro 8)</td>
																					<td class="borde">70</td>
																					<td class="borde">
																						<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																					</td>
																				</tr>
																				<tr>
																					<td class="borde">
																						<strong>D - TOTAL OTRAS DEDUCCIONES</strong>
																					</td>
																					<td class="borde">71</td>
																					<td class="borde">
																						<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
															</tbody>
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
															<p align="left">RUBRO 4 RESULTADO DEL EJERCICIO</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">importe</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">PERDIDA -I-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">UTILIDAD -II-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">RESULTADO FISCAL DEL EJERCICIO (Proviene del resultado del Inc. A menos (Inc. C+D) (Col. I: Pérdida no arrastrable; Col.II: Utilidad Fiscal)</td>
														<td class="borde">72</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="borde">73</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">PERDIDA DEL EJERCICIO ARRASTRABLE (Proviene del resultado del Inc. A menos Inc. C)</td>
														<td class="borde">74</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
															<p align="left">RUBRO 5 determinacion de la renta neta por regimen simplificado</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">IMPORTE</p>
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
														<td class="borde">Resultado del ejercicio / Ganancia (Proviene del Inc. a Col. II del Rubro 4)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">75</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Resultado del ejercicio / Pérdida (Proviene del Inc. b Col. I del Rubro 4)</td>
														<td class="borde">76</td>
														<td class="borde">  
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Pérdida de ejercicios anteriores</td>
														<td class="borde">77</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">SUB TOTALES (Inc. b+c Col. I; Inc. a Col. II)</td>
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
														<td class="borde">e</td>
														<td class="borde">Pérdida Fiscal (Diferencia entre columnas del Inc. d, cuando Col. I sea mayor que Col. II)</td>
														<td class="borde">80</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C80</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C80"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>  
													</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">f</td>
														<td class="borde">Renta Neta del ejercicio (Diferencia entre Columnas del Inc. d, cuando Col. II sea mayor que Col. I)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">81</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C81</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C81"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<p align="left">RUBRO 6 saldo de iva acumulado hasta la modificacion de la ley 125/91 por la ley 2421/04 (para regimen presunto y simplificado)</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">importe</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">credito -i-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">deduccion -II-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Saldo del Crédito IVA a favor del Contribuyente, correspondiente hasta el periodo fiscal del 31 de diciembre de 2004</td>
														<td class="borde">82</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C82</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C82"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Crédito IVA a descontar (No podrá superar el 30% de la Renta Bruta)</td>
														<td class="vacio"/>
														<td class="vacio">   </td>
														<td class="borde">83</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C83</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C83"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>  
													</td>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Saldo a favor del Contribuyente a trasladar al siguiente periodo fiscal (Inc. a-b)</td>
														<td class="borde">84</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C84</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C84"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
									<!--<tr><td class="saltoPagina"></td></tr>-->
									<tr>
										<td class="fondo" vAlign="top" align="left" width="1"/>
										<td vAlign="top" width="636">
											<table class="declaracion">
												<tbody>
													<tr>
														<th class="bordevacio" rowSpan="2">INC</th>
														<th class="bordevacio" rowSpan="2" style="width: 95%">
															<p align="left">RUBRO 7 compras y gastos del periodo gravado con iva (creditos afectados por el regimen de la ley 2421/04 que pueden ser utilizados para el regimen presunto y simplificado)</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">importe</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">credito -i-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">deduccion -II-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Saldo del IVA del ejercicio anterior correspondiente a los gastos y compras, afectados directamente a las actividades agropecuarias</td>
														<td class="borde">85</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C85</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C85"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Monto total del IVA incluído en las facturas correspondientes a los gastos e inversiones afectados directamente a las actividades agropecuarias del presente ejercicio</td>
														<td class="borde">86</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C86</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C86"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Total de crédito fiscal (Inc. a+b)</td>
														<td class="borde">87</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C87</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C87"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">IVA a descontar (Trasladar al  Inc. h Col. I Rubro 9)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">88</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C88</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C88"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">e</td>
														<td class="borde">Saldo a favor del Contribuyente a trasladar al siguiente ejercicio fiscal (Inc. c-d)</td>
														<td class="borde">89</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C89</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C89"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
															<p align="left">RUBRO 8 determinacion de las amortizaciones de las inversiones (para regimen simplificado)</p>
														</th>
														<th class="bordevacio" colSpan="4">
															<p align="center">importe</p>
														</th>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="2">
															<p align="center">inversiones -i-</p>
														</th>
														<th class="bordevacio" colSpan="2" style="width: 90%">
															<p align="center">amortizaciones -II-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Saldo del ejercicio anterior de inversiones a ser amortizadas</td>
														<td class="borde">90</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C90</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C90"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Inversiones del ejercicio a ser amortizadas</td>
														<td class="borde">91</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C91</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C91"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Total de amortizaciones a ser amortizadas (Inc. a+b)</td>
														<td class="borde">92</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C92</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C92"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">Amortización del ejercicio que se liquida, por las compras y gastos en concepto de inversiones, reparaciones y construcciones en terrenos de terceros (Trasladar a la Casilla 70 Rubro 3)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">93</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C93</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C93"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">e</td>
														<td class="borde">Saldo total de inversiones a ser amortizados en los siguientes ejercicios fiscales (Inc. c-d)</td>
														<td class="borde">94</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C94</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C94"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
														<p align="left">RUBRO 9 LIQUIDACION y saldo DEL IMPUESTO</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importe</p>
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
													<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por el Régimen Presunto (.........% sobre el monto del Inc. e Col. II del Rubro 2)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">95</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C95</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C95"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por el Régimen Simplificado ( .........% sobre el monto del Inc. f Col. II del Rubro 5)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">96</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C96</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C96"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Saldo a favor del Contribuyente del periodo anterior</td>
													<td class="borde">97</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C97</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C97"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Pago previo o pago a cuenta</td>
													<td class="borde">98</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C98</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C98"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Pago con Créditos Fiscales Disponibles, Certificados de Créditos Tributario, Nota de Crédito Tributario y Bonos del Tesoro</td>
													<td class="borde">99</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C99</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C99"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Retenciones y Percepciones computables a favor del Contribuyente</td>
													<td class="borde">100</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C100</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C100"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Anticipos ingresados</td>
													<td class="borde">101</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C101</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C101"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Deducción de IVA del presente ejercicio (Proviene del Rubro 7 Inc. d, Col. II)</td>
													<td class="borde">102</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C102</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C102"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">103</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C103</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C103"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Subtotal (Inc. c+d+e+f+g+h, Col. I); (Inc, a+i,  Col. II) ó (Inc, b+i,  Col. II)</td>
													<td class="borde">104</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C104</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C104"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">105</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C105</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C105"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Saldo a favor del Contribuyente para el siguiente período (Diferencia entre Columnas del Inc. j, cuando Col. I sea mayor que Col. II)</td>
													<td class="borde">106</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C106</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C106"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. j cuando Col. II sea mayor a Col. I)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">107</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C107</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C107"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="6">
														<p align="center">PAGOS</p>
													</th>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Multa por Mora (.........% del resultado del Inc. l menos el Inc. i) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">108</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C108</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C108"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">
														<p>Intereses (.........% del resultado del Inc. l menos el Inc. i) (Sólo se calculará cuando exista saldo a favor del Fisco) </p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">109</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C109</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C109"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">o</td>
													<td class="borde">Saldo definitivo a pagar a favor del Fisco (Inc. l+m+n)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">110</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C110</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C110"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
								<!--<tr><td class="saltoPagina"></td></tr>-->
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 10 información complementaria</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center"> </p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">RUC o Cédula de Identidad del Contador Público, si lo tuviere</td>
													<td class="borde">111</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C111</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C111"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Resultado Comercial del Ejercicio, para quienes se dediquen exclusivamente a la actividad agropecuaria (Ingresos menos gastos)</td>
													<td class="borde">112</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C112</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C112"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
								<tr>
									<td colSpan="4">
										<xsl:call-template name="pieDeclaraciones"/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
	</html>
	</xsl:template>
</xsl:stylesheet>
