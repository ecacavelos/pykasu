<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaa</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template name="cabeceraDeclaracionesClausura849">
		<xsl:param name="pImpuesto"/>
		<xsl:param name="pFormulario"/>
		<xsl:param name="pVersion"/>
		<xsl:param name="pNumero"/>
		<xsl:param name="pPeriodo"/>
		<xsl:param name="pRuc"/>
		<xsl:param name="pDv"></xsl:param>
		<xsl:param name="pPrimerApellido"/>
		<xsl:param name="pSegundoApellido"/>
		<xsl:param name="pNombres"/>
		<xsl:param name="pRectificativa"/>
		<xsl:param name="pNumeroRectifica"/>
		<xsl:param name="pModo"/>
		<xsl:param name="pRubro"/>
		<table class="declaracion1" width="640">
			<tbody>
				<tr>
					<td vAlign="bottom" align="left" height="4">
						<img height="4" src="../../style/images/top-l-1.gif" width="4"/>
					</td>
					<td class="fondo"/>
					<td vAlign="bottom" align="right">
						<img height="4" src="../../style/images/top-r-1.gif" width="4"/>
					</td>
				</tr>
				<tr>
					<td class="fondo" vAlign="top" align="left" width="1"/>
					<td vAlign="top" width="636">
						<table class="declaracion" width="640">
							<tbody>
								<tr>
									<td class="borde" rowSpan="7" style="width: 15%">
										<p align="center" size="15">
											<font size="5">
												<img hspace="0" src="../../style/images/cabecera-set.gif" align="baseline" border="0"/>
											</font>
										</p>
										<p align="center">
											<xsl:value-of select="$pImpuesto"/>
										</p>
										<p align="center">
											<b>
												<font face="Arial" size="6">
													<xsl:value-of select="$pFormulario"/>
												</font>
											</b>
											<br/>
											<b/>
										</p>
									</td>
									<td class="borde" colSpan="4" align="center" style="font-size: 8px; font-family: verdana">PARA LLENAR LEA INSTRUCTIVO DISPONIBLE EN LA WEB</td>
									<td class="borde" colSpan="3" align="center" style="font-size: 8px; font-family: verdana">LOS IMPORTES SE CONSIGNARAN SIN CENTIMOS</td>
								</tr>
								<tr>
									<td class="borde" colSpan="4" width="50%">Número de Orden
										<xsl:choose>
											<xsl:when test="$pModo='1' or $pModo='2'">
												<xsl:call-template name="itemNumeroOrden">
													<xsl:with-param name="pNombre">numeroDocumento</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="declaracion/detalle/numeroDocumento"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$pModo='0'">
												<xsl:call-template name="itemNumeroOrden">
													<xsl:with-param name="pNombre">numeroDocumento</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="0"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="itemNumeroOrden">
													<xsl:with-param name="pNombre">numeroDocumento</xsl:with-param>
													<xsl:with-param name="pValor">
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="borde" colSpan="2" width="35%">RUC
										<xsl:choose>
											<xsl:when test="$pModo='1'">
												<xsl:call-template name="itemRuc">
													<xsl:with-param name="pNombre">ruc</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="declaracion/detalle/ruc"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$pModo='0' or $pModo='2'">
												<xsl:call-template name="itemRuc">
													<xsl:with-param name="pNombre">ruc</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="$pRuc"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="itemRuc">
													<xsl:with-param name="pNombre">ruc</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="$pRuc"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="borde" colSpan="2" align="center" width="10%">DV
										<xsl:choose>
											<xsl:when test="$pModo='1'">
												<xsl:call-template name="itemDV">
													<xsl:with-param name="pNombre">dv</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="declaracion/detalle/dv"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$pModo='0' or $pModo='2'">
												<xsl:call-template name="itemDV">
													<xsl:with-param name="pNombre">dv</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="$pDv"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="itemDV">
													<xsl:with-param name="pNombre">dv</xsl:with-param>
													<xsl:with-param name="pValor"></xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="borde" colSpan="4">Razón Social/Primer Apellido
										<xsl:call-template name="itemTexto">
											<xsl:with-param name="pNombre">primerApellido</xsl:with-param>
											<xsl:with-param name="pValor">
												<xsl:value-of select="$pPrimerApellido"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="borde" colSpan="4">Segundo Apellido
										<xsl:call-template name="itemTexto">
											<xsl:with-param name="pNombre">segundoApellido</xsl:with-param>
											<xsl:with-param name="pValor">
												<xsl:value-of select="$pSegundoApellido"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="borde" colSpan="8">Nombres
										<xsl:call-template name="itemTexto">
											<xsl:with-param name="pNombre">nombre</xsl:with-param>
											<xsl:with-param name="pValor">
												<xsl:value-of select="$pNombres"/>
											</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="borde">01</td>
									<td class="borde">1</td>
									<td class="borde" width="1%">
										<xsl:choose>
											<xsl:when test="$pModo='1'">
												<xsl:call-template name="itemCheck">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C1</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="declaracion/detalle/C1"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$pModo='0'">
												<xsl:call-template name="itemCheck">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C1</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="1"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="itemCheck">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C1</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="0"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="borde">Declaración Jurada Original</td>
									<td class="borde" colSpan="4" align="center">Número de Orden Declaración que rectifica</td>
								</tr>
								<tr>
									<td class="borde">02</td>
									<td class="borde">2</td>
									<td class="borde">
										<xsl:choose>
											<xsl:when test="$pModo='1'">
												<xsl:call-template name="itemCheck">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C2</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="declaracion/detalle/C2"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$pModo='0'">
												<xsl:call-template name="itemCheck">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C2</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="2"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="itemCheck">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C1</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="0"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="borde">Declaración Jurada Rectificativa</td>
									<td class="borde" width="1%">03</td>
									<td class="borde" colSpan="3" align="center" width="300">
										<xsl:choose>
											<xsl:when test="$pModo='1'">
												<xsl:call-template name="itemNumeroOrden">
													<xsl:with-param name="pNombre">C3</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="declaracion/detalle/C3"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$pModo='0' or $pModo='2'">
												<xsl:call-template name="itemNumeroOrden">
													<xsl:with-param name="pNombre">C3</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="$pRectificativa"/>
													</xsl:with-param>
													<xsl:with-param name="pModo">
														<xsl:value-of select="0"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="itemNumeroOrden">
													<xsl:with-param name="pNombre">C3</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="$pRectificativa"/>
													</xsl:with-param>
													<xsl:with-param name="pModo">
														<xsl:value-of select="0"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="borde" vAlign="top">06</td>
									<td class="borde" vAlign="top">6</td>
									<td class="borde" vAlign="top">
										<xsl:choose>
											<xsl:when test="$pModo='1'">
												<xsl:call-template name="itemCheck">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C6</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="declaracion/detalle/C6"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$pModo='0'">
												<xsl:call-template name="itemCheck">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C5</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="5"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="itemCheck">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C1</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="0"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="borde" vAlign="top">Declaración Jurada en Caracter de Clausura o Cese</td>
									<td class="borde">04</td>
									<td class="borde" colSpan="2" align="center">Período Fiscal
										<xsl:choose>
											<xsl:when test="$pModo='1' or $pModo='2'">
												<xsl:call-template name="itemPeriodo">
													<xsl:with-param name="pValor">
														<xsl:choose>
															<xsl:when test="$pPeriodo &gt; 0">
																<xsl:value-of select="$pPeriodo"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:value-of select="declaracion/detalle/C4"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C4</xsl:with-param>
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="itemPeriodo">
													<xsl:with-param name="pModo">
														<xsl:value-of select="$pModo"/>
													</xsl:with-param>
													<xsl:with-param name="pValor">
														<xsl:value-of select="$pPeriodo"/>
													</xsl:with-param>
													<xsl:with-param name="pNombre">C4</xsl:with-param>
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
						<img height="4" src="../../style/images/bot-l-1.gif" width="4"/>
					</td>
					<td class="fondo"/>
					<td vAlign="bottom" align="right">
						<img height="4" src="../../style/images/bot-r-1.gif" width="4"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C11)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C10)"].value)-parseFloat(formu["dynamicProps(C12)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C13)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C12)"].value)-parseFloat(formu["dynamicProps(C10)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C14)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C12)"].value) * 0.3));} catch(e){errores++;}
	try { formu["dynamicProps(C22)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C13)"].value),parseFloat(formu["dynamicProps(C14)"].value)) * (buscartasa(22) / 100)));} catch(e){errores++;}
	try { formu["dynamicProps(C23)"].value = nvl(Math.round(elegir(calcularmulta(144,parseFloat(formu["dynamicProps(C22)"].value)),0,si(parseFloat(formu["dynamicProps(C23)"].value)>0,50000,0),calcularmulta(144,parseFloat(formu["dynamicProps(C22)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C19)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)-parseFloat(formu["dynamicProps(C22)"].value)-parseFloat(formu["dynamicProps(C23)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C24)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C22)"].value)+parseFloat(formu["dynamicProps(C23)"].value)-parseFloat(formu["dynamicProps(C15)"].value)-parseFloat(formu["dynamicProps(C16)"].value)-parseFloat(formu["dynamicProps(C17)"].value)-parseFloat(formu["dynamicProps(C18)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C25)"].value = nvl(Math.round(calcularmora(mayor((parseFloat(formu["dynamicProps(C22)"].value))-(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C26)"].value = nvl(Math.round(calcularinteres(mayor((parseFloat(formu["dynamicProps(C22)"].value))-(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)+parseFloat(formu["dynamicProps(C18)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C33)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C33)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C27)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C22)"].value)+parseFloat(formu["dynamicProps(C23)"].value)+parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value)-parseFloat(formu["dynamicProps(C15)"].value)-parseFloat(formu["dynamicProps(C16)"].value)-parseFloat(formu["dynamicProps(C17)"].value)-parseFloat(formu["dynamicProps(C18)"].value)-parseFloat(formu["dynamicProps(C20)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C34)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C34)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C35)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C35)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C21)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C19)"].value)+parseFloat(formu["dynamicProps(C20)"].value)-parseFloat(formu["dynamicProps(C24)"].value)-parseFloat(formu["dynamicProps(C25)"].value)-parseFloat(formu["dynamicProps(C26)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C36)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C36)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C37)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C37)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C29)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C28)"].value)-parseFloat(formu["dynamicProps(C30)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C38)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C38)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C39)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C39)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C31)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C30)"].value)-parseFloat(formu["dynamicProps(C28)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C40)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C40)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C41)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C41)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C42)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C42)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C43)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C43)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C50)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C44)"].value)+parseFloat(formu["dynamicProps(C45)"].value)+parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C47)"].value)+parseFloat(formu["dynamicProps(C48)"].value)+parseFloat(formu["dynamicProps(C49)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C53)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C51)"].value)+parseFloat(formu["dynamicProps(C52)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C54)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C50)"].value)-parseFloat(formu["dynamicProps(C53)"].value),0)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C43)"].value == "") formu["dynamicProps(C43)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C44)"].value == "") formu["dynamicProps(C44)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C37)"].value == "") formu["dynamicProps(C37)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C53)"].value == "") formu["dynamicProps(C53)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C41)"].value == "") formu["dynamicProps(C41)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C49)"].value == "") formu["dynamicProps(C49)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C34)"].value == "") formu["dynamicProps(C34)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C42)"].value == "") formu["dynamicProps(C42)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C12)"].value == "") formu["dynamicProps(C12)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C40)"].value == "") formu["dynamicProps(C40)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C46)"].value == "") formu["dynamicProps(C46)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C13)"].value == "") formu["dynamicProps(C13)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C51)"].value == "") formu["dynamicProps(C51)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C24)"].value == "") formu["dynamicProps(C24)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C35)"].value == "") formu["dynamicProps(C35)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C47)"].value == "") formu["dynamicProps(C47)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C50)"].value == "") formu["dynamicProps(C50)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C36)"].value == "") formu["dynamicProps(C36)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C48)"].value == "") formu["dynamicProps(C48)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C33)"].value == "") formu["dynamicProps(C33)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C30)"].value == "") formu["dynamicProps(C30)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C45)"].value == "") formu["dynamicProps(C45)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C38)"].value == "") formu["dynamicProps(C38)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C39)"].value == "") formu["dynamicProps(C39)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C52)"].value == "") formu["dynamicProps(C52)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C54');
	ponerPuntosEnCampo('C43');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C29');
	ponerPuntosEnCampo('C37');
	ponerPuntosEnCampo('C44');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C41');
	ponerPuntosEnCampo('C53');
	ponerPuntosEnCampo('C49');
	ponerPuntosEnCampo('C34');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C42');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C40');
	ponerPuntosEnCampo('C46');
	ponerPuntosEnCampo('C13');
	ponerPuntosEnCampo('C24');
	ponerPuntosEnCampo('C51');
	ponerPuntosEnCampo('C35');
	ponerPuntosEnCampo('C47');
	ponerPuntosEnCampo('C14');
	ponerPuntosEnCampo('C50');
	ponerPuntosEnCampo('C36');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C33');
	ponerPuntosEnCampo('C48');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C26');
	ponerPuntosEnCampo('C11');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C30');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C45');
	ponerPuntosEnCampo('C39');
	ponerPuntosEnCampo('C38');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C52');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C31');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C54');
	quitarPuntosDeCampo('C43');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C29');
	quitarPuntosDeCampo('C37');
	quitarPuntosDeCampo('C44');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C41');
	quitarPuntosDeCampo('C53');
	quitarPuntosDeCampo('C49');
	quitarPuntosDeCampo('C34');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C42');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C40');
	quitarPuntosDeCampo('C46');
	quitarPuntosDeCampo('C13');
	quitarPuntosDeCampo('C24');
	quitarPuntosDeCampo('C51');
	quitarPuntosDeCampo('C35');
	quitarPuntosDeCampo('C47');
	quitarPuntosDeCampo('C14');
	quitarPuntosDeCampo('C50');
	quitarPuntosDeCampo('C36');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C33');
	quitarPuntosDeCampo('C48');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C26');
	quitarPuntosDeCampo('C11');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C30');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C45');
	quitarPuntosDeCampo('C39');
	quitarPuntosDeCampo('C38');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C52');
	quitarPuntosDeCampo('C20');
	quitarPuntosDeCampo('C31');
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
			<link href="../../style/css/bd-verde.css" type="text/css" rel="stylesheet"/>
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaracionesClausura849">
							<xsl:with-param name="pFormulario">849</xsl:with-param>
							<xsl:with-param name="pVersion">V.1</xsl:with-param>
							<xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA</xsl:with-param>
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
													<th class="bordevacio" rowSpan="2" style="width: 90%">
														<p align="left">PARA AQUELLAS EMPRESAS O ENTIDADES QUE DETERMINEN SU RENTA POR REGIMEN SIMPLIFICADO O REALICEN ACTIVIDADES NO GRAVADAS POR EL IMPUESTO</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">MES DE CIERRE</p>
													</th>
												</tr>
												<tr>
													<td class="borde">05</td>
													<td class="borde">
														<xsl:call-template name="itemMesCierre">
															<xsl:with-param name="pNombre">C5</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C5"/>
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
														<p align="left">RUBRO 1 resultado del ejercicio y determinacion de la base imponible</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">egresos/perdida -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">ingresos/ganancia -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Total Ingresos Brutos provenientes de Actividades Gravadas</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Total de Egresos directamente relacionados a actividades Gravadas, incluyendo la proporción de los gastos afectados indistintamente a operaciones no gravadas</td>
													<td class="borde">10</td>
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
													<td class="borde" charoff="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Resultado del Ejercicio ( Inc. a - b )</td>
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
													<td class="borde">d</td>
													<td class="borde">Monto resultante de aplicar el porcentaje del 30% sobre el Inc. a Col. II</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
														<p align="left">RUBRO 2 liquidacion y saldo del impuesto</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importes</p>
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
													<td class="borde">Impuesto Liquidado por Regimen Simplificado .......%, sobre el Rubro 1 inc. c; o Inc. d Col. II ( el que resulte menor )</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
													<td class="borde">Saldo a favor del Contribuyente del periodo anterior</td>
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
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Pago previo</td>
													<td class="borde">16</td>
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
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Retenciones computables a favor del Contribuyente</td>
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
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Anticipos Ingresados</td>
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
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Multa por presentación fuera de plazo</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
													<td class="borde">g</td>
													<td class="borde">Sub Total ( Inc. a+f) Col. II; ( Inc. b+c+d+e) Col.I</td>
													<td class="vacio">          </td>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Saldo a favor del Contribuyente a trasladar al siguiente periodo (Diferencia entre Columnas I y II del Inc. g cuando la Col. I sea mayor que Col. II )</td>
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
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Saldo a favor del Fisco ( Diferencia entre Columnas I y II del Inc. g cuando Col. II sea mayor que Col. I )</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
												<tr>
													<td class="borde">j</td>
													<td class="borde">Multa por Mora .....% sobre el resultado de Inc. i menos Inc. f( Solo se calculará cuando Inc. i sea mayor que Inc. f )</td>
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
													<td class="borde">k</td>
													<td class="borde">Intereses, sobre el resultado de Inc. i menos Inc. f ( Solo se calculará cuando Inc. i sea mayor que Inc. f )</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Pago con Certificado de Crédito Tributario, expedidos por la SET</td>
													<td class="borde">20</td>
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
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Saldo a favor del Contribuyente a trasladar al siguiente periodo</td>
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
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">Saldo definitivo a favor del Fisco</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
														<p align="left">RUBRO 3 resultado del ejercicio - para EMPRESAS O ENTIDADES que realicen exclusivamEnte operaciones exoneradas</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">egresos/perdida -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">ingresos/ganancia -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Total Ingresos Brutos provenientes de Actividades Exentas o Exoneradas del Tributo </td>
													<td class="vacio"/>
													<td class="vacio"/>
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
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Total de egresos realizados en el ejercicio fiscal</td>
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
													<td class="borde">c</td>
													<td class="borde">Resultado del ejercicio ( Inc. a - b )</td>
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
					<td valign="top">
						<table class="declaracion1" width="640">
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
																	<th class="bordevacio" style="width: 95%">
																		<p align="left">uso interno - identificación del credito tributario</p>
																	</th>
																	<th class="bordevacio" colSpan="2"/>
																</tr>
																<tr>
																	<td class="borde">Número de Recibo expedido por la Administración Tributaria</td>
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
																	<td class="borde" width="33%">
																		<p align="center">Lugar y Fecha de expedición</p>
																	</td>
																	<td class="borde" width="33%">
																		<p align="center">Nombre y Apellido del funcionario responsable</p>
																	</td>
																	<td class="borde" width="33%">
																		<p align="center">Firma y Sello</p>
																	</td>
																</tr>
																<tr>
																	<td class="borde" width="33%">
																		<p> </p>
																		<p> </p>
																		<p> </p>
																	</td>
																	<td class="borde" width="33%">
																		<br/>
																	</td>
																	<td class="borde" width="33%">
																		<br/>
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
								<!--IMPRESION-->
								<tr>
									<td class="saltoPagina"></td>
								</tr>
								<tr>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 4 otros datos complementarios ( debe ser llenado por los declarantes independientemente que sus operaciones se encuentren gravados o no )</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Total de Donaciones y Aportes en General percibidos en dinero, a nivel local de personas fisicas y entidades privadas</td>
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
												<tr>
													<td class="borde">b</td>
													<td class="borde">Total Donaciones y Aportes percibidos en dinero, del exterior</td>
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
													<td class="borde">c</td>
													<td class="borde">Total de Donaciones y Aportes percibidos en bienes tangibles, a nivel local</td>
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
													<td class="borde">d</td>
													<td class="borde">Total de Donaciones y Aportes percibidos en bienes tangibles, del exterior</td>
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
												<tr>
													<td class="borde">e</td>
													<td class="borde">Total de Aportes recibidos del Estado</td>
													<td class="borde">37</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C37</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C37"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Total de otros ingresos no gravados por el impuesto, excluidos los indicados en los Inc. a al Inc. e</td>
													<td class="borde">38</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C38</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C38"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Total pagado, en concepto de Remuneraciones Brutas por sueldos y jornales</td>
													<td class="borde">39</td>
													<td class="borde">
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
													<td class="borde">h</td>
													<td class="borde">Total pagado, en concepto de Aportes Patronales sobre las remuneraciones al personal</td>
													<td class="borde">40</td>
													<td class="borde">
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
													<td class="borde">i</td>
													<td class="borde">Total pagado en concepto de honorarios profesionales</td>
													<td class="borde">41</td>
													<td class="borde">
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
													<td class="borde">j</td>
													<td class="borde">Total pagado, en concepto de Remuneraciones al Personal Superior, no sujetos al regimen de seguridad social</td>
													<td class="borde">42</td>
													<td class="borde">
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
													<td class="borde">k</td>
													<td class="borde">Total de otros egresos realizados, incluyendo los afectados a operaciones o actividades no gravadas, excluidos los señalados en los Inc. g al Inc. j</td>
													<td class="borde">43</td>
													<td class="borde">
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
					<!--ACA-->
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
														<p align="left">RUBRO 5 informacion de patrimonio fiscal</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Disponible</td>
													<td class="borde">44</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C44</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C44"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Inventarios</td>
													<td class="borde">45</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C45</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C45"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Otros Activos Corrientes (Netos de Reservas Incobrables)</td>
													<td class="borde">46</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C46</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C46"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Edificios</td>
													<td class="borde">47</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C47</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C47"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Terrenos</td>
													<td class="borde">48</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C48</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C48"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Otros Activos Fijos (Netos Depreciación Acumulada)</td>
													<td class="borde">49</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C49</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C49"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Total Activos (Inc. a+b+c+d+e+f)</td>
													<td class="borde">50</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C50</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C50"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Pasivos Corrientes</td>
													<td class="borde">51</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C51</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C51"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Otros Pasivos</td>
													<td class="borde">52</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
															<xsl:with-param name="pNombre">C52</xsl:with-param>
															<xsl:with-param name="pValor">
																<xsl:value-of select="declaracion/detalle/C52"/>
															</xsl:with-param>
															<xsl:with-param name="pModo">
																<xsl:value-of select="$Modo"/>
															</xsl:with-param>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Total Pasivos (Inc. h+i)</td>
													<td class="borde">53</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico">
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
												<tr>
													<td class="borde">k</td>
													<td class="borde">Total Patrimonio (Inc. g-j)</td>
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
						<xsl:call-template name="pieDeclaraciones"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
