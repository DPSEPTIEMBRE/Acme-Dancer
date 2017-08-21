<%--
 * list.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<spring:message code="application.createMoment" var="createMoment" />
<spring:message code="application.statusApplication"
	var="statusApplication" />
<spring:message code="application.course" var="course" />
<spring:message code="application.accept" var="accept" />
<spring:message code="application.denied" var="denied" />
<spring:message code="application.cancel" var="cancel" />


<security:authorize access="hasRole('DANCER')">

	<jstl:if test="${a==1}">

		<display:table name="applications" id="row"
			requestURI="application/listByDancer.do" pagesize="8"
			class="table table-over">
			<display:column title="${createMoment}" property="createMoment" />
			<display:column title="${statusApplication}"  property="statusApplication.value" />
			<display:column title="${course}" property="course.title" />
		</display:table>
		
	</jstl:if>

</security:authorize>


<security:authorize access="hasRole('ACADEMY')">

	<jstl:if test="${a==2}">
		<display:table name="applications" id="row"
			requestURI="application/listByCourse.do" pagesize="8"
			class="table table-over">
			<display:column property="createMoment" title="${createMoment}"
				sortable="false" />
			<display:column title="${statusApplication}" sortable="false"
				property="statusApplication.value" />

			<display:column sortable="false">
				<jstl:if test="${row.statusApplication.value eq 'PENDING'}">
					<a href="application/academy/accept.do?q=${row.id}"><jstl:out
							value="${accept}" /></a>
				</jstl:if>
			</display:column>
			<display:column sortable="false">
				<jstl:if test="${row.statusApplication.value eq 'PENDING'}">
					<a href="application/academy/denied.do?q=${row.id}"><jstl:out
							value="${denied}" /></a>
				</jstl:if>
			</display:column>

		</display:table>
	</jstl:if>

	<jstl:if test="${a==3}">
		<acme:list list="${applications}"
			requestURI="application/listByAcademy.do"
			hidden_fields="id,version,course" />
	</jstl:if>

	<jstl:if test="${a==4}">
		<acme:list list="${applications}"
			requestURI="application/listByAcademyPending.do"
			hidden_fields="id,version,course"
			extraColumns=" accept: application/academy/accept.do, denied: application/academy/denied.do" />
	</jstl:if>

	<jstl:if test="${a==5}">
		<acme:list list="${applications}"
			requestURI="application/listByCoursePending.do"
			hidden_fields="id,version,course"
			extraColumns=" accept: application/academy/accept.do, denied: application/academy/denied.do" />
	</jstl:if>

</security:authorize>
