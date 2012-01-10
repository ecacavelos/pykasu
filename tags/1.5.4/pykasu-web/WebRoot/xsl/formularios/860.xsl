<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:NonHtml="http://www.progress.com/StylusStudio/NonHtml" exclude-result-prefixes="NonHtml">
	<xsl:import href="../../style/css/cabecera.xsl"/>
	<xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" method="html"></xsl:output>
	<xsl:param name="Modo">0</xsl:param>
	<xsl:param name="Ruc"></xsl:param>
	<xsl:param name="Dv"></xsl:param>
	<xsl:param name="Periodo">aaaamm</xsl:param>
	<xsl:param name="Nombre"></xsl:param>
	<xsl:param name="PrimerApellido"></xsl:param>
	<xsl:param name="SegundoApellido"></xsl:param>
	<xsl:variable name="tasas"/>
	<xsl:template match="/"><SCRIPT type="text/javascript"><![CDATA[
function Sumar(formu) {
	var errores=0;
	try { formu["dynamicProps(C4)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C4)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C21)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C19)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C22)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C20)"].value) * parseFloat(formu["dynamicProps(C21)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C25)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C23)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C26)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C24)"].value) * parseFloat(formu["dynamicProps(C25)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C29)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C27)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C30)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C28)"].value) * parseFloat(formu["dynamicProps(C29)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C33)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C31)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C34)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C32)"].value) * parseFloat(formu["dynamicProps(C33)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C37)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C35)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C38)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C36)"].value) * parseFloat(formu["dynamicProps(C37)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C41)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C39)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C42)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C40)"].value) * parseFloat(formu["dynamicProps(C41)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C45)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C43)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C46)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C44)"].value) * parseFloat(formu["dynamicProps(C45)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C49)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C47)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C50)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C48)"].value) * parseFloat(formu["dynamicProps(C49)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C53)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C51)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C54)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C52)"].value) * parseFloat(formu["dynamicProps(C53)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C57)"].value = nvl(Math.round(buscartasa(parseFloat(formu["dynamicProps(C55)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C58)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C56)"].value) * parseFloat(formu["dynamicProps(C57)"].value) / 100));} catch(e){errores++;}
	try { formu["dynamicProps(C60)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C22)"].value)+parseFloat(formu["dynamicProps(C26)"].value)+parseFloat(formu["dynamicProps(C30)"].value)+parseFloat(formu["dynamicProps(C34)"].value)+parseFloat(formu["dynamicProps(C38)"].value)+parseFloat(formu["dynamicProps(C42)"].value)+parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C50)"].value)+parseFloat(formu["dynamicProps(C54)"].value)+parseFloat(formu["dynamicProps(C58)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C68)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C64)"].value)+parseFloat(formu["dynamicProps(C65)"].value)+parseFloat(formu["dynamicProps(C66)"].value)+parseFloat(formu["dynamicProps(C67)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C69)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C61)"].value)+parseFloat(formu["dynamicProps(C62)"].value)+parseFloat(formu["dynamicProps(C63)"].value))-parseFloat(formu["dynamicProps(C68)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C70)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C60)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C74)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C64)"].value)+parseFloat(formu["dynamicProps(C65)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C75)"].value = nvl(Math.round(elegir(calcularmulta(311,parseFloat(formu["dynamicProps(C70)"].value)),0,si(parseFloat(formu["dynamicProps(C75)"].value)>0,50000,0),calcularmulta(311,parseFloat(formu["dynamicProps(C70)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C76)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C71)"].value)+parseFloat(formu["dynamicProps(C72)"].value)+parseFloat(formu["dynamicProps(C73)"].value)+parseFloat(formu["dynamicProps(C74)"].value)-parseFloat(formu["dynamicProps(C70)"].value)-parseFloat(formu["dynamicProps(C75)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C77)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C70)"].value)+parseFloat(formu["dynamicProps(C75)"].value)-parseFloat(formu["dynamicProps(C71)"].value)-parseFloat(formu["dynamicProps(C72)"].value)-parseFloat(formu["dynamicProps(C73)"].value)-parseFloat(formu["dynamicProps(C74)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C78)"].value = nvl(Math.round(calcularmora(mayor(parseFloat(formu["dynamicProps(C70)"].value)-parseFloat(formu["dynamicProps(C71)"].value)-parseFloat(formu["dynamicProps(C72)"].value)-parseFloat(formu["dynamicProps(C73)"].value)-parseFloat(formu["dynamicProps(C74)"].value),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C79)"].value = nvl(Math.round(calcularinteres(mayor(parseFloat(formu["dynamicProps(C70)"].value)-parseFloat(formu["dynamicProps(C71)"].value)-parseFloat(formu["dynamicProps(C72)"].value)-parseFloat(formu["dynamicProps(C73)"].value)-parseFloat(formu["dynamicProps(C74)"].value),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C81)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C76)"].value)+parseFloat(formu["dynamicProps(C80)"].value))-parseFloat(formu["dynamicProps(C77)"].value)-parseFloat(formu["dynamicProps(C78)"].value)-parseFloat(formu["dynamicProps(C79)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C82)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C77)"].value)+parseFloat(formu["dynamicProps(C78)"].value)+parseFloat(formu["dynamicProps(C79)"].value)-parseFloat(formu["dynamicProps(C80)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C106)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C101)"].value)+parseFloat(formu["dynamicProps(C102)"].value)+parseFloat(formu["dynamicProps(C103)"].value)+parseFloat(formu["dynamicProps(C104)"].value)+parseFloat(formu["dynamicProps(C105)"].value)));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C54)"].value == "") formu["dynamicProps(C54)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C43)"].value == "") formu["dynamicProps(C43)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C44)"].value == "") formu["dynamicProps(C44)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C37)"].value == "") formu["dynamicProps(C37)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C29)"].value == "") formu["dynamicProps(C29)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C66)"].value == "") formu["dynamicProps(C66)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C60)"].value == "") formu["dynamicProps(C60)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C64)"].value == "") formu["dynamicProps(C64)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C75)"].value == "") formu["dynamicProps(C75)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C49)"].value == "") formu["dynamicProps(C49)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C34)"].value == "") formu["dynamicProps(C34)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C56)"].value == "") formu["dynamicProps(C56)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C78)"].value == "") formu["dynamicProps(C78)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C103)"].value == "") formu["dynamicProps(C103)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C79)"].value == "") formu["dynamicProps(C79)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C104)"].value == "") formu["dynamicProps(C104)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C46)"].value == "") formu["dynamicProps(C46)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C24)"].value == "") formu["dynamicProps(C24)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C72)"].value == "") formu["dynamicProps(C72)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C50)"].value == "") formu["dynamicProps(C50)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C55)"].value == "") formu["dynamicProps(C55)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C102)"].value == "") formu["dynamicProps(C102)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C30)"].value == "") formu["dynamicProps(C30)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C74)"].value == "") formu["dynamicProps(C74)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C39)"].value == "") formu["dynamicProps(C39)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C67)"].value == "") formu["dynamicProps(C67)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C80)"].value == "") formu["dynamicProps(C80)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C101)"].value == "") formu["dynamicProps(C101)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C105)"].value == "") formu["dynamicProps(C105)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C21)"].value == "") formu["dynamicProps(C21)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C32)"].value == "") formu["dynamicProps(C32)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C76)"].value == "") formu["dynamicProps(C76)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C65)"].value == "") formu["dynamicProps(C65)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C4)"].value == "") formu["dynamicProps(C4)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C41)"].value == "") formu["dynamicProps(C41)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C53)"].value == "") formu["dynamicProps(C53)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C70)"].value == "") formu["dynamicProps(C70)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C42)"].value == "") formu["dynamicProps(C42)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C63)"].value == "") formu["dynamicProps(C63)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C40)"].value == "") formu["dynamicProps(C40)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C68)"].value == "") formu["dynamicProps(C68)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C57)"].value == "") formu["dynamicProps(C57)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C73)"].value == "") formu["dynamicProps(C73)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C51)"].value == "") formu["dynamicProps(C51)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C35)"].value == "") formu["dynamicProps(C35)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C62)"].value == "") formu["dynamicProps(C62)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C47)"].value == "") formu["dynamicProps(C47)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C61)"].value == "") formu["dynamicProps(C61)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C36)"].value == "") formu["dynamicProps(C36)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C48)"].value == "") formu["dynamicProps(C48)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C33)"].value == "") formu["dynamicProps(C33)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C77)"].value == "") formu["dynamicProps(C77)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C71)"].value == "") formu["dynamicProps(C71)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C58)"].value == "") formu["dynamicProps(C58)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C45)"].value == "") formu["dynamicProps(C45)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C38)"].value == "") formu["dynamicProps(C38)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C52)"].value == "") formu["dynamicProps(C52)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C31)"].value == "") formu["dynamicProps(C31)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C54');
	ponerPuntosEnCampo('C43');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C29');
	ponerPuntosEnCampo('C37');
	ponerPuntosEnCampo('C44');
	ponerPuntosEnCampo('C66');
	ponerPuntosEnCampo('C60');
	ponerPuntosEnCampo('C64');
	ponerPuntosEnCampo('C49');
	ponerPuntosEnCampo('C75');
	ponerPuntosEnCampo('C34');
	ponerPuntosEnCampo('C56');
	ponerPuntosEnCampo('C78');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C103');
	ponerPuntosEnCampo('C79');
	ponerPuntosEnCampo('C104');
	ponerPuntosEnCampo('C46');
	ponerPuntosEnCampo('C24');
	ponerPuntosEnCampo('C72');
	ponerPuntosEnCampo('C50');
	ponerPuntosEnCampo('C106');
	ponerPuntosEnCampo('C26');
	ponerPuntosEnCampo('C55');
	ponerPuntosEnCampo('C81');
	ponerPuntosEnCampo('C30');
	ponerPuntosEnCampo('C102');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C39');
	ponerPuntosEnCampo('C74');
	ponerPuntosEnCampo('C67');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C80');
	ponerPuntosEnCampo('C101');
	ponerPuntosEnCampo('C32');
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C105');
	ponerPuntosEnCampo('C65');
	ponerPuntosEnCampo('C76');
	ponerPuntosEnCampo('C4');
	ponerPuntosEnCampo('C82');
	ponerPuntosEnCampo('C53');
	ponerPuntosEnCampo('C41');
	ponerPuntosEnCampo('C70');
	ponerPuntosEnCampo('C63');
	ponerPuntosEnCampo('C42');
	ponerPuntosEnCampo('C68');
	ponerPuntosEnCampo('C40');
	ponerPuntosEnCampo('C57');
	ponerPuntosEnCampo('C73');
	ponerPuntosEnCampo('C51');
	ponerPuntosEnCampo('C62');
	ponerPuntosEnCampo('C35');
	ponerPuntosEnCampo('C47');
	ponerPuntosEnCampo('C61');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C36');
	ponerPuntosEnCampo('C33');
	ponerPuntosEnCampo('C48');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C69');
	ponerPuntosEnCampo('C71');
	ponerPuntosEnCampo('C77');
	ponerPuntosEnCampo('C58');
	ponerPuntosEnCampo('C45');
	ponerPuntosEnCampo('C38');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C52');
	ponerPuntosEnCampo('C31');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C54');
	quitarPuntosDeCampo('C43');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C29');
	quitarPuntosDeCampo('C37');
	quitarPuntosDeCampo('C44');
	quitarPuntosDeCampo('C66');
	quitarPuntosDeCampo('C60');
	quitarPuntosDeCampo('C64');
	quitarPuntosDeCampo('C49');
	quitarPuntosDeCampo('C75');
	quitarPuntosDeCampo('C34');
	quitarPuntosDeCampo('C56');
	quitarPuntosDeCampo('C78');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C103');
	quitarPuntosDeCampo('C79');
	quitarPuntosDeCampo('C104');
	quitarPuntosDeCampo('C46');
	quitarPuntosDeCampo('C24');
	quitarPuntosDeCampo('C72');
	quitarPuntosDeCampo('C50');
	quitarPuntosDeCampo('C106');
	quitarPuntosDeCampo('C26');
	quitarPuntosDeCampo('C55');
	quitarPuntosDeCampo('C81');
	quitarPuntosDeCampo('C30');
	quitarPuntosDeCampo('C102');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C39');
	quitarPuntosDeCampo('C74');
	quitarPuntosDeCampo('C67');
	quitarPuntosDeCampo('C20');
	quitarPuntosDeCampo('C80');
	quitarPuntosDeCampo('C101');
	quitarPuntosDeCampo('C32');
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C105');
	quitarPuntosDeCampo('C65');
	quitarPuntosDeCampo('C76');
	quitarPuntosDeCampo('C4');
	quitarPuntosDeCampo('C82');
	quitarPuntosDeCampo('C53');
	quitarPuntosDeCampo('C41');
	quitarPuntosDeCampo('C70');
	quitarPuntosDeCampo('C63');
	quitarPuntosDeCampo('C42');
	quitarPuntosDeCampo('C68');
	quitarPuntosDeCampo('C40');
	quitarPuntosDeCampo('C57');
	quitarPuntosDeCampo('C73');
	quitarPuntosDeCampo('C51');
	quitarPuntosDeCampo('C62');
	quitarPuntosDeCampo('C35');
	quitarPuntosDeCampo('C47');
	quitarPuntosDeCampo('C61');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C36');
	quitarPuntosDeCampo('C33');
	quitarPuntosDeCampo('C48');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C69');
	quitarPuntosDeCampo('C71');
	quitarPuntosDeCampo('C77');
	quitarPuntosDeCampo('C58');
	quitarPuntosDeCampo('C45');
	quitarPuntosDeCampo('C38');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C52');
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
			<link href="../../style/css/bd-rojo.css" rel="stylesheet" type="text/css"/>
			<tbody>
				<tr>
					<td>
						<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">860</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO SELECTIVO AL CONSUMO</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
					</td>
				</tr>
				<tr>
					<td><table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-rojo.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th>
													<p align="left">PARA CONTRIBUYENTES DEL IMPUESTO SELECTIVO AL CONSUMO, EXCEPTO
  AQUELLOS QUE COMERCIALIZAN COMBUSTIBLES DERIVADOS DEL PETROLEO</p></th>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-rojo.gif" width="4" height="4"/></td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<td>
						<table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-rojo.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th class="bordevacio">INC</th>
												<th class="bordevacio" style="width: 90%">
													<p align="left">RUBRO 1 DETALLE DE LOS BIENES ENAJENADOS</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">BASE IMPONIBLE -i-</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">TASA -ii-</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">IMPUESTO -III-</p>
												</th>
											</tr>
											<tr>
												<td colspan="2" class="borde">SECCION Y NUMERAL</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">19</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">20</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">21</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">22</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">23</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">24</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">25</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">26</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">27</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">28</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">29</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">30</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">31</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">32</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">33</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C33</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C33"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">34</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">35</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">36</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">37</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">38</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">39</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">40</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">41</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">42</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">43</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">44</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">45</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">46</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">47</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">48</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">49</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">50</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">51</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">52</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">53</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">54</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">55</td>
												<td class="borde">
													<xsl:call-template name="itemSelectProductos"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">56</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">57</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="borde">58</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td colspan="2" class="borde">TOTAL (Sumatoria de las Casillas de la Col. III)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">60</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C60</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C60"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-rojo.gif" width="4" height="4"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-rojo.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th rowSpan="2" class="bordevacio">INC</th>
												<th rowSpan="2" class="bordevacio" style="width: 95%">
													<p align="left">RUBRO 2 DETALLE DE ANTICIPOS DEL i.s.c. - para uso de empresas fabricantes</p>
												</th>
												<th colSpan="4" class="bordevacio">
													<p align="center">importe</p>
												</th>
											</tr>
											<tr>
												<th colSpan="2" class="bordevacio">
													<p align="center">columna -i-</p>
												</th>
												<th colSpan="2" class="bordevacio" style="width: 90%">
													<p align="center">columna -ii-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Saldo de Anticipos del período anterior (Corresponde al monto declarado en el Inc. j del Rubro 2 correspondiente al periodo anterior)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">61</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C61</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C61"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Monto de Anticipos incluidos por compra en el mercado local en concepto de adquisiciones de materia prima</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">62</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C62</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C62"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Monto de Anticipos incluidos por las importaciones gravadas por el Impuesto en concepto de materia prima</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">63</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C63</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C63"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Monto de los Anticipos del I.S.C. incluido en las materias primas utilizadas en la fabricación de productos enajenados en el mercado local</td>
												<td class="borde">64</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C64</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C64"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">Monto de los Anticipos del I.S.C. incluidos en las materias primas utilizadas en la fabricación de productos enajenados en el mercado internacional</td>
												<td class="borde">65</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C65</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C65"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">f</td>
												<td class="borde">Subtotal (Inc. d+e a Col. I a ser trasladados al Rubro 3 Inc. e) (Inc. a+b+c a Col. II)</td>
												<td class="vacio"/>
												<td class="borde"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">Remanente de los anticipos del I.S.C. incluidos en las materias primas utilizadas en la fabricación de productos enajenados en el mercado internacional, cuya devolución o reembolso será solicitado a través de Certificados de Créditos</td>
												<td class="borde">66</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C66</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C66"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">Anticipos por materias primas que no serán utilizables dentro del proceso productivo (enajenación de materia prima, obsolescencia u otras causas)</td>
												<td class="borde">67</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C67</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C67"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">i</td>
												<td class="borde">Total de Anticipos utilizados en el período (Inc. f+g+h a Col. I)</td>
												<td class="borde">68</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C68</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C68"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">j</td>
												<td class="borde">Saldo a favor del Contribuyente a trasladar en el siguiente período fiscal (Inc. f Col. II menos Inc. i Col. I)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">69</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C69</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C69"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-rojo.gif" width="4" height="4"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<!--IMPRESION-->
				<!--<tr><td class="saltoPagina"></td></tr>-->
				<tr>
					<td>
						<table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-rojo.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th rowSpan="2" class="bordevacio">INC</th>
												<th rowSpan="2" class="bordevacio" style="width: 95%">
													<p align="left">RUBRO 3 liquidacion y saldo del impuesto</p>
												</th>
												<th colSpan="4" class="bordevacio">
													<p align="center">a favor de </p>
												</th>
											</tr>
											<tr>
												<th colSpan="2" class="bordevacio">
													<p align="center">contribuyente -i-</p>
												</th>
												<th colSpan="2" class="bordevacio" style="width: 90%">
													<p align="center">fisco -ii-</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Impuesto Liquidado (Proviene del Rubro 1 Col. III -Casilla 60)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">70</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Saldo a favor del período anterior</td>
												<td class="borde">71</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Retenciones de Impuesto Selectivo al Consumo a favor computables</td>
												<td class="borde">72</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Pago Previo</td>
												<td class="borde">73</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">Anticipos I.S.C. (Proviene del Rubro 2 Inc. f - Col. I)</td>
												<td class="borde">74</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">f</td>
												<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">75</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">g</td>
												<td class="borde">Subtotal (Inc. b+c+d+e a Col.I, Inc. a + f a Col. II)</td>
												<td class="vacio"/>
												<td class="borde"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">h</td>
												<td class="borde">Saldo a favor del Contribuyente (Cuando la Col. I sea mayor que la Col. II en el Inc. g)</td>
												<td class="borde">76</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">i</td>
												<td class="borde">Saldo a favor del Fisco (Cuando la Col. II sea mayor que la Col. I en el Inc. g)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">77</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">j</td>
												<td class="borde">Multa por Mora</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">78</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C78</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C78"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">k</td>
												<td class="borde">
													<p align="left">Intereses ......... % sobre .......................</p>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">79</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C79</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C79"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">l</td>
												<td class="borde">Pago realizado mediante Certificados de Crédito expedido por la SET</td>
												<td class="borde">80</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C80</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C80"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">m</td>
												<td class="borde">Subtotal (Inc. l a Col. I, Inc. i+j+k a Col. II)</td>
												<td class="vacio"/>
												<td class="borde"/>
												<td class="vacio"/>
												<td class="borde"/>
											</tr>
											<tr>
												<td class="borde">n</td>
												<td class="borde">Saldo a favor del Contribuyente para el siguiente período (Cuando Col. I es mayor a Col. II en el Inc. m)</td>
												<td class="borde">81</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C81</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C81"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
												<td class="vacio"/>
												<td class="vacio"/>
											</tr>
											<tr>
												<td class="borde">o</td>
												<td class="borde">Saldo definitivo a pagar a favor de Fisco (Cuando Col. II es mayor que Col. I en el Inc. m)</td>
												<td class="vacio"/>
												<td class="vacio"/>
												<td class="borde">82</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C82</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C82"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-rojo.gif" width="4" height="4"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-rojo.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th class="bordevacio">INC</th>
												<th class="bordevacio" style="width: 95%">
													<p align="left">RUBRO 4 informacion complementaria</p>
												</th>
												<th colSpan="2" class="bordevacio">
													<p align="center">importe</p>
												</th>
											</tr>
											<tr>
												<td class="borde">a</td>
												<td class="borde">Monto Total de Compras en el mercado local por productos gravados por el impuesto, en concepto de materias primas</td>
												<td class="borde">101</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C101</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C101"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">b</td>
												<td class="borde">Monto Total de las Importaciones gravadas por el impuesto, en concepto de materias primas</td>
												<td class="borde">102</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C102</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C102"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">c</td>
												<td class="borde">Monto de las enajenaciones de materia prima sin su transformación en productos terminados, en el período que se declara</td>
												<td class="borde">103</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C103</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C103"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">d</td>
												<td class="borde">Monto de las materias primas que no serán utilizables dentro del proceso productivo por obsolescencia u otras causas</td>
												<td class="borde">104</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C104</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C104"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">e</td>
												<td class="borde">Monto de las operaciones de exportación de productos fabricados, en el período que se declara</td>
												<td class="borde">105</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C105</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C105"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="borde">f</td>
												<td class="borde">Total (suma de Inc. a+b+c+d+e)</td>
												<td class="borde">106</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C106</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C106"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-rojo.gif" width="4" height="4"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="640" class="declaracion1">
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/top-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/top-r-rojo.gif" width="4" height="4"/></td>
							</tr>
							<tr>
								<td width="1" align="left" valign="top" class="fondo"></td>
								<td width="636" valign="top"><table class="declaracion">
										<tbody>
											<tr>
												<th colspan="3" class="bordevacio">
													<p align="left">RUBRO 5 informacion para el uso de certificados de creditos</p></th>
											</tr>
											<tr>
												<td class="borde">Número de Recibo expedido por el Dpto. de Crédito Tributario</td>
												<td class="borde">107</td>
												<td class="borde">
													<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C107</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C107"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table></td>
								<td width="1" align="right" valign="top" class="fondo"></td>
							</tr>
							<tr>
								<td height="4" align="left" valign="bottom"><img src="../../style/images/bot-l-rojo.gif" width="4" height="4"/></td>
								<td class="fondo"></td>
								<td align="right" valign="bottom"><img src="../../style/images/bot-r-rojo.gif" width="4" height="4"/></td>
							</tr>
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
