<%if(request.getSession().getAttribute(py.com.roshka.pykasu.web.Globals.ERROR_MESSAGE)!=null){%>
	<div id="errorMsg" style="background-color: red; padding: 10px;">
		<label style="color: white;font-weight: bold;">Error</label><br>
		<label style="color: white;font-weight: bold">Se ha registrado un error en el sistema</label><br>
		<label style="color: white;font-weight: bold"><%=request.getSession().getAttribute(py.com.roshka.pykasu.web.Globals.ERROR_MESSAGE)%></label>
	</div>
	<%request.getSession().removeAttribute(py.com.roshka.pykasu.web.Globals.ERROR_MESSAGE);%>
<%}%>
<%if(request.getAttribute(py.com.roshka.pykasu.web.Globals.MESSAGE)!=null){%>
	<div id="showMsg" style="background-color: green; padding: 10px;">
		<label style="color: white;font-weight: bold"><%=request.getAttribute(py.com.roshka.pykasu.web.Globals.MESSAGE)%></label>
	</div>
	<%request.getSession().removeAttribute(py.com.roshka.pykasu.web.Globals.MESSAGE);%>
<%}%>