<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:param name="Ruc"></xsl:param>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <LINK rel="stylesheet" type="text/css" href="conf/style/menu.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
        <script>
	<xsl:comment>
	  function mostrarEsconder(id){
	      var elemento = document.getElementById(id);
	      if(elemento.style.display == 'none'){
	          elemento.style.display = '';
	      }else{
	          elemento.style.display = 'none';
	      }
	  }
	  
	  
          function expCh(){
        	 var e
         	 e = lastSelected;
        	 if (e.className=="lblSelected"){
        		while (e.tagName!="BODY"){
        			if (e.className=="e" &amp;&amp; e.children(0).children(0).innerText=="+") ch(e);
          		e=e.parentElement;
        		}
        	 }
	}
			
	function ch(e){ 
		mark=e.children(0).children(0); 
		if (mark.innerText=="+"){ 
			 mark.innerText="-"; 
			 for (var i=1;i&lt;e.children.length;i++) e.children(i).style.display="block"; 
		} else 
			if (mark.innerText=="-"){ 
					 mark.innerText="+"; 
					 for (var i=1;i&lt;e.children.length;i++) e.children(i).style.display="none"; 
		}
	}
	function h(){	window.status=" ";} 
	document.onclick=cl;
	var lastSelected='undefined';

	function cl(){
			e=window.event.srcElement;
		  if (e.className=="lbl"){
			if (lastSelected!='undefined') lastSelected.className='lbl';
			lastSelected=e;
			eventSrc.value=e.id;
			e.className = "lblSelected";
						
			eventSrc.click();
						
			return;}
			if (e.className!="c"){
						e=e.parentElement;
						if (e.className!="c"){return;}
			} 		 		
			e=e.parentElement; 
			if (e.className=="e") ch(e); 
	}
		
	  function getRucSeleccionado( ruc, rucAntiguo, dv, nombre, tipo_contribuyente, primer_apellido, segundo_apellido, mes_cierre ){	         
	    document.getElementById('rucSeleccionado').value = ruc;
	    document.getElementById('rucAntiguo').value = rucAntiguo;
	    document.getElementById('dv').value = dv;
	    document.getElementById('nombre').value = nombre;
	    document.getElementById('primer_apellido').value = primer_apellido;
	    document.getElementById('segundo_apellido').value = segundo_apellido;
	    document.getElementById('tipo_contribuyente').value = tipo_contribuyente;
	    document.getElementById('mes_cierre').value = mes_cierre;  
	}
	  
	  function mostrarEsteRuc(){
	      document.getElementById('rucSeleccionado').click();
	  }
	  
	  function verDeclaracion( periodo, formulario, obligacion, version ){
    	    document.getElementById('periodo').value = periodo;
    	    document.getElementById('formulario').value = formulario;
  	    document.getElementById('obligacion').value = obligacion;
	    document.getElementById('version').value = version;
    	    document.getElementById('verDeclaracion').click();
	  }
	  
	  function verDeclaracionReadOnly( periodo, formulario, obligacion, version, rectificativa ){	        
        	  document.getElementById('periodo').value = periodo;
        	  document.getElementById('formulario').value = formulario;
        	  document.getElementById('obligacion').value = obligacion;
        	  document.getElementById('version').value = version;
	         document.getElementById('rectificativa').value = rectificativa;
        	  document.getElementById('verDeclaracionEnviada').click();    	      
	  }
	  
	  function verDisco( disco ){
	    document.getElementById('disco').value = disco;
	    document.getElementById('verDisco').click();
	  }
	  
	  function desplegarRucActual(){
	     try{
	      document.getElementById('top<xsl:value-of select="$Ruc"/>').click();
  	    }catch(e){
  	    }
	  }
	</xsl:comment>
	</script>

      </HEAD>
      <BODY bgcolor="#ffffff" onload="desplegarRucActual();">
        <TABLE width="225px">

          <xsl:apply-templates select="arbol"/>

        </TABLE>

        <input type="hidden" id="rucSeleccionado" name="rucSeleccionado"/>
        <input type="hidden" id="rucAntiguo" name="rucAntiguo"/>        
        <input type="hidden" id="dv" name="dv"/>
        <input type="hidden" id="nombre" name="nombre"/>
        <input type="hidden" id="primer_apellido" name="primer_apellido"/>
        <input type="hidden" id="segundo_apellido" name="segundo_apellido"/>
        <input type="hidden" id="tipo_contribuyente" name="tipo_contribuyente"/>
        <input type="hidden" id="mes_cierre" name="mes_cierre"/>

        <input type="hidden" id="periodo" name="periodo"/>
        <input type="hidden" id="formulario" name="formulario"/>
        <input type="hidden" id="obligacion" name="obligacion"/>
        <input type="hidden" id="version" name="version"/>
        <input type="hidden" id="rectificativa" name="rectificativa"/>
        <input type="hidden" id="formularioSoloLectura" name="formularioSoloLectura"/>
        <input type="hidden" id="verDeclaracion" name="verDeclaracion"/>
        <input type="hidden" id="verDeclaracionEnviada" name="verDeclaracionEnviada"/>        
        
        <input type="hidden" id="disco" name="disco"/>
        <input type="hidden" id="verDisco" name="verDisco"/>

      </BODY>
    </HTML>
  </xsl:template>

  <xsl:template match="arbol">
    <tr>
      <td>
        <xsl:apply-templates select="contribuyente"/>
        <xsl:apply-templates select="discos"/>
        <xsl:apply-templates select="par"/>
        <input type="hidden" id="eventSrc" name="eventSrc"/>
        <br/>
        <br/>
        <br/>
        <input type="button" class="boton" id="propiedades" name="propiedades" value="Actualizar"/>
      </td>
    </tr>
  </xsl:template>


  <xsl:template match="contribuyente">    
    <div class="e" style="border-style: solid; border-top-width:2px; border-color:'#D1DEF0'; border-left-color: #999999; border-top-color: #999999" >
      <span class="c">
        <a href="#" class="masMenos" onfocus="h();">
          <xsl:attribute name="id">top<xsl:value-of select="ruc"/></xsl:attribute>
          +</a>
        <a class="lbl" href="#" nowrap="nowrap">
          <xsl:attribute name="id">ruc<xsl:value-of select="ruc"/></xsl:attribute>     
          <xsl:attribute name="onclick">getRucSeleccionado('<xsl:value-of select="ruc"/>','<xsl:value-of select="rucAntiguo"/>',
            '<xsl:value-of select="dv"/>' ,'<xsl:call-template name="replace-string"><xsl:with-param name="text"><xsl:value-of select="nombre"/></xsl:with-param><xsl:with-param name="replace">'</xsl:with-param><xsl:with-param name="with">\'</xsl:with-param></xsl:call-template>' ,'<xsl:value-of
            select="tipo_contribuyente"/>' ,'<xsl:call-template name="replace-string"><xsl:with-param name="text"><xsl:value-of select="primer_apellido"/></xsl:with-param><xsl:with-param name="replace">'</xsl:with-param><xsl:with-param name="with">\'</xsl:with-param></xsl:call-template>'
            ,'<xsl:call-template name="replace-string"><xsl:with-param name="text"><xsl:value-of select="segundo_apellido"/></xsl:with-param><xsl:with-param name="replace">'</xsl:with-param><xsl:with-param name="with">\'</xsl:with-param></xsl:call-template>'  , '<xsl:value-of select="mes_cierre"/>' ); mostrarEsteRuc()</xsl:attribute> RUC :
            <xsl:value-of select="ruc"/> DV : <xsl:value-of select="dv"/>
        </a>
      </span>
      
      <span style="BACKGROUND-COLOR:'#D1DEF0';display:none;padding-left:5px" >
        <img src="conf/imagenes/bandeja.gif" alt="Declaraciones en sucio(modificables)"></img>
        <a href="#">
          <xsl:attribute name="onclick">mostrarEsconder( 'decla<xsl:value-of select="ruc"/>')</xsl:attribute>
            <font class="declaracionTitulo">Declaraciones</font>
         </a>
        <div>          
          <span>
        <xsl:call-template name="declaraciones"/>
          </span>         
        <xsl:call-template name="enviados"/>
        </div>
      </span>
      
    </div>
  </xsl:template>

 
<!--
      *********************************************************************************
      *  Despliega las declaraciones todas las que pueden ser modificadas
      *********************************************************************************
-->
  <xsl:template name="declaraciones">
    
    <xsl:variable name="declaracionesVar">
      <xsl:for-each select="declaracion">
        <xsl:sort select="@formulario" data-type="number"/>
        <xsl:copy-of select="."/>
      </xsl:for-each>
    </xsl:variable>
   
    <xsl:variable name="contribuyenteActual" select="."/>
    <span style="text-indent:1em;">  
      <div >
        <xsl:attribute name="id">decla<xsl:value-of select="($contribuyenteActual)/ruc"/></xsl:attribute>
        <span >
         
        <xsl:for-each select="msxsl:node-set($declaracionesVar)/declaracion">      
          <xsl:if test="not( preceding-sibling::declaracion[1] )">
            <font class="formularioTitulo"><u> Formulario <b> <xsl:value-of select="@formulario"/> </b></u></font>
          </xsl:if>
          <xsl:if test="preceding-sibling::declaracion[1]">
            <xsl:if test="not( preceding-sibling::declaracion[1]/@formulario  = @formulario )">
              <font class="formularioTitulo"><u> Formulario <b><xsl:value-of select="@formulario"/> </b></u></font>            
              <!--xsl:value-of select="preceding-sibling::declaracion[1]/@formulario"/-->
            </xsl:if>        
          </xsl:if>
          <div class="e">
            <span class="c">
            
              <img src="conf/imagenes/icon-file.gif"/>
              <a class="periodo" href="#">                
                <xsl:attribute name="onclick"> getRucSeleccionado('<xsl:value-of select="($contribuyenteActual)/ruc"/>','<xsl:value-of select="($contribuyenteActual)/rucAntiguo"/>', 
                  '<xsl:value-of select="($contribuyenteActual)/dv"/>' ,'<xsl:call-template name="replace-string"><xsl:with-param name="text"><xsl:value-of select="($contribuyenteActual)/nombre"/></xsl:with-param><xsl:with-param name="replace">'</xsl:with-param><xsl:with-param name="with">\'</xsl:with-param></xsl:call-template>'
                 ,'<xsl:value-of select="($contribuyenteActual)/tipo_contribuyente"/>' ,'<xsl:call-template name="replace-string"><xsl:with-param name="text"><xsl:value-of
                    select="($contribuyenteActual)/primer_apellido"/></xsl:with-param><xsl:with-param name="replace">'</xsl:with-param><xsl:with-param name="with">\'</xsl:with-param></xsl:call-template>' ,'<xsl:call-template name="replace-string"><xsl:with-param name="text"><xsl:value-of select="($contribuyenteActual)/segundo_apellido"/></xsl:with-param><xsl:with-param name="replace">'</xsl:with-param><xsl:with-param name="with">\'</xsl:with-param></xsl:call-template>' ,'<xsl:value-of select="($contribuyenteActual)/mes_cierre"/>' );
                  verDeclaracion('<xsl:value-of select="@periodo"/>', '<xsl:value-of
                    select="@formulario"/>' , '<xsl:value-of select="@obligacion"/>','<xsl:value-of select="@version"/>' ); </xsl:attribute>
                
                Período: <xsl:if test="not(substring(@periodo, 7, 2 )='00')"><xsl:value-of select="substring(@periodo, 7, 2 )"/>/</xsl:if><xsl:if test="not(substring(@periodo, 5, 2 )='00')"><xsl:value-of select="substring(@periodo, 5,2 )"/>/</xsl:if><xsl:value-of select="substring(@periodo, 1, 4 )"/>( <xsl:value-of select="@obligacion"/>  )
              </a>
            </span>
            <span style="text-indent:3em;display:none">
              <xsl:apply-templates select="bdi"/>
            </span>
          </div>      
        </xsl:for-each>              
        </span>
      </div>
      </span>
  </xsl:template>

  <!--
    *********************************************************************************
    *  Despliega las declaraciones todas las que fueron enviadas via internet
    *********************************************************************************
  -->
  
  <xsl:template name="enviados">    
    <span style="text-indent:0em">
      <div>
       <img src="conf/imagenes/aceptados.jpg"/> 
      <a href="#">
        <xsl:attribute name="onclick">mostrarEsconder( 'enviados<xsl:value-of select="ruc"/>')</xsl:attribute>
        <font class="buzonTitulo"><u><b>Buzon de Enviados</b></u></font> 
      </a>  
      </div>
    </span>
    
    <xsl:variable name="declaracionesVar">
      <xsl:for-each select="enviados/declaracion">
        <xsl:sort select="@formulario" data-type="number"/>
        <xsl:copy-of select="."/>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="contribuyenteActual" select="."/>
    <div style="display:none; text-indent:1em;">
      <xsl:attribute name="id">enviados<xsl:value-of select="($contribuyenteActual)/ruc"/></xsl:attribute>
    <xsl:for-each select="msxsl:node-set($declaracionesVar)/declaracion">      
      <xsl:if test="not( preceding-sibling::declaracion[1] )">
        <font class="formularioTitulo"><u> Formulario <b> <xsl:value-of select="@formulario"/> </b></u></font>
      </xsl:if>
      <xsl:if test="preceding-sibling::declaracion[1]">
        <xsl:if test="not( preceding-sibling::declaracion[1]/@formulario  = @formulario )">
          <font class="formularioTitulo"><u> Formulario <b><xsl:value-of select="@formulario"/> </b></u></font>            
          <!--xsl:value-of select="preceding-sibling::declaracion[1]/@formulario"/-->
        </xsl:if>        
      </xsl:if>
      <div  class="e">
        <span  class="c">
          <xsl:if test="not(@R)" ><!--NO RECTIFICATIVA (declaracion inicial)-->
           <img src="conf/imagenes/icon-file.gif"/>
         </xsl:if>
          <xsl:if test="@R" ><!--RECTIFICATIVA (tiene otro icono)-->
            <img src="conf/imagenes/icon-file-R.gif"/>
          </xsl:if>  
          <a  class="periodo" href="#">
            
            <xsl:attribute name="onclick"> 
              getRucSeleccionado('<xsl:value-of select="($contribuyenteActual)/ruc"/>','<xsl:value-of select="rucAntiguo"/>',
              '<xsl:value-of select="($contribuyenteActual)/dv"/>' ,'<xsl:call-template name="replace-string"><xsl:with-param name="text"><xsl:value-of select="($contribuyenteActual)/nombre"/></xsl:with-param><xsl:with-param name="replace">'</xsl:with-param><xsl:with-param name="with">\'</xsl:with-param></xsl:call-template>'
             ,'<xsl:value-of select="($contribuyenteActual)/tipo_contribuyente"/>' ,'<xsl:call-template name="replace-string"><xsl:with-param name="text"><xsl:value-of select="($contribuyenteActual)/primer_apellido"/></xsl:with-param><xsl:with-param name="replace">'</xsl:with-param><xsl:with-param name="with">\'</xsl:with-param></xsl:call-template>' ,'<xsl:call-template name="replace-string"><xsl:with-param name="text"><xsl:value-of select="($contribuyenteActual)/segundo_apellido"/></xsl:with-param><xsl:with-param name="replace">'</xsl:with-param><xsl:with-param name="with">\'</xsl:with-param></xsl:call-template>' ,'<xsl:value-of select="($contribuyenteActual)/mes_cierre"/>' );
                  verDeclaracionReadOnly('<xsl:value-of select="@periodo"/>', '<xsl:value-of
                    select="@formulario"/>' , '<xsl:value-of select="@obligacion"/>','<xsl:value-of select="@version"/>' , '<xsl:value-of select="@R"/>'); 
            </xsl:attribute>            
            <xsl:if test="not(@R)" > Período:</xsl:if><xsl:if test="@R" > Rectif.(<xsl:value-of select="@R"/>):</xsl:if><xsl:if test="not(substring(@periodo, 7, 2 )='00')"><xsl:value-of select="substring(@periodo, 7, 2 )"/>/</xsl:if><xsl:if test="not(substring(@periodo, 5, 2 )='00')"><xsl:value-of select="substring(@periodo, 5,2 )"/>/</xsl:if><xsl:value-of select="substring(@periodo, 1, 4 )"/>( <xsl:value-of select="@obligacion"/>  )
          </a>
        </span>
        <span style="text-indent:3em;display:none">
          <xsl:apply-templates select="bdi"/>
        </span>
      </div>      
    </xsl:for-each>
    </div>
  </xsl:template>
  
  <xsl:template match="bdi">
    <span style="display:block">
      <a class="periodo" href="#">Periodo:<xsl:value-of select="@periodo"/>
        <xsl:value-of select="@sec"/>
      </a>
    </span>
  </xsl:template>

  <xsl:template match="discos">
    <div class="e">
      <span class="c">
        <a href="#" class="masMenos">+</a>
        <img src="conf/imagenes/diskfold.gif"/>
        <a class="lbl" href="#"> Carpetas </a>
      </span>
      <span style="text-indent:2em;display:none">
        <xsl:apply-templates select="disco"/>
      </span>
    </div>
  </xsl:template>

  <xsl:template match="disco">
    <span style="display:block">
      <img src="conf/imagenes/disk.gif"/>
      <a class="subcarpetas"   href="#">        
        <xsl:attribute name="onclick"> verDisco('<xsl:value-of select="."/>'); </xsl:attribute>
        <xsl:attribute name="name">idDisco<xsl:value-of select="."/></xsl:attribute>
        <xsl:attribute name="id">idDisco<xsl:value-of select="."/></xsl:attribute>
        <xsl:value-of select=". "/>
      </a>
    </span>
  </xsl:template>

  <xsl:template match="tabla">
    <span style="display:block">
      <img src="conf/imagenes/parxml.gif"/>
      <a class="lbl" href="#">
        <xsl:attribute name="id">
          <xsl:value-of select="@src"/>
        </xsl:attribute>
        <xsl:value-of select="@nombre"/>
      </a>
    </span>
  </xsl:template>
  
  <xsl:template name="replace-string">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="with"/>
    <xsl:choose>
      <xsl:when test="contains($text,$replace)">
        <xsl:value-of select="substring-before($text,$replace)"/>
        <xsl:value-of select="$with"/>
        <xsl:call-template name="replace-string">
          <xsl:with-param name="text"
            select="substring-after($text,$replace)"/>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="with" select="$with"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>
