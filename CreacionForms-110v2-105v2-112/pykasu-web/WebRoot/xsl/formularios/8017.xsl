<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Obligacion">211</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaamm</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template name="itemMesCierreEspecial"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
		<xsl:choose>
			<xsl:when test="$pModo = 0">
				<!--script type="text/javascript">        
                    if (window.attachEvent) {
                        window.attachEvent("onload", function(event) { <xsl:value-of select="concat('seleccionarMesDeCierre(&quot;',$pNombre,'&quot;)')"/> });
                    } else {
                        window.addEventListener("load", function(event) { <xsl:value-of select="concat('seleccionarMesDeCierre(&quot;',$pNombre,'&quot;)')"/>} , false);
                    }                  
                </script-->
				<select class="valornumero" AUTOCOMPLETE="off">
					<xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute>
					<xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute>
					<xsl:attribute name="onkeypress">
						<xsl:value-of select="$pFuncionOnKeyPress"/>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute>
					<option value=""></option>
					<option value="4">Abril</option>
					<option value="6">Junio</option>
				</select>
			</xsl:when>
			<xsl:when test="$pModo = 1">
				<input class="valornumero" AUTOCOMPLETE="off">
					<xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute>
					<xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute>
					<xsl:attribute name="readonly"/>
					<xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute>
				</input>
			</xsl:when>
			<xsl:when test="$pModo = 3">
				<table width="60">
					<tbody>
						<tr>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C59)"].value = nvl(Math.round(elegir(calcularmulta(161,parseFloat(formu["dynamicProps(C54)"].value)),0,si(parseFloat(formu["dynamicProps(C59)"].value)>0,50000,0),calcularmulta(161,parseFloat(formu["dynamicProps(C54)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C60)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C55)"].value)+parseFloat(formu["dynamicProps(C56)"].value)+parseFloat(formu["dynamicProps(C57)"].value)+parseFloat(formu["dynamicProps(C58)"].value)-parseFloat(formu["dynamicProps(C54)"].value)-parseFloat(formu["dynamicProps(C59)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C61)"].value = nvl(Math.round(calcularmora(mayor(parseFloat(formu["dynamicProps(C54)"].value)-(parseFloat(formu["dynamicProps(C55)"].value)+parseFloat(formu["dynamicProps(C56)"].value)+parseFloat(formu["dynamicProps(C57)"].value)+parseFloat(formu["dynamicProps(C58)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C62)"].value = nvl(Math.round(calcularinteres(mayor(parseFloat(formu["dynamicProps(C54)"].value)-(parseFloat(formu["dynamicProps(C55)"].value)+parseFloat(formu["dynamicProps(C56)"].value)+parseFloat(formu["dynamicProps(C57)"].value)+parseFloat(formu["dynamicProps(C58)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C63)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C54)"].value)-parseFloat(formu["dynamicProps(C55)"].value)-parseFloat(formu["dynamicProps(C56)"].value)-parseFloat(formu["dynamicProps(C57)"].value)-parseFloat(formu["dynamicProps(C58)"].value)+parseFloat(formu["dynamicProps(C59)"].value)+parseFloat(formu["dynamicProps(C61)"].value)+parseFloat(formu["dynamicProps(C62)"].value),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C61)"].value == "") formu["dynamicProps(C61)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C56)"].value == "") formu["dynamicProps(C56)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C54)"].value == "") formu["dynamicProps(C54)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C57)"].value == "") formu["dynamicProps(C57)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C59)"].value == "") formu["dynamicProps(C59)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C55)"].value == "") formu["dynamicProps(C55)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C62)"].value == "") formu["dynamicProps(C62)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C58)"].value == "") formu["dynamicProps(C58)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C61');
	ponerPuntosEnCampo('C56');
	ponerPuntosEnCampo('C54');
	ponerPuntosEnCampo('C63');
	ponerPuntosEnCampo('C57');
	ponerPuntosEnCampo('C59');
	ponerPuntosEnCampo('C55');
	ponerPuntosEnCampo('C60');
	ponerPuntosEnCampo('C58');
	ponerPuntosEnCampo('C62');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C61');
	quitarPuntosDeCampo('C56');
	quitarPuntosDeCampo('C54');
	quitarPuntosDeCampo('C63');
	quitarPuntosDeCampo('C57');
	quitarPuntosDeCampo('C59');
	quitarPuntosDeCampo('C55');
	quitarPuntosDeCampo('C60');
	quitarPuntosDeCampo('C58');
	quitarPuntosDeCampo('C62');
}

function Calcular(formu) {
	var errores=0;
	try{
		errores = Cerar(formu);
		quitarTodosLosPuntos(formu);
		errores += Sumar(formu);
		ponerTodosLosPuntos(formu);
	} catch(e){alert('El formulario contiene errores.');}
}
  ]]></SCRIPT>
		<table class="declaracion">
			<link href="../../style/css/bd-azul.css" rel="stylesheet" type="text/css"/>
			<tbody>
				<tr>
					<td colSpan="3">
						<xsl:call-template name="cabeceraDeclaraciones">
							<xsl:with-param name="pFormulario">801</xsl:with-param>
							<xsl:with-param name="pRubro">Rubro 7</xsl:with-param>
							<xsl:with-param name="pVersion">V.1</xsl:with-param>
							<xsl:with-param name="pImpuesto">
								ANTICIPO DE IMPUESTO A LA RENTA
							</xsl:with-param>
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
					<td>
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
												<th rowSpan="2" class="bordevacio" style="width: 90%">
													<p align="left">B- Impuesto a la renta - actividades comerciales, industriales o de servicios</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">ANTICIPO Nº</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">FECHA DE VENCIMIENTO</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">MES DE CIERRE</p>
												</th>
											</tr>
											<tr>
												<td class="borde">51</td>
												<td class="borde">
													<xsl:call-template name="itemAnticipo">
														<xsl:with-param name="pNombre">C51</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C51"/>
														</xsl:with-param>
														<xsl:with-param name="pModo">
															<xsl:value-of select="$Modo"/>
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td class="borde">52</td>
												<td class="borde">
													<xsl:call-template name="itemFechaVencimiento">
														<xsl:with-param name="pNombre">C52</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C52"/>
														</xsl:with-param>
														<xsl:with-param name="pModo">
															<xsl:value-of select="$Modo"/>
														</xsl:with-param>
													</xsl:call-template>
												</td>
												<td class="borde">53</td>
												<td class="borde">
													<xsl:call-template name="itemMesCierreEspecial">
														<xsl:with-param name="pNombre">C53</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C53"/>
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
					<td>
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
												<th>ACTIVIDADES COMERCIALES, INDUSTRIALES O DE SERVICIOS</th>
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
					<td>
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
												<th rowSpan="2" class="bordevacio">INC</th>
												<th rowSpan="2" class="bordevacio" style="width: 95%">
													<p align="left">RUBRO 7 LIQUIDACION Y SALDO DEL ANTICIPO</p>
												</th>
												<th colSpan="4" class="bordevacio">
													<p align="center">A FAVOR DE</p>
												</th>
											</tr>
											<tr>
												<th colSpan="2" class="bordevacio">
													<p align="center">CONTRIBUYENTE -i</p>
												</th>
												<th colSpan="2" class="bordevacio" style="width: 90%">
													<p align="center">FISCO -ii-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Anticipo liquidado ( .........% del impuesto liquidado en el ejercicio anterior )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">54</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C54</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C54"/>
														</xsl:with-param>
														<xsl:with-param name="pModo">
															<xsl:value-of select="$Modo"/>
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Saldo a favor del contribuyente de Declaración Jurada anterior</td>
												<td class="borde">55</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C55</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C55"/>
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
												<td class="borde">Retenciones de impuesto a la Renta Computable</td>
												<td class="borde">56</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C56</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C56"/>
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
												<td class="borde">Pago realizado mediante certificados de crédito expedidos por la SET</td>
												<td class="borde">57</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C57</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C57"/>
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
												<td class="borde">Pago previo</td>
												<td class="borde">58</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C58</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C58"/>
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
												<td class="borde">f</td>
												<td class="borde">Multa por presentar la declaración jurada con posterioridad al vencimiento</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">59</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C59</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C59"/>
														</xsl:with-param>
														<xsl:with-param name="pModo">
															<xsl:value-of select="$Modo"/>
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">SUB TOTALES ( Inc. b+c+d+e , a Col. I ; Inc. a+f ,  a Col. II )</td>
												<td class="vacio"/>
												<td class="borde"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">Saldo a favor del contribuyente ( Diferencia entre Columnas del Inc. g cuando Col. I es mayor que col. II )</td>
												<td class="borde">60</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C60</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C60"/>
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
												<td class="borde">i</td>
												<td class="borde">Saldo a favor del fisco ( Diferencia entre Columnas del Inc. g cuando Col. II es mayor que Col. I ) </td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">j</td>
												<td class="borde">Multa por mora ......% del resultado de Inc. i menos Inc. f ( Solo se calculará cuando Inc. i sea mayor que inc. f )</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">61</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C61</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C61"/>
														</xsl:with-param>
														<xsl:with-param name="pModo">
															<xsl:value-of select="$Modo"/>
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">k</td>
												<td class="borde">Interes del resultado de Inc. i menos Inc. f ( Solo se calculará cuando Inc. i sea mayor que Inc. f)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">62</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C62</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C62"/>
														</xsl:with-param>
														<xsl:with-param name="pModo">
															<xsl:value-of select="$Modo"/>
														</xsl:with-param>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">l</td>
												<td class="borde">Saldo definitivo a favor del fisco ( Inc. (a+f+j+k)-(b+c+d+e)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">63</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico">
														<xsl:with-param name="pNombre">C63</xsl:with-param>
														<xsl:with-param name="pValor">
															<xsl:value-of select="declaracion/detalle/C63"/>
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
					<td>
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
