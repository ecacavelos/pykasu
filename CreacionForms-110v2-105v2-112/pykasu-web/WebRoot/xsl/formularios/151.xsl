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
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C12)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C10)"].value)-parseFloat(formu["dynamicProps(C11)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C18)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C13)"].value)+parseFloat(formu["dynamicProps(C14)"].value)+parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C16)"].value)+parseFloat(formu["dynamicProps(C17)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C19)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C12)"].value)-parseFloat(formu["dynamicProps(C18)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C24)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C22)"].value)-parseFloat(formu["dynamicProps(C23)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C30)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C25)"].value)+parseFloat(formu["dynamicProps(C26)"].value)+parseFloat(formu["dynamicProps(C27)"].value)+parseFloat(formu["dynamicProps(C28)"].value)+parseFloat(formu["dynamicProps(C29)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C31)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C24)"].value)-parseFloat(formu["dynamicProps(C30)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C39)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C34)"].value)+parseFloat(formu["dynamicProps(C35)"].value)+parseFloat(formu["dynamicProps(C36)"].value)+parseFloat(formu["dynamicProps(C37)"].value)+parseFloat(formu["dynamicProps(C38)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C45)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C40)"].value)+parseFloat(formu["dynamicProps(C41)"].value)+parseFloat(formu["dynamicProps(C42)"].value)+parseFloat(formu["dynamicProps(C43)"].value)+parseFloat(formu["dynamicProps(C44)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C58)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C52)"].value)+parseFloat(formu["dynamicProps(C53)"].value)+parseFloat(formu["dynamicProps(C54)"].value)+parseFloat(formu["dynamicProps(C55)"].value)+parseFloat(formu["dynamicProps(C56)"].value)+parseFloat(formu["dynamicProps(C57)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C71)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C65)"].value)+parseFloat(formu["dynamicProps(C66)"].value)+parseFloat(formu["dynamicProps(C67)"].value)+parseFloat(formu["dynamicProps(C68)"].value)+parseFloat(formu["dynamicProps(C69)"].value)+parseFloat(formu["dynamicProps(C70)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C88)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C84)"].value)+parseFloat(formu["dynamicProps(C85)"].value)+parseFloat(formu["dynamicProps(C86)"].value)+parseFloat(formu["dynamicProps(C87)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C93)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C89)"].value)+parseFloat(formu["dynamicProps(C90)"].value)+parseFloat(formu["dynamicProps(C91)"].value)+parseFloat(formu["dynamicProps(C92)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C94)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C21)"].value)+parseFloat(formu["dynamicProps(C33)"].value)+parseFloat(formu["dynamicProps(C39)"].value)+parseFloat(formu["dynamicProps(C45)"].value)+parseFloat(formu["dynamicProps(C58)"].value)+parseFloat(formu["dynamicProps(C71)"].value)+parseFloat(formu["dynamicProps(C88)"].value))-parseFloat(formu["dynamicProps(C93)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C107)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C105)"].value)-parseFloat(formu["dynamicProps(C106)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C113)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C108)"].value)+parseFloat(formu["dynamicProps(C109)"].value)+parseFloat(formu["dynamicProps(C110)"].value)+parseFloat(formu["dynamicProps(c111)"].value)+parseFloat(formu["dynamicProps(C112)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C114)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C107)"].value)-parseFloat(formu["dynamicProps(C113)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C123)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C121)"].value)-parseFloat(formu["dynamicProps(C122)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C129)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C124)"].value)+parseFloat(formu["dynamicProps(C125)"].value)+parseFloat(formu["dynamicProps(C126)"].value)+parseFloat(formu["dynamicProps(C127)"].value)+parseFloat(formu["dynamicProps(C128)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C130)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C123)"].value)-parseFloat(formu["dynamicProps(C129)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C139)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C137)"].value)-parseFloat(formu["dynamicProps(C138)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C155)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C153)"].value)-parseFloat(formu["dynamicProps(C154)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C171)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C169)"].value)-parseFloat(formu["dynamicProps(C170)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C185)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C180)"].value)+parseFloat(formu["dynamicProps(C181)"].value)+parseFloat(formu["dynamicProps(C182)"].value)+parseFloat(formu["dynamicProps(C183)"].value)+parseFloat(formu["dynamicProps(C184)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C191)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C186)"].value)+parseFloat(formu["dynamicProps(C187)"].value)+parseFloat(formu["dynamicProps(C188)"].value)+parseFloat(formu["dynamicProps(C189)"].value)+parseFloat(formu["dynamicProps(C190)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C197)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C192)"].value)+parseFloat(formu["dynamicProps(C193)"].value)+parseFloat(formu["dynamicProps(C194)"].value)+parseFloat(formu["dynamicProps(C195)"].value)+parseFloat(formu["dynamicProps(C196)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C203)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C198)"].value)+parseFloat(formu["dynamicProps(C199)"].value)+parseFloat(formu["dynamicProps(C200)"].value)+parseFloat(formu["dynamicProps(C201)"].value)+parseFloat(formu["dynamicProps(C202)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C209)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C204)"].value)+parseFloat(formu["dynamicProps(C205)"].value)+parseFloat(formu["dynamicProps(C206)"].value)+parseFloat(formu["dynamicProps(C207)"].value)+parseFloat(formu["dynamicProps(C208)"].value)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C186)"].value == "") formu["dynamicProps(C186)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C54)"].value == "") formu["dynamicProps(C54)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C43)"].value == "") formu["dynamicProps(C43)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C44)"].value == "") formu["dynamicProps(C44)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C29)"].value == "") formu["dynamicProps(C29)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C37)"].value == "") formu["dynamicProps(C37)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C66)"].value == "") formu["dynamicProps(C66)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C126)"].value == "") formu["dynamicProps(C126)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C56)"].value == "") formu["dynamicProps(C56)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C137)"].value == "") formu["dynamicProps(C137)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C127)"].value == "") formu["dynamicProps(C127)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C13)"].value == "") formu["dynamicProps(C13)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C24)"].value == "") formu["dynamicProps(C24)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C128)"].value == "") formu["dynamicProps(C128)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C198)"].value == "") formu["dynamicProps(C198)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C55)"].value == "") formu["dynamicProps(C55)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C125)"].value == "") formu["dynamicProps(C125)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C170)"].value == "") formu["dynamicProps(C170)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C39)"].value == "") formu["dynamicProps(C39)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C67)"].value == "") formu["dynamicProps(C67)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C108)"].value == "") formu["dynamicProps(C108)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C138)"].value == "") formu["dynamicProps(C138)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C21)"].value == "") formu["dynamicProps(C21)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C105)"].value == "") formu["dynamicProps(C105)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C65)"].value == "") formu["dynamicProps(C65)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C122)"].value == "") formu["dynamicProps(C122)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C92)"].value == "") formu["dynamicProps(C92)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(c111)"].value == "") formu["dynamicProps(c111)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C183)"].value == "") formu["dynamicProps(C183)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C53)"].value == "") formu["dynamicProps(C53)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C93)"].value == "") formu["dynamicProps(C93)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C85)"].value == "") formu["dynamicProps(C85)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C70)"].value == "") formu["dynamicProps(C70)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C86)"].value == "") formu["dynamicProps(C86)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C42)"].value == "") formu["dynamicProps(C42)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C84)"].value == "") formu["dynamicProps(C84)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C35)"].value == "") formu["dynamicProps(C35)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C36)"].value == "") formu["dynamicProps(C36)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C109)"].value == "") formu["dynamicProps(C109)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C110)"].value == "") formu["dynamicProps(C110)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C187)"].value == "") formu["dynamicProps(C187)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C33)"].value == "") formu["dynamicProps(C33)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C71)"].value == "") formu["dynamicProps(C71)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C58)"].value == "") formu["dynamicProps(C58)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C107)"].value == "") formu["dynamicProps(C107)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C38)"].value == "") formu["dynamicProps(C38)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C193)"].value == "") formu["dynamicProps(C193)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C206)"].value == "") formu["dynamicProps(C206)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C121)"].value == "") formu["dynamicProps(C121)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C34)"].value == "") formu["dynamicProps(C34)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C12)"].value == "") formu["dynamicProps(C12)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C199)"].value == "") formu["dynamicProps(C199)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C205)"].value == "") formu["dynamicProps(C205)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C112)"].value == "") formu["dynamicProps(C112)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C153)"].value == "") formu["dynamicProps(C153)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C180)"].value == "") formu["dynamicProps(C180)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C200)"].value == "") formu["dynamicProps(C200)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C87)"].value == "") formu["dynamicProps(C87)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C204)"].value == "") formu["dynamicProps(C204)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C189)"].value == "") formu["dynamicProps(C189)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C123)"].value == "") formu["dynamicProps(C123)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C207)"].value == "") formu["dynamicProps(C207)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C106)"].value == "") formu["dynamicProps(C106)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C202)"].value == "") formu["dynamicProps(C202)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C169)"].value == "") formu["dynamicProps(C169)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C113)"].value == "") formu["dynamicProps(C113)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C192)"].value == "") formu["dynamicProps(C192)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C30)"].value == "") formu["dynamicProps(C30)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C124)"].value == "") formu["dynamicProps(C124)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C208)"].value == "") formu["dynamicProps(C208)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C91)"].value == "") formu["dynamicProps(C91)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C129)"].value == "") formu["dynamicProps(C129)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C194)"].value == "") formu["dynamicProps(C194)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C201)"].value == "") formu["dynamicProps(C201)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C41)"].value == "") formu["dynamicProps(C41)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C181)"].value == "") formu["dynamicProps(C181)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C188)"].value == "") formu["dynamicProps(C188)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C68)"].value == "") formu["dynamicProps(C68)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C40)"].value == "") formu["dynamicProps(C40)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C57)"].value == "") formu["dynamicProps(C57)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C196)"].value == "") formu["dynamicProps(C196)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C90)"].value == "") formu["dynamicProps(C90)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C89)"].value == "") formu["dynamicProps(C89)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C182)"].value == "") formu["dynamicProps(C182)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C69)"].value == "") formu["dynamicProps(C69)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C190)"].value == "") formu["dynamicProps(C190)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C195)"].value == "") formu["dynamicProps(C195)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C88)"].value == "") formu["dynamicProps(C88)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C184)"].value == "") formu["dynamicProps(C184)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C45)"].value == "") formu["dynamicProps(C45)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C154)"].value == "") formu["dynamicProps(C154)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C52)"].value == "") formu["dynamicProps(C52)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C186');
	ponerPuntosEnCampo('C139');
	ponerPuntosEnCampo('C54');
	ponerPuntosEnCampo('C43');
	ponerPuntosEnCampo('C37');
	ponerPuntosEnCampo('C29');
	ponerPuntosEnCampo('C44');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C66');
	ponerPuntosEnCampo('C126');
	ponerPuntosEnCampo('C137');
	ponerPuntosEnCampo('C56');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C127');
	ponerPuntosEnCampo('C13');
	ponerPuntosEnCampo('C24');
	ponerPuntosEnCampo('C128');
	ponerPuntosEnCampo('C198');
	ponerPuntosEnCampo('C26');
	ponerPuntosEnCampo('C55');
	ponerPuntosEnCampo('C125');
	ponerPuntosEnCampo('C170');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C39');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C67');
	ponerPuntosEnCampo('C185');
	ponerPuntosEnCampo('C138');
	ponerPuntosEnCampo('C108');
	ponerPuntosEnCampo('C105');
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C65');
	ponerPuntosEnCampo('C122');
	ponerPuntosEnCampo('c111');
	ponerPuntosEnCampo('C92');
	ponerPuntosEnCampo('C183');
	ponerPuntosEnCampo('C93');
	ponerPuntosEnCampo('C53');
	ponerPuntosEnCampo('C70');
	ponerPuntosEnCampo('C85');
	ponerPuntosEnCampo('C86');
	ponerPuntosEnCampo('C42');
	ponerPuntosEnCampo('C84');
	ponerPuntosEnCampo('C35');
	ponerPuntosEnCampo('C109');
	ponerPuntosEnCampo('C36');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C187');
	ponerPuntosEnCampo('C110');
	ponerPuntosEnCampo('C33');
	ponerPuntosEnCampo('C71');
	ponerPuntosEnCampo('C58');
	ponerPuntosEnCampo('C107');
	ponerPuntosEnCampo('C38');
	ponerPuntosEnCampo('C114');
	ponerPuntosEnCampo('C31');
	ponerPuntosEnCampo('C203');
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C193');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C206');
	ponerPuntosEnCampo('C121');
	ponerPuntosEnCampo('C34');
	ponerPuntosEnCampo('C199');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C205');
	ponerPuntosEnCampo('C180');
	ponerPuntosEnCampo('C153');
	ponerPuntosEnCampo('C112');
	ponerPuntosEnCampo('C87');
	ponerPuntosEnCampo('C200');
	ponerPuntosEnCampo('C204');
	ponerPuntosEnCampo('C189');
	ponerPuntosEnCampo('C123');
	ponerPuntosEnCampo('C207');
	ponerPuntosEnCampo('C155');
	ponerPuntosEnCampo('C106');
	ponerPuntosEnCampo('C202');
	ponerPuntosEnCampo('C169');
	ponerPuntosEnCampo('C11');
	ponerPuntosEnCampo('C113');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C192');
	ponerPuntosEnCampo('C30');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C124');
	ponerPuntosEnCampo('C208');
	ponerPuntosEnCampo('C94');
	ponerPuntosEnCampo('C130');
	ponerPuntosEnCampo('C91');
	ponerPuntosEnCampo('C171');
	ponerPuntosEnCampo('C194');
	ponerPuntosEnCampo('C129');
	ponerPuntosEnCampo('C201');
	ponerPuntosEnCampo('C41');
	ponerPuntosEnCampo('C181');
	ponerPuntosEnCampo('C188');
	ponerPuntosEnCampo('C40');
	ponerPuntosEnCampo('C68');
	ponerPuntosEnCampo('C191');
	ponerPuntosEnCampo('C57');
	ponerPuntosEnCampo('C196');
	ponerPuntosEnCampo('C90');
	ponerPuntosEnCampo('C197');
	ponerPuntosEnCampo('C14');
	ponerPuntosEnCampo('C89');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C182');
	ponerPuntosEnCampo('C69');
	ponerPuntosEnCampo('C190');
	ponerPuntosEnCampo('C195');
	ponerPuntosEnCampo('C209');
	ponerPuntosEnCampo('C184');
	ponerPuntosEnCampo('C88');
	ponerPuntosEnCampo('C154');
	ponerPuntosEnCampo('C45');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C52');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C186');
	quitarPuntosDeCampo('C139');
	quitarPuntosDeCampo('C54');
	quitarPuntosDeCampo('C43');
	quitarPuntosDeCampo('C37');
	quitarPuntosDeCampo('C29');
	quitarPuntosDeCampo('C44');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C66');
	quitarPuntosDeCampo('C126');
	quitarPuntosDeCampo('C137');
	quitarPuntosDeCampo('C56');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C127');
	quitarPuntosDeCampo('C13');
	quitarPuntosDeCampo('C24');
	quitarPuntosDeCampo('C128');
	quitarPuntosDeCampo('C198');
	quitarPuntosDeCampo('C26');
	quitarPuntosDeCampo('C55');
	quitarPuntosDeCampo('C125');
	quitarPuntosDeCampo('C170');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C39');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C67');
	quitarPuntosDeCampo('C185');
	quitarPuntosDeCampo('C138');
	quitarPuntosDeCampo('C108');
	quitarPuntosDeCampo('C105');
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C65');
	quitarPuntosDeCampo('C122');
	quitarPuntosDeCampo('c111');
	quitarPuntosDeCampo('C92');
	quitarPuntosDeCampo('C183');
	quitarPuntosDeCampo('C93');
	quitarPuntosDeCampo('C53');
	quitarPuntosDeCampo('C70');
	quitarPuntosDeCampo('C85');
	quitarPuntosDeCampo('C86');
	quitarPuntosDeCampo('C42');
	quitarPuntosDeCampo('C84');
	quitarPuntosDeCampo('C35');
	quitarPuntosDeCampo('C109');
	quitarPuntosDeCampo('C36');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C187');
	quitarPuntosDeCampo('C110');
	quitarPuntosDeCampo('C33');
	quitarPuntosDeCampo('C71');
	quitarPuntosDeCampo('C58');
	quitarPuntosDeCampo('C107');
	quitarPuntosDeCampo('C38');
	quitarPuntosDeCampo('C114');
	quitarPuntosDeCampo('C31');
	quitarPuntosDeCampo('C203');
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C193');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C206');
	quitarPuntosDeCampo('C121');
	quitarPuntosDeCampo('C34');
	quitarPuntosDeCampo('C199');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C205');
	quitarPuntosDeCampo('C180');
	quitarPuntosDeCampo('C153');
	quitarPuntosDeCampo('C112');
	quitarPuntosDeCampo('C87');
	quitarPuntosDeCampo('C200');
	quitarPuntosDeCampo('C204');
	quitarPuntosDeCampo('C189');
	quitarPuntosDeCampo('C123');
	quitarPuntosDeCampo('C207');
	quitarPuntosDeCampo('C155');
	quitarPuntosDeCampo('C106');
	quitarPuntosDeCampo('C202');
	quitarPuntosDeCampo('C169');
	quitarPuntosDeCampo('C11');
	quitarPuntosDeCampo('C113');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C192');
	quitarPuntosDeCampo('C30');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C124');
	quitarPuntosDeCampo('C208');
	quitarPuntosDeCampo('C94');
	quitarPuntosDeCampo('C130');
	quitarPuntosDeCampo('C91');
	quitarPuntosDeCampo('C171');
	quitarPuntosDeCampo('C194');
	quitarPuntosDeCampo('C129');
	quitarPuntosDeCampo('C201');
	quitarPuntosDeCampo('C41');
	quitarPuntosDeCampo('C181');
	quitarPuntosDeCampo('C188');
	quitarPuntosDeCampo('C40');
	quitarPuntosDeCampo('C68');
	quitarPuntosDeCampo('C191');
	quitarPuntosDeCampo('C57');
	quitarPuntosDeCampo('C196');
	quitarPuntosDeCampo('C90');
	quitarPuntosDeCampo('C197');
	quitarPuntosDeCampo('C14');
	quitarPuntosDeCampo('C89');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C182');
	quitarPuntosDeCampo('C69');
	quitarPuntosDeCampo('C190');
	quitarPuntosDeCampo('C195');
	quitarPuntosDeCampo('C209');
	quitarPuntosDeCampo('C184');
	quitarPuntosDeCampo('C88');
	quitarPuntosDeCampo('C154');
	quitarPuntosDeCampo('C45');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C52');
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
			<link href="../../style/css/bd-ocre.css" type="text/css" rel="stylesheet"/>
			<script type="text/javascript">
			function tabs(num) {
			      var tab;
			      tab = document.getElementById('tab1');
			      tab.style.display = (num==1?'':'none');
			      tab = document.getElementById('tab2');
			      tab.style.display = (num==2?'':'none');
			      tab = document.getElementById('tab3');
			      tab.style.display = (num==3?'':'none');
			      tab = document.getElementById('tab4');
			      tab.style.display = (num==4?'':'none');
			      tab = document.getElementById('tab5');
			      tab.style.display = (num==5?'':'none');

    		}
	</script>
			<body onload="tabs(1)">
				<table class="declaracion">
					<tbody>
						<tr>
							<td>
								<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">151</xsl:with-param><xsl:with-param name="pVersion">V.1   Enero/2007</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LAS ACTIVIDADES AGROPECUARIAS PATRIMONIO INICIAL</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
									</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
							</td>
						</tr>
						<tr>
							<td>
								<table class="declaracion1" width="640">
									<tbody>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
											</td>
										</tr>
										<tr>
											<td class="fondo" vAlign="top" align="left" width="1"/>
											<td vAlign="top" width="636">
												<table class="declaracion">
													<tbody>
														<tr>
															<th>
																<p align="left">DECLARACION JURADA DE S.A.U. Y DE BIENES PATRIMONIALES</p>
															</th>
															<th class="bordevacio">1. REGIMEN CONTABLE</th>
															<td class="bordevacio">
																<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C6"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<th class="bordevacio">2. REGIMEN SIMPLIFICADO</th>
															<td class="bordevacio">
																<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C7"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
															<th class="bordevacio">3. REGIMEN PRESUNTO</th>
															<td class="bordevacio">
																<xsl:call-template name="itemCheck"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C8"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
											<td class="fondo" vAlign="top" align="right" width="1"/>
										</tr>
										<tr>
											<td vAlign="bottom" align="left" height="4">
												<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
											</td>
											<td class="fondo"/>
											<td vAlign="bottom" align="right">
												<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td style="background: #fbdaae">En virtud a los Art. 33 y 35 de la Ley 125/91 y concordante con el Art. 4º de la Ley 2421/04</td>
						</tr>
						<tr>
							<td>
								<a onclick="tabs(1)" href="#">Declaración</a>
								<a onclick="tabs(2)" href="#">Anexo Rubro 1</a>
								<a onclick="tabs(3)" href="#">Anexo Rubro 2</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div id="tab1" style="width: 640px">
					<table class="principal">
						<tbody>
							<tr>
								<td>
									<table class="declaracion1" width="640">
										<tbody>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
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
																	<p align="left">RUBRO 1 DATOS DEL INMUEBLE Y DETERMINACION DE S.A.U.</p>
																</th>
																<th class="bordevacio" colSpan="4">
																	<p align="center">inmuebles</p>
																</th>
															</tr>
															<tr>
																<th class="bordevacio" colSpan="2">
																	<p align="center">region oriental -i-</p>
																</th>
																<th class="bordevacio" colSpan="2" style="width: 90%">
																	<p align="center">region occidental -ii-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">SUPERFICIE TOTAL DE HECTAREAS</td>
																<td class="borde">10</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">22</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Superficie total de Hectáreas que fueron cedidas en arrendamiento o aparceria</td>
																<td class="borde">11</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">23</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">SUPERFICIE TOTAL DISPONIBLE EN PODER DEL DECLARANTE (Inc. a menos b)</td>
																<td class="borde">12</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">24</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Superficies ocupadas por bosques naturales o cultivados y otros deducibles (Art. 32 Inc. a)</td>
																<td class="borde">13</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">25</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Areas marginales no aptas para el cultivo (Art. 32 Inc. b)</td>
																<td class="borde">14</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">26</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Areas silvestres protegidas bajo dominio privado y sujetas a Leyes (Art. 32 Inc. c)</td>
																<td class="borde">15</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">27</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">Superficie en Has. ocupadas por rutas, caminos vecinales y/o servidumbres de paso y/o las superficies destinadas a la actividad comercial o industrial (Art. 32 Inc. d)</td>
																<td class="borde">16</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">28</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">h</td>
																<td class="borde">Areas destinadas a servicios ambientales (Art. 32 Inc. e)</td>
																<td class="borde">17</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">29</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">i</td>
																<td class="borde">TOTAL DE SUPERFICIES DEDUCIBLES (Inc. d+e+f+g+h)</td>
																<td class="borde">18</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">30</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">j</td>
																<td class="borde">SUPEFICIES AGROLOGICAMENTE UTIL (Inc. c menos Inc. i)</td>
																<td class="borde">19</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">31</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">k</td>
																<td class="borde">Superficie utilizada del Inc. j para cultivos permanente, semipermanentes incluyendo pasturas</td>
																<td class="borde">20</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">32</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">l</td>
																<td class="borde">VALOR TOTAL DEL (LOS) INMUEBLE(S) (En guaraníes)</td>
																<td class="borde">21</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">33</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
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
																	<p align="left">RUBRO 2 detalles de las instalaciones e inversiones</p>
																</th>
																<th class="bordevacio" colSpan="4">
																	<p align="center">IMPORTE</p>
																</th>
															</tr>
															<tr>
																<th class="bordevacio" colSpan="2">
																	<p align="center">REGION ORIENTAL -i-</p>
																</th>
																<th class="bordevacio" colSpan="2" style="width: 90%">
																	<p align="center">REGION OCCIDENTAL -ii-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Cercos y alambradas, corrales, bretes, mangas, tajamares y similares</td>
																<td class="borde">34</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">40</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Edificaciones, tinglados, silos, represas, puentes, caminos, etc.</td>
																<td class="borde">35</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">41</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Maquinaria, herramientas, vehículos y equipos</td>
																<td class="borde">36</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">42</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Muebles, útiles y enseres</td>
																<td class="borde">37</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">43</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Otros activos existentes, no incluídos en los incisos anteriores</td>
																<td class="borde">38</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">44</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">TOTALES (Inc. a+b+c+d+e)</td>
																<td class="borde">39</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">45</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
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
																	<p align="left">RUBRO 3 detalle de la existencia y valor del ganado equino, ovino, caprino y otros</p>
																</th>
																<th class="bordevacio" colSpan="4">
																	<p align="center">IMPORTE</p>
																</th>
															</tr>
															<tr>
																<th class="bordevacio" colSpan="2">
																	<p align="center">CANTIDAD DE GANADO -i-</p>
																</th>
																<th class="bordevacio" colSpan="2" style="width: 90%">
																	<p align="center">VALOR DEL GANADO -ii-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Equinos</td>
																<td class="borde">46</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">52</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Burros</td>
																<td class="borde">47</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">53</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Mulas</td>
																<td class="borde">48</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">54</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Ovinos</td>
																<td class="borde">49</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">55</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Caprinos</td>
																<td class="borde">50</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">56</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Otros</td>
																<td class="borde">51</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">57</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">TOTALES (Inc. a+b+c+d+e+f Col. II)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">58</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
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
																	<p align="left">RUBRO 4 detalle de la existencia y valor del ganado bovino</p>
																</th>
																<th class="bordevacio" colSpan="4">
																	<p align="center">IMPORTE</p>
																</th>
															</tr>
															<tr>
																<th class="bordevacio" colSpan="2">
																	<p align="center">CANTIDAD DE GANADO -i-</p>
																</th>
																<th class="bordevacio" colSpan="2" style="width: 90%">
																	<p align="center">VALOR DEL GANADO -ii-</p>
																</th>
															</tr>
															<tr>
																<td class="borde">a</td>
																<td class="borde">Vacas</td>
																<td class="borde">59</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C59</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C59"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">65</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C65</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C65"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">b</td>
																<td class="borde">Toros</td>
																<td class="borde">60</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C60</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C60"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">66</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C66</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C66"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">c</td>
																<td class="borde">Novillos</td>
																<td class="borde">61</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C61</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C61"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">67</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C67</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C67"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">d</td>
																<td class="borde">Vaquillas</td>
																<td class="borde">62</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C62</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C62"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">68</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C68</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C68"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">e</td>
																<td class="borde">Terneros Machos</td>
																<td class="borde">63</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C63</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C63"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">69</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C69</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C69"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">f</td>
																<td class="borde">Terneros Hembras</td>
																<td class="borde">64</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C64</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C64"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
																<td class="borde">70</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">g</td>
																<td class="borde">TOTALES (Inc. a+b+c+d+e+f Col. II)</td>
																<td class="vacio"/>
																<td class="vacio"/>
																<td class="borde">71</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
												</td>
											</tr>
											<tr>
												<td class="fondo" vAlign="top" align="left" width="1"/>
												<td vAlign="top" width="636">
													<table class="declaracion">
														<tbody>
															<tr>
																<th class="bordevacio" colSpan="6" style="width: 95%">
																	<p align="left">RUBRO 5 marcas utilizadas en el establecimiento</p>
																</th>
															</tr>
															<tr>
																<td colSpan="3">
																	<table class="declaracion" style="; width: 320px">
																		<tbody>
																			<tr>
																				<td class="borde">Boleta Nº</td>
																				<td class="borde">72</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Propietario</td>
																				<td class="borde">73</td>
																				<td class="borde">
																					<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">R.U.C. o C.I.</td>
																				<td class="borde">74</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Diseño de la marca</td>
																				<td class="borde"/>
																				<td class="borde">
																					<p>   </p>
																					<p>  </p>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td colSpan="3">
																	<table class="declaracion" style="; width: 320px">
																		<tbody>
																			<tr>
																				<td class="borde">Boleta Nº</td>
																				<td class="borde">78</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C78</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C78"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Propietario</td>
																				<td class="borde">79</td>
																				<td class="borde">
																					<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">C79</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C79"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">R.U.C. o C.I.</td>
																				<td class="borde">80</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C80</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C80"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Diseño de la marca</td>
																				<td class="borde"/>
																				<td class="borde">
																					<p>   </p>
																					<p>  </p>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
															</tr>
															<tr>
																<td colSpan="3">
																	<table class="declaracion" style="; width: 320px">
																		<tbody>
																			<tr>
																				<td class="borde">Boleta Nº</td>
																				<td class="borde">75</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Propietario</td>
																				<td class="borde">76</td>
																				<td class="borde">
																					<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">R.U.C. o C.I.</td>
																				<td class="borde">77</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Diseño de la marca</td>
																				<td class="borde"/>
																				<td class="borde">
																					<p>   </p>
																					<p>  </p>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td colSpan="3">
																	<table class="declaracion" style="; width: 320px">
																		<tbody>
																			<tr>
																				<td class="borde">Boleta Nº</td>
																				<td class="borde">81</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C81</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C81"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Propietario</td>
																				<td class="borde">82</td>
																				<td class="borde">
																					<xsl:call-template name="itemTexto"><xsl:with-param name="pNombre">C82</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C82"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">R.U.C. o C.I.</td>
																				<td class="borde">83</td>
																				<td class="borde">
																					<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C83</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C83"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																				</td>
																			</tr>
																			<tr>
																				<td class="borde">Diseño de la marca</td>
																				<td class="borde"/>
																				<td class="borde">
																					<p>   </p>
																					<p>  </p>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
												</td>
											</tr>
											<tr>
												<td class="fondo" vAlign="top" align="left" width="1"/>
												<td vAlign="top" width="636">
													<table class="declaracion">
														<tbody>
															<tr>
																<th class="bordevacio" style="width: 95%">
																	<p align="left">RUBRO 6 detalle de las cuentas</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center"> </p>
																</th>
															</tr>
															<tr>
																<td class="borde">CUENTAS DEL ACTIVO</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">Caja</td>
																<td class="borde">84</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C84</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C84"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">Bancos</td>
																<td class="borde">85</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C85</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C85"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">Otros Valores</td>
																<td class="borde">86</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C86</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C86"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">Otros Activos</td>
																<td class="borde">87</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C87</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C87"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">Total Activo (excepto Rubro 1, 2, 3 y 4)</td>
																<td class="borde">88</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C88</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C88"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">CUENTAS DEL PASIVO</td>
																<td class="vacio"/>
																<td class="vacio"/>
															</tr>
															<tr>
																<td class="borde">Cuentas a Pagar</td>
																<td class="borde">89</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C89</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C89"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">Préstamos Financieros</td>
																<td class="borde">90</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C90</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C90"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">Provisiones</td>
																<td class="borde">91</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C91</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C91"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">Otros Pasivos</td>
																<td class="borde">92</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C92</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C92"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
															<tr>
																<td class="borde">Total Pasivo</td>
																<td class="borde">93</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C93</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C93"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
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
													<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
												</td>
											</tr>
											<tr>
												<td class="fondo" vAlign="top" align="left" width="1"/>
												<td vAlign="top" width="636">
													<table class="declaracion">
														<tbody>
															<tr>
																<th class="bordevacio" style="width: 95%">
																	<p align="left">RUBRO 7 TOTAL PATRIMONIO</p>
																</th>
																<th class="bordevacio" colSpan="2">
																	<p align="center"> </p>
																</th>
															</tr>
															<tr>
																<td class="borde">Consignar el resultado de la suma de las Casillas (21+33+39+45+58+71+88) menos Casilla 93</td>
																<td class="borde">94</td>
																<td class="borde">
																	<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C94</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C94"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="fondo" vAlign="top" align="right" width="1"/>
											</tr>
											<tr>
												<td vAlign="bottom" align="left" height="4">
													<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
												</td>
												<td class="fondo"/>
												<td vAlign="bottom" align="right">
													<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colSpan="6">
									<xsl:call-template name="pieDeclaraciones"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="tab2" style="width: 640px">
					<input class="fondo" name="insertar" type="submit" value="Detalle 1"/>
					<xsl:for-each select="declaracion/detalle1">
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
									</td>
								</tr>
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio" colSpan="12">
														<p align="center">RUBRO 1 - DATOS DEL INMUEBLE Y DETERMINACION DE S.A.U.</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" rowSpan="2">INC</th>
													<th class="bordevacio" rowSpan="2" width="300">
														<p align="left">DETALLE </p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">1</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">2</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">3</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">4</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">5</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">NUMERO DE FINCA</td>
													<td class="borde">100</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C100</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C100"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">116</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C116</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C116"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">132</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C132</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C132"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">148</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C148</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C148"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">164</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C164</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C164"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">NUMERO DE PADRON</td>
													<td class="borde">101</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C101</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C101"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">117</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C117</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C117"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">133</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C133</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C133"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">149</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C149</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C149"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">165</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C165</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C165"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">CODIGO DE DISTRITO(ver anexo al dto. No-4305/04)</td>
													<td class="borde">102</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">118</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C118</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C118"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">134</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C134</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C134"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">150</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C150</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C150"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">166</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C166</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C166"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">CARACTER DEL INMUEBLE:Indicar con el número, según lo que corresponda 1 Propio; 2 Arrendado; 3 Poseedor a cualquier Tí­tulo; 4 Ocupado sin arrendamiento; 5 Aparcería; 6 Societarios; 7 Otros.</td>
													<td class="borde">103</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C103</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C103"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">119</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C119</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C119"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">135</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C135</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C135"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">151</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C151</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C151"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">167</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C167</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C167"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">VALOR DEL INMUEBLE</td>
													<td class="borde">104</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C104</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C104"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">120</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C120</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C120"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">136</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C136</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C136"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">152</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C152</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C152"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">168</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C168</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C168"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">SUPERFICIE TOTAL DE HECTAREAS</td>
													<td class="borde">105</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C105</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C105"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">121</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C121</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C121"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">137</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C137</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C137"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">153</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C153</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C153"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">169</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C169</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C169"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Superficie en Has, cedidas en arrendamiento o aparcerí­a, por parte del titular del inmueble y está debidamente documentado</td>
													<td class="borde">106</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C106</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C106"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">122</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C122</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C122"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">138</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C138</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C138"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">154</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C154</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C154"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">170</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C170</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C170"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Superficie disponible en poder del declarante (inc. f menos g)</td>
													<td class="borde">107</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C107</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C107"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">123</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C123</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C123"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">139</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C139</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C139"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">155</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C155</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">171</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C171</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C171"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">Superficies ocupadas por bosques naturales o cultivados y otros deducibles (Art. 32 inc. a)</td>
													<td class="borde">108</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C108</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C108"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">124</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C124</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C124"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">140</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C140</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C140"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">156</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C156</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C156"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">172</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C172</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C172"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Areas marginales no aptas para el cultivo (Art. 32 inc. b)</td>
													<td class="borde">109</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C109</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C109"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">125</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C127</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C127"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">141</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C141</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C141"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">157</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C157</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C157"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">173</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C173</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C173"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Areas Silvestres protegidas bajo dominio privado y sujetas a leyes (Art. 32 Inc. c)</td>
													<td class="borde">110</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C110</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C110"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">126</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C126</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C126"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">142</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C142</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C142"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">158</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C158</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C158"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">174</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C174</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C174"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Las ocupadas por rutas, caminos vecinales y/o servidumbres de paso. (Art. 32 Inc. d) y/o superficies destinadas a la actividad comercial o industrial</td>
													<td class="borde">111</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C111</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C111"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">127</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C127</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C127"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">143</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C143</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C143"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">159</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C159</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C159"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">175</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C175</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C175"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Areas destinadas a servicios ambientales (Art. 32 Inc e)</td>
													<td class="borde">112</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C112</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C112"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">128</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C128</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C128"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">144</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C144</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C144"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">160</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C160</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C160"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">176</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C176</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C176"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">TOTAL DE SUPERFICIES DEDUCIBLES (Suma Inc. i al m)</td>
													<td class="borde">113</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C113</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C113"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">129</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C129</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C129"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">145</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C145</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C145"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">161</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C161</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C161"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">177</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C177</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C177"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">o</td>
													<td class="borde">SUPERFICIE AGROLOGICAMENTE UTIL (Inc. h menos Inc. n)</td>
													<td class="borde">114</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C114</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C114"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">130</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C130</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C130"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">146</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C146</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C146"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">162</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C162</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C162"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">178</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C178</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C178"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">p</td>
													<td class="borde">Superficie utilizada del Inciso o) para cultivos permanentes, semipermanentes incluyendo pasturas</td>
													<td class="borde">115</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C115</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C115"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">131</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C131</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C131"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">147</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C147</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C147"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">163</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C163</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C163"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">179</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C179</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C179"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
				</div>
				<div id="tab3" style="width: 640px">
					<input class="fondo" name="insertar" type="submit" value="Detalle 2"/>
					<xsl:for-each select="declaracion/detalle2">
						<table class="declaracion1" width="640">
							<tbody>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/top-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/top-r-ocre.gif" width="4"/>
									</td>
								</tr>
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio" colSpan="14">
														<p align="center">RUBRO 2 - DETALLE DE LAS INSTALACIONES E INVERSIONES</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" rowSpan="2">INC</th>
													<th class="bordevacio" rowSpan="2" width="300">
														<p align="left">DETALLE </p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">INMUEBLE</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">1</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">2</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">3</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">4</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">5</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Cercos y alambradas, corrales, bretes, mangas, tajamares y similares</td>
													<td class="borde">180</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C180</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C180"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">186</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C186</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C186"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">192</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C192</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C192"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">198</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C198</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C198"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">204</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C204</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C204"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Edificaciones, tinglados, silos, represas, puentes, caminos</td>
													<td class="borde">181</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C181</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C181"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">187</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C187</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C187"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">193</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C193</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C193"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">199</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C199</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C199"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">205</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C205</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C205"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Maquinaria, herramientas, vehículos y equipos</td>
													<td class="borde">182</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C182</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C182"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">188</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C188</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C188"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">194</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C194</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C194"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">200</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C200</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C200"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">206</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C206</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C206"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Muebles, útiles y enseres</td>
													<td class="borde">183</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C183</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C183"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">189</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C189</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C189"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">195</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C195</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C195"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">201</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C201</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C201"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">207</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C207</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C207"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Otros activos existentes, no incluídos en los incisos anteriores</td>
													<td class="borde">184</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C184</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C184"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">190</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C190</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C190"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">196</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C196</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C196"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">202</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C202</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C202"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">208</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C208</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C208"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Total Rubro 2</td>
													<td class="borde">185</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C185</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C185"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">191</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C191</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C191"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">197</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C197</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C197"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">203</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C203</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C203"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">209</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C209</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C209"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="fondo" vAlign="top" align="right" width="1"/>
								</tr>
								<tr>
									<td vAlign="bottom" align="left" height="4">
										<img height="4" src="../../style/images/bot-l-ocre.gif" width="4"/>
									</td>
									<td class="fondo"/>
									<td vAlign="bottom" align="right">
										<img height="4" src="../../style/images/bot-r-ocre.gif" width="4"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
