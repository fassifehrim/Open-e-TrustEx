<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="j" tagdir="/WEB-INF/tags/jscaf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<input type="hidden" id="pageMode" value="${pageMode}" /> 
<input type="hidden" id="refererPage" value="${refererPage.action}"/>
<input type="hidden" id="updateNotAuthorizedMsg" value="${updateNotAuthorizedMsg}" /> 

<c:choose>
	<c:when test="${pageMode eq 'view' }">
		<c:set var="url" value="/transaction/${transactionId}/view" />
	</c:when>
	<c:when test="${pageMode eq 'edit' }">
		<c:set var="url" value="/transaction/${transactionId}/edit" />
	</c:when>
	<c:otherwise>
		<c:set var="url" value="/transaction/create" />
	</c:otherwise>
</c:choose>

<form:form modelAttribute="transactionForm" action="${url}" acceptCharset="UTF-8" id="transactionForm" method="post">
	<j:box box_title_key="transaction.${pageMode}.title">
		<div id="innerFragment"></div>
	</j:box>
</form:form>
