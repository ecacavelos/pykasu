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
								<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">107</xsl:with-param><xsl:with-param name="pVersion">V.2  JULIO/2011</xsl:with-param><xsl:with-param name="pImpuesto">TRIBUTO UNICO MAQUILA</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
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
															<th class="bordevacio">para empresas o entidades que realicen actividades de maquila, o submaquila o por capacidad ociosa. </th>
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
															<th class="bordevacio" style="width: 95%">
																<p align="left">RUBRO 1 determinacion de la base imponible </p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">IMPORTE</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">
																VALOR DE LA FACTURA DE EXPORTACIÓN: Suma total del valor facturado. </td>
															<td class="borde">10</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
														  <td class="borde">VALOR AGREGADO NACIONAL (VAN): Suma total del detalle consignado en el Rubro 3 Inc. h. </td>
															<td class="borde">11</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">VENTA NETA IMPONIBLE: Cantidad mayor entre los Inc. a ó b (cuando sean iguales se tomarán cualesquiera de dichos montos) </td>
															<td class="borde">12</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">INGRESOS PROVENIENTES POR VENTAS EN EL MERCADO INTERNO: Suma total del detalle consignado en el Rubro 4 Inc. c. </td>
															<td class="borde">50</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
																<p align="left">RUBRO 2 liquidacion Y SALDO DEL IMPUESTO </p>															</th>
															<th class="bordevacio" colSpan="4">
																<p align="center">IMPORTE</p>															</th>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="2">
																<p align="center">contribuyente -i-</p>															</th>
															<th class="bordevacio" colSpan="2" style="width: 90%">
																<p align="center">fisco -ii-</p>															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">IMPUESTO LIQUIDADO TRIBUTO UNICO MAQUILA Y SUBMAQUILA (.........% sobre el monto del Rubro 1 Inc. c.) </td>
															<td class="vacio" colspan="2"/>
															<td class="borde">13</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">IMPUESTO LIQUIDADO POR VENTAS EN EL MERCADO INTERNO (.........% sobre el monto del Rubro 1 Inc. d.) </td>
															<td class="vacio" colspan="2"/>
															<td class="borde">14</td>
															<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Saldo a favor del Contribuyente del período anterior</td>
															<td class="borde">15</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">Pago Previo o Pago a Cuenta </td>
															<td class="borde">16</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">Pago con Créditos Fiscales disponibles, Certificados de Crédito Tributario y Bonos del Tesoro </td>
															<td class="borde">17</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">
																Multa por presentar la Declaración Jurada con posterioridad al vencimiento </td>
															<td colspan="2" class="vacio"/>
															<td class="borde">18</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde"><strong>SUBTOTALES</strong> (Inc. c+d+e, Col. I; Inc. a+b+f, Col. II)</td>
															<td class="borde">19</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">20</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">h</td>
															<td class="borde">
																Saldo a favor del Contribuyente (Diferencia entre Columnas del Inc. g, cuando Col. I es mayor que Col. II) </td>
															<td class="borde">21</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">i</td>
															<td class="borde">
																Saldo a favor del Fisco (diferencia entre Columnas del Inc. g, cuando Col. II sea mayor que Col. I) </td>
														<td colspan="2" class="vacio"/>
														<td class="borde">22</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="6">
															<p align="center">
																<strong>PAGOS</strong>															</p>														</th>
													</tr>
													<tr>
														<td class="borde">k</td>
														<td class="borde">Multa por Mora (.........% del resultado del Inc. i menos el Inc. f) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">23</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
													</tr>
													<tr>
														<td class="borde">l</td>
														<td class="borde">Intereses (.........% del resultado del Inc. i menos el Inc. f) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">24</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
													</tr>
													<tr>
														<td class="borde">m</td>
														<td class="borde">SALDO DEFINITIVO A FAVOR DEL FISCO (Inc. i+j+k) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">25</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
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
					<tr><td><table class="declaracion1" width="640">
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
															<th class="bordevacio">INFORMACIÓN COMPLEMENTARIA . </th>
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
								</table></td></tr>
					<!--<tr><td class="saltoPagina"></td></tr>-->
					<tr><td><table class="declaracion1" width="640">
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
																<p align="left">RUBRO 3 VALOR AGREGADO NACIONAL (VAN) </p>															</th>
															<th class="bordevacio" colSpan="4">
																<p align="center">IMPORTE</p>															</th>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="2">
																<p align="center">MAQUILA -i-</p>															</th>
															<th class="bordevacio" colSpan="2" style="width: 90%">
																<p align="center">SUBMAQUILA-ii-</p>															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">BIENES ADQUIRIDOS: Compras en el mercado interno o importación de bienes.</td>
															<td class="borde">26</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">27</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">SUELDOS, SALARIOS Y OTRAS REMUNERACIONES: Pagados al personal dependiente.</td>
															<td class="borde">28</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">29</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">CARGAS SOCIALES: Aporte patronal </td>
															<td class="borde">30</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">31</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">OTROS SERVICIOS PERSONALES: Pagados al personal independiente por Honorarios Profesionales y otros servicios personales similares</td>
															<td class="borde">32</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">33</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">DEPRECIACIÓN: De bienes de capital, que no sean de propiedad de la matriz </td>
															<td class="borde">34</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">35</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">OTROS GASTOS: No mencionados en los inciso anteriores</td>
															<td class="borde">36</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">37</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde">PRECIO DEL SERVICIO: Utilidad o beneficio</td>
															<td class="borde">38</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">39</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">h</td>
															<td class="borde"><strong>SUMA TOTAL </strong> (Inc. a+b+c+d+e+f+g; Col. I ó II)</td>
															<td class="borde">40</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">41</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">i</td>
															<td class="borde">CANTIDAD: Número de personas empleadas o contratadas</td>
															<td class="borde">42</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">43</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
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
					</td></tr>
					<tr><td><table class="declaracion1" width="640">
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
																<p align="left">RUBRO 4 ENAJENACIONES EN EL MERCADO INTERNO </p>															</th>
															<th class="bordevacio" colSpan="4">
																<p align="center">IMPORTE</p>															</th>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="2">
																<p align="center">MAQUILA -i-</p>															</th>
															<th class="bordevacio" colSpan="2" style="width: 90%">
																<p align="center">SUBMAQUILA -ii-</p>															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">INGRESOS NETOS PROVENIENTES DE VENTAS REALIZADAS EN EL MERCADO INTERNO: -Bienes elaborados (Productos terminados, mercaderías y similares) - BIENES DE PRODUCCIÓN (maquinarias, herramientas, equipos y similares) -PRESTACION DE SERVICIOS (servicios prestados en el país) </td>
															<td class="borde">44</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">45</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">INGRESOS NETOS PROVENIENTES DE VENTAS REALIZADAS EN EL MERCADO INTERNO: De materias primas e insumos ingresados al amparo del Régimen, incluidos los dersperdicios. </td>
															<td class="borde">46</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">47</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde"><strong>SUBTOTAL:</strong> Ingresos provenients del emrcado interno (Suma Inc. a+b) </td>
															<td class="borde">48</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">49</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
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
					</td></tr>
					<tr>
						<td colSpan="5">
							<xsl:call-template name="pieDeclaraciones"/>
						</td>
					</tr>
				</tbody>
			</table>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>
