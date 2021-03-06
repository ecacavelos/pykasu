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
				<div>		
					<table class="principal">						
						<tbody><!--DWLayoutTable-->
							<tr>
								<td width="654">
									<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">848</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
										</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
								</td>
								<td/>
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
																<th class="bordevacio" rowSpan="2" style="width: 60%">
																	<p align="left">PARA CONTRIBUYENTES QUE se encuentren afectados al impuesto a la renta a las actividades economicas, industriales o de servicios y lleven registros contables</p>
																</th>
																<td class="borde">
																	<p align="left">Mes de Cierre</p>
																</td>
																<td class="borde">05</td>
																<td class="borde" colSpan="2" align="center">
																	<xsl:call-template name="itemMesCierre"><xsl:with-param name="pNombre">C5</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C5"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">
																	<p align="left">Declaración Jurada en carácter de clausura o cese</p>
																</td>
																<td class="borde" style="width: 1px">06 </td>
																<td class="borde" style="width: 1px">3 </td>
																<td class="borde" align="center" style="width: 80px">
																	<xsl:choose>
																		<xsl:when test="$Modo='1'">
																			<xsl:call-template name="itemCheck">
																				<xsl:with-param name="pModo">
																					<xsl:value-of select="$Modo"/>
																				</xsl:with-param>
																				<xsl:with-param name="pNombre">C6</xsl:with-param>
																				<xsl:with-param name="pValor">
																					<xsl:value-of select="declaracion/detalle/C6"/>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:when>
																		<xsl:when test="$Modo='0'">
																			<xsl:call-template name="itemCheck"><xsl:with-param name="pModo">
																					<xsl:value-of select="$Modo"/>
																				</xsl:with-param><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor">
																					<xsl:value-of select="3"/>
																				</xsl:with-param></xsl:call-template>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:call-template name="itemCheck"><xsl:with-param name="pModo">
																					<xsl:value-of select="$Modo"/>
																				</xsl:with-param><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor">
																					<xsl:value-of select="0"/>
																				</xsl:with-param></xsl:call-template>
																		</xsl:otherwise>
																	</xsl:choose>
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
								<td/>
							</tr>
							<tr>
								<td vAlign="top" height="38">
									<table class="declaracion" width="640">
										<tbody><!--DWLayoutTable-->
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
																<th width="100%">
																	<p align="center">RUBRO 1 ESTADO DE RESULTADO</p>
																</th>
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
								<td/>
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
													<table style="; width: 300px; height: 241px">
														<tbody>
															<tr>
																<td vAlign="top">
																	<table class="declaracion" style="; width: 320px; height: 55px">
																		<tbody>
																			<tr>
																				<th class="bordevacio" colSpan="3" style="width: 75%">
																					<p align="center">
																						<strong>INGRESOS</strong>
																					</p>
																				</th>
																			</tr>
																			<tr>
																				<td class="borde">Venta de Bienes</td>
																				<td class="borde">10</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C10"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Ventas de Servicios</td>
																				<td class="borde">11</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C11"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Intereses y Otros Ingresos Financieros (Incluídos los intereses, comisiones, rendimientos y ganancias de Capital colocados en el exterior)</td>
																				<td class="borde">12</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C12"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Otros Ingresos</td>
																				<td class="borde">13</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C13"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>Menos:</strong> Devoluciones, Bonificaciones y Descuentos Otorgados 
																			</td>
																				<td class="borde">14</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C14"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>A - TOTAL DE INGRESOS NETOS:</strong>
																				</td>
																				<td class="borde">15</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C15"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>Menos:</strong> Ingresos Exentos o no Gravados 
																			</td>
																				<td class="borde">16</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C16"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>Menos:</strong> Ingresos de Fuente Extranjera No Gravados 
																			</td>
																				<td class="borde">17</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C17"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>Menos:</strong> Ingresos alcanzados por Régimen Presunto o Especial 
																			</td>
																				<td class="borde">18</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C18"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>B - TOTAL DE INGRESOS NETOS GRAVADOS</strong>
																				</td>
																				<td class="borde">19</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C19"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<th class="bordevacio" colSpan="3">
																					<p align="center">
																						<strong>COSTOS</strong>
																					</p>
																				</th>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>C - TOTAL DE COSTOS</strong>
																				</td>
																				<td class="borde">20</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C20"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Costo relacionado a Rentas Exentas o no Gravadas</td>
																				<td class="borde">21</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor">
																							<xsl:value-of select="declaracion/detalle/C21"/>
																						</xsl:with-param><xsl:with-param name="pModo">
																							<xsl:value-of select="$Modo"/>
																						</xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Costo relacionado a la obtención de Renta de Fuente Extranjera no Gravada</td>
																				<td class="borde">22</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Costo relacionado a la obtención de Rentas Gravadas por Régimen Personal o Especial</td>
																				<td class="borde">23</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>D - TOTAL DE COSTOS NO DEDUCIBLES: </strong>
																				</td>
																				<td class="borde">24</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>E - TOTAL DE COSTO NETO DEDUCIBLE:</strong> (Inc. C menos D) 
																			</td>
																				<td class="borde">25</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																	<table class="declaracion" style="; width: 320px; height: 55px">
																		<tbody>
																			<tr>
																				<th class="bordevacio" colSpan="3" style="width: 75%">
																					<p align="center">
																						<strong>gastos</strong>
																					</p>
																				</th>
																			</tr>
																			<tr>
																				<td class="borde">Gastos Generales</td>
																				<td class="borde">26</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Sueldos y Salarios sujetos al Régimen de Seguro Social admitido por Ley. Incluye aguinaldos</td>
																				<td class="borde">27</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Cargas Sociales - Aporte Patronal</td>
																				<td class="borde">28</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Remuneración Personal Superior (Excluido aquellos que aporten al Régimen de Seguro Social admitido por Ley)</td>
																				<td class="borde">29</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Remuneraciones porcentuales pagadas (Concordante con el Art. 8 
																				<em>
																						<strong>Inc. n</strong>
																					</em>  de la Ley 125) 
																			</td>
																				<td class="borde">30</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td vAlign="top">
																	<table class="declaracion" style="; width: 320px; height: 508px">
																		<tbody>
																			<tr>
																				<th class="bordevacio" colSpan="3" style="width: 100%">
																					<p align="center">
																						<strong>gastos (continuacion)</strong>
																					</p>
																				</th>
																			</tr>
																			<tr>
																				<td class="borde">Honorarios Profesionales y otras remuneraciones por conceptos de servicios personales</td>
																				<td class="borde">31</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">IVA deducible (concordante con el Art.27 Dto. 6359/05)</td>
																				<td class="borde">32</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Alquileres y Cesión de Otros Bienes y Derechos e intereses</td>
																				<td class="borde">33</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Pérdidas Extraordinarias y las originadas por Delitos de Terceros</td>
																				<td class="borde">34</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Gastos de Organización y Constitución, incluidos los preoperativos y reorganización</td>
																				<td class="borde">35</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Previsiones y/o castigo por Malos Créditos</td>
																				<td class="borde">36</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Donaciones</td>
																				<td class="borde">37</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Gastos y Contribuciones a favor del personal</td>
																				<td class="borde">38</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Gastos y Erogaciones en el Exterior</td>
																				<td class="borde">39</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Impuesto, tasas y demás tributos</td>
																				<td class="borde">40</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Gastos de Movilidad, Viáticos y otros. Se excluye los que forman parte del salario</td>
																				<td class="borde">41</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Depreciaciones y Amortizaciones</td>
																				<td class="borde">42</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Otros Gastos (No señalados expresamente en los ítems anteriores)</td>
																				<td class="borde">43</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>F - TOTAL GASTOS BRUTOS</strong>
																				</td>
																				<td class="borde">44</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Gastos relacionados a la obtención de Rentas Exentas y no Gravadas</td>
																				<td class="borde">45</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Gastos relacionados a la obtención de Rentas de Fuente Extranjera no Gravadas</td>
																				<td class="borde">46</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Gastos relacionados a la obtención de Rentas Gravadas por Régimen Presunto o Especial</td>
																				<td class="borde">47</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Impuesto a la Renta</td>
																				<td class="borde">48</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Otros Gastos no Deducibles</td>
																				<td class="borde">49</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>G - TOTAL DE GASTOS NO DEDUCIBLES:</strong>
																				</td>
																				<td class="borde">50</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">
																					<strong>H- TOTAL GASTOS NETOS DEDUCIBLES: (Inc. F-G)</strong>
																				</td>
																				<td class="borde">51</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
																	<p align="left">RUBRO 2 RESULTADO DEL EJERCICIO</p>
																</th>
																<th class="bordevacio" colSpan="4">
																	<p align="center">RESULTADO DEL EJERCICIO</p>
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
																<td class="borde">Resultado contable del ejercicio (pérdida o utilidad comercial neta) Proviene del Rubro 1 (Inc. 
																<strong>A</strong> menos (Inc. 
																<strong>C</strong> mas 
																<strong>F</strong>)) 
															</td>
																<td class="borde">52</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">54</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Resultado fiscal del ejercicio (pérdida o uttilidad fiscal) Proviene del Rubro 1 (Inc.  
																<strong>B</strong> menos (Inc.  
																<strong>E</strong> mas 
																<strong>H</strong>)) 
															</td>
																<td class="borde">53</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">55</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
											<!--IMPRESION-->
											<!--<tr><td class="saltoPagina"></td></tr>-->
											<tr>
												<td class="fondo" vAlign="top" align="left" width="1"/>
												<td vAlign="top" width="636">
													<table class="declaracion">
														<tbody>
															<tr>
																<th class="bordevacio" rowSpan="2">INC</th>
																<th class="bordevacio" rowSpan="2" style="width: 95%">
																	<p align="left">RUBRO 3 compensacion de perdidas de ejercicios anteriores (solo para quienes han declarado perdidas antes de la modificacion del Art. 8 de la ley 125/91)</p>
																</th>
																<th class="bordevacio" colSpan="4">
																	<p align="center">importe</p>
																</th>
															</tr>
															<tr>
																<th class="bordevacio" colSpan="2">
																	<p align="center">perdida -i-</p>
																</th>
																<th class="bordevacio" colSpan="2" style="width: 90%">
																	<p align="center">utilidad -II-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Pérdidas compensables de ejercicios anteriores</td>
																<td class="borde">56</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Utilidad Fiscal del ejercicio (Proviene del Rubro 2, Inc. 
																<strong>B</strong>, Col. II) 
															</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">58</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Pérdidas compensables para el siguiente ejercicio (cuando la diferencia de las perdidas compensables es superior a la utilidad fiscal del ejercicio)</td>
																<td class="borde">57</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Utilidad Fiscal liquidable para el ejercicio 
																<strong>RENTA NETA DEL EJERCICIO </strong>(cuando la diferencia de la utilidd fiscal del ejerercicio es superior a las pérdidas compensables) 
															</td>
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
								<td/>
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
																	<p align="left">RUBRO 4 determinacion de la base imponible para quienes obtuvieron beneficios fiscales antes de la modificacion del Art. 20 de la ley 125/91 y otros</p>
																</th>
																<th class="bordevacio" colSpan="4">
																	<p align="center">importe</p>
																</th>
															</tr>
															<tr>
																<th class="bordevacio" colSpan="2">
																	<p align="center">columna -i</p>
																</th>
																<th class="bordevacio" colSpan="2" style="width: 90%">
																	<p align="center">columna -ii-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Renta Neta del Ejercicio, proviene del Rubro 3 (Inc. d, Col. II)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">66</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C66</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C66"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Rentas alcanzadas por beneficios de la Ley 60/90</td>
																<td class="borde">60</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C60</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C60"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Rentas alcanzadas por beneficios del Mercado de Valores (Ley 1284/98)</td>
																<td class="borde">61</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C61</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C61"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Rentas alcanzadas por beneficios del Mercado de Capitales (Ley 1106/97)</td>
																<td class="borde">62</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C62</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C62"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Rentas alcanzadas por otros Beneficios Especiales vigentes (En caso de utilizar este Inciso debe llenar el Rubro 6)</td>
																<td class="borde">63</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C63</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C63"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Rentas producto de actividades educativas realizadas por entidades lucrativas físicas o Jurídicas, que no serán distribuidas, amparadas bajo lo dispuesto en el Art. 14 Num. 2 Inc. b de la Ley</td>
																<td class="borde">64</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C64</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C64"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">
																	<strong>SUB TOTALES</strong> (Inc. b+c+d+e+f,  Col. I) (Inc. a; Col. II) 
															</td>
																<td class="borde">65</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C65</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C65"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">67</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C67</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C67"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">h</td>
																<td class="borde">
																	<strong>BASE IMPONIBLE PARA EL REGIMEN GENERAL DEL IMPUESTO</strong><![CDATA[ ]]>(Inc. g Col.II menos Inc. g Col. I ; cuando Col. II sea mayor a Col. I) 
															</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">68</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C68</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C68"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
								<td/>
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
																	<p align="left">RUBRO 5 LIQUIDACION DEL IMPUESTO</p>
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
																<td class="borde">Impuesto liquidado sobre la tasa .........% general del impuesto, proviene del Rubro 4 
																<strong>Inc. h</strong> Col. II 
															</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">69</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C69</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C69"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Impuesto liquidado sobre la tasa del 30% aplicable sobre la renta alcanzada por beneficios de la Ley 60/90, proviene del Rubro 4 
																<strong>Inc. b</strong> Col. I 
															</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">70</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Impuesto liquidado sobre la tasa del 30% aplicable sobre la renta alcanzada por beneficios del Mercado de Valores, proviene del Rubro 4 
																<strong>Inc. c</strong> Col. I 
															</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">71</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Impuesto liquidado sobre la tasa del 30% aplicable sobre la renta alcanzada por beneficios del Mercado de Capitales, proviene del Rubro 4 
																<strong>Inc. d</strong> Col. I) 
															</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">72</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Impuesto liquidado Sobre la tasa del ........% por la disposición especificada en el Rubro 4 
																<strong>Inc. e</strong> Col. I 
															</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">73</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Saldo a favor del Contribuyente del período anterior</td>
																<td class="borde">74</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">Pago previo </td>
																<td class="borde">75</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">h</td>
																<td class="borde">Retenciones computables a favor del Contribuyente</td>
																<td class="borde">76</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">i</td>
																<td class="borde">Anticipos ingresados</td>
																<td class="borde">77</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">j</td>
																<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">78</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C78</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C78"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">k</td>
																<td class="borde">
																	<strong>SUB TOTALES</strong> (Inc. f+g+h+i Col. I); (Inc. a+b+c+d+e+j Col. II) 
															</td>
																<td class="borde"/>
																<td class="borde"/>
																<td class="borde"/>
																<td class="borde"/>
															</tr>
															<tr>
																<td class="borde">l</td>
																<td class="borde">Saldo a favor del Contribuyente para el siguiente período (Inc. k 
																<strong>, </strong>Col. I menos Inc. 
																<strong>k</strong>, Col. II cuando Col. I es mayor que Col. II) 
															</td>
																<td class="borde">79</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C79</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C79"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">m</td>
																<td class="borde">Saldo a favor del Fisco (Inc. 
																<strong>k</strong> Col. II menos Inc.  
																<strong>k</strong> Col. I, cuando Col. II es mayor que Col. I) 
															</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">80</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C80</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C80"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">n</td>
																<td class="borde">Multa por Mora .........% sobre el resultado (Inc. m - el Inc. j) (Sólo se calculará cuando el Inc. m sea mayor al Inc. j)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">81</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C81</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C81"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">o</td>
																<td class="borde">
																	<p>Intereses.........% sobre el resultado (Inc.  
																	<strong>m</strong> menos el Inc. j) (Sólo se calculará cuando Inc.  
																	<strong>m</strong> sea mayor al Inc. 
																	<strong>j</strong>) 
																</p>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">82</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C82</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C82"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">p</td>
																<td class="borde">Pago con Certificado de Crédito Tributario, expedido por la Administración</td>
																<td class="borde">83</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C83</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C83"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">q</td>
																<td class="borde">Saldo a favor del contribuyente para el siguiente periodo</td>
																<td class="borde">84</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C84</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C84"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">r</td>
																<td class="borde">Saldo definitivo a pagar a favor del Fisco </td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">85</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C85</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C85"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
								<td/>
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
																<th class="bordevacio" style="width: 95%">
																	<p align="left">RUBRO 6 disposición especial de beneficios fiscales - solo en caso de utilizar el rubro 4 inc. e estas casillas deben ser llenadas</p>
																</th>
																<th class="bordevacio" colSpan="2"/>
															</tr>
															<tr>
																<td class="bordevacio">a</td>
																<td class="bordevacio">Consigne el Número de la disposición legal que respalda el beneficio declarado en el Rubro 4 Inc. 
																<strong>e</strong>
																</td>
																<td class="bordevacio">86</td>
																<td class="bordevacio">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C86</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C86"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="bordevacio">b</td>
																<td class="bordevacio">Consigne el año de la disposición legal, el cual se refiere al Inc. 
																<strong>a</strong> de este Rubro 
															</td>
																<td class="bordevacio">87</td>
																<td class="bordevacio">
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
								<td/>
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
																<th class="bordevacio" style="width: 95%">
																	<p align="left">RUBRO 7 identificador del contador</p>
																</th>
																<th class="bordevacio" colSpan="2"/>
															</tr>
															<tr>
																<td class="borde">Nombre y Apellido del Contador</td>
																<td class="borde"/>
																<td class="borde">
																	<p align="center">Identificador RUC o C.I.</p>
																</td>
															</tr>
															<tr>
																<td class="borde"/>
																<td class="borde">88</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C88</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C88"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
								<td/>
							</tr>
							<tr>
								<td colSpan="2"/>
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
																<th class="bordevacio" style="width: 95%">
																	<p align="left">RUBRO 8 identificador de la empresa auditora</p>
																</th>
																<th class="bordevacio" colSpan="2"/>
															</tr>
															<tr>
																<td class="borde">Razón Social de la Empresa Auditora</td>
																<td class="borde"/>
																<td class="borde">
																	<p align="center">Identificador RUC o C.I.</p>
																</td>
															</tr>
															<tr>
																<td class="borde"/>
																<td class="borde">89</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C89</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C89"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
								<td/>
							</tr>
							<!--IMPRESION-->
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
																<th class="bordevacio" style="width: 95%">
																	<p align="left">RUBRO 9 Datos complementarios</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center"> </p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Compras en el país de bienes activos fijos</td>
																<td class="borde">90</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C90</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C90"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Importación de bienes del activo fijo</td>
																<td class="borde">91</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C91</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C91"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Total de importaciones, excluídos los bienes del Inc. 
																<strong>b</strong>
																</td>
																<td class="borde">92</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C92</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C92"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Cantidad de personal ocupado al cierre del ejercicio</td>
																<td class="borde">93</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C93</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C93"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
								<td/>
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
																<th class="bordevacio" style="width: 95%">
																	<p align="left">uso interno - identificación del credito tributario</p>
																</th>
																<th class="bordevacio" colSpan="2"/>
															</tr>
															<tr>
																<td class="borde">Número de Recibo expedido por la Administración Tributaria</td>
																<td class="borde">94</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C94</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C94"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
								<td/>
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
																<td class="borde" width="33%">
																	<p align="center">Lugar y Fecha de expedición</p>
																</td>
																<td class="borde" width="33%">
																	<p align="center">Nombre y Apellido del funcionario responsable</p>
																</td>
																<td class="borde" width="33%">
																	<p align="center">Firma y Sello</p>
																</td>
															</tr>
															<tr>
																<td class="borde" width="33%">
																	<p> </p>
																	<p> </p>
																	<p> </p>
																</td>
																<td class="borde" width="33%">
																	<br/>
																</td>
																<td class="borde" width="33%">
																	<br/>
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
								<td/>
							</tr>
							<tr>
								<td colSpan="2">
									<xsl:call-template name="pieDeclaraciones"/>
								</td>
							</tr>
						</tbody>
						
					</table>
						</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
