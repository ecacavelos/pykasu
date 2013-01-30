<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml"
	exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl" />
	<xsl:output version="1.0" encoding="UTF-8" indent="no"
		omit-xml-declaration="no" media-type="text/html" method="html" />
	<xsl:param name="Modo">1</xsl:param>
	<xsl:param name="Ruc">
		<xsl:value-of select="declaracion/detalle/ruc" />
	</xsl:param>
	<xsl:param name="Dv">
		<xsl:value-of select="declaracion/detalle/dv" />
	</xsl:param>
	<xsl:param name="Periodo">
		<xsl:value-of select="declaracion/detalle/periodo" />
	</xsl:param>
	<xsl:param name="Nombre" />
	<xsl:param name="PrimerApellido">
		<xsl:value-of select="declaracion/detalle/PrimerApellido" />
	</xsl:param>
	<xsl:param name="SegundoApellido" />
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type"
					content="text/html; charset=iso-8859-1" />
				<link rel="stylesheet" type="text/css"
					href="bd-chocolate.css" />
				<script type="text/javascript">
					function sendtoprint(){
					/*document.getElementById('top').style.visibility='hidden';
					document.getElementById('top').style.height='0px';
					document.getElementById('top').style.width='0px';*/
					window.print(); }
				</script>
			</head>

			<body id="body" onload='DWRUtil.useLoadingMessage()'>
				<!-- inicia body -->

				<style>
					.Btns { background-color: #D9EEFF; color: #000066;
					cursor: hand; font-family: "arial", "helvetica",
					"sans-serif"; font-size: 11px; padding-bottom: 2px;
					padding-left: 2px; padding-right: 2px; padding-top:
					2px; font-weight: bold; background-image:
					url(../images/fondo-bot.gif); background-repeat:
					repeat-x; border: 1px solid #CCCCCC; }
				</style>
				<FORM id="Formu" name="Formu" action="crearDocumento.do"
					method="POST" onsubmit="return alEnviar(this);">

					<!--
						<textarea id="tasas" rows="1" cols="1" class="islaxml">&lt;?xml version="1.0" encoding="UTF-8"?&gt; &lt;Consulta&gt; &lt;Registro id="FERIADO20080501"&gt; &lt;T.VALOR1&gt;1&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;DIA DEL TRABAJADOR&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="FERIADO20080515"&gt; &lt;T.VALOR1&gt;1&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;DIA DE LA INDEPENDENCIA&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="FERIADO20080612"&gt; &lt;T.VALOR1&gt;1&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;DIA DE LA PAZ DEL CHACO&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="FERIADO20080815"&gt; &lt;T.VALOR1&gt;1&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;FUNDACION DE ASUNCION&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="FERIADO20080929"&gt; &lt;T.VALOR1&gt;1&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;BATALLA DE BOQUERON&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="FERIADO20081208"&gt; &lt;T.VALOR1&gt;1&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;VIRGEN DE CAACUPE&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="FERIADO20081225"&gt; &lt;T.VALOR1&gt;1&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;NAVIDAD&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="FINPERIODO"&gt; &lt;T.VALOR1&gt;20080421&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;Fin del per�odo&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="HOY"&gt; &lt;T.VALOR1&gt;20080421&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;D�a de hoy&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="INTERES"&gt; &lt;T.VALOR1&gt;1.5&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;TASA INTERES VIGENTE&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="MULTA127"&gt; &lt;T.VALOR1&gt;50000&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;99999999&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;VALOR&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="MULTA21"&gt; &lt;T.VALOR1&gt;4&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;1&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;PORCENTAJE&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="MULTA22"&gt; &lt;T.VALOR1&gt;6&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;1&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;2&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;PORCENTAJE&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="MULTA23"&gt; &lt;T.VALOR1&gt;8&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;2&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;3&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;PORCENTAJE&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="MULTA24"&gt; &lt;T.VALOR1&gt;10&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;3&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;4&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;PORCENTAJE&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="MULTA25"&gt; &lt;T.VALOR1&gt;12&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;4&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;5&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;PORCENTAJE&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="MULTA26"&gt; &lt;T.VALOR1&gt;14&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;5&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;99999999&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;PORCENTAJE&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="PLAZO0"&gt; &lt;T.VALOR1&gt;0&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;DIA&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="TASA18"&gt; &lt;T.VALOR1&gt;30&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;BASE IMPONIBLE APLICABLE SOBRE LA CASILLA 17&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="TASA34"&gt; &lt;T.VALOR1&gt;10&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;IMPUESTO APLICABLE SOBRE LA RENTA ALCANZADA POR IRACIS&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="TASA35"&gt; &lt;T.VALOR1&gt;10&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;IMPUESTO LIQUIDADO APLICABLE SOBRE LA RENTA ALCANZADA POR IRACIS&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="TASA36"&gt; &lt;T.VALOR1&gt;5&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;IMPUESTO LIQUIDADO EN CONCEPTO DE TASA ADICIONAL DEL IRACIS&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="TASA37"&gt; &lt;T.VALOR1&gt;2&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;IMPUESTO LIQUIDADO EN CONCEPTO DE PATENTE FISCAL DE AUTOVEHICULO&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="TASAGLOBAL1"&gt; &lt;T.VALOR1&gt;1341775&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;SALARIO MINIMO&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;Registro id="TIPOCONTRIBUYENTE"&gt; &lt;T.VALOR1&gt;12&lt;/T.VALOR1&gt; &lt;T.VALOR2&gt;0&lt;/T.VALOR2&gt; &lt;T.VALOR3&gt;0&lt;/T.VALOR3&gt; &lt;T.DESCRIPCION&gt;FISICO&lt;/T.DESCRIPCION&gt; &lt;/Registro&gt; &lt;/Consulta&gt;</textarea> -->
					<link rel="stylesheet" type="text/css"
						href="../../style/css/bd-chocolate.css" />
					<!--	<script type="text/javascript">function asignar() { var fecha; if ($("_C29")) { fecha = $("_C29").value; if (fecha.length != 0) { $("C29").value = fecha.substring(6,10) + fecha.substring(3,5) + fecha.substring(0,2); } } if ($("_C33")) { fecha = $("_C33").value; if (fecha.length != 0) { $("C33").value = fecha.substring(6,10) + fecha.substring(3,5) + fecha.substring(0,2); } } }</script> -->

					<table class="declaracion">
						<tbody>
							<tr>
								<table class="declaracion1"
									width="640">
									<td>
										<tbody>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/top-l-1.gif" height="4" width="4" />
												</td>
												<td class="fondo" />
												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/top-r-1.gif" height="4" width="4" />
												</td>
											</tr>
											<tr>
												<td class="fondo"
													align="left" valign="top" width="1" />
												<td valign="top"
													width="636">
													<table
														class="declaracion" width="640">
														<tbody>
															<tr>
																<td
																	style="width: 15%;" rowspan="4" class="borde">
																	<p
																		size="15" align="center">
																		<font
																			size="5">
																			<img
																				src="/eset/images/cabecera-set.gif" align="bottom"
																				border="0" hspace="0" />
																		</font>
																	</p>
																	<p
																		align="center">
																		<font
																			face="Arial" size="0">
																			LIQUIDACION
																			PARA
																			PAGOS
																			OCASIONALES
																		</font>
																	</p>
																	<p
																		align="center">
																		<b>
																			<font
																				face="Arial" size="6">
																				90
																			</font>
																		</b>
																		<br />
																	</p>
																</td>
																<td
																	style="font-size: 8px; width: 42%; font-family: verdana;"
																	class="borde" align="center">
																	PARA
																	LLENAR
																	LEA
																	INSTRUCTIVO
																	DISPONIBLE
																	EN
																	LA
																	WEB
																</td>
																<td
																	style="font-size: 8px; font-family: verdana;"
																	colspan="2" class="borde" align="center">
																	LOS
																	IMPORTES
																	SE
																	CONSIGNARAN
																	SIN
																	CENTIMOS
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	N�mero
																	de
																	Orden
																	<input
																		class="valornumero" id="numeroDocumento"
																		name="dynamicProps(numeroDocumento)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="0" />
																</td>
																<td
																	colspan="2" class="borde">
																	RUC
																	<input
																		class="valornumero" id="ruc" name="dynamicProps(ruc)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="" />
																	DV
																	<input
																		class="valorDV" id="dv" name="dynamicProps(dv)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="4" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Raz�n
																	Social/Primer
																	Apellido
																	<input
																		class="descripcion" id="primerApellido"
																		name="dynamicProps(primerApellido)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="" />
																</td>
																<td
																	colspan="2" class="borde">
																	Segundo
																	Apellido
																	<input
																		class="descripcion" id="segundoApellido"
																		name="dynamicProps(segundoApellido)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Nombres
																	<input
																		class="descripcion" id="nombre"
																		name="dynamicProps(nombre)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="" />
																</td>
																<td
																	class="borde">
																	04
																</td>
																<td
																	class="borde" align="center">
																	Fecha
																	<table
																		style="width: 240px;">
																		<tbody>
																			<tr>
																				<td
																					colspan="2" class="borde" align="center">
																					D�a
																				</td>
																				<td
																					colspan="2" class="borde" align="center">
																					Mes
																				</td>
																				<td
																					colspan="4" class="borde" align="center">
																					A�o
																				</td>
																			</tr>
																			<tr>
																				<td
																					class="borde" align="center">
																					2
																				</td>
																				<td
																					class="borde" align="center">
																					1
																				</td>
																				<td
																					class="borde" align="center">
																					0
																				</td>
																				<td
																					class="borde" align="center">
																					4
																				</td>
																				<td
																					class="borde" align="center">
																					2
																				</td>
																				<td
																					class="borde" align="center">
																					0
																				</td>
																				<td
																					class="borde" align="center">
																					0
																				</td>
																				<td
																					class="borde" align="center">
																					8
																				</td>
																			</tr>
																		</tbody>
																	</table>
																	<input
																		id="C4" name="dynamicProps(C4)"
																		onchange="Calcular(this.form)"
																		onkeypress="return onKeyPressSoloNumeros(event);"
																		value="20080421" type="hidden" />
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo"
													align="right" valign="top" width="1" />

											</tr>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/bot-l-1.gif" height="4" width="4" />
												</td>
												<td class="fondo" />

												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/bot-r-1.gif" height="4" width="4" />
												</td>
											</tr>
										</tbody>
									</td>
								</table>
								<td />
							</tr>
							<tr>
								<td>
									<table class="declaracion1"
										width="640">
										<tbody>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/top-l-choco.gif" height="4" width="4" />
												</td>
												<td class="fondo" />

												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/top-r-choco.gif" height="4" width="4" />
												</td>
											</tr>
											<tr>
												<td class="fondo"
													align="left" valign="top" width="1" />

												<td valign="top"
													width="636">
													<table
														class="declaracion">
														<tbody>
															<tr>
																<th
																	colspan="8" class="bordevacio">
																	<p
																		align="left">
																		MOTIVO
																		DE
																		LA
																		LIQUIDACION
																		(MARQUE
																		CON
																		UNA
																		"X"
																		EL
																		QUE
																		CORRESPONDA)
																	</p>
																</th>
																<td />

															</tr>
															<tr>
																<td
																	class="borde">
																	<strong>
																		A
																	</strong>
																</td>
																<td
																	style="width: 50%;" class="borde">
																	Ingresos
																	ocasionales
																	obtenidos
																	por
																	contribuyentes
																	del
																	IMAGRO,
																	gravados
																	por
																	el
																	IRACIS
																</td>
																<td
																	class="borde">
																	10
																</td>
																<td
																	class="borde" />

																<td
																	class="borde">
																	<strong>
																		D
																	</strong>
																</td>
																<td
																	style="width: 50%;" class="borde">
																	Patente
																	de
																	Autoveh�culos
																</td>
																<td
																	style="width: 1%;" class="borde">
																	13
																</td>
																<td
																	class="borde" />

															</tr>
															<tr>
																<td
																	class="borde">
																	<strong>
																		B
																	</strong>
																</td>
																<td
																	style="width: 50%;" class="borde">
																	Ingresos
																	ocasionales
																	obtenidos
																	por
																	Personas
																	F�sicas
																	sin
																	representantes
																	en
																	el
																	pa�s,
																	gravadas
																	por
																	el
																	IRACIS
																</td>
																<td
																	class="borde">
																	11
																</td>
																<td
																	class="borde" />

																<td
																	class="borde">
																	<strong>
																		E
																	</strong>
																</td>
																<td
																	style="width: 50%;" class="borde">
																	Otros
																	pagos
																	a
																	Solicitar
																</td>
																<td
																	style="width: 1%;" class="borde">
																	14
																</td>
																<td
																	class="borde">
																	<input
																		id="C14" name="dynamicProps(C14)"
																		onclick="checkRectificativa(this.value); if (this.checked == true) {this.value = 14} else {this.value = 0;};Calcular(this.form); "
																		value="14" checked="checked" type="checkbox" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	<strong>
																		C
																	</strong>
																</td>
																<td
																	style="width: 50%;" class="borde">
																	Distribuci�n
																	de
																	Utilidades
																	o
																	Pago
																	de
																	Dividendos
																</td>
																<td
																	class="borde">
																	12
																</td>
																<td
																	class="borde" />

																<td
																	class="vacio" />

																<td
																	style="width: 50%;" class="vacio" />

																<td
																	style="width: 1%;" class="vacio" />

																<td
																	class="vacio" />

															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo"
													align="right" valign="top" width="1" />

											</tr>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/bot-l-choco.gif" height="4" width="4" />
												</td>
												<td class="fondo" />

												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/bot-r-choco.gif" height="4" width="4" />
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table class="declaracion1"
										width="640">
										<tbody>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/top-l-choco.gif" height="4" width="4" />
												</td>
												<td class="fondo" />

												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/top-r-choco.gif" height="4" width="4" />
												</td>
											</tr>
											<tr>
												<td class="fondo"
													align="left" valign="top" width="1" />

												<td valign="top"
													width="636">
													<table
														class="declaracion">
														<tbody>
															<tr>
																<th
																	style="width: 95%;" class="bordevacio">
																	<p
																		align="left">
																		e
																		-
																		otros
																		pagos
																	</p>
																</th>
																<th
																	colspan="2" class="bordevacio">
																	<p
																		align="center">
																		&amp;nbsp;
																	</p>
																</th>
															</tr>
															<tr>
																<td
																	class="borde">
																	Valor
																	Imponible
																</td>
																<td
																	class="borde">
																	32
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" maxlength="18"
																		id="C32" name="dynamicProps(C32)"
																		onchange="Calcular(this.form)"
																		onkeypress="return onKeyPressSoloNumeros(event);"
																		value="" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Fecha
																	de
																	operaci�n&amp;nbsp;&amp;nbsp;&amp;nbsp;
																</td>
																<td
																	class="borde">
																	33
																</td>
																<td
																	class="borde" align="right">
																	<input
																		id="C33" name="dynamicProps(C33)" type="hidden" />
																	<input
																		autocomplete="off" class="valornumero" id="_C33"
																		name="dynamicProps(_C33)"
																		onchange="Calcular(this.form);isDate(this.value,this);asignar();"
																		onkeypress="return mascaraWebInputDate(this,event);"
																		value="" />
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo"
													align="right" valign="top" width="1" />

											</tr>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/bot-l-choco.gif" height="4" width="4" />
												</td>
												<td class="fondo" />

												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/bot-r-choco.gif" height="4" width="4" />
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table class="declaracion1"
										width="640">
										<tbody>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/top-l-choco.gif" height="4" width="4" />
												</td>
												<td class="fondo" />

												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/top-r-choco.gif" height="4" width="4" />
												</td>
											</tr>
											<tr>
												<td class="fondo"
													align="left" valign="top" width="1" />

												<td valign="top"
													width="636">
													<table
														class="declaracion">
														<tbody>
															<tr>
																<th
																	style="width: 95%;" class="bordevacio">
																	<p
																		align="left">
																		liquidacion
																	</p>
																</th>
																<th
																	colspan="2" class="bordevacio">
																	<p
																		align="center">
																		IMPORTES
																	</p>
																</th>
															</tr>
															<tr>
																<td
																	class="borde">
																	Impuesto
																	liquidado
																	aplicable
																	sobre
																	la
																	renta
																	alcanzada
																	por
																	el
																	r�gimen
																	general
																	del
																	IRACIS,
																	.........%
																	sobre
																	el
																	monto
																	de
																	la
																	casilla
																	18
																</td>
																<td
																	class="borde">
																	34
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" id="C34"
																		name="dynamicProps(C34)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="0" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Impuesto
																	liquidado
																	aplicable
																	sobre
																	la
																	renta
																	alcanzada
																	por
																	el
																	r�gimen
																	general
																	del
																	IRACIS,
																	.........%
																	sobre
																	el
																	monto
																	de
																	la
																	casilla
																	20
																</td>
																<td
																	class="borde">
																	35
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" id="C35"
																		name="dynamicProps(C35)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="0" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Impuesto
																	liquidado
																	en
																	concepto
																	de
																	tasa
																	adicional
																	del
																	IRACIS,
																	.........%
																	aplicable
																	sobre
																	el
																	monto
																	de
																	la
																	casilla
																	28
																</td>
																<td
																	class="borde">
																	36
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" id="C36"
																		name="dynamicProps(C36)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="0" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Impuesto
																	liquidado
																	en
																	concepto
																	de
																	Patente
																	Fiscal
																	de
																	Autovehiculo,
																	.........%
																	aplicable
																	sobre
																	el
																	monto
																	de
																	la
																	casilla
																	30
																</td>
																<td
																	class="borde">
																	37
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" id="C37"
																		name="dynamicProps(C37)"
																		onchange="Calcular(this.form)" readonly="readonly"
																		value="0" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Impuesto
																	liquidado,
																	.........%
																	aplicable
																	sobre
																	el
																	monto
																	de
																	la
																	casilla
																	32
																</td>
																<td
																	class="borde">
																	38
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" maxlength="18"
																		id="C38" name="dynamicProps(C38)"
																		onchange="Calcular(this.form)"
																		onkeypress="return onKeyPressSoloNumeros(event);"
																		value="" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Multa
																	por
																	presentar
																	la
																	Declaraci�n
																	Jurada
																	con
																	posterioridad
																	al
																	vencimiento
																</td>
																<td
																	class="borde">
																	39
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" maxlength="18"
																		id="C39" name="dynamicProps(C39)"
																		onchange="Calcular(this.form)"
																		onkeypress="return onKeyPressSoloNumeros(event);"
																		value="" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Saldo
																	a
																	favor
																	del
																	fisco
																	(Suma
																	de
																	las
																	casillas
																	34+35+36+37+38+39)
																</td>
																<td
																	class="borde">
																	40
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" maxlength="18"
																		id="C40" name="dynamicProps(C40)"
																		onchange="Calcular(this.form)"
																		onkeypress="return onKeyPressSoloNumeros(event);"
																		value="" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Multa
																	por
																	Mora
																	(.........%
																	del
																	resultado
																	de
																	casilla
																	40
																	menos
																	casilla
																	39)
																	(S�lo
																	se
																	calcular�
																	cuando
																	exista
																	saldo
																	a
																	favor
																	del
																	Fisco)
																</td>
																<td
																	class="borde">
																	41
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" maxlength="18"
																		id="C41" name="dynamicProps(C41)"
																		onchange="Calcular(this.form)"
																		onkeypress="return onKeyPressSoloNumeros(event);"
																		value="" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Intereses
																	(.........%
																	del
																	resultado
																	de
																	casilla
																	40
																	menos
																	casilla
																	39)
																	(S�lo
																	se
																	calcular�
																	cuando
																	exista
																	saldo
																	a
																	favor
																	del
																	Fisco)
																</td>
																<td
																	class="borde">
																	42
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" maxlength="18"
																		id="C42" name="dynamicProps(C42)"
																		onchange="Calcular(this.form)"
																		onkeypress="return onKeyPressSoloNumeros(event);"
																		value="" type="text" />
																</td>
															</tr>
															<tr>
																<td
																	class="borde">
																	Saldo
																	definitivo
																	a
																	pagar
																	a
																	favor
																	del
																	Fisco
																	(Suma
																	de
																	las
																	casillas
																	40+41+42)
																</td>
																<td
																	class="borde">
																	43
																</td>
																<td
																	class="borde" align="right">
																	<input
																		autocomplete="off" class="valornumero" maxlength="18"
																		id="C43" name="dynamicProps(C43)"
																		onchange="Calcular(this.form)"
																		onkeypress="return onKeyPressSoloNumeros(event);"
																		value="" type="text" />
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo"
													align="right" valign="top" width="1" />

											</tr>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/bot-l-choco.gif" height="4" width="4" />
												</td>
												<td class="fondo" />

												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/bot-r-choco.gif" height="4" width="4" />
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table class="declaracion1"
										width="640">
										<tbody>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/top-l-choco.gif" height="4" width="4" />
												</td>
												<td class="fondo" />

												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/top-r-choco.gif" height="4" width="4" />
												</td>
											</tr>
											<tr>
												<td class="fondo"
													align="left" valign="top" width="1" />

												<td valign="top"
													width="636">
													<table
														class="declaracion" border="0" width="640">
														<tbody>
															<tr>
																<td
																	style="height: 30px;" colspan="2" class="borde">
																	El que suscribe
																</td>
															</tr>
															<tr>
																<td
																	style="height: 30px;" class="borde">
																	en su carácter de
																</td>
																<td
																	class="borde">
																	con Documento No.
																</td>
															</tr>
															<tr>
																<td
																	style="height: 30px;" colspan="2" class="borde">
																	<p
																		align="justify">
																		declara
																		que
																		los
																		datos
																		consignados
																		en
																		el
																		formulario
																		son
																		correctos
																		y
																		verdaderos
																		y
																		han
																		sido
																		confeccionados
																		sin
																		omitir
																		dato
																		alguno.
																	</p>
																</td>
															</tr>
															<tr>
																<td
																	style="height: 30px;" colspan="2" class="borde">
																	<p
																		align="justify">
																		Lugar:_______________________________,
																		fecha(dd/mm/Año):____/____/_______.
																	</p>
																</td>
															</tr>
															<tr>
																<td
																	style="border-bottom-color: white;" class="borde"
																	align="center" valign="bottom" width="50%">
																	_______________________________________
																</td>
																<td
																	style="border-bottom-color: white; height: 120px;"
																	class="borde" align="center" valign="top">
																	CERTIFICACION
																	O
																	SELLO
																	DE
																	RECEPCION
																</td>
															</tr>
															<tr
																style="border-top: 0px none;">
																<td
																	class="borde" align="center" valign="bottom">
																	Firma
																</td>
																<td
																	class="borde" align="center" valign="bottom" />

															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo"
													align="right" valign="top" width="1" />

											</tr>
											<tr>
												<td align="left"
													height="4" valign="bottom">
													<img
														src="/eset/images/bot-l-choco.gif" height="4" width="4" />
												</td>
												<td class="fondo" />

												<td align="right"
													valign="bottom">
													<img
														src="/eset/images/bot-r-choco.gif" height="4" width="4" />
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="right">
									<font size="1">
										Versi�n 1-Enero/2007
									</font>
								</td>
							</tr>
						</tbody>
					</table>
				</FORM>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>