<?xml version="1.0" encoding="ISO-8859-15"?>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@page
	contentType="text/xml"
	
%><contributor-info>
<%
	java.util.Map contributorInfoMap = (java.util.Map)request.getAttribute(py.com.roshka.pykasu.web.Globals.CONTRIBUTOR_INFO);
	java.util.Iterator contributorInfoKey = contributorInfoMap.keySet().iterator();
	while (contributorInfoKey.hasNext()){
	    String key = (String)contributorInfoKey.next();
	    String value =  (String)contributorInfoMap.get(key);
%>
	<field>
		<field-id><%=key%></field-id>
		<field-value><%=value%></field-value>
	</field>
<%
	}
%>
<%
	java.util.Map moreMessagesMap = (java.util.Map)request.getAttribute(py.com.roshka.pykasu.web.Globals.MORE_MESSAGES);
	if(moreMessagesMap != null){
		java.util.Iterator moreMessageKeys = moreMessagesMap.keySet().iterator();
		while (moreMessageKeys.hasNext()){
		    Object key = moreMessageKeys.next();
		    Object value =  moreMessagesMap.get(key);
%>
			<message key="<%=key%>" value="<%=value%>">
			</message>
<%
		}
	}
%>
</contributor-info>
