<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
<xsl:decimal-format name="guarani" NaN="-" decimal-separator="," grouping-separator="."/>
   <!-- shape constructor --> 
   <xsl:template name="cabeceraDocumentoInterno"><xsl:param name="pDependencia"/><xsl:param name="pDocumento"/><xsl:param name="pNumero"/><xsl:param name="pFecha"/>
	<link href="/eset/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
	<table class="principal" width="640" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
		<tbody>
			<tr>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">SUBSECRETARIA DE ESTADO DE TRIBUTACION</td>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">NUMERO</td>
				<td align="right" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pNumero"/>
				</td>
			</tr>
			<tr>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pDependencia"/>
				</td>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">FECHA</td>
				<td align="right" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pFecha"/>
				</td>
			</tr>
			<tr>
				<td colSpan="3" align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pDocumento"/>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

<xsl:template name="firmas">
	<p style="font-weight: 200">
		<link href="/eset/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
		<table class="principal">
			<tbody>
				<xsl:for-each select="documento/firma"><xsl:variable name="filaActual" select="position()"/>
					<tr>
						<xsl:choose>
							<xsl:when test="position() mod 2 = 0">
								<td class="datos" style="text-align: center">
                  <br></br>
									<p> 
										<xsl:value-of select="/documento/firma[position() = $filaActual - 1]/nombreFirma"/>
									</p>
									<p style="border-right: 0px; font-weight: 700; font-size: 10px;  font-family: verdana">
									    <xsl:value-of select="/documento/firma[position() = $filaActual - 1]/cargoFirma"/>
									</p>
								</td>
								<td class="datos" style="text-align: center">
                  <br></br>
									<p> 
										<xsl:value-of select="nombreFirma"/>
									</p>
									<p style="border-right: 0px; font-weight: 700; font-size: 10px;  font-family: verdana">
									    <xsl:value-of select="cargoFirma"/>
									</p>
								</td>
							</xsl:when>
							<xsl:when test="position()  = count(/documento/firma)">

								<td colspan="2" class="datos" style="text-align: center">
                  <br></br>
									<p> 
										<xsl:value-of select="nombreFirma"/>
									</p>
									<p>
									   <strong> <xsl:value-of select="cargoFirma"/> </strong>
									</p>
								</td>
							</xsl:when>
						</xsl:choose>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</p>
</xsl:template>

<xsl:template name="notificacion"><xsl:param name="pFechaNotificacion"/>
	<link href="/eset/css/documentos.css" type="text/css" rel="StyleSheet"/>
	<table class="principal" style="border-top: #000066 1px solid; ; border-bottom: #000066 1px solid">
		<tbody>
			<tr>
				<td colSpan="2" align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">DATOS DE NOTIFICACION</td>
			</tr>
			<tr>
				<td align="center" style="font-size: 10px; width: 10%; color: #000066; font-family: verdana">FECHA:</td>
				<td style="font-size: 10px; width: 90%; color: #000066; font-family: verdana">
					<xsl:value-of select="$pFechaNotificacion"/>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

<xsl:template name="cabeceraDeclaraciones"><xsl:param name="pImpuesto"/><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pNumero"/><xsl:param name="pPeriodo"/><xsl:param name="pRuc"/><xsl:param name="pDv"></xsl:param><xsl:param name="pPrimerApellido"/><xsl:param name="pSegundoApellido"/><xsl:param name="pNombres"/><xsl:param name="pRectificativa"/><xsl:param name="pNumeroRectifica"/><xsl:param name="pModo"/>
	<link href="/eset/css/bd.css" type="text/css" rel="StyleSheet"/>
	<table class="declaracion" width="640" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
		<tbody>
			<tr>
				<td rowSpan="5" style="width: 15%">
					<p align="center" size="15">
						<font size="5">
							<img hspace="0" src="/eset/images/cabecera3.jpg" align="baseline" border="0"/>
						</font>
					</p>
					<p align="center">
						<xsl:value-of select="$pImpuesto"/>
					</p>
					<p align="center">
						<xsl:value-of select="concat('FORM.',$pFormulario)"/>
						<xsl:value-of select="concat('-',$pVersion)"/>
					</p>
				</td>
				<td>Número de Orden: 
					<xsl:choose>
						<xsl:when test="$pModo='1' or $pModo='2'">
						<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pNumero"/> </xsl:with-param></xsl:call-template>					</xsl:when>
						<xsl:when test="$pModo='0'">
						<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="0"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
					</xsl:choose>
				</td>
				<td>Identificación: 
					<xsl:choose>
						<xsl:when test="$pModo='1'">
						<xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/ruc"/> </xsl:with-param></xsl:call-template> </xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">
						<xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRuc"/> </xsl:with-param></xsl:call-template> 
					</xsl:when>
					</xsl:choose>(DV) 
					<xsl:choose>
						<xsl:when test="$pModo='1'">
						<xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/dv"/> </xsl:with-param></xsl:call-template> </xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">digito<xsl:value-of select="$pDv"/>
						<xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pDv"/> </xsl:with-param></xsl:call-template> 
					</xsl:when>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td>Razón Social/Primer Apellido: 
					<xsl:choose>
						<xsl:when test="$pModo='1'">
						<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">primerApellido</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/primerApellido"/> </xsl:with-param></xsl:call-template> </xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">
						<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">primerApellido</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pPrimerApellido"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
					</xsl:choose>
				</td>
				<td>Segundo Apellido: 
					<xsl:choose>
						<xsl:when test="$pModo='1'">
						<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">segundoApellido</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C904"/> </xsl:with-param></xsl:call-template> </xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">
						<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">segundoApellido</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pSegundoApellido"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td>Nombres: 
					<xsl:choose>
						<xsl:when test="$pModo='1'">
						<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">nombre</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/nombre"/> </xsl:with-param></xsl:call-template> </xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">
						<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">nombre</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pNombres"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
					</xsl:choose>
				</td>
				<td>Período Fiscal: 
					<xsl:choose>
						<xsl:when test="$pModo='1'">
						<xsl:call-template name="itemPeriodo"><xsl:with-param name="pNombre">C4</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C4"/> </xsl:with-param></xsl:call-template> </xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">
						<xsl:call-template name="itemPeriodo"><xsl:with-param name="pNombre">C4</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pPeriodo"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:choose>
						<xsl:when test="$pModo='1'">
						<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C1"/> </xsl:with-param></xsl:call-template> </xsl:when>
						<xsl:when test="$pModo='0'">
						<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="1"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
					</xsl:choose>Declaración Jurada Original 
				</td>
				<td/>
			</tr>
			<tr>
				<td>
					<xsl:choose>
						<xsl:when test="$pModo='1'">
						<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C2</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C2"/> </xsl:with-param></xsl:call-template> </xsl:when>
						<xsl:when test="$pModo='0'">
						<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C2</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="2"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
					</xsl:choose>Declaración Jurada Rectificativa 
				</td>
				<td>Número Declaración que rectifica: 
					<xsl:choose>
						<xsl:when test="$pModo='1'">
						<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C3"/> </xsl:with-param></xsl:call-template> </xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">
						<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRectificativa"/> </xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="0"/></xsl:with-param></xsl:call-template>
					</xsl:when>
					</xsl:choose>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>


<xsl:template name="cabeceraDocumentoExterno"><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pDependencia"/><xsl:param name="pDocumento"/><xsl:param name="pNumero"/><xsl:param name="pFecha"/>
	<link href="/eset/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
	<table class="principal" width="100%" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
		<tbody>
			<tr>
				<td rowSpan="3" width="20%">
					<p align="center" size="15">
						<font size="5">
							<img hspace="0" src="/eset/images/cabecera3.jpg" align="baseline" border="0"/>
						</font>
					</p>
					<p align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
						<xsl:value-of select="concat('FORM.',/documento/@formulario)"/>
						<xsl:value-of select="concat('-',/documento/@version)"/>
					</p>
				</td>
				<td align="left" width="50%" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">SUBSECRETARIA DE ESTADO DE TRIBUTACION</td>
				<td align="left" width="13%" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">NUMERO</td>
				<td align="left" width="12%" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pNumero"/>
				</td>
			</tr>
			<tr>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pDependencia"/>
				</td>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">FECHA</td>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="/documento/@fechaDocumento"/>
				</td>
			</tr>
			<tr>
				<td valign="middle" colSpan="3" align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pDocumento"/>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

<xsl:template name="cabeceraDocumentoExternoSN"><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pDependencia"/><xsl:param name="pDocumento"/><xsl:param name="pFecha"/>
	<link href="/eset/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
	<table class="principal" width="640" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
		<tbody>
			<tr>
				<td rowSpan="3" style="width: 20%">
					<p align="center" size="15">
						<font size="5">
							<img hspace="0" src="/eset/images/cabecera3.jpg" align="baseline" border="0"/>
						</font>
					</p>
					<p align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					</p>
				</td>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">SUBSECRETARIA DE ESTADO DE TRIBUTACION</td>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">FECHA</td>
				<td align="right" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pFecha"/>
				</td>
			</tr>
			<tr>
				<td colSpan="3" align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pDependencia"/>
				</td>
			</tr>
			<tr>
				<td colSpan="3" align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pDocumento"/>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

<xsl:template name="consultas"><xsl:param name="pDependencia"/><xsl:param name="pDocumento"/><xsl:param name="pFecha"/>
	<link href="/eset/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
	<table class="principal" width="640" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
		<tbody>
			<tr>
				<td rowSpan="3" style="width: 20%">
					<p align="center" size="15">
						<font size="5">
							<img hspace="0" src="/eset/images/cabecera3.jpg" align="baseline" border="0"/>
						</font>
					</p>
					<p align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana"/>
				</td>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">SUBSECRETARIA DE ESTADO DE TRIBUTACION</td>
				<td align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">FECHA</td>
				<td align="right" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pFecha"/>
				</td>
			</tr>
			<tr>
				<td colSpan="3" align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<p align="left">
						<xsl:value-of select="$pDependencia"/>
					</p>
				</td>
			</tr>
			<tr>
				<td colSpan="3" align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
					<xsl:value-of select="$pDocumento"/>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>

<xsl:template name="itemNumerico"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0"> 
  	<input class="valornumero"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute>
<xsl:attribute name="onkeypress"><xsl:value-of select="$pFuncionOnKeyPress"/></xsl:attribute><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute>
</input>
  </xsl:when>
		<xsl:when test="$pModo = 1">
			<input class="valornumero"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="format-number($pValor,'###.###','guarani')"/></xsl:attribute></input>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="itemNumeroOrden"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0"> 
  	<input class="valornumero"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute>
<xsl:attribute name="onkeypress"><xsl:value-of select="$pFuncionOnKeyPress"/></xsl:attribute><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute>
</input>
  </xsl:when>
		<xsl:when test="$pModo = 1">
			<input class="valornumero"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="itemPeriodo"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0"> 
  	<input class="valornumero"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute>
<xsl:attribute name="onkeypress"><xsl:value-of select="$pFuncionOnKeyPress"/></xsl:attribute><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute>
</input>
  </xsl:when>
		<xsl:when test="$pModo = 1">
			<input class="valornumero"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="itemRuc"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0"> 
  	<input class="valornumero"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute>
<xsl:attribute name="onkeypress"><xsl:value-of select="$pFuncionOnKeyPress"/></xsl:attribute><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute>
</input>
  </xsl:when>
		<xsl:when test="$pModo = 1">
			<input class="valornumero"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
		</xsl:when>
	</xsl:choose>
</xsl:template>


<xsl:template name="itemDV"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0"> 
  	<input class="valorDV"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute>
<xsl:attribute name="onkeypress"><xsl:value-of select="$pFuncionOnKeyPress"/></xsl:attribute>
</input>
  </xsl:when>
		<xsl:when test="$pModo = 1 or $pModo = 2">
			<input class="valorDV"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="itemTexto"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyUp"></xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<input class="descripcion"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
</xsl:template>

<xsl:template name="itemCheck"><xsl:param name="pFuncionOnChange">checkRectificativa(this.value)</xsl:param><xsl:param name="pFuncionOnKeyUp"></xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0 "> 
			<xsl:choose>
				<xsl:when test="$pValor = 1 "> 
					<input type="checkbox"><xsl:attribute name="checked"><xsl:value-of select="true"/></xsl:attribute><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onclick"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
				</xsl:when>
				<xsl:when test="$pValor = 2 "> 
					<input type="checkbox"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onclick"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
				</xsl:when>
			</xsl:choose>
		</xsl:when>
		<xsl:when test="$pModo = 1 "> 
			<xsl:choose>
				<xsl:when test="$pValor = 1 "> 
					<input disabled="1" type="checkbox"><xsl:attribute name="checked"><xsl:value-of select="true"/></xsl:attribute><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onclick"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
				</xsl:when>
				<xsl:when test="$pValor = 2 "> 
					<input disabled="1" type="checkbox"><xsl:attribute name="checked"><xsl:value-of select="true"/></xsl:attribute><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onclick"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
				</xsl:when>
				<xsl:otherwise>
					<input disabled="1" type="checkbox"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onclick"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template match="/">
	<html><head></head>
		<body/>
	</html>
</xsl:template>
</xsl:stylesheet>