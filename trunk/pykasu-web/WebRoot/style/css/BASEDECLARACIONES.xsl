<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="c:/eset/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">1</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Periodo"></xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:template match="/">
	<table class="declaracion">
		<tbody>
			<tr>
				<td>
					<xsl:call-template name="cabeceraDeclaraciones"><xsl:with-param name="pFormulario">###</xsl:with-param><xsl:with-param name="pVersion">V</xsl:with-param><xsl:with-param name="pImpuesto">XXXXX</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param></xsl:call-template>
				</td>
			</tr>
			<tr>
				<td/>
			</tr>
			<tr>
				<td/>
			</tr>
			<tr>
				<td/>
			</tr>
			<tr>
				<td/>
			</tr>
			<tr>
				<td/>
			</tr>
			<tr>
				<td/>
			</tr>
			<tr>
				<td/>
			</tr>
			<tr>
				<td>
					<table class="declaracion" border="0">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 90%">
									<p align="left">RUBRO tipo 0</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR1 </p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR2 </p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 3</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 4</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>12</td>
								<td>##</td>
								<td>12</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234567890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>12</td>
								<td>##</td>
								<td>12</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234567890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion" border="0">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 90%">
									<p align="left">RUBRO tipo 1 (COPIA 1)</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 1</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 2</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 3</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 90%">
									<p align="left">RUBRO tipo 1 (COPIA 2)</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 1</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 2</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 3</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 90%">
									<p align="left">RUBRO tipo 1 (COPIA 3)</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 1</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 2</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 3</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 90%">
									<p align="left">RUBRO tipo 2 (COPIA 1)</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 1</p>
								</th>
								<th colSpan="2">
									<p align="center">valor 2</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 90%">
									<p align="left">RUBRO tipo 2 (COPIA 2)</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 1</p>
								</th>
								<th colSpan="2">
									<p align="center">valor 2</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 90%">
									<p align="left">RUBRO tipo 2 (COPIA 3)</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR 1</p>
								</th>
								<th colSpan="2">
									<p align="center">valor 2</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 95%">
									<p align="left">RUBRO tipo 3 (COPIA 1)</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR1</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 95%">
									<p align="left">RUBRO tipo 3 (COPIA 2)</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR1</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th>INC</th>
								<th style="width: 95%">
									<p align="left">RUBRO tipo 3 (COPIA 3)</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR1</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th rowSpan="2">INC</th>
								<th rowSpan="2" style="width: 90%">
									<p align="left">RUBRO tipo 4 (COPIA 1)</p>
								</th>
								<th colSpan="6">
									<p align="center">DESCRIPCION</p>
								</th>
							</tr>
							<tr>
								<th colSpan="2">
									<p align="center">VALOR1</p>
								</th>
								<th colSpan="2" style="width: 90%">
									<p align="center">VALOR2</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR3</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890123</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th rowSpan="2">INC</th>
								<th rowSpan="2" style="width: 90%">
									<p align="left">RUBRO tipo 4 (COPIA 2)</p>
								</th>
								<th colSpan="6">
									<p align="center">DESCRIPCION</p>
								</th>
							</tr>
							<tr>
								<th colSpan="2">
									<p align="center">VALOR1</p>
								</th>
								<th colSpan="2" style="width: 90%">
									<p align="center">VALOR2</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR3</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890123</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th rowSpan="2">INC</th>
								<th rowSpan="2" style="width: 90%">
									<p align="left">RUBRO tipo 4 (COPIA 3)</p>
								</th>
								<th colSpan="6">
									<p align="center">DESCRIPCION</p>
								</th>
							</tr>
							<tr>
								<th colSpan="2">
									<p align="center">VALOR1</p>
								</th>
								<th colSpan="2" style="width: 90%">
									<p align="center">VALOR2</p>
								</th>
								<th colSpan="2">
									<p align="center">VALOR3</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890123</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th rowSpan="2">INC</th>
								<th rowSpan="2" style="width: 95%">
									<p align="left">RUBRO TIPO 5 (COPIA 1)</p>
								</th>
								<th colSpan="4">
									<p align="center">DESCRIPCION</p>
								</th>
							</tr>
							<tr>
								<th colSpan="2">
									<p align="center">VALOR 1</p>
								</th>
								<th colSpan="2" style="width: 90%">
									<p align="center">VALOR 2</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th rowSpan="2">INC</th>
								<th rowSpan="2" style="width: 95%">
									<p align="left">RUBRO TIPO 5 (COPIA 2)</p>
								</th>
								<th colSpan="4">
									<p align="center">DESCRIPCION</p>
								</th>
							</tr>
							<tr>
								<th colSpan="2">
									<p align="center">VALOR 1</p>
								</th>
								<th colSpan="2" style="width: 90%">
									<p align="center">VALOR 2</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion">
						<tbody>
							<tr>
								<th rowSpan="2">INC</th>
								<th rowSpan="2" style="width: 95%">
									<p align="left">RUBRO TIPO 5 (COPIA 3)</p>
								</th>
								<th colSpan="4">
									<p align="center">DESCRIPCION</p>
								</th>
							</tr>
							<tr>
								<th colSpan="2">
									<p align="center">VALOR 1xx</p>
								</th>
								<th colSpan="2" style="width: 90%">
									<p align="center">VALOR 2</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%">
						<tbody>
							<tr>
								<th colSpan="6">
									<p align="center">RUBRO TIPO 6</p>
								</th>
							</tr>
							<tr>
								<td colSpan="3" width="50%">
									<p align="center">COLUMNA 1</p>
								</td>
								<td colSpan="3" width="50%">
									<p align="center">COLUMNA 2</p>
								</td>
							</tr>
							<tr>
								<td style="width: 50%">Descripción 1</td>
								<td>##</td>
								<td>1324567890132</td>
								<td style="width: 50%">Descripción 1</td>
								<td style="width: 1%">##</td>
								<td>1324567890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="declaracion" width="900" border="0">
						<tbody>
							<tr>
								<th colSpan="14">
									<p align="center">RUBRO TIPO 7</p>
								</th>
							</tr>
							<tr>
								<th rowSpan="2">INC</th>
								<th rowSpan="2" width="300">
									<p align="left">DETALLE </p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
							</tr>
							<tr>
								<th colSpan="2">
									<p align="center">aa</p>
								</th>
								<th colSpan="2">
									<p align="center">aa</p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
								<th colSpan="2">
									<p align="center">AA</p>
								</th>
							</tr>
							<tr>
								<td>a</td>
								<td>DESCRIPCION&#160;&#160;DELINCISO ...... &#160;INCISO</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234567890132</td>
								<td>##</td>
								<td>1234567890132</td>
								<td>##</td>
								<td>1234567890132</td>
								<td>##</td>
								<td>1234567890132</td>
							</tr>
							<tr>
								<td>b</td>
								<td/>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234657890132</td>
								<td>##</td>
								<td>1234567890132</td>
								<td>##</td>
								<td>1234567890132</td>
								<td>##</td>
								<td>1234567890132</td>
								<td>##</td>
								<td>1234567890132</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\borrar\850_1.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->