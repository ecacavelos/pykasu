<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
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

<xsl:template name="notificación"><xsl:param name="pFechaNotificacion"/>
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

<xsl:template name="cabeceraDeclaraciones"><xsl:param name="pImpuesto"/><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pNumero"/><xsl:param name="pPeriodo"/><xsl:param name="pRuc"/><xsl:param name="pPrimerApellido"/><xsl:param name="pSegundoApellido"/><xsl:param name="pNombres"/><xsl:param name="pRectificativa"/><xsl:param name="pNumeroRectifica"/>
	<link href="/eset/css/bd.css" type="text/css" rel="StyleSheet"/>
	<table class="principal" width="640" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
		<tbody>
			<tr>
				<td rowSpan="4" style="width: 15%">
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
					<xsl:call-template name="casillaValor"><xsl:with-param name="pNombre">C901</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pNumero"/> </xsl:with-param></xsl:call-template>
				</td>
				<td>Identificación: 
					<xsl:call-template name="casillaValor"><xsl:with-param name="pNombre">C900</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRuc"/> </xsl:with-param></xsl:call-template>
				</td>
			</tr>
			<tr>
				<td>Razón Social/Primer Apellido: 
					<xsl:call-template name="casillaTexto"><xsl:with-param name="pNombre">C903</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pPrimerApellido"/> </xsl:with-param></xsl:call-template>
				</td>
				<td>Segundo Apellido: 
					<xsl:call-template name="casillaTexto"><xsl:with-param name="pNombre">C904</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pSegundoApellido"/> </xsl:with-param></xsl:call-template>
				</td>
			</tr>
			<tr>
				<td>Nombres: 
					<xsl:call-template name="casillaTexto"><xsl:with-param name="pNombre">C902</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pNombres"/> </xsl:with-param></xsl:call-template>
				</td>
				<td>Período Fiscal: 
					<xsl:call-template name="casillaValor"><xsl:with-param name="pNombre">C4</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pPeriodo"/> </xsl:with-param></xsl:call-template>
				</td>
			</tr>
			<tr>
				<td>Declaración Jurada o Rectificativa: 
					<xsl:call-template name="casillaSiNo"><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRectificativa"/> </xsl:with-param></xsl:call-template>
				</td>
				<td>Número de Declaración que rectifica: 
					<xsl:call-template name="casillaValor"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pNumeroRectifica"/> </xsl:with-param></xsl:call-template>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>
<xsl:template name="cabeceraDocumentoExterno"><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pDependencia"/><xsl:param name="pDocumento"/><xsl:param name="pNumero"/><xsl:param name="pFecha"/>
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
						<xsl:value-of select="concat('FORM.',$pFormulario)"/>
						<xsl:value-of select="concat('-',$pVersion)"/>
					</p>
				</td>
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

<xsl:template name="casillaValor"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyUp"></xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<input class="valornumero"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynaprops(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="onkeyup"><xsl:value-of select="$pFuncionOnKeyUp"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
</xsl:template>
<xsl:template name="casillaTexto"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyUp"></xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<input class="descripcion"><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynaprops(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="onkeyup"><xsl:value-of select="$pFuncionOnKeyUp"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute></input>
</xsl:template>

<xsl:template name="casillaSiNo"><xsl:param name="pFuncionOnChange">checkRectificativa(this.value)</xsl:param><xsl:param name="pFuncionOnKeyUp"></xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<select><xsl:attribute name="id"><xsl:value-of select="$pNombre"/></xsl:attribute><xsl:attribute name="name"><xsl:value-of select="concat('dynaprops(',$pNombre,')')"/></xsl:attribute><xsl:attribute name="onchange"><xsl:value-of select="$pFuncionOnChange"/></xsl:attribute><xsl:attribute name="onkeyup"><xsl:value-of select="$pFuncionOnKeyUp"/></xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"><xsl:value-of select="$pValor"/></xsl:attribute>
		<option value="N">NO</option>
		<option value="S">SI</option>
	</select>
</xsl:template>

<xsl:template match="/">
	<xsl:call-template name="cabeceraDocumentoExterno"><xsl:with-param name="pDependencia">COLOCAR DIRECCION</xsl:with-param><xsl:with-param name="pDocumento">COLOCAR NOMBRE </xsl:with-param><xsl:with-param name="pNumero">######</xsl:with-param><xsl:with-param name="pFecha">dd-mm-yyyy</xsl:with-param></xsl:call-template><!--xsl:call-template name="cabeceraDocumentoExterno"><xsl:with-param name="pFormulario">###</xsl:with-param><xsl:with-param name="pVersion">#</xsl:with-param><xsl:with-param name="pDependencia">COLOCAR DIRECCION/DEPENDENCIA</xsl:with-param><xsl:with-param name="pDocumento">COLOCAR NOMBRE DOCUMENTO</xsl:with-param><xsl:with-param name="pNumero">#######</xsl:with-param><xsl:with-param name="pFecha">dd-mm-yyyy</xsl:with-param></xsl:call-template--><!--xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">###</xsl:with-param><xsl:with-param name="pVersion">#</xsl:with-param><xsl:with-param name="pImpuesto">COLOCAR NOMBRE</xsl:with-param><xsl:with-param name="pNumero">132456</xsl:with-param><xsl:with-param name="pPrimerApellido">Colocar Primer Apellido</xsl:with-param><xsl:with-param name="pSegundoApellido">Colocar Segundo Apellido</xsl:with-param><xsl:with-param name="pNombres">Colocar Nombres</xsl:with-param><xsl:with-param name="pPeriodo">ddmmyyyy</xsl:with-param><xsl:with-param name="pRuc">########</xsl:with-param><xsl:with-param name="pNumeroRectifica">#######</xsl:with-param> </xsl:call-template-->
</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2005. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\local\Formularios\CF\CUN&#x2D;CF&#x2D;2010 Solicitud General para Franquicias Fiscales\CUN&#x2D;CF&#x2D;2010 Solicitud General para Franquicias Fiscales.xml" htmlbaseurl="" outputurl="" processortype="xalan" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->