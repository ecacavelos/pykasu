<%@ page contentType="text/html" language="java"%>
<table border="0">
	<tr>
		<td><input readonly="readonly" name="<%=((String)pageContext.getAttribute("dateVarName"))%>_date" value="<%out.print(request.getAttribute("dateVarName"+"_date")==null?"":request.getAttribute("dateVarName"+"_date")); %>" size="1"  maxlength="2" type="text" id=<%=((String)pageContext.getAttribute("dateVarName"))%>_d></td>
		<td><input readonly="readonly" name="<%=((String)pageContext.getAttribute("dateVarName"))%>_month" value="<%out.print(request.getAttribute("dateVarName"+"_month")==null?"":request.getAttribute("dateVarName"+"_month")); %>" size="1" maxlength="2" type="text" id=<%=((String)pageContext.getAttribute("dateVarName"))%>_m></td>
		<td><input readonly="readonly" name="<%=((String)pageContext.getAttribute("dateVarName"))%>_year" value="<%out.print(request.getAttribute("dateVarName"+"_year")==null?"":request.getAttribute("dateVarName"+"_year"));%>" size="2" maxlength="4" type="text" id=<%=((String)pageContext.getAttribute("dateVarName"))%>_a></td>
		<td>
			<a href="#" onclick="cal_<%=((String)pageContext.getAttribute("dateVarName"))%>.showCalendar('anchor_<%=((String)pageContext.getAttribute("dateVarName"))%>'); return false;" name="anchor_<%=((String)pageContext.getAttribute("dateVarName"))%>" id="anchor_<%=((String)pageContext.getAttribute("dateVarName"))%>"><img border="0" src="images/cal.gif"  alt="Calendar"></a>
			<script language="JavaScript" id="js_<%=((String)pageContext.getAttribute("dateVarName"))%>">
				var cal_<%=((String)pageContext.getAttribute("dateVarName"))%> = new CalendarPopup();
				cal_<%=((String)pageContext.getAttribute("dateVarName"))%>.setReturnFunction("setMultipleValues_<%=((String)pageContext.getAttribute("dateVarName"))%>");
				function setMultipleValues_<%=((String)pageContext.getAttribute("dateVarName"))%>(y,m,d) {
					document.getElementById('<%=((String)pageContext.getAttribute("dateFormName"))%>').<%=((String)pageContext.getAttribute("dateVarName"))%>_year.value=y;
					document.getElementById('<%=((String)pageContext.getAttribute("dateFormName"))%>').<%=((String)pageContext.getAttribute("dateVarName"))%>_month.value=LZ(m);
					document.getElementById('<%=((String)pageContext.getAttribute("dateFormName"))%>').<%=((String)pageContext.getAttribute("dateVarName"))%>_date.value=LZ(d);
				}
			</script>
		</td>
	</tr>
</table>