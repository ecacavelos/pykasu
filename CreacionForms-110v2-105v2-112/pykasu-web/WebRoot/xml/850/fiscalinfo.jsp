<?xml version="1.0" encoding="ISO-8859-15"?>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@page	contentType="text/xml"%>
<fiscal-info>
<%
	java.util.Map fiscalInfoMap = (java.util.Map)request.getAttribute(py.com.roshka.pykasu.web.Globals.FISCAL_INFO);
	if(fiscalInfoMap != null){
		java.util.Iterator contributorInfoKey = fiscalInfoMap.keySet().iterator();
		while (contributorInfoKey.hasNext()){
		    Object key = contributorInfoKey.next();
		    Object value =  fiscalInfoMap.get(key);
%>
			<info key="<%=key%>" value="<%=value%>">
			</info>
<%
		}
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
</fiscal-info>
