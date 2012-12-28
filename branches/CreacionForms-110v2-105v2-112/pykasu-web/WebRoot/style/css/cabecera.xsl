<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:a="http://www.w3.org/1999/xhtml" exclude-result-prefixes="a">
    <xsl:param name="fechaNotificacion"/>
    <xsl:param name="receptor"/>
    <xsl:param name="idReceptor"/>
    <xsl:param name="agente"/>
    <xsl:param name="formaNotificacion"/>
    <xsl:param name="motivoNoNotificacion"/>
    <xsl:param name="observacion"/>
    
    
	<xsl:output method="html"/>
	<xsl:decimal-format name="guarani" NaN="-" decimal-separator="," grouping-separator="."/>
	<!-- shape constructor -->
    
    <xsl:template name="notificacionDocumento">
            
        <table class="principal">
            <tbody>
                <tr>
                    <td style="height: 20px">
                        <table>
                            <tbody>
                                <tr>
                                    <td class="etiqueta"> Fecha:</td>
                                    <td>
                                        <p class="etiqueta" align="left">
                                            <input size="21" style="width: 174px; height: 22px"><xsl:attribute name="disabled">true</xsl:attribute><xsl:attribute name="value"><xsl:value-of select="$fechaNotificacion"/></xsl:attribute></input>
                                        </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tbody>
                                <tr>
                                    <td class="etiqueta">
                                        <p> Firma Receptor:</p>
                                        <p> Aclaración: 
                                            <input size="26" style="width: 207px; height: 22px"/>
                                            <xsl:if test="$receptor">
                                                <xsl:attribute name="value"><xsl:value-of select="$receptor"/></xsl:attribute>
                                                <xsl:attribute name="disabled">true</xsl:attribute>
                                            </xsl:if>
                                            <br/>
                                        </p>
                                        <p> C.I.: 
                                            <input size="30" style="width: 240px; height: 22px"/>
                                        </p>
                                        <xsl:if test="$idReceptor">
                                            <xsl:attribute name="value"><xsl:value-of select="$idReceptor"/></xsl:attribute>
                                            <xsl:attribute name="disabled">true</xsl:attribute>
                                        </xsl:if>
                                        <p> </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="etiqueta">
                                        <p> Firma Agente Notificador:</p>
                                        <p> Aclaración: 
                                            <input size="26" style="width: 205px; height: 22px"/>
                                        </p>
                                        <xsl:if test="$agente">
                                            <xsl:attribute name="value"><xsl:value-of select="$agente"/></xsl:attribute>
                                            <xsl:attribute name="disabled">true</xsl:attribute>
                                        </xsl:if>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset>
                            <legend class="seccion">Tipo Notificación</legend>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="etiqueta"> POR CORREO</td>
                                        <td>     
                                            <input disabled="1" type="checkbox" value="on"/>
                                            <xsl:if test="$formaNotificacion='POR CORREO' ">
                                                <xsl:attribute name="checked">
                                                    true
                                                </xsl:attribute>
                                            </xsl:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="etiqueta"> PERSONAL</td>
                                        <td>     
                                            <input disabled="1" type="checkbox" value="on"/>
                                            <xsl:if test="$formaNotificacion='PERSONAL' ">
                                                <xsl:attribute name="checked">
                                                    true
                                                </xsl:attribute>
                                            </xsl:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="etiqueta"> EDICTO</td>
                                        <td>     
                                            <input disabled="1" type="checkbox" value="on"/>
                                            <xsl:if test="$formaNotificacion='EDICTO' ">
                                                <xsl:attribute name="checked">
                                                    true
                                                </xsl:attribute>
                                            </xsl:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="etiqueta"> PERIODICO</td>
                                        <td>     
                                            <input disabled="1" type="checkbox" value="on"/>
                                            <xsl:if test="$formaNotificacion='PERIODICO' ">
                                                <xsl:attribute name="checked">
                                                    true
                                                </xsl:attribute>
                                            </xsl:if>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tbody>
                                <tr>
                                    <td class="etiqueta"> Mudanza de Domicilio</td>
                                    <td>     
                                        <input disabled="1" type="checkbox" value="on"/>
                                        <xsl:if test="$motivoNoNotificacion='MUDANZA' ">
                                            <xsl:attribute name="checked">
                                                true
                                            </xsl:attribute>
                                        </xsl:if>
                                    </td>
                                    <td class="etiqueta"> No hay Número</td>
                                    <td>     
                                        <input disabled="1" type="checkbox" value="on"/>
                                        <xsl:if test="$motivoNoNotificacion='NO HAY NUMERO' ">
                                            <xsl:attribute name="checked">
                                                true
                                            </xsl:attribute>
                                        </xsl:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="etiqueta"> Fallecimiento</td>
                                    <td>     
                                        <input disabled="1" type="checkbox" value="on"/>
                                        <xsl:if test="$motivoNoNotificacion='FALLECIMIENTO' ">
                                            <xsl:attribute name="checked">
                                                true
                                            </xsl:attribute>
                                        </xsl:if>
                                    </td>
                                    <td class="etiqueta"> Desconocido</td>
                                    <td>     
                                        <input disabled="1" type="checkbox" value="on"/>
                                        <xsl:if test="$motivoNoNotificacion='DESCONOCIDO' ">
                                            <xsl:attribute name="checked">
                                                true
                                            </xsl:attribute>
                                        </xsl:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="etiqueta"> No existe Domicilio</td>
                                    <td>     
                                        <input disabled="1" type="checkbox" value="on"/>
                                        <xsl:if test="$motivoNoNotificacion='NOEXISTEDOMICILIO' ">
                                            <xsl:attribute name="checked">
                                                true
                                            </xsl:attribute>
                                        </xsl:if>
                                    </td>
                                    <td class="etiqueta"> Rechazado</td>
                                    <td>     
                                        <input disabled="1" type="checkbox" value="on"/>
                                        <xsl:if test="$motivoNoNotificacion='RECHAZADO' ">
                                            <xsl:attribute name="checked">
                                                true
                                            </xsl:attribute>
                                        </xsl:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="etiqueta"> Cerrado</td>
                                    <td>     
                                        <input disabled="1" type="checkbox" value="on"/>
                                        <xsl:if test="$motivoNoNotificacion='CERRADO' ">
                                            <xsl:attribute name="checked">
                                                true
                                            </xsl:attribute>
                                        </xsl:if>
                                    </td>
                                    <td class="etiqueta"> Otro</td>
                                    <td>     
                                        <input disabled="1" type="checkbox" value="on"/>
                                        <xsl:if test="$motivoNoNotificacion='OTRO' ">
                                            <xsl:attribute name="checked">
                                                true
                                            </xsl:attribute>
                                        </xsl:if>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset style="width: 595px; height: 59px">
                            <legend class="seccion">Observaciones</legend>
                            <xsl:if test="$observacion">
                                <textarea rows="10" cols="100">
                                    <xsl:value-of select="$observacion"/>
                                </textarea>
                            </xsl:if>
                        </fieldset>
                    </td>
                </tr>
            </tbody>
        </table>
        
        </xsl:template>
    
	<xsl:template name="cabeceraDocumentoInterno">
		<xsl:param name="pDependencia"/>
		<xsl:param name="pDocumento"/>
		<xsl:param name="pNumero"/>
		<xsl:param name="pFecha"/>
		<link href="../../style/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
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
			<link href="../../style/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
			<table class="principal">
				<tbody>
					<xsl:for-each select="documento/firma">
						<xsl:variable name="filaActual" select="position()"/>
						<tr>
							<xsl:choose>
								<xsl:when test="position() mod 2 = 0">
									<td class="datos" style="text-align: center">
										<br></br>
										<p>
											<xsl:value-of select="../firma[position() = $filaActual - 1]/nombreFirma"/>
										</p>
										<p style="border-right: 0px; font-weight: 700; font-size: 10px;  font-family: verdana">
											<xsl:value-of select="../firma[position() = $filaActual - 1]/cargoFirma"/>
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
								<xsl:when test="position()  = count(../firma)">

									<td colspan="2" class="datos" style="text-align: center">
										<br></br>
										<p>
											<xsl:value-of select="nombreFirma"/>
										</p>
										<p>
											<strong>
												<xsl:value-of select="cargoFirma"/>
											</strong>
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

   <xsl:template name="pieDeclaraciones">
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
					<table class="declaracion" width="640" border="0">
						<tbody>
							<tr>
								<td class="borde" colSpan="2" style="height: 30px">El que suscribe </td>
							</tr>
							<tr>
								<td class="borde" style="height: 30px">en su carácter de </td>
								<td class="borde">con Documento No. </td>
							</tr>
							<tr>
								<td class="borde" colSpan="2" style="height: 30px">
									<p align="justify">declara que los datos consignados en el formulario son correctos y verdaderos y han sido confeccionados sin omitir dato alguno.</p>
								</td>
							</tr>
							<tr>
								<td class="borde" colSpan="2" style="height: 30px">
									<p align="justify">Lugar:_______________________________, fecha(dd/mm/Año):____/____/_______.</p>
								</td>
							</tr>
							<tr>
								<td class="borde" colSpan="2" style="height: 30px">
									<p align="justify">Señor Contribuyente: Le recordamos que los pagos que efectúe, sean emergentes de esta declaración o por cualquier otro concepto, serán imputados en su cuenta corriente conforme a lo señalado en el Art. 162 de la Ley No. 125/91</p>
								</td>
							</tr>
							<tr>
								<td class="borde" vAlign="bottom" align="center" width="50%" style="border-bottom-color: white">_______________________________________</td>
								<td class="borde" vAlign="top" align="center" style="border-bottom-color: white; height: 120px">CERTIFICACION O SELLO DE RECEPCION </td>
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
<xsl:template name="pieDeclaracionesInformativa">
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
					<table class="declaracion" width="640" border="0">
						<tbody>
							<tr>
								<td class="borde" colSpan="2" style="height: 30px">El que suscribe </td>
							</tr>
							<tr>
								<td class="borde" style="height: 30px">en su carácter de </td>
								<td class="borde">con Documento No. </td>
							</tr>
							<tr>
								<td class="borde" colSpan="2" style="height: 30px">
									<p align="justify">declara que los datos consignados en el formulario son correctos y verdaderos y han sido confeccionados sin omitir dato alguno.</p>
								</td>
							</tr>
							<tr>
								<td class="borde" colSpan="2" style="height: 30px">
									<p align="justify">Lugar:_______________________________, fecha(dd/mm/Año):____/____/_______.</p>
								</td>
							</tr>
							<tr>
								<td class="borde" vAlign="bottom" align="center" width="50%" style="border-bottom-color: white">_______________________________________</td>
								<td class="borde" vAlign="top" align="center" style="border-bottom-color: white; height: 120px">CERTIFICACION O SELLO DE RECEPCION </td>
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
	<xsl:template name="notificacion">
		<xsl:param name="pFechaNotificacion"/>
		<link href="../../style/css/documentos.css" type="text/css" rel="StyleSheet"/>
		<table width="640" class="declaracion1">
  <tr>
    <td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-1.gif" width="4" height="4"/></td>
    <td class="fondo"></td>
    <td align="right" valign="bottom"><img src="../../style/images/top-r-1.gif" width="4" height="4"/></td>
  </tr>
  <tr>
    <td width="1" align="left" valign="top" class="fondo"></td>
    <td width="636" valign="top"><table class="declaracion" width="640" border="0">
               <tbody>
                       <tr>
                               <td colSpan="2" class="borde" style="height:30px">El que suscribe </td>
                       </tr>
                       <tr>
                               <td class="borde" style="height:30px">en su carcter de </td>
                               <td class="borde">con Documento No. </td>
                       </tr>
                       <tr>
                               <td colSpan="2" class="borde" style="height:30px">
                                       <p align="justify">declara que los datos consignados en el formulario
son correctos y verdaderos y han sido confeccionados sin omitir dato
alguno.</p>
                         </td>
                       </tr>
                       <tr>
                               <td colSpan="2" class="borde" style="height:30px">
                                       <p align="justify">Lugar:_______________________________,
fecha(dd/mm/ao):____/____/_______.</p>
                         </td>
                       </tr>
                       <tr>
                               <td width="50%" align="center" vAlign="bottom" class="borde" style="border-bottom-color: white">_______________________________________</td>
                               <td align="center" vAlign="top" class="borde" style="border-bottom-color: white; height: 120px">CERTIFICACION O SELLO DE RECEPCION </td>
                       </tr>
                       <tr style="border-top: 0px">
                               <td vAlign="bottom" align="center" class="borde">Firma</td>
                               <td vAlign="bottom" align="center" class="borde"/>
                       </tr>
               </tbody>
       </table></td>
    <td width="1" align="right" valign="top" class="fondo"></td>
  </tr>
  <tr>
    <td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-1.gif" width="4" height="4"/></td>
    <td class="fondo"></td>
    <td align="right" valign="bottom"><img src="../../style/images/bot-r-1.gif" width="4" height="4"/></td>
  </tr>
</table>
	</xsl:template>
    <xsl:template name="cabeceraDeclaracionesDeclarativa"><xsl:param name="pImpuesto"/><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pNumero"/><xsl:param name="pPeriodo"/><xsl:param name="pRuc"/><xsl:param name="pDv">1</xsl:param><xsl:param name="pPrimerApellido"/><xsl:param name="pSegundoApellido"/><xsl:param name="pNombres"/><xsl:param name="pRectificativa"/><xsl:param name="pNumeroRectifica"/><xsl:param name="pModo"/>
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
                <td rowSpan="6" style="width: 15%" class="borde">
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
						<font face="Arial" size="6"><xsl:value-of select="$pFormulario"/></font></b><br/><b>
					</b></p>
                </td>
                <td class="borde" colSpan="8" align="center" style="font-size: 8px; width: 48%; font-family: verdana">PARA LLENAR LEA EL INSTRUCTIVO DISPONIBLE EN LA WEB</td>
                <td class="borde" colSpan="3" align="center" style="font-size: 8px; width: 37%; font-family: verdana">LOS IMPORTES SE CONSIGNARAN SIN CENTIMOS </td>
            </tr>
            <tr>
                <td class="borde" colSpan="8">Número de Orden 
                    <xsl:choose>
                        <xsl:when test="$pModo='1' or $pModo='2'">
                          <!--    <xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/numeroDocumento"/> </xsl:with-param></xsl:call-template> -->
                            <xsl:call-template name="itemNumeroOrden">
								<xsl:with-param name="pNombre">numeroDocumento</xsl:with-param>
								<xsl:with-param name="pValor"> </xsl:with-param>
							</xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$pModo='0'">
                        <xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="0"/> </xsl:with-param></xsl:call-template>
                    </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor"> </xsl:with-param></xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td class="borde" colSpan="2" align="left">RUC 
                    <xsl:choose>
                        <xsl:when test="$pModo='1'">
                            <xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/ruc"/> </xsl:with-param></xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$pModo='0' or $pModo='2'">
                        <xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRuc"/> </xsl:with-param></xsl:call-template> 
                    </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRuc"/> </xsl:with-param></xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td class="borde" align="center" width="1%">DV 
                    <xsl:choose>
                        <xsl:when test="$pModo='1'">
                            <xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/dv"/> </xsl:with-param></xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$pModo='0' or $pModo='2'">
                        <xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pDv"/> </xsl:with-param></xsl:call-template> 
                    </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"></xsl:with-param></xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
            <tr>
                <td class="borde" colSpan="8" align="center">Razón Social/Primer Apellido </td>
                <td class="borde" colSpan="3" align="center">Segundo Apellido </td>
            </tr>
            <tr>
                <td class="borde" colSpan="8" align="center">
                        <xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">primerApellido</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pPrimerApellido"/> </xsl:with-param></xsl:call-template>
                </td>
                <td class="borde" colSpan="3" align="center">
                        <xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">segundoApellido</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pSegundoApellido"/> </xsl:with-param></xsl:call-template>
                </td>
            </tr>
            <tr>
                <td class="borde">01 </td>
                <td class="borde">1</td>
                <td class="borde" width="1%">
                    <xsl:choose>
                        <xsl:when test="$pModo='1'">
                            <xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C1"/> </xsl:with-param></xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$pModo='0'">
                        <xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="1"/> </xsl:with-param></xsl:call-template>
                    </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="0"/> </xsl:with-param></xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td class="borde">Declaración Jurada Original </td>
                <td class="borde">02</td>
                <td class="borde">2</td>
                <td class="borde">
                    <xsl:choose>
                        <xsl:when test="$pModo='1'">
                            <xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C2</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C2"/> </xsl:with-param></xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$pModo='0'">
                        <xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C2</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="2"/> </xsl:with-param></xsl:call-template>
                    </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="0"/> </xsl:with-param></xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td class="borde">Declaración Jurada Rectificativa</td>
                <td class="borde" width="1%">03</td>
                <td class="borde" align="left">Número de Orden Declaración que rectifica</td>
                <td class="borde">
                    <xsl:choose>
                        <xsl:when test="$pModo='1'">
                            <xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C3"/> </xsl:with-param></xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$pModo='0' or $pModo='2'">
                        <xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRectificativa"/> </xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="0"/></xsl:with-param></xsl:call-template>
                    </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRectificativa"/> </xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="0"/></xsl:with-param></xsl:call-template>
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
	<xsl:template name="cabeceraDeclaraciones"><xsl:param name="pImpuesto"/><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pNumero"/><xsl:param name="pPeriodo"/><xsl:param name="pRuc"/><xsl:param name="pDv"></xsl:param><xsl:param name="pPrimerApellido"/><xsl:param name="pSegundoApellido"/><xsl:param name="pNombres"/><xsl:param name="pRectificativa"/><xsl:param name="pNumeroRectifica"/><xsl:param name="pModo"/><xsl:param name="pRubro"/>
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
								<td class="borde" rowSpan="6" style="width: 15%">
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
						<font face="Arial" size="6"><xsl:value-of select="$pFormulario"/></font></b><br/><b>
					</b>
					<font face="Arial" size="4"><xsl:value-of select="$pRubro"/></font>								
					</p>
								</td>
								<td class="borde" colSpan="3" align="center" style="font-size: 8px; width: 68%; font-family: verdana">PARA LLENAR LEA INSTRUCTIVO DISPONIBLE EN LA WEB</td>
								<td class="borde" colSpan="8" align="center" style="font-size: 8px; width: 30%; font-family: verdana">LOS IMPORTES SE CONSIGNARAN SIN CENTIMOS</td>
							</tr>
							<tr>
								<td class="borde" colSpan="3">Número de Orden 
									<xsl:choose>
										<xsl:when test="$pModo='1' or $pModo='2'">
								<xsl:call-template name="itemNumeroOrden">
									<xsl:with-param name="pNombre">numeroDocumento</xsl:with-param>
									<xsl:with-param name="pValor">
										<xsl:value-of select="0"/>
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
													<xsl:value-of select="0"/>
												</xsl:with-param>
									</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="borde" colSpan="7" align="left" width="1%">RUC 
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
											<xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pRuc"/>
									</xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="borde" align="center" width="40%">DV 
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
											<xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"></xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="borde" colSpan="3" align="center">Razón Social/Primer Apellido</td>
								<td class="borde" colSpan="8" align="center">Segundo Apellido</td>
							</tr>
							<tr>
								<td class="borde" colSpan="3" align="center">
									<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">primerApellido</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pPrimerApellido"/> 
									</xsl:with-param></xsl:call-template>
								</td>
								<td class="borde" colSpan="8" align="center">
									<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">segundoApellido</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pSegundoApellido"/>
									</xsl:with-param></xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="borde" colSpan="3" align="left">Nombres
									<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">nombre</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pNombres"/>
									</xsl:with-param></xsl:call-template>	
								</td>
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
											<xsl:call-template name="itemCheck"><xsl:with-param name="pModo">
										<xsl:value-of select="$pModo"/>
									</xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="0"/>
									</xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="borde">Declaración Jurada Original</td>
								<td class="borde" width="1px">02</td>
								<td class="borde" width="1px">2</td>
								<td class="borde" width="1px">
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
											<xsl:call-template name="itemCheck"><xsl:with-param name="pModo">
											<xsl:value-of select="$pModo"/>
										</xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor">
											<xsl:value-of select="0"/>
										</xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="borde">Declaración Jurada Rectificativa</td>
							</tr>
							<tr>
								<td class="borde" width="1%">03</td>
								<td class="borde" align="left">Número de Orden Declaración que rectifica</td>
								<td class="borde">
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
											<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pRectificativa"/>
									</xsl:with-param><xsl:with-param name="pModo">
										<xsl:value-of select="0"/>
									</xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="borde">04</td>
								<td class="borde" colSpan="3" align="center">Período Fiscal</td>
								<td class="borde" colSpan="4" align="center">
									<xsl:choose>
										<xsl:when test="$pModo='1' or $pModo='2'">
								<xsl:call-template name="itemPeriodo">
									<xsl:with-param name="pValor">
										<xsl:choose>
						                    <xsl:when test="$pPeriodo > 0">
						       					<xsl:value-of select="$pPeriodo"/>
						                    </xsl:when>
						                    <xsl:otherwise>
						       					<xsl:value-of select="declaracion/detalle/C4"/>
						                    </xsl:otherwise>
										</xsl:choose>                                     
									</xsl:with-param>
									<xsl:with-param name="pNombre">C4</xsl:with-param>
                  <xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param>
								</xsl:call-template>
							</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="itemPeriodo"><xsl:with-param name="pModo">
										<xsl:value-of select="$pModo"/>
									</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pPeriodo"/>
									</xsl:with-param><xsl:with-param name="pNombre">C4</xsl:with-param></xsl:call-template>
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
<xsl:template name="cabeceraDeclaracionesOcasional"><xsl:param name="pImpuesto"/><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pNumero"/><xsl:param name="pPeriodo"/><xsl:param name="pRuc"/><xsl:param name="pDv"></xsl:param><xsl:param name="pPrimerApellido"/><xsl:param name="pSegundoApellido"/><xsl:param name="pNombres"/><xsl:param name="pRectificativa"/><xsl:param name="pNumeroRectifica"/><xsl:param name="pModo"/>
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
								<td class="borde" rowSpan="4" style="width: 15%">
									<p align="center" size="15">
										<font size="5">
											<img hspace="0" src="../../style/images/cabecera-set.gif" align="baseline" border="0"/>
										</font>
									</p>
									<p align="center">
									<font face="Arial" size="0">
										<xsl:value-of select="$pImpuesto"/>
										</font>
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
								<td class="borde" align="center" style="font-size: 8px; width: 42%; font-family: verdana">PARA LLENAR LEA INSTRUCTIVO DISPONIBLE EN LA WEB</td>
								<td class="borde" colSpan="2" align="center" style="font-size: 8px; font-family: verdana">LOS IMPORTES SE CONSIGNARAN SIN CENTIMOS</td>
							</tr>
							<tr>
								<td class="borde">Número de Orden 
									<xsl:choose>
										<xsl:when test="$pModo='1' or $pModo='2'">
								<xsl:call-template name="itemNumeroOrden">
									<xsl:with-param name="pNombre">numeroDocumento</xsl:with-param>
									<xsl:with-param name="pValor">
										<xsl:value-of select="0"/>
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
											<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor">
									</xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="borde" colSpan="2">RUC 
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
											<xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pRuc"/>
									</xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose> DV 
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
											<xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"></xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="borde">Razón Social/Primer Apellido 
									<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">primerApellido</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pPrimerApellido"/>
									</xsl:with-param></xsl:call-template>
								</td>
								<td class="borde" colSpan="2">Segundo Apellido 
									<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">segundoApellido</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pSegundoApellido"/>
									</xsl:with-param></xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="borde">Nombres 
									<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">nombre</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pNombres"/>
									</xsl:with-param></xsl:call-template>
								</td>
								<td class="borde">04</td>
								<td class="borde" align="center">Fecha 
									<xsl:choose>
										<xsl:when test="$pModo='1' or $pModo='2'">
								<xsl:call-template name="itemPeriodo">
									<xsl:with-param name="pValor">
										<xsl:choose>
						                    <xsl:when test="$pPeriodo > 0">
						       					<xsl:value-of select="$pPeriodo"/>
						                    </xsl:when>
						                    <xsl:otherwise>
						       					<xsl:value-of select="declaracion/detalle/C4"/>
						                    </xsl:otherwise>
										</xsl:choose>                                     
									</xsl:with-param>
									<xsl:with-param name="pNombre">C4</xsl:with-param>
                  <xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param>
								</xsl:call-template>
							</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="itemPeriodo"><xsl:with-param name="pModo">
										<xsl:value-of select="$pModo"/>
									</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pPeriodo"/>
									</xsl:with-param><xsl:with-param name="pNombre">C4</xsl:with-param></xsl:call-template>
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
	<xsl:template name="cabeceraDeclaracionesClausura"><xsl:param name="pImpuesto"/><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pNumero"/><xsl:param name="pPeriodo"/><xsl:param name="pRuc"/><xsl:param name="pDv"></xsl:param><xsl:param name="pPrimerApellido"/><xsl:param name="pSegundoApellido"/><xsl:param name="pNombres"/><xsl:param name="pRectificativa"/><xsl:param name="pNumeroRectifica"/><xsl:param name="pModo"/>
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
											<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor">
									</xsl:with-param></xsl:call-template>
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
											<xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pRuc"/>
									</xsl:with-param></xsl:call-template>
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
											<xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"></xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="borde" colSpan="4">Razón Social/Primer Apellido 
									<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">primerApellido</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pPrimerApellido"/>
									</xsl:with-param></xsl:call-template>
								</td>
								<td class="borde" colSpan="4">Segundo Apellido 
									<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">segundoApellido</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pSegundoApellido"/>
									</xsl:with-param></xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="borde" colSpan="8">Nombres 
									<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">nombre</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pNombres"/>
									</xsl:with-param></xsl:call-template>
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
											<xsl:call-template name="itemCheck"><xsl:with-param name="pModo">
										<xsl:value-of select="$pModo"/>
									</xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="0"/>
									</xsl:with-param></xsl:call-template>
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
											<xsl:call-template name="itemCheck"><xsl:with-param name="pModo">
											<xsl:value-of select="$pModo"/>
										</xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor">
											<xsl:value-of select="0"/>
										</xsl:with-param></xsl:call-template>
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
											<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pRectificativa"/>
									</xsl:with-param><xsl:with-param name="pModo">
										<xsl:value-of select="0"/>
									</xsl:with-param></xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="borde" vAlign="top">05</td>
								<td class="borde" vAlign="top">5</td>
								<td class="borde" vAlign="top">
									<xsl:choose>
										<xsl:when test="$pModo='1'">
								<xsl:call-template name="itemCheck">
									<xsl:with-param name="pModo">
										<xsl:value-of select="$pModo"/>
									</xsl:with-param>
									<xsl:with-param name="pNombre">C5</xsl:with-param>
									<xsl:with-param name="pValor">
										<xsl:value-of select="declaracion/detalle/C5"/>
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
											<xsl:call-template name="itemCheck"><xsl:with-param name="pModo">
										<xsl:value-of select="$pModo"/>
									</xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="0"/>
									</xsl:with-param></xsl:call-template>
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
						                    <xsl:when test="$pPeriodo > 0">
						       					<xsl:value-of select="$pPeriodo"/>
						                    </xsl:when>
						                    <xsl:otherwise>
						       					<xsl:value-of select="declaracion/detalle/C4"/>
						                    </xsl:otherwise>
										</xsl:choose>                                     
									</xsl:with-param>
									<xsl:with-param name="pNombre">C4</xsl:with-param>
                  <xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param>
								</xsl:call-template>
							</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="itemPeriodo"><xsl:with-param name="pModo">
										<xsl:value-of select="$pModo"/>
									</xsl:with-param><xsl:with-param name="pValor">
										<xsl:value-of select="$pPeriodo"/>
									</xsl:with-param><xsl:with-param name="pNombre">C4</xsl:with-param></xsl:call-template>
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
    <xsl:template name="cabeceraDeclaracionesAnticipo"><xsl:param name="pImpuesto"/><xsl:param name="pFormulario"/><xsl:param name="pVersion"/><xsl:param name="pNumero"/><xsl:param name="pPeriodo"/><xsl:param name="pRuc"/><xsl:param name="pDv">1</xsl:param><xsl:param name="pPrimerApellido"/><xsl:param name="pSegundoApellido"/><xsl:param name="pNombres"/><xsl:param name="pRectificativa"/><xsl:param name="pNumeroRectifica"/><xsl:param name="pModo"/>
<table width="640" class="declaracion1">
  <tr>
    <td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-1.gif" width="4" height="4"/></td>
    <td class="fondo"></td>
    <td align="right" valign="bottom"><img src="../../style/images/top-r-1.gif" width="4" height="4"/></td>
  </tr>
  <tr>
    <td width="1" align="left" valign="top" class="fondo"></td>
    <td width="636" valign="top">     
	<table class="declaracion" width="640">
		<tbody>
			<tr>
				<td rowSpan="6" style="width: 15%" class="borde">
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
						<font face="Arial" size="6"><xsl:value-of select="$pFormulario"/></font></b><br/><b>
					</b></p>
				</td>
				<td class="borde" colSpan="8" align="center" style="font-size: 8px; width: 48%; font-family: verdana">PARA LLENAR LEA INSTRUCTIVO DISPONIBLE EN LA WEB</td>
				<td class="borde" colSpan="3" align="center" style="font-size: 8px; width: 37%; font-family: verdana">LOS IMPORTES SE CONSIGNARAN SIN CENTIMOS </td>
			</tr>
			<tr>
				<td colSpan="8" class="borde">Número de Orden 
					<xsl:choose>
						<xsl:when test="$pModo='1' or $pModo='2'">
							<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="0"/> </xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:when test="$pModo='0'">
						<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="0"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">numeroDocumento</xsl:with-param><xsl:with-param name="pValor"> </xsl:with-param></xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td colSpan="2" align="left" class="borde">RUC 
					<xsl:choose>
						<xsl:when test="$pModo='1'">
							<xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/ruc"/> </xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">
						<xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRuc"/> </xsl:with-param></xsl:call-template> 
					</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="itemRuc"><xsl:with-param name="pNombre">ruc</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRuc"/> </xsl:with-param></xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td align="center" width="1%" class="borde">DV 
					<xsl:choose>
						<xsl:when test="$pModo='1'">
							<xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/dv"/> </xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">
						<xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pDv"/> </xsl:with-param></xsl:call-template> 
					</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="itemDV"><xsl:with-param name="pNombre">dv</xsl:with-param><xsl:with-param name="pValor"></xsl:with-param></xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<tr>
				<td class="borde" colSpan="8" align="center">Razón Social/Primer Apellido </td>
				<td class="borde" colSpan="3" align="center">Segundo Apellido </td>
			</tr>
			<tr>
				<td class="borde" colSpan="8" align="center">
						<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">primerApellido</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pPrimerApellido"/> </xsl:with-param></xsl:call-template>
				</td>
				<td class="borde" colSpan="3" align="center">
						<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">segundoApellido</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pSegundoApellido"/> </xsl:with-param></xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="borde">01 </td>
				<td class="borde">1</td>
				<td class="borde" width="1%">
					<xsl:choose>
						<xsl:when test="$pModo='1'">
							<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C1"/> </xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:when test="$pModo='0'">
						<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="1"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="0"/> </xsl:with-param></xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="borde">Declaración Jurada Original </td>
				<td class="borde">02</td>
				<td class="borde">2</td>
				<td class="borde">
					<xsl:choose>
						<xsl:when test="$pModo='1'">
							<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C2</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C2"/> </xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:when test="$pModo='0'">
						<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C2</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="2"/> </xsl:with-param></xsl:call-template>
					</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="itemCheck"><xsl:with-param name="pModo"><xsl:value-of select="$pModo"/></xsl:with-param><xsl:with-param name="pNombre">C1</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="0"/> </xsl:with-param></xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="borde">Declaración Jurada Rectificativa</td>
				<td class="borde" width="1%">03</td>
				<td class="borde" align="left">Número de Orden Declaración que rectifica</td>
				<td class="borde">
					<xsl:choose>
						<xsl:when test="$pModo='1'">
							<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C3"/> </xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:when test="$pModo='0' or $pModo='2'">
						<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRectificativa"/> </xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="0"/></xsl:with-param></xsl:call-template>
					</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="itemNumeroOrden"><xsl:with-param name="pNombre">C3</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="$pRectificativa"/> </xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="0"/></xsl:with-param></xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</tbody>
	</table>
</td>
    <td width="1" align="right" valign="top" class="fondo"></td>
  </tr>
  <tr>
    <td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-1.gif" width="4" height="4"/></td>
    <td class="fondo"></td>
    <td align="right" valign="bottom"><img src="../../style/images/bot-r-1.gif" width="4" height="4"/></td>
  </tr>
</table>
</xsl:template>
	<xsl:template name="cabeceraDocumentoExterno">
		<xsl:param name="pFormulario"/>
		<xsl:param name="pVersion"/>
		<xsl:param name="pDependencia"/>
		<xsl:param name="pDocumento"/>
		<xsl:param name="pNumero"/>
		<xsl:param name="pFecha"/>
		<link href="../../style/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
		<table class="principal" width="100%" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
			<tbody>
				<tr>
					<td rowSpan="3" width="20%">
						<p align="center" size="15">
							<font size="5">
								<img hspace="0" src="../../style/images/cabecera-set.gif" align="baseline" border="0"/>
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

<xsl:template name="cabeceraParametrizada">
		<xsl:param name="pFormulario"/>
		<xsl:param name="pVersion"/>
		<xsl:param name="pDependencia"/>
		<xsl:param name="pDocumento"/>
		<xsl:param name="pNumero"/>
		<xsl:param name="pFecha"/>
		<link href="../../style/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
		<table class="principal" width="100%" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
			<tbody>
				<tr>
					<td rowSpan="3" width="20%">
						<p align="center" size="15">
							<font size="5">
								<img hspace="0" src="../../style/images/cabecera-set.gif" align="baseline" border="0"/>
							</font>
						</p>
						<p align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
							<xsl:value-of select="concat('FORM.',$pFormulario)"/>
							<xsl:value-of select="concat('-',$pVersion)"/>
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
						<xsl:value-of select="$pFecha"/>
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

<xsl:template name="cabeceraParametrizadaSinLogo">
		<xsl:param name="pFormulario"/>
		<xsl:param name="pVersion"/>
		<xsl:param name="pDependencia"/>
		<xsl:param name="pDocumento"/>
		<xsl:param name="pNumero"/>
		<xsl:param name="pFecha"/>
		<link href="../../style/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
		<table class="principal" width="100%" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
			<tbody>
				<tr>
					<td rowSpan="3" width="20%">
						
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
						<xsl:value-of select="$pFecha"/>
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


	<xsl:template name="cabeceraDocumentoExternoSN">
		<xsl:param name="pFormulario"/>
		<xsl:param name="pVersion"/>
		<xsl:param name="pDependencia"/>
		<xsl:param name="pDocumento"/>
		<xsl:param name="pFecha"/>
		<xsl:param name="pUsuario"/>
		<link href="../../style/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
		 <div class="areaimpresion">
         <a HREF="javascript:self.print()" class="contenido_areaimpresion"><img src="../../style/images/print.gif" alt="Imprimir" border="0"/>Imprimir este documento</a>
         <a HREF="javascript:window.close()" class="contenido_areaimpresion">Cerrar esta ventana</a>
    	 <hr></hr>
	    </div>	     
		<table class="principal" width="640" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
			<tbody>
				<tr>
					<td rowSpan="3" style="width: 20%">
						<p align="center" size="15">
							<font size="5">
								<img hspace="0" src="../../style/images/cabecera-set.gif" align="baseline" border="0"/>
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
					<td colspan="2" align="left" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
						<xsl:value-of select="$pDependencia"/>
					</td>
          <td align="right" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana">
            <xsl:value-of select="$pUsuario"/>
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
	<link href="../../style/css/bddocumentos.css" type="text/css" rel="StyleSheet"/>
	<div class="areaimpresion">
		<a class="contenido_areaimpresion" HREF="javascript:self.print()">
			<img alt="Imprimir" src="../../style/images/print.gif" border="0"/>Imprimir este documento 
		</a>
		<a class="contenido_areaimpresion" HREF="javascript:window.close()">Cerrar esta ventana</a>
		<hr/>
	</div>
	<table class="principal" width="640" style="border-right: 0px; border-top: 0px; ; border-left: 0px; border-bottom: #000066 1px solid">
		<tbody>
			<tr>
				<td rowSpan="3" style="width: 20%">
					<p align="center" size="15">
						<font size="5">
							<img hspace="0" src="../../style/images/cabecera-set.gif" align="baseline" border="0"/>
						</font>
					</p>
					<p align="center" style="border-right: 0px; font-weight: 700; font-size: 10px; color: #000066; font-family: verdana"> </p>
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
			<input type="text" readonly="true" maxlength="18" class="valornumero" AUTOCOMPLETE="off"><xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute><xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute><xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute><xsl:attribute name="onkeypress">
						<xsl:value-of select="$pFuncionOnKeyPress"/>
					</xsl:attribute><xsl:attribute name="value">
					    <xsl:choose>
						    <xsl:when test="$pValor > 0">
								<xsl:value-of select="format-number($pValor,'###.###','guarani')"/>
							</xsl:when>
						    <xsl:otherwise>
								<xsl:value-of select="$pValor"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute></input>
		</xsl:when>
		<xsl:when test="$pModo = 1">
				<input type="text" readonly="true" class="valornumero" AUTOCOMPLETE="off">
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
						<xsl:value-of select="format-number($pValor,'###.###','guarani')"/>
					</xsl:attribute>
				</input>
			</xsl:when>
		<xsl:otherwise>
			<input class="valornumero" AUTOCOMPLETE="off"><xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute><xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute><xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"></xsl:attribute></input>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template name="itemNumeroCorto"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
			<input type="text" maxlength="18" class="valornumeromediano" AUTOCOMPLETE="off"><xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute><xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute><xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute><xsl:attribute name="onkeypress">
						<xsl:value-of select="$pFuncionOnKeyPress"/>
					</xsl:attribute><xsl:attribute name="value">
					    <xsl:choose>
						    <xsl:when test="$pValor > 0">
								<xsl:value-of select="format-number($pValor,'###.###','guarani')"/>
							</xsl:when>
						    <xsl:otherwise>
								<xsl:value-of select="$pValor"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute></input>
		</xsl:when>
		<xsl:when test="$pModo = 1">
				<input type="text" class="valornumeromediano" AUTOCOMPLETE="off">
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
						<xsl:value-of select="format-number($pValor,'###.###','guarani')"/>
					</xsl:attribute>
				</input>
			</xsl:when>
		<xsl:otherwise>
			<input class="valornumeromediano" AUTOCOMPLETE="off"><xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute><xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute><xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"></xsl:attribute></input>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template name="itemActividadEconomica"><xsl:param name="pFuncionOnChange"></xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
			<input maxlength="6" class="valornumero" AUTOCOMPLETE="off"><xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute><xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute><xsl:attribute name="onchange">
						<xsl:value-of select="concat('esActividadEconomica(',$pNombre,');')"/>
					</xsl:attribute><xsl:attribute name="onkeypress">
						<xsl:value-of select="$pFuncionOnKeyPress"/>
					</xsl:attribute><xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute></input>
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
						<xsl:value-of select="format-number($pValor,'###.###','guarani')"/>
					</xsl:attribute>
				</input>
			</xsl:when>
		<xsl:otherwise>
			<input class="valornumero" AUTOCOMPLETE="off"><xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute><xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute><xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value"></xsl:attribute></input>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
	<xsl:template name="itemSelectProductos"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
			  <script type="text/javascript">		
    		    if (window.attachEvent) {
    		    window.attachEvent("onload", function(event) { <xsl:value-of select="concat('cargarProductos(&quot;',$pNombre,'&quot; , &quot;',$pValor,'&quot;)')"/> });
    		    } else {
    		    window.addEventListener("load", function(event) { <xsl:value-of select="concat('cargarProductos(&quot;',$pNombre,'&quot; ,  &quot;',$pValor,'&quot;)')"/>} , false);
    		    }                  
    		  </script>

				<select class="descripcion" style="font-size: 9px; font-family: arial">
    		    <!--xsl:attribute name="onclick">
    		      <xsl:value-of select="concat('cargarProductos','(this)')"/>
    		      </xsl:attribute-->		
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
				</select>
			</xsl:when>
		<xsl:when test="$pModo = 1">
			<script type="text/javascript">		
				if (window.attachEvent) {
				    window.attachEvent("onload", function(event) { <xsl:value-of select="concat('buscardescripcion(&quot;',$pNombre,'&quot;)')"/> });
				} else {
				    window.addEventListener("load", function(event) { <xsl:value-of select="concat('buscardescripcion(&quot;',$pNombre,'&quot;)')"/>} , false);
				}
				
			</script>
				<input class="descripcion" style="font-size: 9px; font-family: arial" AUTOCOMPLETE="off">
					<xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute>
				</input>
			</xsl:when>
		<xsl:otherwise><textarea>					<xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute>
					<xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute>
					<xsl:attribute name="readonly"/>
					<xsl:attribute name="value"></xsl:attribute>
				</textarea></xsl:otherwise>
	</xsl:choose>
</xsl:template>

	<xsl:template name="itemNumeroOrden"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
				<input class="valornumero">
				    <xsl:if test="$pNombre = 'numeroDocumento'">
					<xsl:attribute name="type">
						hidden
					</xsl:attribute>
			        <xsl:if test="$pValor = '0'">
						<xsl:attribute name="type">hidden</xsl:attribute>
					</xsl:if>

					</xsl:if> 
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
				</input>
			</xsl:when>
		<xsl:when test="$pModo = 1">
			<input class="valornumero"><xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute><xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute><xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute>
			<xsl:if test="$pValor = '0'">
						<xsl:attribute name="type">hidden</xsl:attribute>
			</xsl:if>
			</input>
		</xsl:when>
	</xsl:choose>
</xsl:template>

	<xsl:template name="itemPeriodo"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param><xsl:variable name="tamano" select="string-length($pValor)"/>
	<xsl:choose>
		<xsl:when test="$tamano = 4">
			<table style="; width: 120px">
				<tbody>
					<tr>
						<td class="borde" colSpan="4" align="center">Año</td>
					</tr>
					<xsl:choose>
						<xsl:when test="$pModo = '1' or $pModo = '2' or $pModo = '0'">
							<tr>
								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,1,1)"/>
								</td>
								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,2,1)"/>
								</td>
								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,3,1)"/>
								</td>
								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,4,1)"/>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</tbody>
			</table>
		</xsl:when>
		<xsl:when test="$tamano = 6">
			<table style="; width: 180px">
				<tbody>
					<tr>
						<td class="borde" colSpan="2" align="center" style="width: 60px">Mes</td>
						<td class="borde" colSpan="4" align="center" style="width: 120px">Año</td>
					</tr>
					<xsl:choose>
						<xsl:when test="$pModo = '1' or $pModo = '2' or $pModo = '0'">
							<tr>
								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,5,1)"/>
								</td>
								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,6,1)"/>
								</td>

								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,1,1)"/>
								</td>
								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,2,1)"/>
								</td>
								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,3,1)"/>
								</td>
								<td align="center" class="borde">
									<xsl:value-of select="substring($pValor,4,1)"/>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px"/>
								<td class="borde" align="center" style="width: 30px"/>
								<td class="borde" align="center" style="width: 30px"/>
								<td class="borde" align="center" style="width: 30px"/>
								<td class="borde" align="center" style="width: 30px"/>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</tbody>
			</table>
		</xsl:when>
		<xsl:when test="$tamano = 8">
			<table style="; width: 240px">
				<tbody>
					<tr>
						<td class="borde" colSpan="2" align="center">Día</td>
						<td class="borde" colSpan="2" align="center">Mes</td>
						<td class="borde" colSpan="4" align="center">Año</td>
					</tr>
					<xsl:choose>
						<xsl:when test="$pModo = '1' or $pModo = '2' or $pModo = '0'">
								<tr>
									<td align="center" class="borde">
										<xsl:value-of select="substring($pValor,7,1)"/>
									</td>
									<td align="center" class="borde">
										<xsl:value-of select="substring($pValor,8,1)"/>
									</td>
									<td align="center" class="borde">
										<xsl:value-of select="substring($pValor,5,1)"/>
									</td>
									<td align="center" class="borde">
										<xsl:value-of select="substring($pValor,6,1)"/>
									</td>
									<td align="center" class="borde">
										<xsl:value-of select="substring($pValor,1,1)"/>
									</td>
									<td align="center" class="borde">
										<xsl:value-of select="substring($pValor,2,1)"/>
									</td>
									<td align="center" class="borde">
										<xsl:value-of select="substring($pValor,3,1)"/>
									</td>
									<td align="center" class="borde">
										<xsl:value-of select="substring($pValor,4,1)"/>
									</td>
								</tr>
							</xsl:when>
						<xsl:otherwise>
							<tr>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
								<td class="borde" align="center" style="width: 30px">
									<br/>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</tbody>
			</table>
		</xsl:when>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
				<input type="hidden">
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
				</input>
			</xsl:when>
		<xsl:when test="$pModo = 1">
				<input type="hidden">
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
	</xsl:choose>
</xsl:template>
<xsl:template name="itemFechaVencimiento"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return mascaraWebInputDate(this,event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
				<input>
					<xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute>
					<xsl:attribute name="onchange">
						<xsl:value-of select="concat($pFuncionOnChange,';isDate(this.value,this)')"/>
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
				<input>
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
						<td colspan="2" class="borde" align="center">Día</td>
						<td colspan="2" class="borde" align="center">Mes</td>
						<td colspan="4" class="borde" align="center">Año</td>
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
<xsl:template name="itemFecha"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return mascaraWebInputDate(this,event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
				<input>
					<xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute>
					<xsl:attribute name="onchange">
						<xsl:value-of select="concat($pFuncionOnChange,';isDate(this.value,this)')"/>
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
				<input>
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
<xsl:template name="itemMesCierre"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
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
					<option value="12">Diciembre</option>
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
<xsl:template name="itemAnticipo"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param><xsl:param name="pAnticipoMaximo">4</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
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
					<xsl:if test="$pAnticipoMaximo >= '1'">
						<option value="1">1</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '2'">
						<option value="2">2</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '3'">
						<option value="3">3</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '4'">
						<option value="4">4</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '5'">
						<option value="5">5</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '6'">
						<option value="6">6</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '7'">
						<option value="7">7</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '8'">
						<option value="8">8</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '9'">
						<option value="9">9</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '10'">
						<option value="10">10</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '11'">
						<option value="11">11</option>
					</xsl:if>
					<xsl:if test="$pAnticipoMaximo >= '12'">
						<option value="12">12</option>
					</xsl:if>
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

	<xsl:template name="itemRuc"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
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
					<xsl:attribute name="onkeypress">
						<xsl:value-of select="$pFuncionOnKeyPress"/>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute>
				</input>
			</xsl:when>
		<xsl:when test="$pModo = 1">
			<input class="valornumero"><xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute><xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute><xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute></input>
		</xsl:when>
	</xsl:choose>
</xsl:template>


	<xsl:template name="itemDV"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyPress">return onKeyPressSoloNumeros(event);</xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0">
				<input class="valorDV">
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
				</input>
			</xsl:when>
		<xsl:when test="$pModo = 1 or $pModo = 2">
			<input class="valorDV"><xsl:attribute name="id">
						<xsl:value-of select="$pNombre"/>
					</xsl:attribute><xsl:attribute name="name">
						<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
					</xsl:attribute><xsl:attribute name="onchange">
						<xsl:value-of select="$pFuncionOnChange"/>
					</xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value">
						<xsl:value-of select="$pValor"/>
					</xsl:attribute></input>
		</xsl:when>
		<xsl:otherwise>
				<input class="valorDV">
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
				</input>
			</xsl:otherwise>
	</xsl:choose>
</xsl:template>

	<xsl:template name="itemTexto"><xsl:param name="pFuncionOnChange">Calcular(this.form)</xsl:param><xsl:param name="pFuncionOnKeyUp"></xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param>
	<input class="descripcion"><xsl:attribute name="id">
				<xsl:value-of select="$pNombre"/>
			</xsl:attribute><xsl:attribute name="name">
				<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
			</xsl:attribute><xsl:attribute name="onchange">
				<xsl:value-of select="$pFuncionOnChange"/>
			</xsl:attribute><xsl:attribute name="readonly"/><xsl:attribute name="value">
				<xsl:value-of select="$pValor"/>
			</xsl:attribute></input>
</xsl:template>

<xsl:template name="itemCheck"><xsl:param name="pFuncionOnChange">checkRectificativa(this.value)</xsl:param><xsl:param name="pFuncionOnKeyUp"></xsl:param><xsl:param name="pNombre"></xsl:param><xsl:param name="pValor"></xsl:param><xsl:param name="pModo">1</xsl:param><xsl:param name="pValorInicial"></xsl:param>
	<xsl:choose>
		<xsl:when test="$pModo = 0 ">
				<xsl:choose>
					<xsl:when test="$pValor = 1 ">
						<input type="checkbox">
							<xsl:attribute name="checked">
								<xsl:value-of select="true"/>
							</xsl:attribute>
							<xsl:attribute name="id">
								<xsl:value-of select="$pNombre"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
							</xsl:attribute>
							<xsl:attribute name="onclick">
								<xsl:value-of select="$pFuncionOnChange"/>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="$pValor"/>
							</xsl:attribute>
						</input>
					</xsl:when>
					<xsl:when test="$pValor = 2 ">
						<input type="checkbox">
							<xsl:attribute name="id">
								<xsl:value-of select="$pNombre"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
							</xsl:attribute>
							<xsl:attribute name="onclick">
								<xsl:value-of select="$pFuncionOnChange"/>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="$pValor"/>
							</xsl:attribute>
						</input>
					</xsl:when>
					<xsl:when test="$pValor = 5 ">
						<input type="checkbox">
							<xsl:attribute name="id">
								<xsl:value-of select="$pNombre"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
							</xsl:attribute>
							<xsl:attribute name="onclick">
								if (this.checked == true) {this.value = <xsl:value-of select="$pValor"/>} else {this.value = 0;};Calcular(this.form);
							</xsl:attribute>						
							<xsl:attribute name="value">
								0
							</xsl:attribute>
						</input>
					</xsl:when>
					<xsl:when test="$pValor = 3 ">
						<input type="checkbox">
							<xsl:attribute name="id">
								<xsl:value-of select="$pNombre"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
							</xsl:attribute>
							<xsl:attribute name="onclick">
								<xsl:value-of select="$pFuncionOnChange"/>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="$pValor"/>
							</xsl:attribute>
						</input>
					</xsl:when>
					<xsl:otherwise>
						<input type="checkbox">
							<xsl:attribute name="id">
								<xsl:value-of select="$pNombre"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
							</xsl:attribute>
							<xsl:attribute name="onclick">
								<xsl:value-of select="$pFuncionOnChange"/>
							</xsl:attribute>
							<xsl:attribute name="value">
								<xsl:value-of select="$pValorInicial"/>
							</xsl:attribute>
						</input>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		<xsl:when test="$pModo = 1 ">
				<xsl:choose>
					<xsl:when test="$pValor = 1 ">
						<input disabled="1" type="checkbox">
							<xsl:attribute name="checked">
								<xsl:value-of select="true"/>
							</xsl:attribute>
							<xsl:attribute name="id">
								<xsl:value-of select="$pNombre"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
							</xsl:attribute>
							<xsl:attribute name="onclick">
								<xsl:value-of select="$pFuncionOnChange"/>
							</xsl:attribute>
							<xsl:attribute name="readonly"/>
							<xsl:attribute name="value">
								<xsl:value-of select="$pValor"/>
							</xsl:attribute>
						</input>
					</xsl:when>
					<xsl:when test="$pValor = 2 ">
						<input disabled="1" type="checkbox">
							<xsl:attribute name="checked">
								<xsl:value-of select="true"/>
							</xsl:attribute>
							<xsl:attribute name="id">
								<xsl:value-of select="$pNombre"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
							</xsl:attribute>
							<xsl:attribute name="onclick">
								<xsl:value-of select="$pFuncionOnChange"/>
							</xsl:attribute>
							<xsl:attribute name="readonly"/>
							<xsl:attribute name="value">
								<xsl:value-of select="$pValor"/>
							</xsl:attribute>
						</input>
					</xsl:when>
					<xsl:when test="$pValor = 5 ">
						<input disabled="1" type="checkbox">
							<xsl:attribute name="checked">
								<xsl:value-of select="true"/>
							</xsl:attribute>
							<xsl:attribute name="id">
								<xsl:value-of select="$pNombre"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="concat('dynamicProps(',$pNombre,')')"/>
							</xsl:attribute>
							<xsl:attribute name="onclick">
								<xsl:value-of select="$pFuncionOnChange"/>
							</xsl:attribute>
							<xsl:attribute name="readonly"/>
							<xsl:attribute name="value">
								<xsl:value-of select="$pValor"/>
							</xsl:attribute>
						</input>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		<xsl:otherwise>
			<input disabled="1" type="checkbox" value="on"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
	<xsl:template match="/">
	<xsl:call-template name="cabeceraDeclaracionesOcasional"/>
</xsl:template>
</xsl:stylesheet>