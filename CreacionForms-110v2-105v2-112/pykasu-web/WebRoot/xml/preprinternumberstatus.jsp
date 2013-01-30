<?xml version="1.0" encoding="ISO-8859-15"?>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@page
	contentType="text/xml"
	
%>
<preprinternumber-status>
	<status number="<bean:write name="PREPRINTERNUMBER"/>" status="<bean:write name="PREPRINTERNUMBER_STATUS"/>"/>
</preprinternumber-status>
