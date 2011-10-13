<?xml version="1.0" encoding="ISO-8859-15"?>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@page	contentType="text/xml"%>

<salary-info>
<%
	py.com.roshka.pykasu.persistence.fiscal.Salary salary =
		(py.com.roshka.pykasu.persistence.fiscal.Salary) request.getAttribute("SALARY");

	Double amount = salary.getAmount();
%>
	<salary>
		<salary-amount><%=amount%></salary-amount>
	</salary>
</salary-info>
