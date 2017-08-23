<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<spring:message code="chirp.momentWritten" var="momentWritten" />
<spring:message code="chirp.text" var="text" />
<spring:message code="chirp.actor" var="actorName" />
<spring:message code="chirp.delete" var="delete" />
<spring:message code="chirp.subscribe" var="subscribe" />

<security:authorize access="isAuthenticated()">

	<jstl:if test="${a==1}">

		<display:table name="chirps" id="row"
			requestURI="chirp/actor/mylist.do" pagesize="16"
			class="table table-over">

			<display:column title="${momentWritten}" property="momentWritten" />
			<display:column title="${text}" property="text" />
			<display:column title="${actorName}" property="actor.actorName" />
			<display:column title="${delete}">
				<a href="chirp/actor/delete.do?q=${row.id}"> <jstl:out
						value="${delete}" /></a>
			</display:column>

		</display:table>

	</jstl:if>


	<jstl:if test="${a==2}">

		<display:table name="chirps" id="row" requestURI="chirp/actor/list.do"
			pagesize="16" class="table table-over">

			<display:column title="${momentWritten}" property="momentWritten" />
			<display:column title="${text}" property="text" />
			<display:column title="${actorName}" property="actor.actorName" />
			<display:column title="${subscribe}">
				<security:authentication property="principal.id" var="id" />
				<a href="chirp/actor/subscribe.do?q=${row.id}"> <jstl:out
						value="${subscribe}" /></a>
			</display:column>

		</display:table>

	</jstl:if>
	

	<jstl:if test="${a==3}">

		<display:table name="chirps" id="row"
			requestURI="chirp/actor/myListSubscribe.do" pagesize="16"
			class="table table-over">

			<display:column title="${momentWritten}" property="momentWritten" />
			<display:column title="${text}" property="text" />
			<display:column title="${actorName}" property="actor.actorName" />
			
		</display:table>
		
	</jstl:if>

</security:authorize>
