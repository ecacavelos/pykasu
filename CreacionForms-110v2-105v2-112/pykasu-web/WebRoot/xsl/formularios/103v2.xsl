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
				<link href="../../style/css/bd-azul.css" type="text/css" rel="stylesheet"/></head>
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
								<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">103</xsl:with-param><xsl:with-param name="pVersion">V.2   JULIO/2011</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
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
															<th class="bordevacio">PARA EMPRESAS UNIPERSONALES QUE REALICEN OPERACIONES GRAVADAS Y POSEAN UN REGIMEN DE LIQUIDACION Y PAGO MENSUAL. </th>
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
																<p align="left">RUBRO 1 determinacion de la base imponible de actividades gravadas por el impuesto </p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">IMPORTE</p>
															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">
																Ingresos gravados obtenidos en el período, según el tipo de actividad que desarrolla la empresa</td>
															<td class="borde">10</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
														  <td class="borde">Otros ingresos gravados obtenidos</td>
															<td class="borde">11</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Renta Neta .........% sobre el monto del Inc. a </td>
															<td class="borde">12</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">Renta Neta .........% sobre el monto del Inc. b</td>
															<td class="borde">13</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">TotalRenta Neta (Inc. c+d) </td>
															<td class="borde">14</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
																<p align="left">RUBRO 2 liquidacion Y SALDO DEL IMPUESTO </p>															</th>															<th class="bordevacio" colSpan="4">
																<p align="center">monto a favor del:</p>															</th>
														</tr>
														<tr>
															<th class="bordevacio" colSpan="2">
																<p align="center">contribuyente -i-</p>															</th>
															<th class="bordevacio" colSpan="2" style="width: 90%">
																<p align="center">fisco -ii-</p>															</th>
														</tr>
														<tr>
															<td class="borde">a</td>
															<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por el régimen general del impuesto (.........% sobre el monto del Rubro 1 Inc. e)</td>
															<td class="vacio" colspan="2"/>
															<td class="borde">26</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">b</td>
															<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por tasa diferencial del impuesto (30% sobre el monto del Inc. e del Rubro 1)</td>
															<td class="vacio" colspan="2"/>
															<td class="borde">27</td>
															<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">c</td>
															<td class="borde">Saldo a favor del Contribuyente del periodo anterior</td>
															<td class="borde">29</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">e</td>
															<td class="borde">Pago con Créditos Fiscales disponibles.</td>
															<td class="borde">30</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">d</td>
															<td class="borde">Pago previo o pago a cuenta</td>
															<td class="borde">31</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">f</td>
															<td class="borde">Retenciones y percepciones computables a favor del Contribuyente. </td>
															<td class="borde">40</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">g</td>
															<td class="borde">
																<strong>MULTA</strong>: Por presentar la Declaración Jurada con posterioridad al vencimiento														</td>
															<td colspan="2" class="vacio"/>
															<td class="borde">32</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">h</td>
															<td class="borde">
																<strong>SUBTOTALES</strong>: (Inc. c+d+e+f, Col. I);	(Inc. a+b+g, Col. II)													</td>
															<td class="borde">33</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td class="borde">34</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
														</tr>
														<tr>
															<td class="borde">i</td>
															<td class="borde">
																<strong>SALDO A FAVOR DEL CONTRIBUYENTE</strong> PARA EL SIGUIENTE PERIODO FISCAL (diferencia entre Columnas del Inc. h, cuando Col. I sea mayor a Col. II) </td>
															<td class="borde">35</td>
															<td class="borde">
																<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>															</td>
															<td colspan="2" class="vacio"/>
														</tr>
														<tr>
															<td class="borde">j</td>
															<td class="borde">
																<strong>Saldo a favor del Fisco</strong>(diferencia entre Columnas del Inc. h cuando Col. II sea mayor a Col. I) </td>
														<td colspan="2" class="vacio"/>
														<td class="borde">36</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
													</tr>
													<tr>
														<th class="bordevacio" colSpan="6">
															<p align="center">
																<strong>PAGOS</strong>															</p>														</th>
													</tr>
													<tr>
														<td class="borde">k</td>
														<td class="borde">Multa por Mora (.........% del resultado del Inc. j menos el Inc. g) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">37</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
													</tr>
													<tr>
														<td class="borde">l</td>
														<td class="borde">Intereses (.........% del resultado del Inc. j menos el Inc. g) (Sólo se calculará cuando exista saldo a favor del Fisco) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">38</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
													</tr>
													<tr>
														<td class="borde">m</td>
														<td class="borde">SALDO DEFINITIVO A FAVOR DEL FISCO (Inc. j+k+l) </td>
														<td class="vacio"/>
														<td class="vacio"/>
														<td class="borde">39</td>
														<td class="borde">
															<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>														</td>
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
