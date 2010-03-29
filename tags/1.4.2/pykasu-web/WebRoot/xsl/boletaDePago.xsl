<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="codigoBarras"></xsl:param>
	<xsl:output method="html"/>
	<xsl:decimal-format name="guarani" NaN="-" decimal-separator="," grouping-separator="."/>
	<xsl:template name="Boleta"><xsl:param name="Original">S</xsl:param>
	<table class="principal">
		<tbody>
			<xsl:if test="$Original ='S'">
			</xsl:if>
			<tr>
				<td>
					<table style="; width: 100%; height: 44px">
						<tbody>
							<tr>
								<td class="logo" rowSpan="2" width="8%">
								  <img hspace="0" src="../style/images/cabecera3.jpg" align="baseline" border="0"/>
								</td>
								<td class="titulo" rowSpan="2">BOLETA DE PAGO</td>
								<td class="subseccioncentro" width="15%">Número</td>
							</tr>
							<tr>
								<td class="centro">
									<p align="left">
										<xsl:value-of select="pago/cabecera/numeroOrden"/>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td class="seccion" width="50%">
					<table style="; width: 100%; height: 37px">
						<tbody>
							<tr>
								<td class="etiquetacentro" width="25%">RUC</td>
								<td class="etiquetacentro" width="25%" style="width: 75%">Nombre&#160;o Razón Social</td>
							</tr>
							<tr>
								<td width="25%">
									<p align="center">
										<xsl:value-of select="pago/cabecera/ruc"/>
									</p>
								</td>
								<td width="25%" style="width: 75%">
									<p align="center">&#160; 
										<xsl:value-of select="pago/cabecera/nombre"/>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td class="seccion" width="50%">
					<table class="sinborde" style="; width: 100%; height: 97px">
						<tbody>
							<tr>
								<td class="etiqueta" width="60%" style="width: 15%">Código</td>
								<td style="width: 35%">
									<xsl:value-of select="pago/detalle/codigoImpuesto"/>
								</td>
								<td rowSpan="5" width="40%"/>
							</tr>
							<tr>
								<td class="etiqueta" width="50%" style="width: 25%">Impuesto</td>
								<td>
									<xsl:value-of select="pago/detalle/abreviatura"/>
								</td>
							</tr>
							<tr>
								<td class="etiqueta" width="50%" style="width: 25%">Descripción</td>
								<td>
									<xsl:value-of select="pago/detalle/descripcion"/>
								</td>
							</tr>
							<tr>
								<td class="etiqueta" width="50%" style="width: 25%">Número de Resolución</td>
								<td>
									<xsl:value-of select="pago/detalle/numeroResolucion"/>
								</td>
							</tr>
							<tr>
								<td class="etiqueta" width="50%" style="width: 25%">Total a Pagar (Gs.)</td>
								<td>
									<xsl:value-of select="format-number(pago/detalle/totalPagar,'###.###','guarani')"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table style="; width: 100%; height: 20px">
						<tbody>
							<tr>
								<td class="etiqueta" width="33%" style="width: 25%">Fecha de Emisión</td>
								<td width="35%" style="width: 35%">
									<xsl:value-of select="pago/cabecera/fecha"/>
								</td>
								<td width="33%" style="width: 50%">
									<p class="ETIQUETAcentro" align="center">Firma y Sello del Cajero</p>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<xsl:if test="$Original = 'N'">
					<tr>
						<td class="seccion" width="50%">
							<table style="; width: 100%; height: 74px">
								<tbody>
									<tr>
										<td width="100%">
											<p align="center">
												
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</xsl:if>
		</tbody>
	</table>
</xsl:template>
	<xsl:template name="BoletaCopia">
	<xsl:call-template name="Boleta"><xsl:with-param name="Original">N</xsl:with-param></xsl:call-template>
</xsl:template>
	<xsl:template match="/">
	<html>
	  <head>
	    <link href="../style/documentos.css" type="text/css" rel="StyleSheet"/>
	    <link rel="stylesheet" type="text/css"  media="print" href="../style/impresion.css"></link>
	    <link rel="stylesheet" type="text/css"   href="../style/boton.css"></link>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
	  </head>
	  <body align="center" style="align:center;">
	    <div class="esconderParaImpresion"><input type='button' class='boton' id='inicio' name='inicio' value='Inicio'/> | <input type='button' class='boton' id='imprimir' name='imprimir' value='Imprimir'/>   | </div>
	    <div  class="mostrarParaImpresion">
			<table align="center"  width="100%">
				<tbody>
					<tr>
						<td width="100%">
							<xsl:call-template name="Boleta"/>
						</td>
					</tr>
					<tr>
						<td class="ETIQUETA" width="100%">
							<p>
								<font size="1">
									<strong>Los Pagos realizados se imputarán a la obligación más antigua, conforme lo señalado en el art. 162 de la ley 125/91.</strong>
								</font>
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<img src="../style/images/cortar.gif" width="645" border="0"/>
						</td>
					</tr>
					<tr>
						<td width="100%">&#160; 
							<xsl:call-template name="BoletaCopia"/>
						</td>
					</tr>
					<tr>
						<td class="etiqueta" width="100%">
							<p>
							  <strong><font size="1">Los Pagos realizados se imputarán a la obligación más antigua, conforme lo señalado en el art. 162 de la ley 125/91.</font></strong>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
	     </div>
	    </body>	  
	</html>
</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="CUN&#x2D;RE&#x2D;2010&#x2D;Boleta de pago.xml" htmlbaseurl="" outputurl="" processortype="internal" useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="CUN&#x2D;RE&#x2D;2010&#x2D;Boleta de pago.xml" srcSchemaRoot="Pago" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="html/body/p/table/tbody/tr[3]/td/table/tbody/tr[4]/td[1]/xsl:value&#x2D;of" x="236" y="78"/></template></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->