<%@ page contentType="text/html" language="java"

%>

<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tlds/pykasu.tld" prefix="pks"%>
<%py.com.roshka.pykasu.ui.form.Form form = (py.com.roshka.pykasu.ui.form.Form)
	request.getAttribute(py.com.roshka.pykasu.web.Globals.FORM_BEAN);%>


<html>
<head>

<title>Sistema</title>

<script id="pykUtil" language="JavaScript" src="js/pykasu_util.js"></script>
<script id="pykJS_1" language="JavaScript" src="plugins/plugin_<%=form.getId()%>.js"></script>
<script id="pykJS_2" language="JavaScript"></script>
<script id="pykJS_3" language="JavaScript"></script>
<script id="pykJS_4" language="JavaScript"></script>
<script id="pykJS_5" language="JavaScript"></script>

<link href="styles/pykasu.css" rel="stylesheet" type="text/css">
<link href="styles/form.css" rel="stylesheet" type="text/css">
<link href="styles/style<%=form.getId()%>.css" rel="stylesheet" type="text/css">


<script language="javascript"> 

var o ;
var valueOld;


function setField(obj){
	
	o = obj;
	valueOld = o.value;
}

function lostFocus(obj){

	if (!isCorrectHead()){
		alert("Favor completar datos de la cabecera (RUC, Periodo Fiscal, Fecha Presentacion) antes de completar este campo.");
		obj.value = "";
		return;		
	}
	if (obj != o){
		return;
	}
	if (o == null || valueOld == null){
		return;
	}
	if (valueOld != o.value){
		calculate();
	}
	o = null;
	valueOld = null;
}


			<%
				java.util.ArrayList JSvars = new java.util.ArrayList();
				java.util.Iterator triggers = form.getTriggers().values().iterator();
				while (triggers.hasNext()){
				 	py.com.roshka.pykasu.ui.form.Trigger trigger = (py.com.roshka.pykasu.ui.form.Trigger)triggers.next();
				 	%>
					function <%=trigger.getName()%> (){
						try{
						<%if (trigger.getCondition()!=null){%>
							if (<%=trigger.getCondition()%>){
						<%}%>
						var tmp = (<%=trigger.getFormula()%>).toFixed(0);
						//alert(tmp);
						document.getElementById('<%=trigger.getCell()%>').value =  addCommas(tmp);
					    try{
					    	<%=trigger.getCell()%> = 0;
					    	if (document.getElementById('<%=trigger.getCell()%>').value != ''){
								<%=trigger.getCell()%> = parseFloat((parseFloat(removeCommas(document.getElementById('<%=trigger.getCell()%>').value))).toFixed(0));
							}
					    }catch(exc){
							alert('error en el trigger <%=trigger.getName()%> + \n + e');					    
					    }					
						<%if (trigger.getCondition()!=null){%>
							}
						<%}%>
						if (document.getElementById('<%=trigger.getCell()%>').value == '0'){
						document.getElementById('<%=trigger.getCell()%>').value = '';
						}
						}catch(e){
							alert('error en el trigger <%=trigger.getName()%> + \n + e');
						}
					
					}
					
					
				<%}
				

				%>
				
				function calculate(){
					<%if (request.getAttribute(py.com.roshka.pykasu.web.Globals.FORM_BEAN_READONLY)==null){%>
					try{
						calculateBeforePlugin();
					}catch(e1){
						alert('Error al calcular Before Plugin'+e1);
					}
					refreshVars();	
				<%
					java.util.ArrayList triggersArray = new java.util.ArrayList(form.getTriggers().values());
					java.util.Collections.sort(triggersArray);
					triggers = triggersArray.iterator();
				
					while (triggers.hasNext()){
				    py.com.roshka.pykasu.ui.form.Trigger trigger = (py.com.roshka.pykasu.ui.form.Trigger)triggers.next();
				 	%>
						<%=trigger.getName()%>();
					<%}%>
					
					try{
						calculateAfterPlugin();					
					}catch(e3){
						alert('Error al calcular After Plugin'+e3);
					}
					<%}%>
					postRefresh();
				}
				function onloadLocal(){
					document.getElementById('cargando_div').style.visibility = 'hidden';
					document.getElementById('cargando_div').style.height='0px';
					document.getElementById('cargando_div').style.width='0px';						
					document.getElementById('form_div').style.visibility = 'visible';
					
				}
</script>				

</head>

<body onload="onloadLocal();onloadForm();">


<jsp:include page="../header.jsp"/> 
<jsp:include page="../menu.jsp"/> 
<div id="main"> 


<h2><%=form.getName()%></h2>
<% 
	py.com.roshka.pykasu.ui.form.Cell cellStatus = form.getCell("status");
	py.com.roshka.pykasu.ui.form.Cell cellPPN = form.getCell("prePrintedNumber");
	if((cellStatus != null) 
		&& (cellStatus.getData().toString().equals("CONFIRMADO"))
		&& (cellPPN != null)
		&& (!form.getName().contains(" 90"))
	){
	%>	
		<input type="button" value="Vista Preliminar" onclick="pykOpenWindow('/pycasu/xsl/formularios/printForm.do?formType=<%=form.getType()%>&formId=<%=cellPPN.getData().toString()%>', '_blank', 640, 600)" />
	<%			 
	}
%>
<div id="cargando_div" style="visibility:visible">
	<label style="text-decoration: blink; font-weight: bold">Cargando ... </label> 
</div>
<div id="form_div" style="visibility: hidden">
<html:form action="enviarGenericForm.do">

	<html:errors/>
	<html:hidden property="formName" 
		value="<%=(String)request.getAttribute(py.com.roshka.pykasu.web.Globals.FORM_NAME)%>"
	/>
	
	<%
		String newInstance = "false";
		if (request.getAttribute(py.com.roshka.pykasu.web.Globals.FORM_NEW_INSTANCE)!=null){
		    newInstance = (String)request.getAttribute(py.com.roshka.pykasu.web.Globals.FORM_NEW_INSTANCE);
		}
		        
	%>
	<html:hidden
		property="newInstance"
		value="<%=newInstance%>"
	/>

	<input type="hidden" id="formStatus" value="<%=(String)request.getAttribute(py.com.roshka.pykasu.web.Globals.FORM_STATUS)%>"/>
	<input type="hidden" id="serverActualDate" value="<%=(String)request.getAttribute("serverActualDate")%>"/>
	<input type="hidden" id="suggestedPaymentDate" value="<%=(String)request.getAttribute("suggestedPaymentDate")%>"/>

	<table width="95%" align="center">
	<tr>
	<td>	
	<%
		java.util.Iterator headers = form.getHeaders().values().iterator(); 
		while (headers.hasNext()){
		    py.com.roshka.pykasu.ui.form.Section header = (py.com.roshka.pykasu.ui.form.Section)headers.next();
			%>
			<table width="100%" class="sections" cellpadding="0" cellspacing="0">
			<%
			
			java.util.ArrayList linesArray = new java.util.ArrayList(header.getLines().values());
			java.util.Collections.sort(linesArray);
			java.util.Iterator lines = linesArray.iterator();
			int rowIndex=0;
			while (lines.hasNext()){
				rowIndex++;
				py.com.roshka.pykasu.ui.form.Line line = (py.com.roshka.pykasu.ui.form.Line)lines.next();
				%>	
				<tr <%if ((rowIndex++)%2==0){%>class="line1"<%}%>>
				<%
				
				java.util.ArrayList cellsList = new java.util.ArrayList(line.getCells().values());
				java.util.Collections.sort(cellsList);
				
				java.util.Iterator cells = cellsList.iterator();
				
				
				while (cells.hasNext()){
			    	py.com.roshka.pykasu.ui.form.Cell cell = (py.com.roshka.pykasu.ui.form.Cell)cells.next();
					%>
					<td class="sections" 
						<%if(cell.getColSpan() > 1){%>
							colspan="<%=cell.getColSpan()%>"
						<% 
						  }
						%>
					>
					<%				
					String readOnly = "false";
                    String calculableFunction = "";
                    String disabled = "false";
                    String value = "";
                    String position = cell.getAlignAditionalDescription();

                    if (cell.getData()!=null){
                         value = cell.getData().toString();
                     }
                     if (cell.isOpaque())
                         disabled = "true";
                     if (!cell.isCalculable())
                         calculableFunction = "calculate();";
                     if (cell.isReadOnly())
                         readOnly = "true";
                     %>
                   	 <table width="100%" height="100%" border="0" cellpadding="1" cellspacing="0">
                   	 <tr>
                		<%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.TOP) || position.equals(py.com.roshka.pykasu.ui.form.Cell.BOTTON)){%>
	               			<%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.TOP)){ %>
	               				<th class="sections">
	               					<%=cell.getAdditionalDescription()%>
	               				</th></tr><tr>
	               			<%}else{//is BOTTON%>
	               				<th><pks:cell cell="<%=cell%>"  styleName="header"/></th>
	               			<%}%>
     	          		<%}else{%>
	               			<%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.LEFT)){ %>
	               			<th class="sections" <%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.LEFT))out.print(" width=\"50%\" ");%>>
	               				<%=cell.getAdditionalDescription()%>
	               			</th>
	               			<%}else{ %>
	               			   <pks:cell cell="<%=cell%>" styleName="header"/> 
	               			<%}%>
               			<%}%>
						<td witdh="100%" 
							<%if(cell.getColSpan() > 1){%>
								colspan="<%=cell.getColSpan()%>"
							<% 
							  }
							%>
						>
                		<%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.RIGHT) || position.equals(py.com.roshka.pykasu.ui.form.Cell.BOTTON)){ %>
                			<th class="sections" <%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.RIGHT))out.print(" width=\"50%\" ");%>>
                				<%=cell.getAdditionalDescription()%>
                			</th>
                		<%}else{ //is BOTTON!%>
       						<pks:cell cell="<%=cell%>" styleName="header" /> 
                		<%} %>
                		</td>	 
                 	</tr>
                 	</table>
			</td>
		<%}//iterador de celdas %>
		</tr>
		<%}//iterador de lineas%>
	</table>
	<%}//iterador de headers.. %>
	</td>
	</tr>



<hr>

<%//mostrar secciones y sus campos %> 

	<%
		java.util.ArrayList rubrosList = new java.util.ArrayList(form.getSections().values());
		java.util.Collections.sort(rubrosList);
	
		java.util.Iterator rubrosIt = rubrosList.iterator();
		
		while (rubrosIt.hasNext()) {
                   py.com.roshka.pykasu.ui.form.Section rubro = (py.com.roshka.pykasu.ui.form.Section) rubrosIt.next();

    %>
	<tr>
	<td>
	<table class="sections" cellpadding="0" cellspacing="0">
		
		<%
			java.util.ArrayList linesList = new java.util.ArrayList(rubro.getLines().values());
			java.util.Collections.sort(linesList);
			java.util.Iterator lines = linesList.iterator();

         %>
		<%
		int rowIndex2 = 0;
		while (lines.hasNext()) {
			py.com.roshka.pykasu.ui.form.Line line = (py.com.roshka.pykasu.ui.form.Line)lines.next();
        %>
			<tr <%if ((rowIndex2++)%2==0){%>class="line1"<%}%>>			
			<%

			String endCell2 = "</td>";
			if(line.getDescription() != null){ 
				if (rowIndex2 == 1){ endCell2 = "</th>";%>
					<th class="header" >
				<%}else{ %>
					<td class="sections">
				<%}//si no es label	%>

				<%=line.getDescription()%>
			
				<%=endCell2%>
			<%}%>		
			<%	
			java.util.ArrayList cellsList = new java.util.ArrayList(line.getCells().values());
			java.util.Collections.sort(cellsList);
			java.util.Iterator cells = cellsList.iterator();
            while (cells.hasNext()){
				py.com.roshka.pykasu.ui.form.Cell cell = (py.com.roshka.pykasu.ui.form.Cell)cells.next();
				String align = "center";   
				String endCell = "</td>";
				String classId = "sections";
				
				if(cell.getType().equals(cell.NUMBER)){
					align = "right";
				}else if(cell.getType().equals(cell.STRING) || cell.getType().equals(cell.DATE)){
					align = "left";
				} 		
				if (cell.getType().equals("LABEL") && rowIndex2==1){
				    classId = "header";
				}
				%>
				<%if (cell.getType().equals(py.com.roshka.pykasu.ui.form.Cell.LABEL)){ 
					endCell = "</th>";%>
					<th class="<%=classId%>" <%if (cell.getColSpan()>1){%> colspan="<%=cell.getColSpan()%>" <%}%>
				<%}else{%>
					<td class="<%=classId%>" <%if (cell.getColSpan()>1){%> colspan="<%=cell.getColSpan()%>"	<%}%>
				<%}%>
				align="<%=align%>" width="20%">
				<%
				String position = cell.getAlignAditionalDescription();
				String readOnly = "false";
				String calculableFunction = "";
				String disabled = "false";
                if (cell.isOpaque())
                	disabled = "true";
                if (cell.isCalculable())
                	calculableFunction = "calculate();";
                if (cell.isReadOnly())
                	readOnly = "true";
				String value = null;
            	%> 
				<%if (!cell.getType().equals("LABEL")){ %>
                    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                    		
                  		<%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.TOP) || position.equals(py.com.roshka.pykasu.ui.form.Cell.BOTTON)){%>
                  			<%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.TOP)){ %>
                  			
                  				<th class="header" width="20%">
                  					<% if (cell.getAdditionalDescription() != null && !cell.getAdditionalDescription().equals("")){
                  					     out.print(cell.getAdditionalDescription());
                  					  }else{
                  					  	 out.print("&nbsp;");
                  					  }
                  					%>    
                  					
                  				</th></tr><tr>
                  		
                  			<%}else{ %>
                  					<pks:cell cell="<%=cell%>"/>
                  			<%} %>
                <%}else{%>
                            			<%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.LEFT)){ %>
                            			<th class="header">
                            			
                            			<% if (cell.getAdditionalDescription() != null && !cell.getAdditionalDescription().equals("")){
                            				   	out.print(cell.getAdditionalDescription());
                            			  }else{
                            				  	out.print("&nbsp;");
                            			  }
                            			%> 
                            			
                            			</th>
                            		<%}else{ %>
                            			 <pks:cell cell="<%=cell%>"/> 
                            			<%} %>
                            		<%}%>
                            		<td>
                            		
                            		<%if (position.equals(py.com.roshka.pykasu.ui.form.Cell.RIGHT) || position.equals(py.com.roshka.pykasu.ui.form.Cell.BOTTON)){ %>
                            			<th class="header"><%=cell.getAdditionalDescription()%></th>
                            		<%}else{ %>
                 						  <pks:cell cell="<%=cell%>"/>      		
                            		<%}%>
                            		</td>	 
                            	</tr>
                            </table>
                            <%}else{%>
                                <pks:cell cell="<%=cell%>"/>      		
                            <%}%>
                            
                            
							<%
								if(cell.getType().equals(py.com.roshka.pykasu.ui.form.Cell.NUMBER)){
									JSvars.add(cell.getId());
								}
	                        %>
				<%=endCell%>
			
		
			<%}//for de columnas%>
		</tr>
		<%}//for de incises%>

	</table>
	</td>
	</tr>
	<%}//iterator de rubros %>
	</table>
	<hr>	
	<%-- Por lo visto solo se puede pasar de de PROCESO a CONFIRMADO (el estado ANULADO parece haber desaparecido) no tiene sentido el boton ENVIAR
		Ademas de esta forma se puede solucionar un problema de seguridad del sorteo --%>
	<%if(((cellStatus != null)&& cellStatus.getData().toString().trim().equalsIgnoreCase("")) || (cellStatus.getData().toString().trim().equalsIgnoreCase("PROCESO"))){%>	
	<input type="button" value="Enviar" onclick="submitForm('send')"/>
	<input type="button" value="Cancelar" onclick="submitForm('cancel')"/>
	<%}%>

	&nbsp;
	<%if((cellStatus != null) 
		 && (cellStatus.getData().toString().equals("CONFIRMADO"))
		 && (cellPPN != null)
		 && (!form.getName().contains(" 90"))
	){
	%>
	<input type="button" value="Vista Preliminar" onclick="pykOpenWindow('/pycasu/xsl/formularios/printForm.do?formType=<%=form.getType()%>&formId=<%=cellPPN.getData().toString()%>', '_blank', 640, 600)" />	
	<%}%>
</html:form>
</div>
<script language="javascript">
		<%java.util.Iterator vars1 = JSvars.iterator();
			while (vars1.hasNext()){
			  String var = (String)vars1.next();
		%>
			var <%=var%> = 0;
		<%}%>
		function refreshVars(){
		    
	
		    
		<%java.util.Iterator vars2 = JSvars.iterator();
			while (vars2.hasNext()){
			  String var = (String)vars2.next();
			  
		%>
			if (document.getElementById('<%=var%>') != null){
			 	if (document.getElementById('<%=var%>').value == ''){
					<%=var%> = 0;
				}
				else{
					if (document.getElementById('<%=var%>') != null)
						<%=var%> = parseFloat((parseFloat(removeCommas(document.getElementById('<%=var%>').value))).toFixed(0));
				}
			}
			
		<%}%>
		
		}
		function postRefresh(){
		<%java.util.Iterator vars3 = JSvars.iterator();
			while (vars3.hasNext()){
			  String var = (String)vars3.next();
		%>
	
			if (document.getElementById('<%=var%>') != null && document.getElementById('<%=var%>').value == '0'){
				<%=var%> = 0;
			}
		
		<%}%>
		
		}
	</script>
</div>

</body>
</html>
