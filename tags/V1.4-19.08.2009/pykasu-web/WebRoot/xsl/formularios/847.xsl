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
	try { formu["dynamicProps(C13)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C10)"].value) * parseFloat(formu["dynamicProps(C11)"].value) * parseFloat(formu["dynamicProps(C12)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C14)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C14)"].value),parseFloat(formu["dynamicProps(C13)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C15)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C13)"].value)-parseFloat(formu["dynamicProps(C14)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C19)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C16)"].value) * parseFloat(formu["dynamicProps(C17)"].value) * parseFloat(formu["dynamicProps(C18)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C20)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C20)"].value),parseFloat(formu["dynamicProps(C19)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C21)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C19)"].value)-parseFloat(formu["dynamicProps(C20)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C25)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C22)"].value) * parseFloat(formu["dynamicProps(C23)"].value) * parseFloat(formu["dynamicProps(C24)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C26)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C26)"].value),parseFloat(formu["dynamicProps(C25)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C27)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C25)"].value)-parseFloat(formu["dynamicProps(C26)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C31)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C28)"].value) * parseFloat(formu["dynamicProps(C29)"].value) * parseFloat(formu["dynamicProps(C30)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C32)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C32)"].value),parseFloat(formu["dynamicProps(C31)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C33)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C31)"].value)-parseFloat(formu["dynamicProps(C32)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C36)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C15)"].value)+parseFloat(formu["dynamicProps(C21)"].value)+parseFloat(formu["dynamicProps(C27)"].value)+parseFloat(formu["dynamicProps(C33)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C37)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C36)"].value)-(parseFloat(formu["dynamicProps(C34)"].value)+parseFloat(formu["dynamicProps(C35)"].value)),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C46)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C37)"].value) * 0.025));} catch(e){errores++;}
	try { formu["dynamicProps(C63)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C59)"].value)+parseFloat(formu["dynamicProps(C60)"].value)+parseFloat(formu["dynamicProps(C61)"].value)+parseFloat(formu["dynamicProps(C62)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C58)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C53)"].value)+parseFloat(formu["dynamicProps(C54)"].value)+parseFloat(formu["dynamicProps(C55)"].value)+parseFloat(formu["dynamicProps(C56)"].value)+parseFloat(formu["dynamicProps(C57)"].value))-parseFloat(formu["dynamicProps(C69)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C75)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C70)"].value)+parseFloat(formu["dynamicProps(C71)"].value)+parseFloat(formu["dynamicProps(C72)"].value)+parseFloat(formu["dynamicProps(C73)"].value)+parseFloat(formu["dynamicProps(C74)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C118)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C113)"].value)+parseFloat(formu["dynamicProps(C114)"].value)+parseFloat(formu["dynamicProps(C115)"].value)+parseFloat(formu["dynamicProps(C116)"].value)+parseFloat(formu["dynamicProps(C117)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C137)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C121)"].value)+parseFloat(formu["dynamicProps(C122)"].value)+parseFloat(formu["dynamicProps(C123)"].value)+parseFloat(formu["dynamicProps(C124)"].value)+parseFloat(formu["dynamicProps(C125)"].value)+parseFloat(formu["dynamicProps(C126)"].value)+parseFloat(formu["dynamicProps(C127)"].value)+parseFloat(formu["dynamicProps(C128)"].value)+parseFloat(formu["dynamicProps(C129)"].value)+parseFloat(formu["dynamicProps(C130)"].value)+parseFloat(formu["dynamicProps(C131)"].value)+parseFloat(formu["dynamicProps(C132)"].value)+parseFloat(formu["dynamicProps(C133)"].value)+parseFloat(formu["dynamicProps(C134)"].value)+parseFloat(formu["dynamicProps(C135)"].value)+parseFloat(formu["dynamicProps(C136)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C138)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C137)"].value)-parseFloat(formu["dynamicProps(C118)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C119)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C118)"].value)-parseFloat(formu["dynamicProps(C137)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C147)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C112)"].value),parseFloat(formu["dynamicProps(C146)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C149)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C147)"].value)+parseFloat(formu["dynamicProps(C148)"].value))-parseFloat(formu["dynamicProps(C150)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C150)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C68)"].value),parseFloat(formu["dynamicProps(C120)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C151)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C150)"].value)-(parseFloat(formu["dynamicProps(C147)"].value)-parseFloat(formu["dynamicProps(C148)"].value)),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C47)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C151)"].value) * 0.1));} catch(e){errores++;}
	try { formu["dynamicProps(C153)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C152)"].value)-parseFloat(formu["dynamicProps(C154)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C154)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C154)"].value),parseFloat(formu["dynamicProps(C152)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C157)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C155)"].value)+parseFloat(formu["dynamicProps(C156)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C158)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C157)"].value)-parseFloat(formu["dynamicProps(C159)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C159)"].value = nvl(Math.round(menor(elegir(parseFloat(formu["dynamicProps(C159)"].value)-(parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C47)"].value)),1,0,parseFloat(formu["dynamicProps(C159)"].value)),parseFloat(formu["dynamicProps(C157)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C42)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C159)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C50)"].value = nvl(Math.round(calcularmora(mayor(parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C47)"].value)-(parseFloat(formu["dynamicProps(C38)"].value)+parseFloat(formu["dynamicProps(C39)"].value)+parseFloat(formu["dynamicProps(C40)"].value)+parseFloat(formu["dynamicProps(C41)"].value)+parseFloat(formu["dynamicProps(C42)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C51)"].value = nvl(Math.round(calcularinteres(mayor(parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C47)"].value)-(parseFloat(formu["dynamicProps(C38)"].value)+parseFloat(formu["dynamicProps(C39)"].value)+parseFloat(formu["dynamicProps(C40)"].value)+parseFloat(formu["dynamicProps(C41)"].value)+parseFloat(formu["dynamicProps(C42)"].value)),0))));} catch(e){errores++;}
	try { formu["dynamicProps(C162)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C160)"].value)+parseFloat(formu["dynamicProps(C161)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C163)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C162)"].value)-parseFloat(formu["dynamicProps(C164)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C48)"].value = nvl(Math.round(elegir(calcularmulta(131,parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C47)"].value)),0,si(parseFloat(formu["dynamicProps(C48)"].value)>0,50000,0),calcularmulta(131,parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C47)"].value)))));} catch(e){errores++;}
	try { formu["dynamicProps(C49)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C47)"].value)+parseFloat(formu["dynamicProps(C48)"].value))-(parseFloat(formu["dynamicProps(C38)"].value)+parseFloat(formu["dynamicProps(C39)"].value)+parseFloat(formu["dynamicProps(C40)"].value)+parseFloat(formu["dynamicProps(C41)"].value)+parseFloat(formu["dynamicProps(C42)"].value)),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C43)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C38)"].value)+parseFloat(formu["dynamicProps(C39)"].value)+parseFloat(formu["dynamicProps(C40)"].value)+parseFloat(formu["dynamicProps(C41)"].value)+parseFloat(formu["dynamicProps(C42)"].value))-(parseFloat(formu["dynamicProps(C46)"].value)+parseFloat(formu["dynamicProps(C47)"].value)+parseFloat(formu["dynamicProps(C48)"].value)),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C164)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C164)"].value),parseFloat(formu["dynamicProps(C162)"].value))));} catch(e){errores++;}
	try { formu["dynamicProps(C52)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C49)"].value)+parseFloat(formu["dynamicProps(C50)"].value)+parseFloat(formu["dynamicProps(C51)"].value)-parseFloat(formu["dynamicProps(C44)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C45)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C43)"].value)+parseFloat(formu["dynamicProps(C44)"].value))-(parseFloat(formu["dynamicProps(C49)"].value)+parseFloat(formu["dynamicProps(C50)"].value)+parseFloat(formu["dynamicProps(C51)"].value)),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C111)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C105)"].value)+parseFloat(formu["dynamicProps(C106)"].value)+parseFloat(formu["dynamicProps(C107)"].value)+parseFloat(formu["dynamicProps(C108)"].value)+parseFloat(formu["dynamicProps(C109)"].value)+parseFloat(formu["dynamicProps(C110)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C145)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C139)"].value)+parseFloat(formu["dynamicProps(C140)"].value)+parseFloat(formu["dynamicProps(C141)"].value)+parseFloat(formu["dynamicProps(C142)"].value)+parseFloat(formu["dynamicProps(C143)"].value)+parseFloat(formu["dynamicProps(C144)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C120)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C119)"].value)-parseFloat(formu["dynamicProps(C145)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C168)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C166)"].value)+parseFloat(formu["dynamicProps(C167)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C170)"].value = nvl(Math.round(si(parseFloat(formu["dynamicProps(C165)"].value)>0,(parseFloat(formu["dynamicProps(C168)"].value) / parseFloat(formu["dynamicProps(C165)"].value)) * 100,0)));} catch(e){errores++;}
	try { formu["dynamicProps(C172)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C75)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C173)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C171)"].value)+parseFloat(formu["dynamicProps(C172)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C174)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C173)"].value)-parseFloat(formu["dynamicProps(C169)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C66)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C174)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C103)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C76)"].value)+parseFloat(formu["dynamicProps(C77)"].value)+parseFloat(formu["dynamicProps(C78)"].value)+parseFloat(formu["dynamicProps(C79)"].value)+parseFloat(formu["dynamicProps(C80)"].value)+parseFloat(formu["dynamicProps(C81)"].value)+parseFloat(formu["dynamicProps(C82)"].value)+parseFloat(formu["dynamicProps(C83)"].value)+parseFloat(formu["dynamicProps(C84)"].value)+parseFloat(formu["dynamicProps(C85)"].value)+parseFloat(formu["dynamicProps(C86)"].value)+parseFloat(formu["dynamicProps(C87)"].value)+parseFloat(formu["dynamicProps(C88)"].value)+parseFloat(formu["dynamicProps(C89)"].value)+parseFloat(formu["dynamicProps(C90)"].value)+parseFloat(formu["dynamicProps(C100)"].value)+parseFloat(formu["dynamicProps(C101)"].value)+parseFloat(formu["dynamicProps(C102)"].value))-(parseFloat(formu["dynamicProps(C64)"].value)+parseFloat(formu["dynamicProps(C65)"].value)+parseFloat(formu["dynamicProps(C66)"].value)),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C176)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C168)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C177)"].value = nvl(Math.round(parseFloat(formu["dynamicProps(C175)"].value)+parseFloat(formu["dynamicProps(C176)"].value)));} catch(e){errores++;}
	try { formu["dynamicProps(C67)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C58)"].value)-parseFloat(formu["dynamicProps(C75)"].value)-parseFloat(formu["dynamicProps(C103)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C178)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C177)"].value)-parseFloat(formu["dynamicProps(C179)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C68)"].value = nvl(Math.round(mayor(parseFloat(formu["dynamicProps(C67)"].value)-parseFloat(formu["dynamicProps(C111)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C104)"].value = nvl(Math.round(mayor((parseFloat(formu["dynamicProps(C75)"].value)+parseFloat(formu["dynamicProps(C103)"].value))-parseFloat(formu["dynamicProps(C58)"].value),0)));} catch(e){errores++;}
	try { formu["dynamicProps(C179)"].value = nvl(Math.round(menor(parseFloat(formu["dynamicProps(C179)"].value),parseFloat(formu["dynamicProps(C177)"].value))));} catch(e){errores++;}
	return errores;
}

function Cerar(formu) {
	var errores=0;
	try { if(formu["dynamicProps(C179)"].value == "") formu["dynamicProps(C179)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C139)"].value == "") formu["dynamicProps(C139)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C54)"].value == "") formu["dynamicProps(C54)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C43)"].value == "") formu["dynamicProps(C43)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C59)"].value == "") formu["dynamicProps(C59)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C37)"].value == "") formu["dynamicProps(C37)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C29)"].value == "") formu["dynamicProps(C29)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C44)"].value == "") formu["dynamicProps(C44)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C66)"].value == "") formu["dynamicProps(C66)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C15)"].value == "") formu["dynamicProps(C15)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C126)"].value == "") formu["dynamicProps(C126)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C49)"].value == "") formu["dynamicProps(C49)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C56)"].value == "") formu["dynamicProps(C56)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C137)"].value == "") formu["dynamicProps(C137)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C78)"].value == "") formu["dynamicProps(C78)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C118)"].value == "") formu["dynamicProps(C118)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C148)"].value == "") formu["dynamicProps(C148)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C177)"].value == "") formu["dynamicProps(C177)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C143)"].value == "") formu["dynamicProps(C143)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C27)"].value == "") formu["dynamicProps(C27)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C79)"].value == "") formu["dynamicProps(C79)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C115)"].value == "") formu["dynamicProps(C115)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C127)"].value == "") formu["dynamicProps(C127)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C13)"].value == "") formu["dynamicProps(C13)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C24)"].value == "") formu["dynamicProps(C24)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C72)"].value == "") formu["dynamicProps(C72)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C128)"].value == "") formu["dynamicProps(C128)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C134)"].value == "") formu["dynamicProps(C134)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C55)"].value == "") formu["dynamicProps(C55)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C26)"].value == "") formu["dynamicProps(C26)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C162)"].value == "") formu["dynamicProps(C162)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C125)"].value == "") formu["dynamicProps(C125)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C81)"].value == "") formu["dynamicProps(C81)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C16)"].value == "") formu["dynamicProps(C16)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C39)"].value == "") formu["dynamicProps(C39)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C17)"].value == "") formu["dynamicProps(C17)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C67)"].value == "") formu["dynamicProps(C67)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C132)"].value == "") formu["dynamicProps(C132)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C80)"].value == "") formu["dynamicProps(C80)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C108)"].value == "") formu["dynamicProps(C108)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C135)"].value == "") formu["dynamicProps(C135)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C105)"].value == "") formu["dynamicProps(C105)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C32)"].value == "") formu["dynamicProps(C32)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C21)"].value == "") formu["dynamicProps(C21)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C65)"].value == "") formu["dynamicProps(C65)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C76)"].value == "") formu["dynamicProps(C76)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C117)"].value == "") formu["dynamicProps(C117)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C122)"].value == "") formu["dynamicProps(C122)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C144)"].value == "") formu["dynamicProps(C144)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C82)"].value == "") formu["dynamicProps(C82)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C53)"].value == "") formu["dynamicProps(C53)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C85)"].value == "") formu["dynamicProps(C85)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C70)"].value == "") formu["dynamicProps(C70)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C86)"].value == "") formu["dynamicProps(C86)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C42)"].value == "") formu["dynamicProps(C42)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C84)"].value == "") formu["dynamicProps(C84)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C35)"].value == "") formu["dynamicProps(C35)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C83)"].value == "") formu["dynamicProps(C83)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C47)"].value == "") formu["dynamicProps(C47)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C109)"].value == "") formu["dynamicProps(C109)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C25)"].value == "") formu["dynamicProps(C25)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C36)"].value == "") formu["dynamicProps(C36)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C110)"].value == "") formu["dynamicProps(C110)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C147)"].value == "") formu["dynamicProps(C147)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C33)"].value == "") formu["dynamicProps(C33)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C133)"].value == "") formu["dynamicProps(C133)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C48)"].value == "") formu["dynamicProps(C48)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C77)"].value == "") formu["dynamicProps(C77)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C71)"].value == "") formu["dynamicProps(C71)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C58)"].value == "") formu["dynamicProps(C58)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C161)"].value == "") formu["dynamicProps(C161)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C107)"].value == "") formu["dynamicProps(C107)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C38)"].value == "") formu["dynamicProps(C38)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C160)"].value == "") formu["dynamicProps(C160)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C114)"].value == "") formu["dynamicProps(C114)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C31)"].value == "") formu["dynamicProps(C31)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C119)"].value == "") formu["dynamicProps(C119)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C152)"].value == "") formu["dynamicProps(C152)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C141)"].value == "") formu["dynamicProps(C141)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C10)"].value == "") formu["dynamicProps(C10)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C22)"].value == "") formu["dynamicProps(C22)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C60)"].value == "") formu["dynamicProps(C60)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C121)"].value == "") formu["dynamicProps(C121)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C64)"].value == "") formu["dynamicProps(C64)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C75)"].value == "") formu["dynamicProps(C75)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C34)"].value == "") formu["dynamicProps(C34)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C165)"].value == "") formu["dynamicProps(C165)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C12)"].value == "") formu["dynamicProps(C12)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C103)"].value == "") formu["dynamicProps(C103)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C159)"].value == "") formu["dynamicProps(C159)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C142)"].value == "") formu["dynamicProps(C142)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C112)"].value == "") formu["dynamicProps(C112)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C87)"].value == "") formu["dynamicProps(C87)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C46)"].value == "") formu["dynamicProps(C46)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C174)"].value == "") formu["dynamicProps(C174)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C150)"].value == "") formu["dynamicProps(C150)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C145)"].value == "") formu["dynamicProps(C145)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C123)"].value == "") formu["dynamicProps(C123)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C111)"].value == "") formu["dynamicProps(C111)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C167)"].value == "") formu["dynamicProps(C167)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C156)"].value == "") formu["dynamicProps(C156)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C50)"].value == "") formu["dynamicProps(C50)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C106)"].value == "") formu["dynamicProps(C106)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C136)"].value == "") formu["dynamicProps(C136)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C155)"].value == "") formu["dynamicProps(C155)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C169)"].value == "") formu["dynamicProps(C169)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C11)"].value == "") formu["dynamicProps(C11)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C113)"].value == "") formu["dynamicProps(C113)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C18)"].value == "") formu["dynamicProps(C18)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C102)"].value == "") formu["dynamicProps(C102)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C30)"].value == "") formu["dynamicProps(C30)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C173)"].value == "") formu["dynamicProps(C173)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C74)"].value == "") formu["dynamicProps(C74)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C23)"].value == "") formu["dynamicProps(C23)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C20)"].value == "") formu["dynamicProps(C20)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C124)"].value == "") formu["dynamicProps(C124)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C101)"].value == "") formu["dynamicProps(C101)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C157)"].value == "") formu["dynamicProps(C157)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C168)"].value == "") formu["dynamicProps(C168)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C146)"].value == "") formu["dynamicProps(C146)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C100)"].value == "") formu["dynamicProps(C100)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C130)"].value == "") formu["dynamicProps(C130)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C116)"].value == "") formu["dynamicProps(C116)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C171)"].value == "") formu["dynamicProps(C171)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C166)"].value == "") formu["dynamicProps(C166)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C151)"].value == "") formu["dynamicProps(C151)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C129)"].value == "") formu["dynamicProps(C129)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C172)"].value == "") formu["dynamicProps(C172)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C41)"].value == "") formu["dynamicProps(C41)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C68)"].value == "") formu["dynamicProps(C68)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C40)"].value == "") formu["dynamicProps(C40)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C131)"].value == "") formu["dynamicProps(C131)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C164)"].value == "") formu["dynamicProps(C164)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C57)"].value == "") formu["dynamicProps(C57)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C73)"].value == "") formu["dynamicProps(C73)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C90)"].value == "") formu["dynamicProps(C90)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C51)"].value == "") formu["dynamicProps(C51)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C62)"].value == "") formu["dynamicProps(C62)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C120)"].value == "") formu["dynamicProps(C120)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C61)"].value == "") formu["dynamicProps(C61)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C14)"].value == "") formu["dynamicProps(C14)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C175)"].value == "") formu["dynamicProps(C175)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C176)"].value == "") formu["dynamicProps(C176)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C140)"].value == "") formu["dynamicProps(C140)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C89)"].value == "") formu["dynamicProps(C89)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C19)"].value == "") formu["dynamicProps(C19)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C69)"].value == "") formu["dynamicProps(C69)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C88)"].value == "") formu["dynamicProps(C88)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C154)"].value == "") formu["dynamicProps(C154)"].value = 0;} catch(e) {errores++;} 
	try { if(formu["dynamicProps(C28)"].value == "") formu["dynamicProps(C28)"].value = 0;} catch(e) {errores++;} 
	return errores;
}

function ponerTodosLosPuntos(formu) {
	ponerPuntosEnCampo('C179');
	ponerPuntosEnCampo('C54');
	ponerPuntosEnCampo('C139');
	ponerPuntosEnCampo('C43');
	ponerPuntosEnCampo('C59');
	ponerPuntosEnCampo('C44');
	ponerPuntosEnCampo('C29');
	ponerPuntosEnCampo('C37');
	ponerPuntosEnCampo('C15');
	ponerPuntosEnCampo('C66');
	ponerPuntosEnCampo('C126');
	ponerPuntosEnCampo('C49');
	ponerPuntosEnCampo('C137');
	ponerPuntosEnCampo('C56');
	ponerPuntosEnCampo('C148');
	ponerPuntosEnCampo('C118');
	ponerPuntosEnCampo('C78');
	ponerPuntosEnCampo('C27');
	ponerPuntosEnCampo('C143');
	ponerPuntosEnCampo('C177');
	ponerPuntosEnCampo('C115');
	ponerPuntosEnCampo('C79');
	ponerPuntosEnCampo('C127');
	ponerPuntosEnCampo('C13');
	ponerPuntosEnCampo('C24');
	ponerPuntosEnCampo('C72');
	ponerPuntosEnCampo('C128');
	ponerPuntosEnCampo('C134');
	ponerPuntosEnCampo('C162');
	ponerPuntosEnCampo('C26');
	ponerPuntosEnCampo('C55');
	ponerPuntosEnCampo('C125');
	ponerPuntosEnCampo('C170');
	ponerPuntosEnCampo('C81');
	ponerPuntosEnCampo('C16');
	ponerPuntosEnCampo('C39');
	ponerPuntosEnCampo('C17');
	ponerPuntosEnCampo('C132');
	ponerPuntosEnCampo('C67');
	ponerPuntosEnCampo('C80');
	ponerPuntosEnCampo('C138');
	ponerPuntosEnCampo('C108');
	ponerPuntosEnCampo('C135');
	ponerPuntosEnCampo('C21');
	ponerPuntosEnCampo('C32');
	ponerPuntosEnCampo('C105');
	ponerPuntosEnCampo('C76');
	ponerPuntosEnCampo('C65');
	ponerPuntosEnCampo('C122');
	ponerPuntosEnCampo('C117');
	ponerPuntosEnCampo('C144');
	ponerPuntosEnCampo('C82');
	ponerPuntosEnCampo('C53');
	ponerPuntosEnCampo('C70');
	ponerPuntosEnCampo('C85');
	ponerPuntosEnCampo('C86');
	ponerPuntosEnCampo('C42');
	ponerPuntosEnCampo('C84');
	ponerPuntosEnCampo('C149');
	ponerPuntosEnCampo('C35');
	ponerPuntosEnCampo('C83');
	ponerPuntosEnCampo('C47');
	ponerPuntosEnCampo('C36');
	ponerPuntosEnCampo('C25');
	ponerPuntosEnCampo('C109');
	ponerPuntosEnCampo('C147');
	ponerPuntosEnCampo('C110');
	ponerPuntosEnCampo('C158');
	ponerPuntosEnCampo('C48');
	ponerPuntosEnCampo('C133');
	ponerPuntosEnCampo('C33');
	ponerPuntosEnCampo('C71');
	ponerPuntosEnCampo('C77');
	ponerPuntosEnCampo('C58');
	ponerPuntosEnCampo('C161');
	ponerPuntosEnCampo('C107');
	ponerPuntosEnCampo('C38');
	ponerPuntosEnCampo('C160');
	ponerPuntosEnCampo('C114');
	ponerPuntosEnCampo('C31');
	ponerPuntosEnCampo('C119');
	ponerPuntosEnCampo('C152');
	ponerPuntosEnCampo('C141');
	ponerPuntosEnCampo('C10');
	ponerPuntosEnCampo('C22');
	ponerPuntosEnCampo('C60');
	ponerPuntosEnCampo('C121');
	ponerPuntosEnCampo('C64');
	ponerPuntosEnCampo('C75');
	ponerPuntosEnCampo('C34');
	ponerPuntosEnCampo('C12');
	ponerPuntosEnCampo('C165');
	ponerPuntosEnCampo('C159');
	ponerPuntosEnCampo('C103');
	ponerPuntosEnCampo('C153');
	ponerPuntosEnCampo('C112');
	ponerPuntosEnCampo('C142');
	ponerPuntosEnCampo('C87');
	ponerPuntosEnCampo('C104');
	ponerPuntosEnCampo('C46');
	ponerPuntosEnCampo('C150');
	ponerPuntosEnCampo('C174');
	ponerPuntosEnCampo('C145');
	ponerPuntosEnCampo('C123');
	ponerPuntosEnCampo('C156');
	ponerPuntosEnCampo('C167');
	ponerPuntosEnCampo('C111');
	ponerPuntosEnCampo('C50');
	ponerPuntosEnCampo('C155');
	ponerPuntosEnCampo('C136');
	ponerPuntosEnCampo('C106');
	ponerPuntosEnCampo('C169');
	ponerPuntosEnCampo('C11');
	ponerPuntosEnCampo('C18');
	ponerPuntosEnCampo('C113');
	ponerPuntosEnCampo('C30');
	ponerPuntosEnCampo('C102');
	ponerPuntosEnCampo('C23');
	ponerPuntosEnCampo('C74');
	ponerPuntosEnCampo('C173');
	ponerPuntosEnCampo('C20');
	ponerPuntosEnCampo('C124');
	ponerPuntosEnCampo('C157');
	ponerPuntosEnCampo('C101');
	ponerPuntosEnCampo('C168');
	ponerPuntosEnCampo('C146');
	ponerPuntosEnCampo('C130');
	ponerPuntosEnCampo('C100');
	ponerPuntosEnCampo('C163');
	ponerPuntosEnCampo('C116');
	ponerPuntosEnCampo('C166');
	ponerPuntosEnCampo('C171');
	ponerPuntosEnCampo('C151');
	ponerPuntosEnCampo('C129');
	ponerPuntosEnCampo('C172');
	ponerPuntosEnCampo('C41');
	ponerPuntosEnCampo('C63');
	ponerPuntosEnCampo('C40');
	ponerPuntosEnCampo('C68');
	ponerPuntosEnCampo('C164');
	ponerPuntosEnCampo('C131');
	ponerPuntosEnCampo('C57');
	ponerPuntosEnCampo('C73');
	ponerPuntosEnCampo('C90');
	ponerPuntosEnCampo('C51');
	ponerPuntosEnCampo('C120');
	ponerPuntosEnCampo('C62');
	ponerPuntosEnCampo('C61');
	ponerPuntosEnCampo('C14');
	ponerPuntosEnCampo('C175');
	ponerPuntosEnCampo('C140');
	ponerPuntosEnCampo('C176');
	ponerPuntosEnCampo('C89');
	ponerPuntosEnCampo('C19');
	ponerPuntosEnCampo('C69');
	ponerPuntosEnCampo('C88');
	ponerPuntosEnCampo('C45');
	ponerPuntosEnCampo('C154');
	ponerPuntosEnCampo('C28');
	ponerPuntosEnCampo('C52');
	ponerPuntosEnCampo('C178');
}

function quitarTodosLosPuntos(formu) {
	quitarPuntosDeCampo('C179');
	quitarPuntosDeCampo('C54');
	quitarPuntosDeCampo('C139');
	quitarPuntosDeCampo('C43');
	quitarPuntosDeCampo('C59');
	quitarPuntosDeCampo('C44');
	quitarPuntosDeCampo('C29');
	quitarPuntosDeCampo('C37');
	quitarPuntosDeCampo('C15');
	quitarPuntosDeCampo('C66');
	quitarPuntosDeCampo('C126');
	quitarPuntosDeCampo('C49');
	quitarPuntosDeCampo('C137');
	quitarPuntosDeCampo('C56');
	quitarPuntosDeCampo('C148');
	quitarPuntosDeCampo('C118');
	quitarPuntosDeCampo('C78');
	quitarPuntosDeCampo('C27');
	quitarPuntosDeCampo('C143');
	quitarPuntosDeCampo('C177');
	quitarPuntosDeCampo('C115');
	quitarPuntosDeCampo('C79');
	quitarPuntosDeCampo('C127');
	quitarPuntosDeCampo('C13');
	quitarPuntosDeCampo('C24');
	quitarPuntosDeCampo('C72');
	quitarPuntosDeCampo('C128');
	quitarPuntosDeCampo('C134');
	quitarPuntosDeCampo('C162');
	quitarPuntosDeCampo('C26');
	quitarPuntosDeCampo('C55');
	quitarPuntosDeCampo('C125');
	quitarPuntosDeCampo('C170');
	quitarPuntosDeCampo('C81');
	quitarPuntosDeCampo('C16');
	quitarPuntosDeCampo('C39');
	quitarPuntosDeCampo('C17');
	quitarPuntosDeCampo('C132');
	quitarPuntosDeCampo('C67');
	quitarPuntosDeCampo('C80');
	quitarPuntosDeCampo('C138');
	quitarPuntosDeCampo('C108');
	quitarPuntosDeCampo('C135');
	quitarPuntosDeCampo('C21');
	quitarPuntosDeCampo('C32');
	quitarPuntosDeCampo('C105');
	quitarPuntosDeCampo('C76');
	quitarPuntosDeCampo('C65');
	quitarPuntosDeCampo('C122');
	quitarPuntosDeCampo('C117');
	quitarPuntosDeCampo('C144');
	quitarPuntosDeCampo('C82');
	quitarPuntosDeCampo('C53');
	quitarPuntosDeCampo('C70');
	quitarPuntosDeCampo('C85');
	quitarPuntosDeCampo('C86');
	quitarPuntosDeCampo('C42');
	quitarPuntosDeCampo('C84');
	quitarPuntosDeCampo('C149');
	quitarPuntosDeCampo('C35');
	quitarPuntosDeCampo('C83');
	quitarPuntosDeCampo('C47');
	quitarPuntosDeCampo('C36');
	quitarPuntosDeCampo('C25');
	quitarPuntosDeCampo('C109');
	quitarPuntosDeCampo('C147');
	quitarPuntosDeCampo('C110');
	quitarPuntosDeCampo('C158');
	quitarPuntosDeCampo('C48');
	quitarPuntosDeCampo('C133');
	quitarPuntosDeCampo('C33');
	quitarPuntosDeCampo('C71');
	quitarPuntosDeCampo('C77');
	quitarPuntosDeCampo('C58');
	quitarPuntosDeCampo('C161');
	quitarPuntosDeCampo('C107');
	quitarPuntosDeCampo('C38');
	quitarPuntosDeCampo('C160');
	quitarPuntosDeCampo('C114');
	quitarPuntosDeCampo('C31');
	quitarPuntosDeCampo('C119');
	quitarPuntosDeCampo('C152');
	quitarPuntosDeCampo('C141');
	quitarPuntosDeCampo('C10');
	quitarPuntosDeCampo('C22');
	quitarPuntosDeCampo('C60');
	quitarPuntosDeCampo('C121');
	quitarPuntosDeCampo('C64');
	quitarPuntosDeCampo('C75');
	quitarPuntosDeCampo('C34');
	quitarPuntosDeCampo('C12');
	quitarPuntosDeCampo('C165');
	quitarPuntosDeCampo('C159');
	quitarPuntosDeCampo('C103');
	quitarPuntosDeCampo('C153');
	quitarPuntosDeCampo('C112');
	quitarPuntosDeCampo('C142');
	quitarPuntosDeCampo('C87');
	quitarPuntosDeCampo('C104');
	quitarPuntosDeCampo('C46');
	quitarPuntosDeCampo('C150');
	quitarPuntosDeCampo('C174');
	quitarPuntosDeCampo('C145');
	quitarPuntosDeCampo('C123');
	quitarPuntosDeCampo('C156');
	quitarPuntosDeCampo('C167');
	quitarPuntosDeCampo('C111');
	quitarPuntosDeCampo('C50');
	quitarPuntosDeCampo('C155');
	quitarPuntosDeCampo('C136');
	quitarPuntosDeCampo('C106');
	quitarPuntosDeCampo('C169');
	quitarPuntosDeCampo('C11');
	quitarPuntosDeCampo('C18');
	quitarPuntosDeCampo('C113');
	quitarPuntosDeCampo('C30');
	quitarPuntosDeCampo('C102');
	quitarPuntosDeCampo('C23');
	quitarPuntosDeCampo('C74');
	quitarPuntosDeCampo('C173');
	quitarPuntosDeCampo('C20');
	quitarPuntosDeCampo('C124');
	quitarPuntosDeCampo('C157');
	quitarPuntosDeCampo('C101');
	quitarPuntosDeCampo('C168');
	quitarPuntosDeCampo('C146');
	quitarPuntosDeCampo('C130');
	quitarPuntosDeCampo('C100');
	quitarPuntosDeCampo('C163');
	quitarPuntosDeCampo('C116');
	quitarPuntosDeCampo('C166');
	quitarPuntosDeCampo('C171');
	quitarPuntosDeCampo('C151');
	quitarPuntosDeCampo('C129');
	quitarPuntosDeCampo('C172');
	quitarPuntosDeCampo('C41');
	quitarPuntosDeCampo('C63');
	quitarPuntosDeCampo('C40');
	quitarPuntosDeCampo('C68');
	quitarPuntosDeCampo('C164');
	quitarPuntosDeCampo('C131');
	quitarPuntosDeCampo('C57');
	quitarPuntosDeCampo('C73');
	quitarPuntosDeCampo('C90');
	quitarPuntosDeCampo('C51');
	quitarPuntosDeCampo('C120');
	quitarPuntosDeCampo('C62');
	quitarPuntosDeCampo('C61');
	quitarPuntosDeCampo('C14');
	quitarPuntosDeCampo('C175');
	quitarPuntosDeCampo('C140');
	quitarPuntosDeCampo('C176');
	quitarPuntosDeCampo('C89');
	quitarPuntosDeCampo('C19');
	quitarPuntosDeCampo('C69');
	quitarPuntosDeCampo('C88');
	quitarPuntosDeCampo('C45');
	quitarPuntosDeCampo('C154');
	quitarPuntosDeCampo('C28');
	quitarPuntosDeCampo('C52');
	quitarPuntosDeCampo('C178');
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
						<xsl:call-template name="cabeceraDeclaracionesClausura"><xsl:with-param name="pFormulario">847</xsl:with-param><xsl:with-param name="pVersion">V.1</xsl:with-param><xsl:with-param name="pImpuesto">IMPUESTO A LA RENTA DE ACTIVIDADES AGROPECUARIAS</xsl:with-param><xsl:with-param name="pNombres"><xsl:value-of select="$Nombre"/></xsl:with-param><xsl:with-param name="pNumero"><xsl:value-of select="declaracion/detalle/C901"/></xsl:with-param><xsl:with-param name="pNumeroRectifica"><xsl:value-of select="declaracion/detalle/C3"/></xsl:with-param><xsl:with-param name="pPeriodo"><xsl:value-of select="$Periodo"/></xsl:with-param><xsl:with-param name="pPrimerApellido"><xsl:value-of select="$PrimerApellido"/></xsl:with-param><xsl:with-param name="pSegundoApellido"><xsl:value-of select="$SegundoApellido"/></xsl:with-param><xsl:with-param name="pRuc"><xsl:value-of select="$Ruc"/>
							</xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param><xsl:with-param name="pDv"><xsl:value-of select="$Dv"/></xsl:with-param></xsl:call-template>
					</td>
				</tr>
				<tr>
					<td/>
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
													<th>
														<p align="left">PARA CONTRIBUYENTES QUE SE ENCUENTREN AFECTADOS AL IMPUESTO A LAS ACTIVIDADES AGROPECUARIAS</p>
													</th>
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
										<table class="declaracion" border="0">
											<tbody>
												<tr>
													<th class="bordevacio">INC</th>
													<th class="bordevacio" style="width: 90%">
														<p align="left">RUBRO 1 DETERMINACION DE LA BASE IMPONIBLE - REGIMEN PRESUNTO</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">ZONA 1 - GRANERA O SOJA</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">ZONA 2 - FIBRA O ALGODON</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">ZONA 3 - GANADERO ALTO RENDIMIENTO</p>
													</th>
													<th class="bordevacio" colSpan="2">
														<p align="center">ZONA 4 - GANADERO RENDIMIENTO MEDIO</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">SAU computable                    </td>
													<td class="borde">10</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C10</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C10"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">16</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C16</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C16"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">22</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C22</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C22"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">28</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C28</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C28"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b </td>
													<td class="borde">Productividad Kg./Ha.</td>
													<td class="borde">11</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C11</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C11"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">17</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C17</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C17"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">23</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C23</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C23"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">29</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C29</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C29"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Precio por Kg.</td>
													<td class="borde">12</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C12</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C12"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">18</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C18</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C18"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">24</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C24</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C24"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">30</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C30</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C30"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">
														<strong>SUB TOTALES</strong> (Inc. a x b x c) 
												</td>
													<td class="borde">13</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C13</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C13"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">19</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C19</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C19"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">25</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C25</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C25"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">31</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C31</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C31"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Liquidación proporcional por la tenencia efectiva del inmueble en el ejercicio (ver instructivo)</td>
													<td class="borde">14</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C14</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C14"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">20</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C20</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C20"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">26</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C26</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C26"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">32</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C32</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C32"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">
														<strong>TOTAL RENTA BRUTA</strong> (Inc. d - e) 
												</td>
													<td class="borde">15</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C15</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C15"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">21</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C21</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C21"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">27</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C27</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C27"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
				<tr/>
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
														<p align="left">RUBRO 2 determinacion de la renta neta - regimen presunto</p>
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
														<p align="center">Fisco -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">
														<strong>TOTAL RENTA BRUTA</strong> (Suma de los montos del Rubro 1 Inc. f) 
												</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">36</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C36</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C36"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Deducción del IVA, por saldos provenientes de la Ley 125/91 (Proviene del Rubro 7 Inc. b)</td>
													<td class="borde">34</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C34</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C34"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Deducción por pérdidas extraordinarias establecidas por el Poder Ejecutivo</td>
													<td class="borde">35</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C35</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C35"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">
														<strong>SUB TOTALES</strong> (Inc. b + c Col. I; Inc. a Col. II) 
												</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">
														<strong>RENTA NETA DEL EJERCICIO</strong> (Inc. d Col. II menos Inc. d Col. I) 
												</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">37</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C37</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C37"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
														<p align="left">RUBRO 3 liquidacion y saldo del impuesto</p>
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
													<td class="borde">Impuesto liquidado por resultado de ingresos por el régimen presunto (..........% sobre Rubro 2 Inc. e)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">46</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C46</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C46"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Impuesto liquidado por resultado de régimen Simplificado o Contable (..........% sobre Rubro 6 Inc. f)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">47</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C47</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C47"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Saldo a favor del contribuyente del periodo anterior</td>
													<td class="borde">38</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C38</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C38"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Pago Previo</td>
													<td class="borde">39</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C39</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C39"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Retenciones computables a favor del contribuyente</td>
													<td class="borde">40</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C40</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C40"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Anticipos Ingresados</td>
													<td class="borde">41</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C41</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C41"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Deducción del IVA del presente ejercicio</td>
													<td class="borde">42</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C42</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C42"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Multa por presentar la Declaración Jurada con posterioridad al vencimiento</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">48</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C48</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C48"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde">
														<strong>SUB TOTALES</strong> (Inc. c+d+e+f+g Col. I); (Inc. b+h Col. II) o (Inc. a+h Col. II), según corresponda 
												</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Saldo a favor del Contribuyente para el siguiente periodo (Inc. i Col. I menos Inc. i Col. II, cuando Col. I sea mayor que Col. II)</td>
													<td class="borde">43</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C43</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C43"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">k</td>
													<td class="borde">Saldo a favor del Fisco (Inc. i Col. II menos Inc. i Col. I, cuando Col. II sea mayor que Col. I)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">49</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C49</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C49"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">l</td>
													<td class="borde">Multa por Mora .........% sobre resultado (Inc. k menos el Inc. h) (Sólo se calculará cuando Inc. k sea mayor que Inc. h)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">50</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C50</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C50"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">m</td>
													<td class="borde">Intereses sobre resultado (Inc. k menos el Inc. h) (Sólo se calculará cuando Inc. k sea mayor que Inc. h)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">51</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C51</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C51"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">n</td>
													<td class="borde">Pago con Certificado de Crédito Tributario expedido por la Administración</td>
													<td class="borde">44</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C44</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C44"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">o</td>
													<td class="borde">Saldo a favor del contribuyente para el siguiente ejercicio </td>
													<td class="borde">45</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C45</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C45"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">p</td>
													<td class="borde">Saldo definitivo a pagar a favor del Fisco</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">52</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C52</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C52"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
				<!--<tr><td class="saltoPagina"></td></tr>-->
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
													<th class="borde">
														<p align="center">
															<strong>DETERMINACION DEL IMPUESTO POR REGIMEN CONTABLE</strong>
														</p>
													</th>
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
													<th class="bordevacio-izq" rowSpan="2"/>
													<th class="bordevacio-centro" rowSpan="2" style="width: 95%">
														<p align="left">RUBRO 4 Resultados del Ejercicio</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">ingresos -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">gastos y deducciones -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="vacio" colSpan="2">
														<p align="center">
															<strong>INGRESOS GRAVADOS</strong>
														</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="bordevacio"/>
													<td class="bordevacio">Ventas de ganado bovino</td>
													<td class="bordevacio">53</td>
													<td class="bordevacio">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C53</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C53"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="bordevacio"/>
													<td class="bordevacio">Ventas de otros tipos de ganado (equino, caprino, ovino y otros)</td>
													<td class="bordevacio">54</td>
													<td class="bordevacio">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C54</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C54"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="bordevacio"/>
													<td class="bordevacio">Venta de productos derivados de la ganadería (lana, cueros y cerdas) y venta de embriones</td>
													<td class="bordevacio">55</td>
													<td class="bordevacio">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C55</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C55"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="bordevacio"/>
													<td class="bordevacio">Ventas de productos agrícolas en general</td>
													<td class="bordevacio">56</td>
													<td class="bordevacio">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C56</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C56"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="bordevacio"/>
													<td class="bordevacio">Otros ingresos relacionados con la actividad agropecuaria, excluídos los establecidos en el Art. 13 de la Res. 449/05</td>
													<td class="bordevacio">57</td>
													<td class="bordevacio">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C57</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C57"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Menos: devoluciones, bonificaciones y descuentos otorgados</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">69</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C69</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C69"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">
														<strong>A</strong>
													</td>
													<td class="borde">
														<strong>TOTAL DE INGRESOS GRAVADOS:</strong> (Casilla 53+54+55+56+57) - 69 
												</td>
													<td class="borde">58</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C58</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C58"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="vacio" colSpan="2">
														<p align="center">
															<strong>INGRESOS NO GRAVADOS</strong>
														</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Utilidades y dividendos percibidos por participación de acciones en otras sociedades </td>
													<td class="borde">59</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C59</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C59"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Intereses y otros ingresos financieros </td>
													<td class="borde">60</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C60</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C60"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Ingresos de fuente extranjera </td>
													<td class="borde">61</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C61</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C61"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Otros ingresos </td>
													<td class="borde">62</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C62</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C62"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">
														<strong>B</strong>
													</td>
													<td class="borde">
														<p align="left">
															<strong>TOTAL INGRESOS NO GRAVADOS: </strong>(Casilla 59+60+61+62) 
													</p>
													</td>
													<td class="borde">63</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C63</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C63"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="vacio" colSpan="2">
														<p align="center">
															<strong>EGRESOS - COSTOS DIRECTOS</strong>
														</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Suplementación alimentaria</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">70</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C70</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C70"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Sanitación y vacunación</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">71</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C71</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C71"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Fletes</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">72</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C72</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C72"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Honorarios profesionales (Veterinario)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">73</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C73</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C73"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Inseminación artificial</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">74</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C74</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C74"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">
														<strong>C</strong>
													</td>
													<td class="borde">
														<strong>TOTAL DE COSTOS DIRECTOS</strong> (Casilla 70+71+72+73+74) 
												</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">75</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C75</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C75"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="vacio" colSpan="2">
														<p align="center">
															<strong>EGRESOS - GASTOS INDIRECTOS Y DEDUCCIONES</strong>
														</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos generales (incluye gastos de movilidad y otros)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">76</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C76</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C76"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Sueldos y salarios</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">77</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C77</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C77"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Costos relacionados a la obtención de los ingresos gravados</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">78</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C78</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C78"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Remuneración personal superior</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">79</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C79</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C79"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Honorarios profesionales</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">80</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C80</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C80"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Intereses financieros</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">81</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C81</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C81"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Alquileres y cesión de otros bienes y derechos</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">82</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C82</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C82"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Pérdidas extraordinarias y las originadas por delitos de terceros</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">83</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C83</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C83"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Contrataciones de profesional técnico rural a través de factura de compra</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">84</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C84</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C84"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">IVA Crédito computable por saldos existentes al 31 de diciembre del 2004 (Proviene del Inc. b, Rubro 7)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">85</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C85</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C85"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Amortización proporcional de bienes incorporales</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">86</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C86</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C86"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Amortización proporcional en concepto de gastos de constitución y organización</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">87</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C87</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C87"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Amortización proporcional por el agotamiento de la fuente productiva</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">88</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C88</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C88"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Castigo por malos créditos</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">89</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C89</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C89"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Donaciones</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">90</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C90</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C90"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos y contribuciones a favor del personal</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">100</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C100</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C100"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos y erogaciones en el exterior relacionados con la obtención de la renta</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">101</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C101</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C101"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Otros gastos deducibles no incluídos en los incisos anteriores</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">102</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C102</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C102"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<!--IMPRESION-->
												<tr><td class="borde" colspan="6"></td></tr>
												<tr><td class="saltoPagina" colspan="6"></td></tr>
												<tr>
													<td class="borde"/>
													<td class="borde">
														<strong>Menos:</strong> Gastos no deducibles 
												</td>
													<td class="borde">64</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C64</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C64"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">
														<strong>Menos:</strong> De fuente extranjera 
												</td>
													<td class="borde">65</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C65</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C65"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">
														<p>
															<strong>Menos:</strong> Costos directos asociados no utilizados en ejercico (proviene del Rubro 10 Inc. j) 
													</p>
													</td>
													<td class="borde">66</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C66</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C66"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">
														<strong>D</strong>
													</td>
													<td class="borde">
														<strong>TOTAL GASTOS INDIRECTOS Y DEDUCCIONES:</strong> (Suma de las Casillas 76 al 102) menos (Casillas 64+65+66) 
												</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">103</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C103</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C103"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">
														<strong>E</strong>
													</td>
													<td class="borde">
														<strong>RESULTADO PARCIAL:</strong> Inc. 
													<strong>A,</strong> Col. I menos (Inc. 
													<strong>C</strong>, Col. II + 
													<strong>D</strong>, Col. II) 
												</td>
													<td class="borde">67</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C67</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C67"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">104</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C104</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C104"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="vacio"/>
													<td class="vacio">
														<p align="center">
															<strong>GASTOS Y DEDUCCIONES NO ARRASTRABLES (Si al aplicar estas deducciones se obtiene una renta neta negativa no se podrá trasladar al siguiente ejercicio)</strong>
														</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos personales y familiares</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">105</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C105</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C105"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos en concepto de ayuda a personas físicas de fincas colindantes (incluído IVA), proviene del Libro de Egresos)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">106</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C106</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C106"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos e inversiones directamente relacionadas con la actividad (incluye capitalización en sociedades cooperativas y fondos destinados a los mismos)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">107</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C107</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C107"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Pérdidas de inventario por mortandad (hasta el 3%)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">108</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C108</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C108"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Depreciación del ganado hembra (hasta el 8%)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">109</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C109</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C109"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Depreciación de mejoras e instalaciones realizadas incluídas las reparaciones extraordinarias y construcciones en terreno de terceros (proviene del Rubro 9, Inc. d)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">110</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C110</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C110"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">
														<strong>F</strong>
													</td>
													<td class="borde">
														<strong>TOTAL DEDUCCIONES:</strong> (Casilla 105+106+107+108+109+110) 
												</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">111</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C111</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C111"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">
														<strong>G</strong>
													</td>
													<td class="borde">
														<strong>RESULTADO FINAL DEL EJERCICIO:</strong> (Inc. 
													<strong>E</strong> menos 
													<strong>F</strong>) 
												</td>
													<td class="borde">68</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C68</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C68"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">112</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C112</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C112"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<th class="borde">
														<p align="center">
															<strong>DETERMINACION DEL IMPUESTO POR REGIMEN SIMPLIFICADO</strong>
														</p>
													</th>
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
													<th class="bordevacio-izq" rowSpan="2"/>
													<th class="bordevacio-centro" rowSpan="2" style="width: 95%">
														<p align="left">RUBRO 5 Resultados del Ejercicio</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">ingresos -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">gastos y deducciones -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="vacio" colSpan="2">
														<p align="center">
															<strong>INGRESOS GRAVADOS</strong>
														</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Ventas de ganado bovino</td>
													<td class="borde">113</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C113</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C113"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Ventas de otros tipos de ganado (equino, caprino, ovino y otros)</td>
													<td class="borde">114</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C114</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C114"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Venta de productos derivados de la ganadería (lana, cueros y cerdas) y venta de embriones</td>
													<td class="borde">115</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C115</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C115"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Ventas de productos agrícolas en general</td>
													<td class="borde">116</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C116</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C116"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Otros ingresos relacionados con la actividad agropecuaria, excluídos los establecidos en el Art. 13 de la Res. 449/05</td>
													<td class="borde">117</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C117</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C117"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">
														<strong>A</strong>
													</td>
													<td class="borde">
														<strong>TOTAL DE INGRESOS GRAVADOS:</strong> (Casilla 113+114+115+116+117) 
												</td>
													<td class="borde">118</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C118</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C118"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="vacio" colSpan="2">
														<p align="center">
															<strong>EGRESOS - GASTOS INDIRECTOS Y DEDUCCIONES</strong>
														</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos generales (incluye gastos de movilidad y otros)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">121</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C121</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C121"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Sueldos y salarios</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">122</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C122</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C122"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Costos relacionados a la obtención de los ingresos gravados</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">123</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C123</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C123"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Remuneración personal superior</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">124</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C124</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C124"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Honorarios profesionales</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">125</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C125</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C125"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Intereses financieros</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">126</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C126</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C126"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Alquileres y cesión de otros bienes y derechos</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">127</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C127</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C127"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Pérdidas extraordinarias y las originadas por delitos de terceros</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">128</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C128</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C128"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Contrataciones de profesional técnico rural a través de factura de compra</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">129</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C129</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C129"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">IVA Crédito computable por saldos existentes al 31 de diciembre del 2004 (Proviene del Inc. b, Rubro 7)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">130</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C130</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C130"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Amortización proporcional de bienes incorporales</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">131</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C131</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C131"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Amortización proporcional en concepto de gastos de constitución y organización</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">132</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C132</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C132"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Amortización proporcional por el agotamiento de la fuente productiva</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">133</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C133</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C133"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Castigo por malos créditos</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">134</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C134</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C134"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Donaciones</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">135</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C135</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C135"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos y contribuciones a favor del personal</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">136</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C136</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C136"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">
														<strong>B</strong>
													</td>
													<td class="borde">
														<strong>TOTAL GASTOS INDIRECTOS Y DEDUCCIONES:</strong> (Suma de las Casillas 121 al 136) 
												</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">137</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C137</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C137"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">
														<strong>C</strong>
													</td>
													<td class=" ">
														<strong>RESULTADO PARCIAL:</strong> Inc. 
													<strong>A,</strong> Col. I menos Inc. 
													<strong>B</strong>, Col. II 
												</td>
													<td class="borde">119</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C119</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C119"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">138</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C138</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C138"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<!--IMPRESION-->
												<tr><td class="borde" colspan="6"></td></tr>
												<!--<tr><td class="saltoPagina"></td></tr>-->
												<tr>
													<td class="vacio"/>
													<td class="vacio">
														<p align="center">
															<strong>GASTOS Y DEDUCCIONES NO ARRASTRABLES (Si al aplicar estas deducciones se obtiene una renta neta negativa no se podrá trasladar al siguiente ejercicio)</strong>
														</p>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos personales y familiares</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">139</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C139</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C139"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos de ayuda a personas físicas de fincas colindantes (incluído IVA), proviene del Libro de Egresos)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">140</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C140</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C140"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Gastos e inversiones directamente relacionadas con la actividad (incluye capitalización en sociedades cooperativas y fondos destinados a los mismos)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">141</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C141</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C141"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Pérdidas de inventario por mortandad (hasta el 3%)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">142</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C142</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C142"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Depreciación del ganado hembra (hasta el 8%)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">143</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C143</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C143"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">Depreciación de mejoras e instalaciones realizadas incluídas las reparaciones extraordinarias y construcciones en terreno de terceros (proviene del Rubro 9, Inc. d)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">144</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C144</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C144"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">
														<strong>D</strong>
													</td>
													<td class="borde">
														<strong>TOTAL GASTOS Y DEDUCCIONES:</strong> (Casilla 139+140+141+142+143+144) 
												</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">145</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C145</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C145"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">
														<strong>E</strong>
													</td>
													<td class="borde">
														<strong>RESULTADO FINAL DEL EJERCICIO:</strong> (Inc.  
													<strong>C</strong> menos 
													<strong>D</strong>) 
												</td>
													<td class="borde">120</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C120</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C120"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="borde">146</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C146</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C146"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
														<p align="left">RUBRO 6 determinacion de la renta neta (SOLO PARA REGIMEN CONTABLE Y SIMPLIFICADO) </p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importe</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">contribuyente -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">Fisco -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Resultado del ejercicio/Ganancia (proviene del Rubro 4 Inc. 
													<strong>G</strong> o del Rubro 5 Inc. 
													<strong>E</strong>) 
												</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">150</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C150</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C150"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Resultado del ejercicio/pérdida (proviene del Rubro 4 Inc. 
													<strong>G</strong> o del Rubro 5 Inc. 
													<strong>E</strong>) 
												</td>
													<td class="borde">147</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C147</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C147"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Pérdida de ejercicios anteriores</td>
													<td class="borde">148</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C148</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C148"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">SUB TOTALES: (Inc. b + c Col. I; Inc. a Col. II)</td>
													<td class="vacio"/>
													<td class="borde"/>
													<td class="vacio"/>
													<td class="borde"/>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Pérdida fiscal (Inc. d Col. I menos Inc. d Col. II, cuando Col. I sea mayor que Col. II)</td>
													<td class="borde">149</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C149</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C149"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Renta Neta del ejercicio (Inc. d Col. II menos Inc. d Col. I, cuando Col. II sea mayor que Col. I)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">151</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C151</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C151"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
														<p align="left">RUBRO 7 saldo de iva acumulado hasta EL 31 DE DICIEMBRE DE 2004 (CREDITOS A SER UTILIZADOS POR EL REGIMEN DE LA LEY 125/91 QUE PODRAN UTILIZAR PARA CUALQUIER TIPO DE REGIMEN OPTADO)</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">credito -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">deduccion -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Saldo del crédito IVA a favor del Contribuyente, correspondiente hasta el período fiscal del 31 de diciembre de 2004</td>
													<td class="borde">152</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C152</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C152"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Crédito IVA a descontar (no podrá superar el 30% de la Renta Bruta)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">154</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C154</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C154"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Saldo a favor del Contribuyente a trasladar al siguiente período fiscal (Inc. a-b)</td>
													<td class="borde">153</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C153</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C153"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
														<p align="left">RUBRO 8 Compras y gastos del periodo gravados con iva (creditos afectados por el regimen de la ley 2421/04 que podran utilizar para cualquier regimen optado)</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">credito -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">deduccion -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Saldo del IVA del ejercicio anterior correspondiente a los gastos y compras, afectados directamente a las actividades agropecuarias</td>
													<td class="borde">155</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C155</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C155"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Monto total del IVA incluido en las facturas correspondiente a los gastos e inversiones afectados directamente a las actividades agropecuarias del presente ejercicio</td>
													<td class="borde">156</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C156</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C156"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Total de Crédito Fiscal: (Inc. a+b)</td>
													<td class="borde">157</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C157</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C157"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">IVA a descontar (trasladar al  Rubro 3 Inc. g)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">159</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C159</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C159"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Saldo a favor del Contribuyente a trasladar al siguiente periodo fiscal (Inc. c-d)</td>
													<td class="borde">158</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C158</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C158"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
														<p align="left">RUBRO 9 determinacion de las amortizaciones de las inversiones (solo para regimen contable y simplificado</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">inversion -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">amortizacion -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Saldo del ejercicio anterior de inversiones a ser amortizadas</td>
													<td class="borde">160</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C160</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C160"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Inversiones del ejercicio a ser amortizadas</td>
													<td class="borde">161</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C161</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C161"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Total de inversiones a ser amortizadas (Inc. a+b)</td>
													<td class="borde">162</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C162</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C162"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Amortización realizada en el ejercicio que se liquida, por las compras y gastos en concepto de inversiones, reparaciones y construcciones en terrenos de terceros</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">164</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C164</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C164"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Saldo total de inversiones a ser amortizado en los siguientes ejercicios fiscales (Inc. c - d)</td>
													<td class="borde">163</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C163</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C163"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
								<!--IMPRESION-->
								<!--<tr><td class="saltoPagina"></td></tr>-->
								<tr>
									<td class="fondo" vAlign="top" align="left" width="1"/>
									<td vAlign="top" width="636">
										<table class="declaracion">
											<tbody>
												<tr>
													<th class="bordevacio" rowSpan="2">INC</th>
													<th class="bordevacio" rowSpan="2" style="width: 95%">
														<p align="left">RUBRO 10 determinacion de los costos directos asociados (solo para regimen CONTABLE)</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">valores -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">costos -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Valor total del ganado al cierre del ejercicio</td>
													<td class="borde">165</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C165</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C165"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Valor de ganado recategorizado del ejercicio</td>
													<td class="borde">166</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C166</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C166"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Valor de ganado procreado en el ejercicio</td>
													<td class="borde">167</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C167</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C167"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Total de ganado recategorizado y procreado del ejercicio (Inc. b+c)</td>
													<td class="borde">168</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C168</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C168"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">e </td>
													<td class="borde">Porcentaje proporcional de ganado recategorizado y de procreo (Inc. d / Inc. a) x %</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">170</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C170</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C170"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">f</td>
													<td class="borde">Saldo del ejercicio anterior de costos directos asociados</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">171</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C171</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C171"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">g</td>
													<td class="borde">Costos directos asociados del ejercicio (proviene del Rubro 4 Inc. 
													<strong>C</strong>) 
												</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">172</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C172</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C172"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">h</td>
													<td class="borde">Total de costos directos asociados (Inc. f + g)</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class=" ">173</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C173</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C173"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">i</td>
													<td class="borde"> Monto de costos asociados directos aplicados en el ejercicio que se liquida</td>
													<td class="borde">169</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C169</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C169"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">j</td>
													<td class="borde">Saldo de costos directos asociados no utilizados a trasladar al siguiente ejercicio fiscal (Inc. h - i) trasladar al Rubro 4 Casilla 66</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde"> 174</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C174</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C174"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
														<p align="left">RUBRO 11 determinacion de la utilidad diferida (solo para regimen contable)</p>
													</th>
													<th class="bordevacio" colSpan="4">
														<p align="center">importes</p>
													</th>
												</tr>
												<tr>
													<th class="bordevacio" colSpan="2">
														<p align="center">utilidades diferidas -i-</p>
													</th>
													<th class="bordevacio" colSpan="2" style="width: 90%">
														<p align="center">utilidades percibidas -ii-</p>
													</th>
												</tr>
												<tr>
													<td class="borde">a</td>
													<td class="borde">Saldo del ejericicio anterior de utilidades diferidas</td>
													<td class="borde">175</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C175</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C175"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">b</td>
													<td class="borde">Utilidades diferidas del periodo (proviene del Rubro 10 Inc. d)</td>
													<td class="borde">176</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C176</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C176"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">c</td>
													<td class="borde">Total de utilidades diferidas (Inc. a+b)</td>
													<td class="borde">177</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C177</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C177"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
												</tr>
												<tr>
													<td class="borde">d</td>
													<td class="borde">Utilidades diferidas percibidas en el ejercicio</td>
													<td class="vacio"/>
													<td class="vacio"/>
													<td class="borde">179 </td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C179</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C179"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
												</tr>
												<tr>
													<td class="borde">e</td>
													<td class="borde">Saldo Utilidad Diferida a trasladar al siguiente ejercicio fiscal (Inc. c - d)</td>
													<td class="borde">178</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C178</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C178"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
													</td>
													<td class="vacio"/>
													<td class="vacio"/>
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
													<th class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 12 identificacion del contador</p>
													</th>
													<th class="bordevacio" colSpan="2"/>
												</tr>
												<tr>
													<td class="borde">Nombre y Apellido del Contador</td>
													<td class="borde"/>
													<td class="borde">
														<p align="center">Identificador RUC o C.I.</p>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">180</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C180</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C180"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
													<th class="bordevacio" style="width: 95%">
														<p align="left">RUBRO 13 identificacion de la empresa auditora</p>
													</th>
													<th class="bordevacio" colSpan="2"/>
												</tr>
												<tr>
													<td class="borde">Razón Social de la Empresa Auditora</td>
													<td class="borde"/>
													<td class="borde">
														<p align="center">Identificador RUC o C.I.</p>
													</td>
												</tr>
												<tr>
													<td class="borde"/>
													<td class="borde">181</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C181</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C181"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
				<tr/>
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
													<td class="borde">182</td>
													<td class="borde">
														<xsl:call-template name="itemNumerico"><xsl:with-param name="pNombre">C182</xsl:with-param><xsl:with-param name="pValor"><xsl:value-of select="declaracion/detalle/C182"/></xsl:with-param><xsl:with-param name="pModo"><xsl:value-of select="$Modo"/></xsl:with-param></xsl:call-template>
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
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
