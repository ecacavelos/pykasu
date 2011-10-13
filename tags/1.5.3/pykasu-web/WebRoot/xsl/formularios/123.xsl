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
					<link href="../../style/css/bd-azul.css" type="text/css" rel="stylesheet"/>
					<tbody>
						<tr>
							<td class="borde">
								<xsl:call-template name="cabeceraDeclaracionesClausura">
									<xsl:with-param name="pFormulario">123</xsl:with-param>
									<xsl:with-param name="pVersion">V.1</xsl:with-param>
									<xsl:with-param name="pImpuesto">IMPUESTO AL VALOR AGREGADO DEL PEQUEÑO CONTRIBUYENTE</xsl:with-param>
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
						<tr>
							<td class="borde">
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
														<th class="bordevacio">PARA EMPRESAS UNIPERSONALES QUE LIQUIDEN EL IMPUESTO AL VALOR AGREGADO POR EL REGIMEN SIMPLIFICADO</th>
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
							<td class="borde">
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
														<th rowSpan="2">INC</th>
														<th rowSpan="2" style="width: 90%">
															<p align="left">RUBRO 1 monto de las ventas del periodo y determinacion del debito fiscal </p>
														</th>
														<th colSpan="5">
															<p align="center">IMPORTE</p>
														</th>
													</tr>
													<tr>
														<th colSpan="2">
															<p align="center">Monto de las ventas  -I-</p>
														</th>
														<th colSpan="2" style="width: 90%">
															<p align="center">coeficiente -II-</p>
														</th>
														<th colSpan="2">
															<p align="center">debito fiscal -III-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Total Ingresos obtenidos en el periodo que se declara, incluído el IVA y las operaciones exentas (Proviene del Libro de Ventas)</td>
														<td class="borde">  10</td>
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
														<td class="borde">
															<p align="center">7,3   </p>
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
														<td class="borde">b</td>
														<td class="borde">Ajustes de precios, devoluciones realizadas y descuentos obtenidos por compras ya declaradas con Crédito Fiscal y recupero de impuesto por operaciones delcaradas como incobrables</td>
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
														<td class="borde">
															<p align="center">7,3</p>
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
														<td class="borde">c</td>
														<td class="borde">Total (Inc. a+b Col. I y Col. III)</td>
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
														<td class="vacio"/>
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
							<td class="borde">
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
														<th rowSpan="2">INC</th>
														<th rowSpan="2" style="width: 90%">
															<p align="left">RUBRO 2 monto de las compras del periodo y determinacion del credito fiscal </p>
														</th>
														<th colSpan="5">
															<p align="center">IMPORTE</p>
														</th>
													</tr>
													<tr>
														<th colSpan="2">
															<p align="center">Monto de las compras  -I-</p>
														</th>
														<th colSpan="2" style="width: 90%">
															<p align="center">coeficiente -II-</p>
														</th>
														<th colSpan="2">
															<p align="center">credito fiscal -III-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Total Compras realizadas en el periodo que se declara, incluído el IVA y las operaciones exentas (Proviene del Libro Compras)</td>
														<td class="borde">
															<p align="left">16</p>
														</td>
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
														<td class="borde">
															<p align="center">7,3   </p>
														</td>
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
													</tr>
													<tr>
														<td class="borde">b</td>
														<td class="borde">Ajustes de precios, devoluciones recibidas y descuentos otorgados por ventas ya declaradas y operaciones gravadas declaradas incobrables</td>
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
														<td class="borde">
															<p align="center">7,3</p>
														</td>
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
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Total (Inc. a+b Col. I y Col. III)</td>
														<td class="borde">20   </td>
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
						<tr/>
						<tr>
							<td class="borde">
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
														<th>INC</th>
														<th style="width: 95%">
															<p align="left">RUBRO 3 determinacion del impuesto</p>
														</th>
														<th colSpan="2">
															<p align="center">IMPORTE</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Debito Fiscal (Proviene del Inc. c Col. III del Rubro 1)</td>
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
														<td class="borde">Crédito Fiscal (Proviene del Inc. c Col. III del Rubro 2)</td>
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
														<td class="borde">Impuesto Determinado ( Inc. a - b) (Cuando Inc. b es mayor que Inc. a consignar 0 (cero))</td>
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
							<td class="borde">
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
														<th rowSpan="2">INC</th>
														<th rowSpan="2" style="width: 95%">
															<p align="left">RUBRO 4 liquidacion y saldo DEL IMPUESTO</p>
														</th>
														<th colSpan="4">
															<p align="center">a favor del</p>
														</th>
													</tr>
													<tr>
														<th colSpan="2">
															<p align="center">contribuyente -i-</p>
														</th>
														<th colSpan="2" style="width: 90%">
															<p align="center">fisco -ii-</p>
														</th>
													</tr>
													<tr>
														<td class="borde">a</td>
														<td class="borde">Impuesto Liquidado (Proviene del Inc. c Rubro 3)</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
														<td class="borde">b</td>
														<td class="borde">Saldo a favor del Contribuyente del periodo anterior</td>
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
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">c</td>
														<td class="borde">Pago previo o pago a cuenta</td>
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
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">d</td>
														<td class="borde">Pago con Créditos Fiscales Disponibles, Certificados de Créditos Tributario, Nota de Crédito Tributario y Bonos del Tesoro</td>
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
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">e</td>
														<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
													<tr>
														<td class="borde">f</td>
														<td class="borde">SUB TOTALES (Inc. b+c+d,Col. I); (Inc. a+e, Col. II)</td>
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
														<td class="borde">g</td>
														<td class="borde">Saldo a favor del Contribuyente para el siguiente período (Diferencia entre Columnas del Inc. f, cuando Col. I sea mayor que Col. II)</td>
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
														<td class="vacio"/>
														<td class="vacio"/>
													</tr>
													<tr>
														<td class="borde">h</td>
														<td class="borde">Saldo a favor del Fisco (Diferencia entre Colunmas de Inc. f, cuando Col. II sea mayor que Col. I)</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
													<!--<tr><td class="saltoPagina"></td></tr>-->
													<tr>
														<th class="bordevacio" colspan="6">
															<p align="center">PAGOS</p>
														</th>
													</tr>
													<tr>
														<td class="borde">i</td>
														<td class="borde">Multa por Mora (.........% del resultado del Inc. h menos el Inc. e) (Sólo se calculará cuando exista saldo a favor del Fisco)</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
														<td class="borde">j</td>
														<td class="borde">Intereses (.........% del resultado del Inc. h menos el Inc. e) (Sólo se calculará cuando exista saldo a favor del Fisco)</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
														<td class="borde">k</td>
														<td class="borde">Saldo definitivo a pagar a favor del Fisco (Inc. h+i+j)</td>
														<td class="vacio"/>
														<td class="vacio"/>
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
							<td class="borde">
								<xsl:call-template name="pieDeclaraciones"/>
							</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
