<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Obligacion"></xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaammdd</xsl:param>
	<xsl:param name="Hoy">aaaammdd</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template name="itemFechaPago">
		<xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param>
		<xsl:param name="pFuncionOnKeyPress">return mascaraWebInputDate(this,event);</xsl:param>
		<xsl:param name="pNombre"></xsl:param>
		<xsl:param name="pValor"></xsl:param>
		<xsl:param name="pModo">1</xsl:param>
		<xsl:choose>
			<xsl:when test="$pModo = 0">
				<input type="hidden">
					<xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute>
				</input>
				<input class="valornumero" AUTOCOMPLETE="off">
					<xsl:attribute name="id">
						<xsl:value-of select="concat('_',$pNombre)"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(_',$pNombre,')')"/>
					</xsl:attribute>
					<xsl:attribute name="onchange">
						<xsl:value-of select="concat($pFuncionOnChange,';isDate(this.value,this);asignar();')"/>
					</xsl:attribute>
					<xsl:attribute name="onkeypress">
						<xsl:value-of select="$pFuncionOnKeyPress"/>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute>
				</input>
			</xsl:when>
			<xsl:when test="$pModo = 1">
				<input class="valornumero">
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
				<table width="240">
					<tbody>
						<tr>
							<td class="borde" colSpan="2" align="center">DÃ­a</td>
							<td class="borde" colSpan="2" align="center">Mes</td>
							<td class="borde" colSpan="4" align="center">AÃ±o</td>
						</tr>
						<tr>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
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
	<xsl:template name="itemFechaVencimiento">
		<xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param>
		<xsl:param name="pFuncionOnKeyPress">return mascaraWebInputDate(this,event);</xsl:param>
		<xsl:param name="pNombre"></xsl:param>
		<xsl:param name="pValor"></xsl:param>
		<xsl:param name="pModo">1</xsl:param>
		<xsl:choose>
			<xsl:when test="$pModo = 0">
				<input type="hidden">
					<xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute>
				</input>
				<input class="valornumero" AUTOCOMPLETE="off">
					<xsl:attribute name="id">
						<xsl:value-of select="concat('_',$pNombre)"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(_',$pNombre,')')"/>
					</xsl:attribute>
					<xsl:attribute name="onchange">
						<xsl:value-of select="concat($pFuncionOnChange,';isDate(this.value,this);asignar();')"/>
					</xsl:attribute>
					<xsl:attribute name="onkeypress">
						<xsl:value-of select="$pFuncionOnKeyPress"/>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute>
				</input>
			</xsl:when>
			<xsl:when test="$pModo = 1">
				<input class="valornumero">
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
				<table width="240">
					<tbody>
						<tr>
							<td class="borde" colSpan="2" align="center">Día</td>
							<td class="borde" colSpan="2" align="center">Mes</td>
							<td class="borde" colSpan="4" align="center">Año</td>
						</tr>
						<tr>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
							<td class="borde" style="width: 30px">
								<br/>
							</td>
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
	<xsl:template name="pieDeclaracionesEspecial">
		<table class="declaracion1" width="640">
			<tbody>
				<tr>
					<td vAlign="bottom" align="left" height="4">
						<img height="4" src="../../style/images/top-l-rojo.gif" width="4"/>
					</td>
					<td class="fondo"/>
					<td vAlign="bottom" align="right">
						<img height="4" src="../../style/images/top-r-rojo.gif" width="4"/>
					</td>
				</tr>
				<tr>
					<td class="fondo" vAlign="top" align="left" width="1"/>
					<td vAlign="top" width="636">
						<table class="declaracion" width="640" border="0">
							<tbody>
								<tr>
									<td class="borde" colSpan="2" style="height: 30px">El que suscribe</td>
								</tr>
								<tr>
									<td class="borde" style="height: 30px">en su carÃ¡cter de</td>
									<td class="borde">con Documento No.</td>
								</tr>
								<tr>
									<td class="borde" colSpan="2" style="height: 30px">
										<p align="justify">declara que los datos consignados en el formulario son correctos y verdaderos y han sido confeccionados sin omitir dato alguno.</p>
									</td>
								</tr>
								<tr>
									<td class="borde" colSpan="2" style="height: 30px">
										<p align="justify">Lugar:_______________________________, fecha(dd/mm/AÃ±o):____/____/_______.</p>
									</td>
								</tr>
								<tr>
									<td class="borde" vAlign="bottom" align="center" width="50%" style="border-bottom-color: white">_______________________________________</td>
									<td class="borde" vAlign="top" align="center" style="border-bottom-color: white; height: 120px">CERTIFICACION O SELLO DE RECEPCION</td>
								</tr>
								<tr style="border-top: 0px">
									<td class="borde" vAlign="bottom" align="center">Firma</td>
									<td class="borde" vAlign="bottom" align="center"/>
								</tr>
							</tbody>
						</table>
					</td>
					<td class="fondo" vAlign="top" align="right" width="1"/>
				</tr>
				<tr>
					<td vAlign="bottom" align="left" height="4">
						<img height="4" src="../../style/images/bot-l-rojo.gif" width="4"/>
					</td>
					<td class="fondo"/>
					<td vAlign="bottom" align="right">
						<img height="4" src="../../style/images/bot-r-rojo.gif" width="4"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C17)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C18)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C17)"].value) * buscartasa(18) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C28)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C23)"].value)+parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C27)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C32)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C32)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C34)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C18)"].value) * buscartasa(34) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C35)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C20)"].value) * buscartasa(35) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C36)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C28)"].value) * buscartasa(36) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C37)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C30)"].value) * buscartasa(37) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C38)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C32)"].value),parseFloat(formu["dynamicProps(C38)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C39)"].value = nvl(Math.round(elegir(calcularmulta(112,parseFloat(formu["dynamicProps(C39)"].value)),0,si(parseFloat(formu["dynamicProps(C39)"].value)>0,50000,0),calcularmulta(112,parseFloat(formu["dynamicProps(C39)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C40)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C34)"].value)+parseFloat(formu["dynamicProps(C35)"].value)+parseFloat(formu["dynamicProps(C36)"].value)+parseFloat(formu["dynamicProps(C37)"].value)+parseFloat(formu["dynamicProps(C38)"].value)+parseFloat(formu["dynamicProps(C39)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C41)"].value = nvl(Math.round(calcularmora(mayor(parseFloat(formu["dynamicProps(C40)"].value)-parseFloat(formu["dynamicProps(C39)"].value)-parseFloat(formu["dynamicProps(C35)"].value),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C42)"].value = nvl(Math.round(calcularinteres(mayor(parseFloat(formu["dynamicProps(C40)"].value)-parseFloat(formu["dynamicProps(C39)"].value)-parseFloat(formu["dynamicProps(C35)"].value),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C43)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C40)"].value)+parseFloat(formu["dynamicProps(C41)"].value)+parseFloat(formu["dynamicProps(C42)"].value)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C32)"].value == "") formu["dynamicProps(C32)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C36)"].value == "") formu["dynamicProps(C36)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C37)"].value == "") formu["dynamicProps(C37)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C41)"].value == "") formu["dynamicProps(C41)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C34)"].value == "") formu["dynamicProps(C34)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C30)"].value == "") formu["dynamicProps(C30)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C38)"].value == "") formu["dynamicProps(C38)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C39)"].value == "") formu["dynamicProps(C39)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C42)"].value == "") formu["dynamicProps(C42)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C40)"].value == "") formu["dynamicProps(C40)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C35)"].value == "") formu["dynamicProps(C35)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C32');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C36');
	ponerPuntosEnCampo('C43');
	ponerPuntosEnCampo('C37');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C41');
	ponerPuntosEnCampo('C30');
	ponerPuntosEnCampo('C34');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C39');
	ponerPuntosEnCampo('C38');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C42');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C40');
	ponerPuntosEnCampo('C35');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C32');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C36');
	quitarPuntosDeCampo('C43');
	quitarPuntosDeCampo('C37');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C41');
	quitarPuntosDeCampo('C30');
	quitarPuntosDeCampo('C34');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C39');
	quitarPuntosDeCampo('C38');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C42');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C20');
	quitarPuntosDeCampo('C40');
	quitarPuntosDeCampo('C35');
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
		<html>
			<link href="../../style/css/bd-rojolate.css" type="text/css" rel="stylesheet"/>
			<script type="text/javascript">			
			function asignar() {
				var fecha;
				if ($("_C29")) {
					fecha = $("_C29").value;
					if (fecha.length != 0) {
				    		$("C29").value = fecha.substring(6,10) + fecha.substring(3,5) + fecha.substring(0,2);
					}
				}
				if ($("_C33")) {
			    		fecha = $("_C33").value;
			    		if (fecha.length != 0) {
			 			$("C33").value = fecha.substring(6,10) + fecha.substring(3,5) + fecha.substring(0,2);
					}
				}
			}
		</script>
			<table class="declaracion">
				<tbody>
					<tr>
						<td>
							<xsl:call-template name="cabeceraDeclaracionesOcasional">
								<xsl:with-param name="pFormulario">90</xsl:with-param>
								<xsl:with-param name="pImpuesto">LIQUIDACION PARA PAGOS OCASIONALES</xsl:with-param>
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
									<xsl:value-of select="$Hoy"/>
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
							<table class="declaracion1" width="640">
								<tbody>
									<tr>
										<td vAlign="bottom" align="left" height="4">
											<img height="4" src="../../style/images/top-l-rojo.gif" width="4"/>
										</td>
										<td class="fondo"/>
										<td vAlign="bottom" align="right">
											<img height="4" src="../../style/images/top-r-rojo.gif" width="4"/>
										</td>
									</tr>
									<tr>
										<td class="fondo" vAlign="top" align="left" width="1"/>
										<td vAlign="top" width="636">
											<table class="declaracion">
												<tbody>
													<tr>
														<th class="bordevacio" colSpan="8">
															<p align="left">MOTIVO DE LA LIQUIDACION (MARQUE CON UNA "X" EL QUE CORRESPONDA)</p>
														</th>
														<td/>
													</tr>
													<tr>
														<td class="borde">
															<strong>A</strong>
														</td>
														<td class="borde" style="width: 50%">Ingresos ocasionales obtenidos por contribuyentes del IMAGRO, gravados por el IRACIS</td>
														<td class="borde">10</td>
														<td class="borde">
															<xsl:if test="$Obligacion=114 or $Modo = 1">
																<xsl:choose>
																	<xsl:when test="$Modo = 1">
																		<xsl:call-template name="itemCheck">
																			<xsl:with-param name="pValorInicial">10</xsl:with-param>
																			<xsl:with-param name="pNombre">C10</xsl:with-param>
																			<xsl:with-param name="pValor">
																				<xsl:value-of select="declaracion/detalle/C10"/>
																			</xsl:with-param>
																			<xsl:with-param name="pModo">
																				<xsl:value-of select="$Modo"/>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:if test="$Obligacion=114">
																			<xsl:call-template name="itemCheck">
																				<xsl:with-param name="pValorInicial">10</xsl:with-param>
																				<xsl:with-param name="pNombre">C10</xsl:with-param>
																				<xsl:with-param name="pValor">
																					<xsl:value-of select="10"/>
																				</xsl:with-param>
																				<xsl:with-param name="pModo">
																					<xsl:value-of select="$Modo"/>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:if>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:if>
														</td>
														<td class="borde">
															<strong>D</strong>
														</td>
														<td class="borde" style="width: 50%">Patente de AutovehÃ­culos</td>
														<td class="borde" style="width: 1%">13</td>
														<td class="borde">
															<xsl:if test="$Obligacion=431 or $Modo = 1">
																<xsl:choose>
																	<xsl:when test="$Modo = 1">
																		<xsl:call-template name="itemCheck">
																			<xsl:with-param name="pValorInicial">13</xsl:with-param>
																			<xsl:with-param name="pNombre">C13</xsl:with-param>
																			<xsl:with-param name="pValor">
																				<xsl:value-of select="declaracion/detalle/C13"/>
																			</xsl:with-param>
																			<xsl:with-param name="pModo">
																				<xsl:value-of select="$Modo"/>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:if test="$Obligacion=431">
																			<xsl:call-template name="itemCheck">
																				<xsl:with-param name="pValorInicial">13</xsl:with-param>
																				<xsl:with-param name="pNombre">C13</xsl:with-param>
																				<xsl:with-param name="pValor">
																					<xsl:value-of select="13"/>
																				</xsl:with-param>
																				<xsl:with-param name="pModo">
																					<xsl:value-of select="$Modo"/>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:if>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:if>
														</td>
													</tr>
													<tr>
														<td class="borde">
															<strong>B</strong>
														</td>
														<td class="borde" style="width: 50%">Ingresos ocasionales obtenidos por Personas FÃ­sicas sin representantes en el paÃ­s, gravadas por el IRACIS</td>
														<td class="borde">11</td>
														<td class="borde">
															<xsl:if test="$Obligacion=115 or $Modo = 1">
																<xsl:choose>
																	<xsl:when test="$Modo = 1">
																		<xsl:call-template name="itemCheck">
																			<xsl:with-param name="pValorInicial">11</xsl:with-param>
																			<xsl:with-param name="pNombre">C11</xsl:with-param>
																			<xsl:with-param name="pValor">
																				<xsl:value-of select="declaracion/detalle/C11"/>
																			</xsl:with-param>
																			<xsl:with-param name="pModo">
																				<xsl:value-of select="$Modo"/>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:if test="$Obligacion=115">
																			<xsl:call-template name="itemCheck">
																				<xsl:with-param name="pValorInicial">11</xsl:with-param>
																				<xsl:with-param name="pNombre">C11</xsl:with-param>
																				<xsl:with-param name="pValor">
																					<xsl:value-of select="11"/>
																				</xsl:with-param>
																				<xsl:with-param name="pModo">
																					<xsl:value-of select="$Modo"/>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:if>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:if>
														</td>
														<td class="borde">
															<strong>E</strong>
														</td>
														<td class="borde" style="width: 50%">Otros pagos a Solicitar</td>
														<td class="borde" style="width: 1%">14</td>
														<td class="borde">
															<xsl:if test="$Obligacion=461 or $Modo = 1">
																<xsl:choose>
																	<xsl:when test="$Modo = 1">
																		<xsl:call-template name="itemCheck">
																			<xsl:with-param name="pValorInicial">14</xsl:with-param>
																			<xsl:with-param name="pNombre">C14</xsl:with-param>
																			<xsl:with-param name="pValor">
																				<xsl:value-of select="declaracion/detalle/C14"/>
																			</xsl:with-param>
																			<xsl:with-param name="pModo">
																				<xsl:value-of select="$Modo"/>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:if test="$Obligacion=461">
																			<xsl:call-template name="itemCheck">
																				<xsl:with-param name="pValorInicial">14</xsl:with-param>
																				<xsl:with-param name="pNombre">C14</xsl:with-param>
																				<xsl:with-param name="pValor">
																					<xsl:value-of select="14"/>
																				</xsl:with-param>
																				<xsl:with-param name="pModo">
																					<xsl:value-of select="$Modo"/>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:if>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:if>
														</td>
													</tr>
													<tr>
														<td class="borde">
															<strong>C</strong>
														</td>
														<td class="borde" style="width: 50%">DistribuciÃ³n de Utilidades o Pago de Dividendos</td>
														<td class="borde">12</td>
														<td class="borde">
															<xsl:if test="$Obligacion=112 or $Modo = 1">
																<xsl:choose>
																	<xsl:when test="$Modo = 1">
																		<xsl:call-template name="itemCheck">
																			<xsl:with-param name="pValorInicial">12</xsl:with-param>
																			<xsl:with-param name="pNombre">C12</xsl:with-param>
																			<xsl:with-param name="pValor">
																				<xsl:value-of select="declaracion/detalle/C12"/>
																			</xsl:with-param>
																			<xsl:with-param name="pModo">
																				<xsl:value-of select="$Modo"/>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:if test="$Obligacion=112">
																			<xsl:call-template name="itemCheck">
																				<xsl:with-param name="pValorInicial">12</xsl:with-param>
																				<xsl:with-param name="pNombre">C12</xsl:with-param>
																				<xsl:with-param name="pValor">
																					<xsl:value-of select="12"/>
																				</xsl:with-param>
																				<xsl:with-param name="pModo">
																					<xsl:value-of select="$Modo"/>
																				</xsl:with-param>
																			</xsl:call-template>
																		</xsl:if>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:if>
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
											<img height="4" src="../../style/images/bot-l-rojo.gif" width="4"/>
										</td>
										<td class="fondo"/>
										<td vAlign="bottom" align="right">
											<img height="4" src="../../style/images/bot-r-rojo.gif" width="4"/>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<xsl:if test="$Obligacion=114 or /declaracion/detalle/C10 = '10'">
						<tr>
							<td>
								<table class="declaracion1" width="640">
									<tbody>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/top-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/top-r-rojo.gif" width="4"/>
											</td>
										</tr>
										<tr>
											<td class="fondo" vAlign="top" align="left" width="1"/>
											<td vAlign="top" width="636">
												<table class="declaracion">
													<tbody>
														<tr>
															<th class="bordevacio" style="width: 95%">
																<p align="left">a - ingresos ocasionales obtenidos por contribuyentes del imagro</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">IMPORTES</p>
															</th>
														</tr>
														<tr>
															<td class="borde">
																<p align="center">
																	<strong>DESCRIPCION</strong>
																</p>
															</td>
															<td class="borde" colSpan="2"/>
														</tr>
														<tr>
															<td class="borde">Ingresos por venta de Activo Fijo</td>
															<td class="borde">15</td>
															<td class="borde" align="right">
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
														<tr>
															<td class="borde">Otros ingresos gravados por el impuesto</td>
															<td class="borde">16</td>
															<td class="borde" align="right">
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
														</tr>
														<tr>
															<td class="borde">Otros ingresos ocasionales (Suma de las casillas 15+16)</td>
															<td class="borde">17</td>
															<td class="borde" align="right">
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
															<td class="borde">Base Imponible (.........% aplicable sobre la casilla 17)</td>
															<td class="borde">18</td>
															<td class="borde" align="right">
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
														</tr>
														<tr>
															<td class="borde">Fecha de venta</td>
															<td class="borde">19</td>
															<td class="borde">
																<xsl:choose>
																	<xsl:when test="$Modo='1' or $Modo='2'">
																		<xsl:call-template name="itemPeriodo">
																			<xsl:with-param name="pValor">
																				<xsl:value-of select="declaracion/detalle/C19"/>
																			</xsl:with-param>
																			<xsl:with-param name="pNombre">C19</xsl:with-param>
																			<xsl:with-param name="Modo">
																				<xsl:value-of select="$Modo"/>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:call-template name="itemPeriodo">
																			<xsl:with-param name="Modo">
																				<xsl:value-of select="$Modo"/>
																			</xsl:with-param>
																			<xsl:with-param name="pValor">
																				<xsl:value-of select="$Periodo"/>
																			</xsl:with-param>
																			<xsl:with-param name="pNombre">C19</xsl:with-param>
																		</xsl:call-template>
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
												<img height="4" src="../../style/images/bot-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/bot-r-rojo.gif" width="4"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="$Obligacion=115 or /declaracion/detalle/C11 = '11'">
						<tr>
							<td>
								<table class="declaracion1" width="640">
									<tbody>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/top-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/top-r-rojo.gif" width="4"/>
											</td>
										</tr>
										<tr>
											<td class="fondo" vAlign="top" align="left" width="1"/>
											<td vAlign="top" width="636">
												<table class="declaracion">
													<tbody>
														<tr>
															<th class="bordevacio" style="width: 95%">
																<p align="left">b - ingresos ocasionales obtenidos por personas fisicas sin representantes en el pais</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">IMPORTES</p>
															</th>
														</tr>
														<tr>
															<td class="borde">Ingresos gravados por el Impuesto</td>
															<td class="borde">20</td>
															<td class="borde" align="right">
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
														</tr>
														<tr>
															<td class="borde">Fecha de operaciÃ³n</td>
															<td class="borde">21</td>
															<td class="borde">
																<xsl:choose>
																	<xsl:when test="$Modo='1' or $Modo='2'">
																		<xsl:call-template name="itemPeriodo">
																			<xsl:with-param name="pValor">
																				<xsl:choose>
																					<xsl:when test="$Periodo &gt; 0">
																						<xsl:value-of select="$Periodo"/>
																					</xsl:when>
																					<xsl:otherwise>
																						<xsl:value-of select="declaracion/detalle/C21"/>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:with-param>
																			<xsl:with-param name="pNombre">C21</xsl:with-param>
																			<xsl:with-param name="Modo">
																				<xsl:value-of select="$Modo"/>
																			</xsl:with-param>
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:call-template name="itemPeriodo">
																			<xsl:with-param name="Modo">
																				<xsl:value-of select="$Modo"/>
																			</xsl:with-param>
																			<xsl:with-param name="pValor">
																				<xsl:value-of select="$Periodo"/>
																			</xsl:with-param>
																			<xsl:with-param name="pNombre">C21</xsl:with-param>
																		</xsl:call-template>
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
												<img height="4" src="../../style/images/bot-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/bot-r-rojo.gif" width="4"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="$Obligacion=112 or /declaracion/detalle/C12 = '12'">
						<tr>
							<td>
								<table class="declaracion1" width="640">
									<tbody>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/top-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/top-r-rojo.gif" width="4"/>
											</td>
										</tr>
										<tr>
											<td class="fondo" vAlign="top" align="left" width="1"/>
											<td vAlign="top" width="636">
												<table class="declaracion">
													<tbody>
														<tr>
															<th class="bordevacio" style="width: 90%">
																<p align="left">c - distribucion de utilidades o pago de dividendos</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">aÃ±o</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center">importes</p>
															</th>
														</tr>
														<tr>
															<td class="borde">DistribuciÃ³n de utilidades a pago de Dividendos correspondiente al ejercicio fiscal</td>
															<td class="borde">22</td>
															<td class="borde" align="right">
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
															<td class="borde">23</td>
															<td class="borde" align="right">
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
															<td class="borde">DistribuciÃ³n de utilidades a pago de Dividendos correspondiente al ejercicio fiscal</td>
															<td class="borde">24</td>
															<td class="borde" align="right">
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
															<td class="borde">25</td>
															<td class="borde" align="right">
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
															<td class="borde">DistribuciÃ³n de utilidades a pago de Dividendos correspondiente al ejercicio fiscal</td>
															<td class="borde">26</td>
															<td class="borde" align="right">
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
															<td class="borde">27</td>
															<td class="borde" align="right">
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
														</tr>
														<tr>
															<td class="borde">Monto total pagado o puesto a disposiciÃ³n (Suma de las casillas 22, 24 y 26)</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">28</td>
															<td class="borde" align="right">
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
														</tr>
														<tr>
															<td class="borde">Fecha de Pago</td>
															<td class="vacio"/>
															<td class="vacio"/>
															<td class="borde">29</td>
															<td class="borde" align="right">
																<xsl:call-template name="itemFechaPago">
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
													</tbody>
												</table>
											</td>
											<td class="fondo" vAlign="top" align="right" width="1"/>
										</tr>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/bot-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/bot-r-rojo.gif" width="4"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="$Obligacion=431 or /declaracion/detalle/C13 = '13'">
						<tr>
							<td>
								<table class="declaracion1" width="640">
									<tbody>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/top-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/top-r-rojo.gif" width="4"/>
											</td>
										</tr>
										<tr>
											<td class="fondo" vAlign="top" align="left" width="1"/>
											<td vAlign="top" width="636">
												<script type="text/javascript">if (window.attachEvent) {
							    		    window.attachEvent("onload", function(event) { <xsl:value-of select="concat('cambiarFinPeriodo(&quot;20070101&quot;)',';')"/> });
							    		    } else {
							    		    window.addEventListener("load", function(event) { <xsl:value-of select="concat('cambiarFinPeriodo(&quot;20070101&quot;)',';')"/>} , false);
							    		    }</script>
												<table class="declaracion">
													<tbody>
														<tr>
															<th class="bordevacio" colSpan="8">
																<p align="left">d - patente de autovehiculo</p>
															</th>
														</tr>
														<tr>
															<td class="borde">Valor Aforo en GuaranÃ­es</td>
															<td class="borde">30</td>
															<td class="borde" align="right">
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
															<td class="borde">AÃ±o que liquida el impuesto</td>
															<td class="borde">31</td>
															<td class="borde" align="right">
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
															<td class="borde">Marca del VehÃ­culo</td>
															<td class="borde" width="100"/>
														</tr>
														<tr>
															<td class="borde">AÃ±o de fabricaciÃ³n</td>
															<td class="borde" colSpan="2"/>
															<td>NÃºmero de MatrÃ­cula</td>
															<td class="borde" colSpan="2"/>
															<td class="borde">NÃºmero de Chasis</td>
															<td class="borde"/>
														</tr>
														<tr>
															<td class="borde">Escritura NÃºmero</td>
															<td class="borde" colSpan="2"/>
															<td class="borde">Protocolo</td>
															<td class="borde" colSpan="2"/>
															<td class="borde" colSpan="2" align="center">
															</td>
														</tr>
													</tbody>
												</table>
											</td>
											<td class="fondo" vAlign="top" align="right" width="1"/>
										</tr>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/bot-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/bot-r-rojo.gif" width="4"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="$Obligacion=461 or  /declaracion/detalle/C14 = '14'">
						<tr>
							<td>
								<table class="declaracion1" width="640">
									<tbody>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/top-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/top-r-rojo.gif" width="4"/>
											</td>
										</tr>
										<tr>
											<td class="fondo" vAlign="top" align="left" width="1"/>
											<td vAlign="top" width="636">
												<table class="declaracion">
													<tbody>
														<tr>
															<th class="bordevacio" style="width: 95%">
																<p align="left">e - otros pagos</p>
															</th>
															<th class="bordevacio" colSpan="2">
																<p align="center"> </p>
															</th>
														</tr>
														<tr>
															<td class="borde">Valor Imponible</td>
															<td class="borde">32</td>
															<td class="borde" align="right">
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
														</tr>
														<tr>
															<td class="borde">Fecha de operaciÃ³n   </td>
															<td class="borde">33</td>
															<td class="borde" align="right">
																<xsl:call-template name="itemFechaVencimiento">
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
													</tbody>
												</table>
											</td>
											<td class="fondo" vAlign="top" align="right" width="1"/>
										</tr>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/bot-l-rojo.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/bot-r-rojo.gif" width="4"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td>
							<table class="declaracion1" width="640">
								<tbody>
									<tr>
										<td vAlign="bottom" align="left" height="4">
											<img height="4" src="../../style/images/top-l-rojo.gif" width="4"/>
										</td>
										<td class="fondo"/>
										<td vAlign="bottom" align="right">
											<img height="4" src="../../style/images/top-r-rojo.gif" width="4"/>
										</td>
									</tr>
									<tr>
										<td class="fondo" vAlign="top" align="left" width="1"/>
										<td vAlign="top" width="636">
											<table class="declaracion">
												<tbody>
													<tr>
														<th class="bordevacio" style="width: 95%">
															<p align="left">liquidacion</p>
														</th>
														<th class="bordevacio" colSpan="2">
															<p align="center">IMPORTES</p>
														</th>
													</tr>
													<tr>
														<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por el rÃ©gimen general del IRACIS, .........% sobre el monto de la casilla 18</td>
														<td class="borde">34</td>
														<td class="borde" align="right">
															<xsl:choose>
																<xsl:when test="$Obligacion=114 or $Modo = 1">
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C34</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="declaracion/detalle/C34"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="$Modo"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C34</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="0"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="1"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr>
														<td class="borde">Impuesto liquidado aplicable sobre la renta alcanzada por el rÃ©gimen general del IRACIS, .........% sobre el monto de la casilla 20</td>
														<td class="borde">35</td>
														<td class="borde" align="right">
															<xsl:choose>
																<xsl:when test="$Obligacion=115 or $Modo = 1">
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C35</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="declaracion/detalle/C35"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="$Modo"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C35</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="0"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="1"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr>
														<td class="borde">Impuesto liquidado en concepto de tasa adicional del IRACIS, .........% aplicable sobre el monto de la casilla 28</td>
														<td class="borde">36</td>
														<td class="borde" align="right">
															<xsl:choose>
																<xsl:when test="$Obligacion=112 or $Modo = 1">
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C36</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="declaracion/detalle/C36"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="$Modo"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C36</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="0"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="1"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr>
														<td class="borde">Impuesto liquidado en concepto de Patente Fiscal de Autovehiculo, .........% aplicable sobre el monto de la casilla 30</td>
														<td class="borde">37</td>
														<td class="borde" align="right">
															<xsl:choose>
																<xsl:when test="$Obligacion=431 or $Modo = 1">
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C37</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="declaracion/detalle/C37"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="$Modo"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C37</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="0"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="1"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr>
														<td class="borde">Impuesto liquidado, .........% aplicable sobre el monto de la casilla 32</td>
														<td class="borde">38</td>
														<td class="borde" align="right">
															<xsl:choose>
																<xsl:when test="$Obligacion=461 or $Modo = 1">
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C38</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="declaracion/detalle/C38"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="$Modo"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="itemNumerico">
																		<xsl:with-param name="pNombre">C38</xsl:with-param>
																		<xsl:with-param name="pValor">
																			<xsl:value-of select="0"/>
																		</xsl:with-param>
																		<xsl:with-param name="pModo">
																			<xsl:value-of select="1"/>
																		</xsl:with-param>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr>
														<td class="borde">Multa por presentar la DeclaraciÃ³n Jurada con posterioridad al vencimiento</td>
														<td class="borde">39</td>
														<td class="borde" align="right">
															<xsl:call-template name="itemNumerico">
																<xsl:with-param name="pNombre">C39</xsl:with-param>
																<xsl:with-param name="pValor">
																	<xsl:value-of select="declaracion/detalle/C39"/>
																</xsl:with-param>
																<xsl:with-param name="pModo">
																	<xsl:value-of select="$Modo"/>
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">Saldo a favor del fisco (Suma de las casillas 34+35+36+37+38+39)</td>
														<td class="borde">40</td>
														<td class="borde" align="right">
															<xsl:call-template name="itemNumerico">
																<xsl:with-param name="pNombre">C40</xsl:with-param>
																<xsl:with-param name="pValor">
																	<xsl:value-of select="declaracion/detalle/C40"/>
																</xsl:with-param>
																<xsl:with-param name="pModo">
																	<xsl:value-of select="$Modo"/>
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">Multa por Mora (.........% del resultado de casilla 40 menos casilla 39) (SÃ³lo se calcularÃ¡ cuando exista saldo a favor del Fisco)</td>
														<td class="borde">41</td>
														<td class="borde" align="right">
															<xsl:call-template name="itemNumerico">
																<xsl:with-param name="pNombre">C41</xsl:with-param>
																<xsl:with-param name="pValor">
																	<xsl:value-of select="declaracion/detalle/C41"/>
																</xsl:with-param>
																<xsl:with-param name="pModo">
																	<xsl:value-of select="$Modo"/>
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">Intereses (.........% del resultado de casilla 40 menos casilla 39) (SÃ³lo se calcularÃ¡ cuando exista saldo a favor del Fisco)</td>
														<td class="borde">42</td>
														<td class="borde" align="right">
															<xsl:call-template name="itemNumerico">
																<xsl:with-param name="pNombre">C42</xsl:with-param>
																<xsl:with-param name="pValor">
																	<xsl:value-of select="declaracion/detalle/C42"/>
																</xsl:with-param>
																<xsl:with-param name="pModo">
																	<xsl:value-of select="$Modo"/>
																</xsl:with-param>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td class="borde">Saldo definitivo a pagar a favor del Fisco (Suma de las casillas 40+41+42)</td>
														<td class="borde">43</td>
														<td class="borde" align="right">
															<xsl:call-template name="itemNumerico">
																<xsl:with-param name="pNombre">C43</xsl:with-param>
																<xsl:with-param name="pValor">
																	<xsl:value-of select="declaracion/detalle/C43"/>
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
										<td class="fondo" vAlign="top" align="right" width="1"/>
									</tr>
									<tr>
										<td vAlign="bottom" align="left" height="4">
											<img height="4" src="../../style/images/bot-l-rojo.gif" width="4"/>
										</td>
										<td class="fondo"/>
										<td vAlign="bottom" align="right">
											<img height="4" src="../../style/images/bot-r-rojo.gif" width="4"/>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:call-template name="pieDeclaracionesEspecial"/>
						</td>
					</tr>
					<tr>
						<td align="right">
							<font size="1">VersiÃ³n 1-Enero/2007</font>
						</td>
					</tr>
				</tbody>
			</table>
		</html>
	</xsl:template>
</xsl:stylesheet>
