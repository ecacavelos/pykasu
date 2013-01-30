<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="4.0" encoding="utf-8" />
  <xsl:template match="*">    
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template match="contribuyente">
    <html>
      <head>     
        <script>
          function eliminar_contribuyente() {          
              if(confirm("Realmente desea eliminar el contribuyente ?")){
                  setAccion('ELIMINAR');
              }
          }
          
   	function setAccion(evento){
   	    document.getElementById("accion").value=evento;
   	    document.getElementById("accion").click();
   	}          
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
        <link href="../../../style/base.css" rel="stylesheet" type="text/css"></link>
      </head>
      <body>
        
        <form id="thisForm" name="thisForm">
          <TABLE width="100%"  align="center" border="0" cellpadding="1" cellspacing="0">
            <TR>
              <td width="60%" valign="top">
                
               <xsl:if test="not(ruc='0')">
                <table width="400"  border="0" cellpadding="1" cellspacing="2">
                  <TR>
                    <TD colspan="2" align="center"  class="tituloSeccionPrincipal">
                      Datos del Contribuyente
                    </TD>
                  </TR>
                  <tr>
                    <td>
                      <br/>
                    </td>
                  </tr>
                  <TR>
                    <TD align="right">RUC:</TD>
                    <TD align="left" class="campo">
                      <xsl:value-of select="ruc"/>
                    </TD>
                  </TR>
                  <tr>
                    <TD align="right">Dígito Verificador:</TD>
                    <TD align="left" class="campo">
                      <xsl:value-of select="dv"/>
                    </TD>
                  </tr>
                  <TR>
                    <TD align="right">Nombre / Razón Social:</TD>
                    <TD align="left" class="campo">
                      <xsl:if test="tipo_contribuyente='FISICO' ">
                        <xsl:if test="not(primer_apellido='')">
                          <xsl:value-of select="primer_apellido"/><xsl:if test="not(segundo_apellido='')"><xsl:text> </xsl:text><xsl:value-of select="segundo_apellido"/></xsl:if>,
                            </xsl:if>
                      </xsl:if>
                       <xsl:value-of select="nombre"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD align="right">Tipo Contribuyente:</TD>
                    <TD align="left" class="campo">
                      <xsl:value-of select="tipo_contribuyente"/>
                    </TD>
                  </TR>
                </table>
               </xsl:if >                
                <xsl:if test="ruc='0'">
                  <table width="500" border="1" bordercolor="#CCCCCC" cellpadding="0" cellspacing="0">
                    <TR>
                      <TD colspan="3" align="center" bgcolor="#243376">
                        <font size="2"  style="font-family: sans-serif, Tahoma, Verdana, Arial, Helvetica; " color="#fdff9f"><b>Bienvenidos a Marangatu'i</b> </font>
                      </TD>
                    </TR>
                    <TR>
                   
                      <TD   colspan="3"  align="center"  bgcolor="#D1DEF0">                      
                        <font size="1" color="#0d4c91" style="Verdana, Tahoma, Arial; " >
                          <br/>
                          <div align="justify">
                            Este software ha sido creado por la Subsecretaría de Estado de Tributación, SET, para facilitarle la preparación de las declaraciones juradas. El software permite las siguientes funciones:
                            <br/>
                            <br/>                            
                            <ul>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1"> 
                                Registro de un nuevo contribuyente con el fin de incluirle una o más
                                declaraciones juradas. Puede registrar uno o mas contribuyentes.</span></font></li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Modificación
                                de los datos de contribuyentes que haya registrado</span></font>.</li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Eliminación
                                de contribuyentes registrados</span></font>.</li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Llenado
                                de formularios de declaraciones juradas para diferentes tipos de
                                impuesto para los contribuyentes que haya registrado.</span></font></li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1"> Registro,
                                cálculo y liquidación automáticos de los formularios</span></font>.</li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Consulta
                                de los instructivos.</span></font></li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Archivo
                                de las declaraciones procesadas.</span></font></li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Copia
                                de las declaraciones a medio magnético para su presentación a la
                                SET.</span></font></li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Impresión
                                de los formularios de declaraciones juradas.</span></font></li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Envío
                                de declaraciones a la SET a través de Internet para los contribuyentes
                                que posean clave de acceso.</span></font></li>
                              <li><font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Verificación
                                de actualizaciones y nuevas versiones de Marangatu'i </span></font><font color="#0d4c91" size="1" style="Verdana, Tahoma, Arial; ">.<br/>
                                </font></li>
                            </ul>
                          </div>
                        </font>
                      </TD>
                   
                    </TR>
                  </table>
                  <table width="500" border="1" bordercolor="#CCCCCC" cellpadding="0" cellspacing="0">
                    <TR>
                      <TD colspan="3" align="center" bgcolor="#243376">
                        <font size="1"  style="font-family: sans-serif, Tahoma, Verdana, Arial, Helvetica; " color="#ffffff"><b>OBSERVACIONES:</b> </font>
                      </TD>
                    </TR>
                    <TR>                      
                      <TD   colspan="3"  align="center"  bgcolor="#D1DEF0">                      
                        <font size="1" color="#0d4c91" style="Verdana, Tahoma, Arial; " >
                          <div align="justify">
                            <br/>                            
                            <ul>
                              <li>
                                <font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Asegúrese de utilizar una resolución mayor o igual a <b>1024x768</b> en su monitor.</span></font>
                              </li>
                              <li>
                                <font color="#0d4c91" style="Verdana, Tahoma, Arial; "><span class="style1">Para la impresión de formularios asegúrese de configurar la página con 
                                  el <b>tamaño de papel</b> adecuado, que debe ser el siguiente <b> 216mm x 330mm (equivalente a 8.5" x 13")</b>,  para ello le recomendamos utilizar la opciones de "configurar  página"  y "vista preliminar" en el menu de "Archivo" en la parte superior del sistema.
                                </span></font>
                              </li>
                            </ul>
                          </div>
                        </font>
                      </TD>                      
                    </TR>
                    </table>
                  </xsl:if>
              </td>
              <TD rowspan="1" valign="top">
                <table border="0" cellspacing="1" align="center" width="190">
                  <tr>
                    <td>
                      <br/>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <input type="button" class="botonMenu" onclick="setAccion('CREAR')"
                        value="Crear Contribuyente"/>
                    </td>
                  </tr>
                  <tr>
                    <td bgcolor="#b0c4de" class="campo"> Crea un nuevo contribuyente en el sistema,
                      para luego generar declaraciones.</td>
                  </tr>
                  <xsl:if test="ruc='0'">
                    <tr>
                      <td height="20" class="campo"> </td>
                    </tr>
                    <tr>
                      <td bgcolor="#b0c4de" class="campo"> Por favor elija un contribuyente en el menu principal de la izquierda para realizar otras operaciones.</td>
                    </tr>
                   </xsl:if>
                  <xsl:if test="not(ruc='0')">
                  <tr>
                    <td>
                      <input type="button" class="botonMenu" onclick="setAccion('MODIFICAR')"
                        value="Modificar  Contribuyente"/>
                    </td>
                  </tr>
                  <tr>
                    <td bgcolor="#b0c4de" class="campo"> Modifica los datos del contribuyente,
                      excepto el RUC y el Dígito Verificador.</td>
                  </tr>
                  <tr>
                    <td>
                      <input type="button" onclick="window.open('../../../sistema/boleta_de_pago.pdf', 'boletaPago','top=40,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,copyhistory=no');" class="botonMenu" value="Imprimir Boleta de Pago"/>
                    </td>
                  </tr>
                  <tr>
                    <td bgcolor="#b0c4de"  class="campo">Imprime una boleta de pago vacia, para que el contribuyente
                    pueda completarla a mano y acercarla a la Entidad Recaudadora Autorizada.</td>
                  </tr>
                  <tr>
                    <td>
                      <input type="button" class="botonMenu" onclick="eliminar_contribuyente();"
                        value="Eliminar  Contribuyente"/>
                    </td>
                  </tr>
                  <tr>
                    <td bgcolor="#b0c4de" class="campo">Elimina los datos de un contribuyente. Todas
                      las declaraciones del mismo también serán eliminadas.</td>
                  </tr>                    
                  <tr>
                    <td>
                      <br/>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <input type="button" class="botonMenu" onclick="setAccion('DECLARAR')"
                        value="   Crear Declaración    "/>
                    </td>
                  </tr>
                  <tr>
                    <td bgcolor="#b0c4de" class="campo">                    
                    Crea una nueva declaración para presentarla
                      ante la Subsecretaría de Estado de Tributacion o a la Entidad Recaudadora  Autorizada.
                      </td>
                  </tr>
                  </xsl:if>
                </table>
              </TD>
            </TR>
          </TABLE>

          <input type="hidden" id="accion" name="accion"/>
          <!--DATOS DEL CONTRIBUYENTE-->
          <input type="hidden" id="ruc" name="ruc"/>
          <input type="hidden" id="dv" name="dv"/>
          <input type="hidden" id="nombre" name="nombre"/>
          <input type="hidden" id="apellido" name="apellido"/>
          <input type="hidden" id="tipo" name="tipo"/>
        </form>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
