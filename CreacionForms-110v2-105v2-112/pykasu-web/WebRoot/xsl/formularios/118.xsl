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
					<td class="borde">
						<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">118</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA DEL PEQUEÑO CONTRIBUYENTE ANTICIPOS CUATRIMESTRALES</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
					</td>
				</tr>
				<tr>
					<th class="bordevacio">PARA EMPRESAS UNIPERSONALES QUE REALICEN ACTIVIDADES GRAVADAS POR EL IMPUESTO Y QUE LIQUIDEN EL IMPUESTO AL VALOR AGREGADO POR EL REGIMEN SIMPLIFICADO</th>
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
																		<p align="left">RUBRO 1 DETERMINACION DE LA RENTA NETA REAL Y BASE DE CALCULO DEL ANTICIPO</p>
																	</th>
																	<th colSpan="2">
																		<p align="center">IMPORTE</p>
																	</th>
																</tr>
																<tr>
																	<td class="borde">a</td>
																	<td class="borde">Total Ingresos obtenidos en el periodo que se declara, excluído el IVA (Proviene del Libro de Ventas)</td>
																	<td class="borde">10</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																</tr>
																<tr>
																	<td class="borde">b</td>
																	<td class="borde">Total Egresos realizados durante el periodo que se declara, excluido el IVA (Proviene del Libro de Compras)</td>
																	<td class="borde">11</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																</tr>
																<tr>
																	<td class="borde">c</td>
																	<td class="borde">Renta Neta Real del Periodo (Inc. a - b) (Cuando Inc. b sea mayor, consignar 0 (cero))</td>
																	<td class="borde">12</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																</tr>
																<tr>
																	<td class="borde">d</td>
																	<td class="borde">Base de cálculo para el Anticipo (10% sobre el monto del Inc. c)</td>
																	<td class="borde">13</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
																	<th rowSpan="2">INC</th>
																	<th rowSpan="2" style="width: 95%">
																		<p align="left">RUBRO 2 liquidacion y saldo DEL IMPUESTO</p>
																	</th>
																	<th colSpan="4">
																		<p align="center">importe</p>
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
																	<td class="borde">Anticipo  a ingresar (50% sobre el monto del Rubro 1 Inc. d)</td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																	<td class="borde">14</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																</tr>
																<tr>
																	<td class="borde">b</td>
																	<td class="borde">Saldo a favor del Contribuyente del periodo anterior</td>
																	<td class="borde">15</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																</tr>
																<tr>
																	<td class="borde">c</td>
																	<td class="borde">Pago previo o pago a cuenta</td>
																	<td class="borde">16</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>   
								</td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																</tr>
																<tr>
																	<td class="borde">d</td>
																	<td class="borde">Pago con Créditos Fiscales disponibles, Certificados de Créditos Tributarios, Nota de Crédito Tributario y Bonos del Tesoro</td>
																	<td class="borde">17</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																</tr>
																<tr>
																	<td class="borde">e</td>
																	<td class="borde">Retenciones y Percepciones computables a favor del Contribuyente</td>
																	<td class="borde">18</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																</tr>
																<tr>
																	<td class="borde">f</td>
																	<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																	<td class="borde">19</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																</tr>
																<tr>
																	<td class="borde">g</td>
																	<td class="borde">SUB TOTALES (Inc. b+c+d+e, Col. I); (Inc. a+f, Col. II)</td>
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
																	<td class="borde">h</td>
																	<td class="borde">Saldo a favor del Contribuyente para el siguiente periodo (Diferencia entre Columnas del Inc. g, cuando Col. I sea mayor a Col. II) </td>
																	<td class="borde">22</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																	<td class="vacio"/>
																	<td class="vacio"> </td>
																</tr>
																<tr>
																	<td class="borde">i</td>
																	<td class="borde">Saldo a favor del Fisco (Diferencia entre Columnas del Inc. g cuando Col. II sea mayor a Col. I)</td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																	<td class="borde">23</td>
																	<td class="borde" charoff=" ">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																</tr>
																<tr>
																	<th class="bordevacio" colspan="6">
																		<p align="center">PAGOS</p>
																	</th>
																</tr>
																<tr>
																	<td class="borde">j</td>
																	<td class="borde">Multa por Mora (.........% del resultado del Inc. i menos el Inc. f) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																	<td class="borde">24</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																</tr>
																<tr>
																	<td class="borde">k</td>
																	<td class="borde">Intereses (.........% del resultado del Inc. i menos el Inc. f) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																	<td class="borde">25</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																	</td>
																</tr>
																<tr>
																	<td class="borde">l</td>
																	<td class="borde">Saldo definitivo a pagar a favor del Fisco (Inc. i+j+k)</td>
																	<td class="vacio"/>
																	<td class="vacio"/>
																	<td class="borde">26</td>
																	<td class="borde">
																		<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
