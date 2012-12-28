<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">1</xsl:param>
	<xsl:param name="Ruc"><xsl:value-of select="declaracion/detalle/ruc"/></xsl:param>
	<xsl:param name="Periodo"><xsl:value-of select="declaracion/detalle/periodo"/></xsl:param>
	<xsl:param name="Dv"><xsl:value-of select="declaracion/detalle/dv"/></xsl:param>
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
							<td class="borde">
								<xsl:call-template name="cabeceraDeclaracionesClausura">
									<xsl:with-param name="pFormulario">111</xsl:with-param>
									<xsl:with-param name="pImpuesto">RETENCIONES IMPUESTO A LA RENTA OCASIONAL</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param>
									<xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/></xsl:with-param>
									<xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param>
									<xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<th class="bordevacio">PARA EMPRESAS O ENTIDADES QUE REALICEN RETENCIONES EN CARACTER DE PAGO A CUENTA Y PAGO UNICO Y DEFINITIVO EN FORMA OCASIONAL</th>
						</tr>
						<tr>
							<td colSpan="2">
								<table width="100%">
									<tbody>
										<tr>
											<td class="borde">
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
																			<th>INC</th>
																			<th style="width: 95%">
																				<p align="left">RUBRO 1 IMPUESTO A LA RENTA COMERCIAL, INDUSTRIAL O DE SERVICIOS</p>																			</th>
																			<th colSpan="2">
																				<p align="center">IMPORTE</p>																			</th>
																		</tr>
																		<tr>
																			<td class="borde">a</td>
																			<td class="borde">Retenciones en carácter de Pago Único y Definitivo por distribución de utilidades o dividendos, remesados a personas o entidades del exterior que no posean sucursales en el pais </td>
																			<td class="borde">10</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">b</td>
																			<td class="borde">Retenciones en carácter de Pago Único y Definitivo por servicios de flete a empresas del exterior que no posean sucursales en el país </td>
																			<td class="borde">11</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">c</td>
																			<td class="borde">Retenciones en carácter de Pago Único y Definitivo por peimas de seguro a empresas del exterior que no posean sucursales en el país </td>
																			<td class="borde">12</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">d</td>
																			<td class="borde">Retenciones en carácter de Pago Único y Definitivo por la venta de bienes inmuebles loteados </td>
																			<td class="borde">13</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																			</td>
																		</tr>
																		<tr>
																			<td class="borde">e</td>
																			<td class="borde">Retenciones en caracter de Pago Único y Definitivo por la prestación de servicios o enajenación de bienes documentados con la autofactura </td>
																			<td class="borde">14</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">f</td>
																			<td class="borde">Retenciones y Percepciones en carácter de Pago Único y Definitivo por otros conceptos no incluidos en los incisos anteriores </td>
																			<td class="borde">15</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">g</td>
																			<td class="borde">Total de retenciones en carácter de Pago Único y definitivo (Inc. a+b+c+d+e+f) </td>
																			<td class="borde">16</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr><tr>
																			<td class="borde">h</td>
																			<td class="borde">Pago a cuenta en caracter de retenciones, para Contribuyentes obligados por el impuesto </td>
																			<td class="borde">17</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr><tr>
																			<td class="borde">i</td>
																			<td class="borde">Pago a cuenta en caracter de percepciones, para Contribuyentes obligados por el impuesto </td>
																			<td class="borde">18</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">j</td>
																			<td class="borde">Total retenciones y percepciones en carácter de pago a cuenta (Inc. h+i) </td>
																			<td class="borde">19</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr><tr>
																			<td class="borde">k</td>
																			<td class="borde">Total retenciones (Inc. g+j) </td>
																			<td class="borde">20</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
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
							<td colSpan="2">
								<table width="100%">
									<tbody>
										<tr>
											<td class="borde">
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
																			<th>INC</th>
																			<th style="width: 95%">
																				<p align="left">RUBRO 2 IMPUESTO A LA RENTA DEL PEQUEÑO CONTRIBUYENTE </p>																			</th>
																			<th colSpan="2">
																				<p align="center">IMPORTE</p>																			</th>
																		</tr>
																		<tr>
																			<td class="borde">a</td>
																			<td class="borde">Retenciones en carácter de pago único y definitivo por actividades gravadas por el impuesto </td>
																			<td class="borde">21</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">b</td>
																			<td class="borde">Pago a cuenta para contribuyentes obligados por el impuesto </td>
																			<td class="borde">22</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">c</td>
																			<td class="borde">Total retenciones (Inc. a+b) </td>
																			<td class="borde">23</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
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
					<tr><td colSpan="2">
								<table width="100%">
									<tbody>
										<tr>
											<td class="borde">
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
																			<th>INC</th>
																			<th style="width: 95%">
																				<p align="left">RUBRO 3 impuesto a la renta del servicio de caracter personal </p>																			</th>
																			<th colSpan="2">
																				<p align="center">IMPORTE</p>																			</th>
																		</tr>
																		<tr>
																			<td class="borde">a</td>
																			<td class="borde">Retenciones en carácter de Pago Único y Definitivo por actividades gravadas por el impuesto realizadas por personas sin domicilio en el país </td>
																			<td class="borde">24</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">b</td>
																			<td class="borde">Pago a cuenta para Contribuyentes obligados para el Impuesto </td>
																			<td class="borde">25</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">c</td>
																			<td class="borde">Total retenciones (Inc. a+b) </td>
																			<td class="borde">26</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
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
							</td></tr>
					<tr><td colSpan="2">
								<table width="100%">
									<tbody>
										<tr>
											<td class="borde">
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
																			<th>INC</th>
																			<th style="width: 95%">
																				<p align="left">RUBRO 4 impuesto a la renta POR ACTIVIDADES AGROPECUARIAS </p>																			</th>
																			<th colSpan="2">
																				<p align="center">IMPORTE</p>																			</th>
																		</tr>
																		<tr>
																			<td class="borde">a</td>
																			<td class="borde">Retenciones en carácter de Pago Único por distribución de utilidades o dividendos remesados a personas o entidades del exterior que no posean sucursales en el país </td>
																			<td class="borde">27</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">b</td>
																			<td class="borde">Pago a cuenta para Contribuyentes obligados por el Impuesto </td>
																			<td class="borde">28</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
																		</tr>
																		<tr>
																			<td class="borde">c</td>
																			<td class="borde">Total retenciones (Inc. a+b) </td>
																			<td class="borde">29</td>
																			<td class="borde">
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>																			</td>
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
							</td></tr>
							<tr><td><table class="declaracion1" width="658">
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
											<td class="fondo" vAlign="top" align="left" width="2"/>
											<td vAlign="top" width="638">
												<table class="declaracion">
													<tbody>
														<tr>
															<th class="bordevacio" rowSpan="2">INC</th>
															<th class="bordevacio" rowSpan="2" style="width: 95%">
																<p align="left">RUBRO 5 liquidacion Y SALDO DEL IMPUESTO </p>															</th>															<th class="bordevacio" colSpan="4">
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
															<td class="borde">Retenciones en concepto de Impuesto a la Renta Comercial (Proviene del Inc. k Rubro 1) </td>
															<td class="vacio" colspan="2"/>
															<td class="borde">30</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Retenciones en concepto de Impuesto a la Renta Pequeño Contribuyente (Proviene del Inc. c Rubro 2) </td>
															<td class="vacio" colspan="2"/>
															<td class="borde">31</td>
															<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Retenciones en concepto de Impuesto a la Renta de Servicio de Caracter Personal (Proviene del Inc. c Rubro 3) </td>
															<td class="vacio" colspan="2"/>
															<td class="borde">32</td>
															<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr><tr>
															<td class="borde">d</td>
															<td class="borde">Retenciones en concepto de Impuesto a la Renta a las Actividades Agropecuarias (Proviene del Inc. c Rubro 4) </td>
															<td class="vacio" colspan="2"/>
															<td class="borde">33</td>
															<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">SUB TOTALES (Inc. a+b+c+d) </td>
															<td class="vacio" colspan="2"/>
															<td class="borde">34</td>
															<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">Pago previo o pago a cuenta por el Impuesto a la Renta Comercial, Ind. o de Servicios</td>
															<td class="borde">35</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde">Pago previo o pago a cuenta por el Impuesto a la Renta Pequeño Contribuyente. </td>
															<td class="borde">36</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td height="35" class="borde">h</td>
															<td class="borde">Pago previo o pago a cuenta por el Impuesto a la Renta de Servicios de Caracter Personal </td>
															<td class="borde">37</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">i</td>
															<td class="borde">Pago previo o pago a cuenta por el Impuesto a la Renta a las Actividades Agropecuarias </td>
															<td class="borde">38</td>
															<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">j</td>
															<td class="borde">Pago con Créditos Fiscales disponibles, Certificados de Créditos Tributarios, Nota de Crédito Tributario y Bonos del Tesoro </td>
															<td class="borde">39</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">k</td>
															<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento </td>
															<td colspan="2" class="vacio"/>
															<td class="borde">40</td>
															<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">l</td>
															<td class="borde">SUB TOTALES (Inc f+g+h+i+j, Col I); (Inc. e+k, Col II) </td>
															<td class="borde">41</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">42</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">m</td>
															<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas de Inc. I, cuando Col. II sea mayor que Col. I) </td>
																<td colspan="2" class="vacio"/>
															<td class="borde">43</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
													
													<tr>
														<th class="bordevacio" colSpan="6">
															<p align="center">
																<strong>PAGOS</strong>															</p>														</th>
													</tr>
													<tr>
														<td class="borde">n</td>
														<td class="borde">Multa por Mora (.........% del resultado del Inc. m menos el Inc. k) (Sólo se calculará cuando exista saldo a favor del fisco) </td>
														<td colspan="2" class="vacio"/>
														<td class="borde">44</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
													</tr>
													<tr>
														<td class="borde">o</td>
														<td class="borde">Intereses (.........% del resultado del Inc. m menos el Inc. k) (Sólo se calculará cuando exista saldo a favor del fisco) </td>
														<td colspan="2" class="vacio"/>
														<td class="borde">45</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
													</tr>
													<tr>
														<td class="borde">p</td>
														<td class="borde">Saldo definitivo a pagar a favor del Fisco (Inc. m+n+o) </td>
														<td colspan="2" class="vacio"/>
														<td class="borde">46</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td class="fondo" vAlign="top" align="right" width="10"/>
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
