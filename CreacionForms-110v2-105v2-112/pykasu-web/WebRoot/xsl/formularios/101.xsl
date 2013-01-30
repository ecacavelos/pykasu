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
					<link href="../../style/css/bd-verde.css" type="text/css" rel="stylesheet"/>
					<tbody>
						<tr>
							<td>
								<xsl:call-template name="cabeceraDeclaracionesClausura">
									<xsl:with-param name="pFormulario">101</xsl:with-param>
									<xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA</xsl:with-param>
									<xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param>
									<xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param>
									<xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param>
									<xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param>
									<xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param>
									<xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param>
									<xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/></xsl:with-param>
									<xsl:with-param name="pModo"><xsl:value-of select="$Modo"/>
									</xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param>
								</xsl:call-template>
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
															<th class="bordevacio">
																<p align="justify">PARA EMPRESAS O ENTIDADES QUE REALICEN ACTIVIDADES GRAVADAS POR EL IMPUESTO QUE CUENTEN CON REGISTROS CONTABLES</p>
															</th>
															<td>
																<table class="declaracion" style="; width: 150px">
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
																			<th class="bordevacio" colSpan="2">
																				<p align="left">RUBRO 1 ESTADO DE RESULTADO</p>
																			</th>
																		</tr>
																		<tr>
																			<td colSpan="2">
																				<table style="; width: 333px; height: 241px">
																					<tbody>
																						<tr>
																							<td vAlign="top">
																								<table class="declaracion" style="; width: 333px; height: 55px">
																									<tbody>
																										<tr>
																											<th class="bordevacio" colSpan="3" style="width: 75%">
																												<p align="center">INGRESOS</p>
																											</th>
																										</tr>
																										<tr>
																											<td class="borde">Venta de Bienes</td>
																											<td class="borde">10</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor">
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
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor">
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
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor">
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
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C13"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Total Ingresos Brutos</strong>
																											</td>
																											<td class="borde">14</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C14"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Devoluciones, Bonificaciones y Descuentos Otorgados 
																										</td>
																											<td class="borde">15</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C15"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>A - TOTAL INGRESOS NETOS</strong>
																											</td>
																											<td class="borde">16</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C16"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong><![CDATA[ ]]>Ingresos por operaciones de exportación a terceros países realizados por usuarios de Zonas Francas 
																										</td>
																											<td class="borde">17</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C17"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong><![CDATA[ ]]>Ingresos Exentos o no Gravados 
																										</td>
																											<td class="borde">18</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C18"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Ingresos de Fuente Extranjera No Gravados 
																										</td>
																											<td class="borde">19</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C19"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Ingresos alcanzados por Régimen Presunto o Especial 
																										</td>
																											<td class="borde">20</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C20"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>B - TOTAL DE INGRESOS NETOS GRAVADOS</strong>
																											</td>
																											<td class="borde">21</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C21"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																									</tbody>
																								</table>
																								<table class="declaracion" style="; width: 333px; height: 48px">
																									<tbody>
																										<tr>
																											<th class="bordevacio" colSpan="3" style="width: 75%">
																												<p align="center">COSTO</p>
																											</th>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>C - TOTAL DE COSTO</strong>
																											</td>
																											<td class="borde">22</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C22"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos: </strong>Costos relacionados a los ingresos por operaciones de exportación a terceros paises realizados por usuarios de Zonas Francas 
																										</td>
																											<td class="borde">23</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C23"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Costo relacionado a Rentas Exentas o no Gravadas 
																										</td>
																											<td class="borde">24</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C24"/>
																													</xsl:with-param><xsl:with-param name="pModo">
																														<xsl:value-of select="$Modo"/>
																													</xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Costo relacionado a la obtención de Rentas de Fuente Extranjera no Gravadas 
																										</td>
																											<td class="borde">25</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Costo relacionado a la obtención de Rentas Gravadas por Régimen Presunto o Especial 
																										</td>
																											<td class="borde">26</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>D - TOTAL DE COSTO DEDUCIBLE</strong><![CDATA[ ]]>
																											</td>
																											<td class="borde">27</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																									</tbody>
																								</table>
																								<!--<tr><td class="saltoPagina"></td></tr>-->
																								<table class="declaracion" style="; width: 333px; height: 55px">
																									<tbody>
																										<tr>
																											<th class="bordevacio" colSpan="3" style="width: 75%">
																												<p align="center">gastos</p>
																											</th>
																										</tr>
																										<tr>
																											<td class="borde">Gastos Generales</td>
																											<td class="borde">28</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Sueldos y Salarios sujetos al Régimen de Seguro Social admitido por Ley. Aguinaldos</td>
																											<td class="borde">29</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Cargas Sociales - Aporte Patronal</td>
																											<td class="borde">30</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Remuneración Personal Superior (Excluido aquellos que aporten al Régimen de Seguro Social admitido por Ley)</td>
																											<td class="borde">31</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																							<td vAlign="top">
																								<table class="declaracion" style="; width: 307px; height: 764px">
																									<tbody>
																										<tr>
																											<th class="bordevacio" colSpan="3" style="width: 95%">
																												<p align="center">gastos (continuacion)</p>
																											</th>
																										</tr>
																										<tr>
																											<td class="borde">Remuneraciones Porcentuales Pagadas (Concuerda con el Inc. n del Art. 8 de la Ley 125/91)</td>
																											<td class="borde">32</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Honorarios Profesionales y otras remuneraciones por conceptos de servicios personales</td>
																											<td class="borde">33</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">IVA Gasto</td>
																											<td class="borde">34</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Alquileres y Cesión de Otros Bienes y Derechos e intereses</td>
																											<td class="borde">35</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Pérdidas Extraordinarias y las originadas por Delitos de Terceros</td>
																											<td class="borde">36</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Gastos de Organización y Constitución, incluidos los Preoperativos y Reorganización</td>
																											<td class="borde">37</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Previsiones y/o castigo por Malos Créditos</td>
																											<td class="borde">38</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Donaciones</td>
																											<td class="borde">39</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Gastos y Contribuciones a favor del personal</td>
																											<td class="borde">40</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Gastos y Erogaciones en el Exterior</td>
																											<td class="borde">41</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Impuesto a la Renta y demás Tributos</td>
																											<td class="borde">42</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Gastos de Movilización, Viáticos y otros. Se excluye los que forman parte del salario</td>
																											<td class="borde">43</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Depreciaciones y Amortizaciones</td>
																											<td class="borde">44</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">Otros Gastos (No señalados expresamente en los ítems anteriores)</td>
																											<td class="borde">45</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>E - TOTAL GASTOS</strong><![CDATA[ ]]>
																											</td>
																											<td class="borde">46</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Gastos relacionados a las operaciones de exportación a terceros paises realizados por usuarios de Zona Franca 
																										</td>
																											<td class="borde">47</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Gastos relacionados a la obtención de Rentas Exentas y no Gravadas 
																										</td>
																											<td class="borde">48</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Gastos relacionados a la obtención de Rentas de Fuente Extranjera no Gravadas 
																										</td>
																											<td class="borde">49</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Gastos relacionados a la obtención de Rentas Gravadas por Régimen Presunto o Especial 
																										</td>
																											<td class="borde">50</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Impuesto a la Renta 
																										</td>
																											<td class="borde">51</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>Menos:</strong> Otros Gastos no Deducibles 
																										</td>
																											<td class="borde">52</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																											</td>
																										</tr>
																										<tr>
																											<td class="borde">
																												<strong>F - TOTAL DE  GASTOS DEDUCIBLES</strong>
																											</td>
																											<td class="borde">53</td>
																											<td class="borde">
																												<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor">
																														<xsl:value-of select="declaracion/detalle/C53"/>
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
															<td class="borde">RESULTADO CONTABLE DEL EJERCICIO (Col. I: Pérdida ; Col. II: Utilidad Comercial Neta) (Proviene del resultado de A menos (C+E) del Rubro 1)</td>
															<td class="borde">54</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor">
																		<xsl:value-of select="declaracion/detalle/C54"/>
																	</xsl:with-param><xsl:with-param name="pModo">
																		<xsl:value-of select="$Modo"/>
																	</xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">56</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor">
																		<xsl:value-of select="declaracion/detalle/C56"/>
																	</xsl:with-param><xsl:with-param name="pModo">
																		<xsl:value-of select="$Modo"/>
																	</xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">RESULTADO FISCAL DEL EJERCICIO (Col. I: Pérdida ; Col. II: Utilidad Fiscal). Proviene del Rubro I, resultado de B menos (D+F) </td>
															<td class="borde">55</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor">
																		<xsl:value-of select="declaracion/detalle/C55"/>
																	</xsl:with-param><xsl:with-param name="pModo">
																		<xsl:value-of select="$Modo"/>
																	</xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">57</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor">
																		<xsl:value-of select="declaracion/detalle/C57"/>
																	</xsl:with-param><xsl:with-param name="pModo">
																		<xsl:value-of select="$Modo"/>
																	</xsl:with-param></xsl:call-template>
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
																<p align="left">RUBRO 3 COMPENSACION DE PERDIDAS DE EJERCICIOS ANTERIORES (SOLO PARA QUIENES HAN DECLARADO PERDIDAS ANTES DE LA MODIFICACION DEL ART. 8 DE LA LEY 125/91)</p>
															</th>
															<th class="bordevacio" colSpan="4">
																<p align="center">IMPORTE</p>
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
															<td class="borde">PERDIDAS COMPENSABLES DE EJERCICIOS ANTERIORES</td>
															<td class="borde">58</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">UTILIDAD FISCAL DEL EJERCICIO (Proviene del Inc. b, Col. II Rubro 2)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">60</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C60</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C60"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">PERDIDAS COMPENSABLES PARA EL SIGUIENTE EJERCICIO (Cuando la diferencia de las pérdidas compensables es superior a la Utilidad Fiscal del ejercicio)</td>
															<td class="borde">59</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C59</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C59"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">UTILIDAD FISCAL LIQUIDABLE DEL EJERCICIO (Cuando la diferencia de la Utilidad Fiscal del ejercicio es superior a las Pérdidas Compensables)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">61</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C61</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C61"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
																<p align="left">RUBRO 4 DETERMINACIÓN DE LA BASE IMPONIBLE PARA QUIENES OBTUVIERON BENEFICIOS FISCALES ANTES DE LA MODIFICACION del Art. 20 de la ley 125/91 Y OTROS</p>
															</th>
															<th class="bordevacio" colSpan="4">
																<p align="center">importe</p>
															</th>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="2">
																<p align="center">DEDUCCIONES -i-</p>
															</th>
															<th class="bordevacio" colSpan="2" style="width: 90%">
																<p align="center">BASE IMPONIBLE -II-</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">Renta Neta del Ejercicio (Proviene del Inc. d, Col. II del Rubro 3)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">68</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C68</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C68"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Rentas alcanzadas por beneficios de la Ley 60/90</td>
															<td class="borde">62</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C62</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C62"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>   
														</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Rentas alcanzadas por beneficios del Mercado de Valores (Ley 1284/98)</td>
															<td class="borde">63</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C63</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C63"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">Renta alcanzada por beneficios del Mercado de Capitales (Ley 1106/97)</td>
															<td class="borde">64</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C64</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C64"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">Rentas alcanzadas por otros Beneficios Especiales vigentes (En caso de utilizar este inciso debe llenar el Rubro 8 Inc. c y d)</td>
															<td class="borde">65</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C65</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C65"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">Renta producto de actividades educativas realizadas por entidades lucrativas (Físicas o Jurídicas) cuyas utilidades no serán distribuidas, amparadas bajo lo dispuesto en el Inc b, Num. 2 del Art. 14 de la Ley</td>
															<td class="borde">66</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C66</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C66"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde">Subtotal (Inc, b+c+d+e+f Col. I; Inc. a Col. II)</td>
															<td class="borde">67</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C67</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C67"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">69</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C69</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C69"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">h</td>
															<td class="borde">TOTAL BASE IMPONIBLE DEL IMPUESTO (Inc. g Col.II menos Inc. g Col. I, cuando Col. II sea mayor que Col. I)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">70</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
							<td colSpan="2">
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
																<p align="left">RUBRO 5 LIQUIDACION Y SALDO DEL IMPUESTO</p>
															</th>
															<th class="bordevacio" colSpan="4">
																<p align="center">IMPORTE</p>
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
															<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por el Régimen General (.........% sobre el monto del Inc. h Col. II del Rubro 4 )</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">71</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por beneficio de la Ley 60/90 ( .........% sobre el monto del Inc. b Col. I del Rubro 4)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">72</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por beneficio del Mercado de Valores (.........% sobre el monto del Inc. c Col. I del Rubro 4)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">73</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por beneficio del Mercado de Capitales (.........% sobre el monto del Inc. d Col. I del Rubro 4)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">74</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por beneficios especiales (.........% sobre el monto del Inc. e Col. I del Rubro 4)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">75</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">Subtotal (Inc. a+b+c+d+e Col. II)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">76</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde">Saldo a favor del Contribuyente del período anterior</td>
															<td class="borde">77</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">h</td>
															<td class="borde">Pago previo o pago a cuenta</td>
															<td class="borde">78</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C78</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C78"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">i</td>
															<td class="borde">Pago con Créditos Fiscales Disponibles, Certificados de Créditos Tributario, Nota de Crédito Tributario y Bonos del Tesoro</td>
															<td class="borde">79</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C79</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C79"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">j</td>
															<td class="borde">Retenciones y Percepciones computables a favor del Contribuyente</td>
															<td class="borde">80</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C80</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C80"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">k</td>
															<td class="borde">Anticipos ingresados</td>
															<td class="borde">81</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C81</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C81"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">l</td>
															<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">84</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C84</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C84"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">m</td>
															<td class="borde">Subtotal  (Inc. g+h+i+j+k Col. I); (Inc. f+l Col. II)</td>
															<td class="borde">82</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C82</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C82"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">85</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C85</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C85"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">n</td>
															<td class="borde">Saldo a favor del Contribuyente para el siguiente período (Diferencia entre Columnas del Inc. m, cuando Col. I sea mayor que Col. II)</td>
															<td class="borde">83</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C83</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C83"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">o</td>
															<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. m cuando Col. II sea mayor a Col. I)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">86</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C86</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C86"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="6">
																<p align="center">PAGOS</p>
															</th>
														</tr>
														<tr>
															<td class="borde">p</td>
															<td class="borde">
																<p>Multa por Mora (.........% del resultado del Inc. o menos el Inc. I) (Sólo se calculará cuando exista saldo a favor del Fisco) </p>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">87</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C87</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C87"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">q</td>
															<td class="borde">
																<p>Intereses (.........% del resultado del Inc. o menos el Inc. I) (Sólo se calculará cuando exista saldo a favor del Fisco) </p>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">88</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C88</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C88"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">r</td>
															<td class="borde">Saldo definitivo a pagar a favor del Fisco (Inc. o+p+q)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">89</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C89</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C89"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<th class="bordevacio" style="width: 95%">
																<p align="left">RUBRO 6 determinacion de anticipo para el siguiente ejercicio fiscal</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">importe</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">Impuesto liquidado del ejercicio (Proviene del Inc. f Col. II del Rubro 5)</td>
															<td class="borde">90</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C90</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C90"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Retenciones y Percepciones computables (Proviene del Inc. j Col. I del Rubro 5)</td>
															<td class="borde">91</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C91</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C91"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Anticipo a ingresar para el siguiente ejercicio (Inc. a-b)</td>
															<td class="borde">92</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C92</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C92"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">Saldo a favor del Contribuyente del ejercicio que se liquida (Proviene del Inc. n Col. I del Rubro 5 (Consignar hasta el monto del Anticipo Liquidado)</td>
															<td class="borde">93</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C93</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C93"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">Cuotas a ingresar ((Inc. c-d)/4)</td>
															<td class="borde">94</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C94</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C94"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<th class="bordevacio" colSpan="8">
																<p align="left">RUBRO 7 informacion patrimonial</p>
															</th>
															<td/>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="4">
																<p align="center">
																	<strong>ACTIVO</strong>
																</p>
															</th>
															<th class="bordevacio" colSpan="4">
																<p align="center">
																	<strong>PASIVO</strong>
																</p>
															</th>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="4">
																<p align="center">
																	<strong>Corriente</strong>
																</p>
															</th>
															<td class="borde">l</td>
															<td class="borde" style="width: 50%">Corriente</td>
															<td class="borde" style="width: 1%">106</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C106</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C106"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde" style="width: 50%">Caja</td>
															<td class="borde">95</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C95</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C95"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">m</td>
															<td class="borde" style="width: 50%">No Corriente</td>
															<td class="borde" style="width: 1%">107</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C107</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C107"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde" style="width: 50%">Bancos y Otros Valores</td>
															<td class="borde">96</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C96</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C96"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">n</td>
															<td class="borde" style="width: 50%">
																<strong>Total Pasivos (Inc. l+m)</strong>
															</td>
															<td class="borde" style="width: 1%">108</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C108</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C108"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde" style="width: 50%">Inversiones temporales</td>
															<td class="borde">97</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C97</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C97"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<th class="bordevacio" colSpan="4">
																<p align="center">
																	<strong>PATRIMONIO NETO</strong>
																</p>
															</th>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde" style="width: 50%">Créditos (importe neto)</td>
															<td class="borde">98</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C98</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C98"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">o</td>
															<td class="borde" style="width: 50%">Capital (a integrar, suscripto y realizado)</td>
															<td class="borde" style="width: 1%">109</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C109</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C109"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde" style="width: 50%">Inventario (importe neto)</td>
															<td class="borde">99</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C99</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C99"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">p</td>
															<td class="borde" style="width: 50%">Reserva Legal y Facultativas</td>
															<td class="borde" style="width: 1%">110</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C110</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C110"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde" style="width: 50%">Anticipos</td>
															<td class="borde">100</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C100</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C100"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">q</td>
															<td class="borde" style="width: 50%">Otras Reservas (Revalúo y otras)</td>
															<td class="borde" style="width: 1%">111</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C111</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C111"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde" style="width: 50%">Otros Activos Corrientes</td>
															<td class="borde">101</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C101</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C101"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">r</td>
															<td class="borde" style="width: 50%">Ganancia del Ejercicio</td>
															<td class="borde" style="width: 1%">112</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C112</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C112"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="4">
																<p align="center">
																	<strong>No Corriente</strong>
																</p>
															</th>
															<td class="borde">s</td>
															<td class="borde" style="width: 50%">Pérdida del Ejercicio</td>
															<td class="borde" style="width: 1%">113</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C113</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C113"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">h</td>
															<td class="borde" style="width: 50%">Crédito (importe neto)</td>
															<td class="borde">102</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C102</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C102"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">t</td>
															<td class="borde" style="width: 50%">Ganancias acumuladas</td>
															<td class="borde" style="width: 1%">114</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C114</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C114"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">i</td>
															<td class="borde" style="width: 50%">Propiedad: planta y equipo (importe neto)</td>
															<td class="borde">103</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C103</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C103"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">u</td>
															<td class="borde" style="width: 50%">Pérdidas acumuladas</td>
															<td class="borde" style="width: 1%">115</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C115</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C115"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">j</td>
															<td class="borde" style="width: 50%">Otros Activos No Corrientes (importe neto, incluído intangibles)</td>
															<td class="borde">104</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C104</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C104"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">v</td>
															<td class="borde" style="width: 50%">
																<strong>Total Patrimonio Neto (Inc. o+p+q+r-s+t-u)</strong>
															</td>
															<td class="borde" style="width: 1%">116</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C116</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C116"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">k</td>
															<td class="borde" style="width: 50%">
																<strong>Total Activos (Inc. a+b+c+d+e+f+g+h+i+j)</strong>
															</td>
															<td class="borde">105</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C105</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C105"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">w</td>
															<td class="borde" style="width: 50%">
																<strong>Total Pasivo + Patrimonio Neto (Inc. n+v)</strong>
															</td>
															<td class="borde" style="width: 1%">122</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C122</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C122"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
							<td colSpan="2">
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
															<th class="bordevacio" colSpan="8">
																<p align="left">RUBRO 8 imformacion complementaria</p>
															</th>
															<td/>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde" style="width: 50%">RUC del Auditor o de la Empresa Auditora</td>
															<td class="borde">117</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C117</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C117"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">b</td>
															<td class="borde" style="width: 50%">RUC o Cédula de Identidad del Contador Público</td>
															<td class="borde" style="width: 1%">118</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C118</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C118"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde" style="width: 50%">Consigne el Número de la disposición legal que respalda el beneficio fiscal, declarada en el Rubro 4 Inc. e)</td>
															<td class="borde">119</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C119</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C119"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde">d</td>
															<td class="borde" style="width: 50%">Consigne el año de la disposición legal que se referencia en el Inc. c de este Rubro</td>
															<td class="borde" style="width: 1%">120</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C120</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C120"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde" style="width: 50%">Total personal ocupado en relación de dependencia y aporten algún Seguro Social previsto en la Ley, al cierre del ejercicio</td>
															<td class="borde">121</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C121</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C121"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio" style="width: 50%"/>
															<td class="vacio" style="width: 1%"/>
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
							<td colSpan="2">
								<xsl:call-template name="pieDeclaraciones"/>
							</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
