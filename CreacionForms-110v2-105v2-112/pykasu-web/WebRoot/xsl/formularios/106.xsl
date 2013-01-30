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
								<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">106</xsl:with-param><xsl:with-param name="pVersion">V.1   Enero/2007</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA DEL PEQUEÑO CONTRIBUYENTE DECLARACION ANUAL</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
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
															<th class="bordevacio">PARA EMPRESAS UNIPERSONALES QUE REALICEN OPERACIONES GRAVADAS POR EL IMPUESTO A LA RENTA DEL PEQUEÑO CONTRIBUYENTE</th>
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
																				<xsl:call-template name="itemNumerico"><xsl:with-param name="pFuncionOnChange">Calcular(this.form);validar()</xsl:with-param><xsl:with-param name="pNombre">C6</xsl:with-param><xsl:with-param name="pValor">
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
															<th class="bordevacio" style="width: 95%">
																<p align="left">RUBRO 1 DETERMINACION DE LA RENTA NETA REAL DEL EJERCICIO</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">IMPORTE</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">
																<strong>INGRESOS TOTALES DEL EJERCICIO</strong>: Suma de los importes percibidos durante el ejercicio, excluido el IVA, por venta de bienes o prestación de servicios, registradas en el Libro de Ventas 
														</td>
															<td class="borde">10</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">
																<strong>EGRESOS TOTALES DEL EJERCICIO: </strong>Suma de los egresos del ejercicio, excluido el IVA, por compra de bienes o contratación de servicios, registrados en el Libro de Compras 
														</td>
															<td class="borde">11</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">
																<strong>DIFERENCIA</strong>: Inc. a menos Inc. b. Si el resultado es negativo, registrar 0 (cero) 
														</td>
															<td class="borde">12</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">
																<strong>RENTA NETA REAL</strong>: Copiar Inc. c si es mayor a 0 (cero). Si es igual a 0 (cero) o un número negativo registrar 0 (cero) 
														</td>
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
																<p align="left">RUBRO 2 determinacion de la renta neta presunta del ejercicio</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">importe</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">
																<strong>FACTURACION BRUTA ANUAL DEL EJERCICIO</strong>: Suma de los importes percibidos durante el ejercicio, excluido el IVA, por venta de bienes o prestación de servicios, registradas en el Libro de Ventas 
														</td>
															<td class="borde">14</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">
																<strong>RENTA NETA PRESUNTA</strong>: 30% (treinta por ciento) del Inc. a 
														</td>
															<td class="borde">15</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
															<th class="bordevacio" style="width: 95%">
																<p align="left">RUBRO 3 determinacion del impuesto</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">importe</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">
																<strong>BASE IMPONIBLE</strong>: Copiar  Inc. d Rubro 1 ó Inc. b Rubro 2  (El menor entre Inc. d Rubro 1 y el Inc. b Rubro 2 ) 
														</td>
															<td class="borde">16</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">
																<strong>IMPUESTO DETERMINADO</strong>: 10% (diez por ciento) de Inc. a 
														</td>
															<td class="borde">17</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
																<p align="left">RUBRO 4 liquidacion final</p>
															</th>
															<th class="bordevacio" colSpan="4">
																<p align="center">monto a favor del:</p>
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
															<td class="borde">
																<strong>IMPUESTO DETERMINADO</strong>: Copiar Inc. b Rubro 3 
														</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">18</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">
																<strong>SALDO ANTERIOR</strong>: Saldo a favor del Contribuyente del ejercicio anterior 
														</td>
															<td class="borde">19</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">
																<strong>ANTICIPOS:</strong> Monto total pagado durante el ejercicio en concepto de anticipos 
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
															<td class="borde">
																<strong>PAGO PREVIO O PAGO A CUENTA</strong>: Importes pagados por concepto de ....................... 
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
															<td class="borde">
																<strong>PAGO</strong> con Créditos Fiscales Disponible, Certificados de Créditos Tributario, Nota de Crédito Tributario y Bonos del Tesoro. 
														</td>
															<td class="borde">22</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="vacio"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">
																<strong>MULTA</strong>: Por presentar la Declaración Jurada con posterioridad al vencimiento 
														</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">23</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde">
																<strong>SUBTOTALES</strong>: Inc. b+c+d+e Col. I ; Inc. a+f Col. II 
														</td>
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
															<td class="borde">h</td>
															<td class="borde">
																<strong>SALDO A FAVOR DEL CONTRIBUYENTE</strong>: Diferencia entre Columnas del Inc. g cuando Col. I es mayor que Col. II 
														</td>
															<td class="borde">26</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<td class="borde"/>
															<td class="vacio"/>
														</tr>
														<tr>
															<td class="borde">i</td>
															<td class="borde">
																<strong>SALDO A FAVOR DEL FISCO:</strong> Diferencia entre Columnas del Inc. g cuando Col. II es mayor que Col. I 
														</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">27</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
														<td class="borde">Multa por Mora (.........% del resultado del Inc. i menos el Inc. f) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">28</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">k</td>
														<td class="borde">Intereses (.........% del resultado del Inc. i menos el Inc. f) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">29</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">l</td>
														<td class="borde">Saldo definitivo a pagar a favor del Fisco (Inc. i+j+k)</td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">30</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
