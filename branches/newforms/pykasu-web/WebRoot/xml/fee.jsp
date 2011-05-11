<?xml version="1.0" encoding="ISO-8859-15"?>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@page	contentType="text/xml"%>

<fee-info>
<%
	py.com.roshka.pykasu.persistence.fiscal.Fee fee =
		(py.com.roshka.pykasu.persistence.fiscal.Fee) request.getAttribute("FEE");
	if(fee != null){
		Integer percent = fee.getPercent();
%>
		<fee>
			<fee-percent><%=percent%></fee-percent>
		</fee>
<%	}else{ %>
		<fee>
			<fee-percent>NOT_EXIST</fee-percent>
		</fee>
<%	} %>
</fee-info>
