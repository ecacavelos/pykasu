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
							<td>
								<xsl:call-template name="cabeceraDeclaracionesClausura">
									<xsl:with-param name="pFormulario">120</xsl:with-param>
									<xsl:with-param name="pVersion">V.1   Enero/2007</xsl:with-param>
									<xsl:with-param name="pImpuesto">IMPUESTO AL VALOR AGREGADO</xsl:with-param>
									<xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param>
									<xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param>
									<xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param>
									<xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param>
									<xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param>
									<xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param>									
									<xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/></xsl:with-param>
									<xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param>
									<xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</tbody>
				</table>
				<div id="tab1" style="width: 640px">
					<table>
						<tbody>
							<tr>
								<td>
									<table class="declaracion1" width="640">
										<tbody>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/top-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-1.gif" width="4"/>
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
																	<p align="left">RUBRO 1 monto de las operaciones del periodo y determinacion del debito fiscal</p>
																</th>
																<th class="bordevacio" colSpan="6">
																	<p align="center">debito fiscal por operaciones gravadas</p>
																</th>
															</tr>
															<tr>
																<th class="bordevacio" colSpan="2">
																	<p align="center">monto de las operaciones -i-</p>
																</th>
																<th class="bordevacio" colSpan="2" style="width: 90%">
																	<p align="center">AL 10% -ii-</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center">AL  5% -iii-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Enajenación de Bienes y Prestación de Servicios gravados con tasa del 10%</td>
																<td class="borde">10</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">19</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Enajenación de Bienes y Prestación de Servicios gravadas con tasa del 5%</td>
																<td class="borde">11</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">25</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Enajenación de autovehículo (Art. 25 del Dto. 6806/05)</td>
																<td class="borde">12</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">20</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Remuneraciones que se autoasignan los propietarios de empresas unipersonales (Art. 6 Dto. 6806/05)</td>
																<td class="borde">13</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">21</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Ajustes de precios, devoluciones realizadas y descuentos obtenidos por compras ya declaradas con Crédito Fiscal del 10% y recupero de impuesto por operaciones declaradas como incobrables</td>
																<td class="borde">14</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">22</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">26</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Ajustes de precios, devoluciones realizadas y descuentos obtenidos por compras ya declaradas con Crédito Fiscal del 5% y recupero de impuesto por operaciones declaradas como incobrables.</td>
																<td class="borde">15</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">23</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">27</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">Operaciones no gravadas o exentas de tributo</td>
																<td class="borde">16</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">h</td>
																<td class="borde">Operaciones de Exportación y Asimilables (Art. 88 de la Ley)</td>
																<td class="borde">17</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">i</td>
																<td class="borde">TOTAL (Col. I: Inc. a+b+c+d+e+f); (Col. II: a+c+d+e+f); (Col. III: Inc. b+e+f)</td>
																<td class="borde">18</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">24</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
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
													<img height="4" src="../../style/images/bot-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-1.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-1.gif" width="4"/>
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
																	<p align="left">RUBRO 2 informacion complementaria sobre operaciones realizadas durante los ultimos 6 (seis) meses (incluido el periodo que se declara)</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center">monto acumulado</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Enajenación de Bienes y Prestación de Servicios realizadas en el mercado interno gravadas con tasa del 10%</td>
																<td class="borde">29</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Enajenación de Bienes y Prestación de Servicios realizadas en el mercado interno gravadas con tasa del 5%</td>
																<td class="borde">30</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">TOTAL OPERACIONES GRAVADAS: (Inc. a+b)</td>
																<td class="borde">31</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Enajenaciones de bienes y prestación de servicios no gravadas o exentas de tributo</td>
																<td class="borde">32</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">TOTAL OPERACIONES EN EL MERCADO INTERNO GRAVADAS Y NO GRAVADAS: (Inc. c+d)</td>
																<td class="borde">33</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Operaciones de Exportación y asimilables (Art. 88 de la Ley)</td>
																<td class="borde">34</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">MONTO TOTAL DE LAS OPERACIONES: (inc. e+f)</td>
																<td class="borde">35</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-1.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-1.gif" width="4"/>
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
																	<p align="left">RUBRO 3 detalle de compras e importaciones del periodo, afectadas indistintamente a diferentes operaciones del contribuyente</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center">monto de las compras -i-</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center">credito fiscal -ii-</p>
																</th>
															</tr>
															<tr>
																<td class="borde"/>
																<td class="borde">COMPRA DE BIENES (INCLUIDAS LAS IMPORTACIONES Y SERVICIOS GRAVADOS)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Con Crédito Fiscal del 10%, indistintamente afectados a Exportaciones y asimilables y a operaciones en el Mercado Interno gravadas y no gravadas</td>
																<td class="borde">36</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">42</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Con Crédito Fiscal del 5%, indistintamente afectados  a Exportaciones y asimilables y a operaciones en el Mercado Interno gravadas y no gravadas</td>
																<td class="borde">37</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">43</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Con Crédito Fiscal del 10%, indistintamente afectados a operaciones en el mercado interno gravadas y a operaciones en el Mercado Interno no gravadas o exentas</td>
																<td class="borde">38</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">44</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Con Crédito Fiscal del 5%, indistintamente afectados a operaciones en el mercado interno gravadas y a operaciones en el mercado interno no gravadas o exentas</td>
																<td class="borde">39</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">45</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Con Crédito Fiscal del 10%, indistintamente afectados a operaciones gravadas con tasa del 10% y a operaciones gravadas con tasa del 5%</td>
																<td class="borde">40</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">46</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Con Crédito Fiscal del 5%, indistintamente afectados a operaciones gravadas con tasa del 10% y a operaciones gravadas con tasa del 5%</td>
																<td class="borde">41</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">47</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-1.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-1.gif" width="4"/>
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
																	<p align="left">RUBRO 4 DETALLE DE LAS COMPRAS DEL PERIODO Y CREDITO FISCAL POR OPERACIONES DE EXPORTACION Y ASIMILABLES (aRT. 88 DE LA lEY)</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center">MONTO DE LAS COMPRAS -I-</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center">CREDITO FISCAL -II-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Compra de bienes (incluidas importaciones) y servicios con Crédito Fiscal del 10%  directamente vinculadas a operaciones de Exportación y asimilables</td>
																<td class="borde">49</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">51</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Compras de bienes (incluidas importaciones) y servicios con Crédito Fiscal del 5% directamente vinculadas a operaciones de Exportación y asimilables</td>
																<td class="borde">50</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">52</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Crédito Fiscal del 10% atribuido proporcionalmente a operaciones de Exportación y asimilables</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">53</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Crédito Fiscal del 5% atribuido proporcionalmente a operaciones de Exportación y asimilables</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">54</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Saldo a favor del Contribuyente del período anterior (proviene del Inc. i, Col. II del Rubro 4 de la Declaración Jurada del periodo anterior)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">55</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">TOTAL ACUMULADO DE CREDITO FISCAL POR EXPORTACIONES Y ASIMILABLES (Col. II: Inc.(a+b+c+d+e)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">56</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">Monto del Crédito Fiscal a ser utilizado en el período que se liquida para operaciones gravadas al 10% (trasladar al Rubro 6: Col. I Inc. c)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">57</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">h</td>
																<td class="borde">Monto del Crédito Fiscal a ser utilizado en el período que se liquida para operaciones gravadas al 5% (trasladar al Rubro 6: Col. II Inc. c)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">58</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">i</td>
																<td class="borde">SALDO A FAVOR DEL EXPORTADOR Y ASIMILABLES: (Inc. f - (Col. II Inc. g+h)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">59</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C59</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C59"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-1.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-1.gif" width="4"/>
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
																	<p align="left">RUBRO 5 detalle de las compras del periodo y determinacion del credito fiscal para operaciones gravadas</p>
																</th>
																<th class="bordevacio" colSpan="6">
																	<p align="center">credito fiscal para operaciones gravadas</p>
																</th>
															</tr>
															<tr>
																<th class="bordevacio" colSpan="2">
																	<p align="center">monto de las comras -i-</p>
																</th>
																<th class="bordevacio" colSpan="2" style="width: 90%">
																	<p align="center">al 10% -ii-</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center">al 5% -iii-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Compras de bienes (incluidas importaciones y servicios gravados): Con Crédito Fiscal del 10% directamente vinculadas a operaciones gravadas a la tasa del 10%</td>
																<td class="borde">61</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C61</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C61"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">70</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Compras de bienes (incluidas importaciones y servicios gravados): Con Crédito Fiscal del 5% directamente vinculadas a operaciones gravadas a la tasa del 10%</td>
																<td class="borde">62</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C62</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C62"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">71</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Compras de bienes (incluídas importaciones y servicios gravados): Con Crédito Fiscal del 10% directamente vinculadas a operaciones gravadas a la tasa del 5%</td>
																<td class="borde">63</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C63</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C63"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">79</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C79</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C79"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Compras de bienes (incluidas importaciones y servicios gravados): Con Crédito Fiscal del 5% directamente vinculadas a operaciones gravadas a la tasa del 5%</td>
																<td class="borde">64</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C64</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C64"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">80</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C80</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C80"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Crédito Fiscal del 10% atribuido proporcionalmente a operaciones gravadas a la tasa del 10%</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">72</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Crédito Fiscal del 5% atribuido proporcionalmente a operaciones gravadas a la tasa del 10%</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">73</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">Crédito Fiscal del 10% atribuido proporcionalmente a operaciones gravadas a la tasa del 5%</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">81</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C81</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C81"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">h</td>
																<td class="borde">Crédito Fiscal del 5% atribuido proporcionalmente a operaciones gravadas a la tasa del 5%</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">82</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C82</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C82"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">i</td>
																<td class="borde">Monto de compra de autovehículo y Crédito Fiscal (Art. 25 del Decreto 6806/05)</td>
																<td class="borde">65</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C65</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C65"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">74</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">j</td>
																<td class="borde">Crédito Fiscal del 10% vinculado a remuneraciones que se autoasignan los propietarios de empresas unipersonales</td>
																<td class="borde">66</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C66</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C66"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">75</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">k</td>
																<td class="borde">Crédito Fiscal del 5% vinculado a remuneraciones que se autoasignan los propietarios de empresas unipersonales</td>
																<td class="borde">67</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C67</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C67"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">76</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">l</td>
																<td class="borde">Ajustes de precios, devoluciones y descuentos otorgados, por ventas ya declaradas con tasa del 10% y operaciones gravadas con tasa del 10% declaradas incobrables</td>
																<td class="borde">68</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C68</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C68"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">77</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">m</td>
																<td class="borde">Ajustes de precios, devoluciones y descuentos otorgados, por ventas ya declaradas con tasa del 5% y operaciones gravadas con tasa del 5% declaradas incobrables</td>
																<td class="borde">69</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C69</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C69"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">83</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C83</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C83"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">n</td>
																<td class="borde">TOTAL CREDITO FISCAL POR OPERACIONES GRAVADA: ( Col. II: Inc. a+b+e+f+i+j+k+l); (Col. III: Inc. c+d+g+h+m)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">78</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C78</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C78"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">84</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C84</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C84"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-1.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-1.gif" width="4"/>
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
																	<p align="left">RUBRO 6 determinacion del impuesto</p>
																</th>
																<th class="bordevacio" colSpan="4">
																	<p align="center">operaciones gravadas </p>
																</th>
															</tr>
															<tr>
																<th class="bordevacio" colSpan="2">
																	<p align="center">al 10% -i-</p>
																</th>
																<th class="bordevacio" colSpan="2" style="width: 90%">
																	<p align="center">al 5% -ii-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Débito Fiscal (proviene del Rubro 1 Inc. i, Col. II y III)</td>
																<td class="borde">85</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C85</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C85"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">100</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C100</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C100"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Crédito Fiscal por operaciones gravadas (proviene del Rubro 5 Inc. n, Col. II y III)</td>
																<td class="borde">86</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C86</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C86"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">101</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C101</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C101"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Crédito Fiscal por operaciones de exportación (proviene del Rubro 4 Inc. g, h Col. II)</td>
																<td class="borde">87</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C87</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C87"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">102</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C102</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C102"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Saldo a favor del Contribuyente del período anterior (proviene del Inc. e, Col. I y II de Rubro 6 de la Declaración Jurada del período anterior</td>
																<td class="borde">88</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C88</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C88"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">103</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C103</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C103"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Saldo a favor del Contribuyente (monto a trasladar al Inc. d del presente rubro, en el siguiente período fiscal) Inc. (b+c+d) - a Col. I y II, cuando Inc. a sea menor que sumatoria Inc. b,c,d Col. I y II</td>
																<td class="borde">89</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C89</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C89"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">104</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C104</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C104"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Impuesto determinado Inc. a - (b+c+d) Col. I y II, cuando Inc. a sea mayor que sumatoria Inc. b,c,d Col. I y II.</td>
																<td class="borde">90</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C90</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C90"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">105</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C105</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C105"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-1.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-1.gif" width="4"/>
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
																	<p align="left">RUBRO 7 liquidacion y saldo del impuesto</p>
																</th>
																<th class="bordevacio" colSpan="4">
																	<p align="center">monto a favor de</p>
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
																<td class="borde">Impuesto determinado para operaciones gravadas al 10% y 5% (Suma de Inc. f, Col. I y II del Rubro 6)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">112</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C112</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C112"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Saldo a favor del Contribuyente del período anterior (Proviene del Inc. h Col. I y II del Rubro 7 de la Declaración Jurada del periodo anterior)</td>
																<td class="borde">106</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C106</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C106"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Pago previo</td>
																<td class="borde">107</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C107</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C107"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Pago con Créditos Fiscales Disponibles, Certificados de Créditos Tributario, Nota de Crédito Tributario y Bonos del Tesoro</td>
																<td class="borde">108</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C108</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C108"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Retenciones computables por operaciones gravadas al 10% y al 5%</td>
																<td class="borde">109</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C109</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C109"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">113</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C113</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C113"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">SUBTOTALES: (Inc. b+c+d+e, Col. I); (Inc. a+f, Col. II)</td>
																<td class="borde">110</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C110</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C110"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">114</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C114</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C114"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">h</td>
																<td class="borde">
																	<p>Saldo a favor del Contribuyente (Diferencia entre el Inc. g Col. I y II, cuando Col. I sea mayor que Col. II)</p>
																</td>
																<td class="borde">111</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C111</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C111"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">i</td>
																<td class="borde">Saldo a favor del Fisco (Diferencia entre el Inc. g Col. I y II, cuando Col. II sea mayor que Col. I)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">115</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C115</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C115"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde"/>
																<td class="borde">
																	<p align="center">PAGOS</p>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">j</td>
																<td class="borde">Multa por Mora (.........% del resultado del Inc. i menos el Inc. f) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">116</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C116</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C116"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">k</td>
																<td class="borde">Intereses (.........% del resultado del Inc. i menos el Inc. f) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">117</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C117</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C117"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">l</td>
																<td class="borde">Saldo definitivo a pagar a favor del Fisco (Inc. i+j+k)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">118</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C118</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C118"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-1.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-1.gif" width="4"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colSpan="2">
									<table width="100%">
										<tbody>
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
																				<th class="bordevacio" style="width: 95%">
																					<p align="left">RUBRO 8 DETALLE DE COMPRAS DEL PERIODO AFECTADA A OPERACIONES EXENTAS Y GRAVADAS IMPORTACIONES Y RENTA AGROPECUARIA</p>
																				</th>
																				<th class="bordevacio" colSpan="4">
																					<p align="center">IMPORTE</p>
																				</th>
																			</tr>
																			<tr>
																				<td class="borde">a</td>
																				<td class="borde">Compras con crédito fiscal del 10% relacionadas a operaciones exentas. </td>
																				<td class="borde">150</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C150</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C150"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																					<td class="borde">165</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C165</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C165"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">b</td>
																				<td class="borde">Compras con crédito fiscal del 5% relacionadas a operaciones exentas. </td>
																				<td class="borde">151</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C151</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C151"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																				<td class="borde">166</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C166</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C166"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">c</td>
																				<td class="borde">Compras exentas relacionadas a operaciones exentas. </td>
																				<td class="borde">152</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C152</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C152"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">d</td>
																				<td class="borde">Compras exentas relacionadas a operaciones gravadas a la tasa del 10% </td>
																				<td class="borde">153</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C153</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C153"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">e</td>
																				<td class="borde">Compras exentas relacionadas a operaciones gravadas a la tasa del 5% </td>
																				<td class="borde">154</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C154</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C154"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">f</td>
																				<td class="borde">Compras afectadas a exportación y asimilables y a operaciones en el mercado interno gravadas. </td>
																				<td class="borde">155</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C155</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C155"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">g</td>
																				<td class="borde">Compras exentas afectadas a operaciones en el mercado interno gravadas y no gravadas </td>
																				<td class="borde">156</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C156</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C156"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">h</td>
																				<td class="borde">Compras exentas afectadas a operaciones gravadas con tasa del 10% y 5% </td>
																				<td class="borde">157</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C157</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C157"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">i</td>
																				<td class="borde">Compras exentas afectadas a operaciones gravadas con tasa del 10% y 5% </td>
																				<td class="borde">158</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C158</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C158"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																				<td class="borde">167</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C167</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C167"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">j</td>
																				<td class="borde">Con crédito fiscal del 5% relacionadas a Renta Agropecuaria. </td>
																				<td class="borde">159</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C159</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C159"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																				<td class="borde">168</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C168</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C168"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">k</td>
																				<td class="borde">Compras documentadas con Autofactura </td>
																				<td class="borde">160</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C160</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C160"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">l</td>
																				<td class="borde">Valor imponible de las importaciones para el IVA </td>
																				<td class="borde">161</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C161</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C161"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																				<td class="borde">169</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C169</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C169"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">m</td>
																				<td class="borde">Valor imponible aduanero </td>
																				<td class="borde">162</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C162</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C162"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">n</td>
																				<td class="borde">Valor Factura de las Importaciones. </td>
																				<td class="borde">163</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C163</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C163"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">l</td>
																				<td class="borde">Gastos de nacionalización de las importaciones </td>
																				<td class="borde">164</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C164</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C164"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																				<td class="borde">170</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C170</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C170"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="pieDeclaraciones"/>
								</td>
							</tr>
							<tr>
							  <td>
								
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
