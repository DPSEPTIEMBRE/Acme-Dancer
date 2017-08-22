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


<spring:message code="course.title" var="title" />
<spring:message code="course.levelCourse" var="levelCourse" />
<spring:message code="course.start" var="start" />
<spring:message code="course.end" var="end" />
<spring:message code="course.dayWeek" var="dayWeek" />
<spring:message code="course.time" var="time" />
<spring:message code="course.academy" var="academy" />
<spring:message code="course.applications" var="applications" />
<spring:message code="course.style" var="style" />
<spring:message code="course.edit" var="edit" />
<spring:message code="course.delete" var="delete" />
<spring:message code="course.cancel" var="cancel" />
<spring:message code="course.apply" var="apply" />


<security:authorize access="permitAll()">

	<form action="course/search.do">
		<b><spring:message code="course.search" /></b> <input type="search"
			name="searchText" />
	</form>
</security:authorize>

<security:authorize access="permitAll()">

	<jstl:if test="${a==0}">

		<display:table name="courses" id="row" requestURI="course/list.do"
			pagesize="8" class="table table-over">
			<display:column property="title" title="${title}" />
			<display:column property="levelCourse.value" title="${levelCourse}" />
			<display:column property="start" title="${start}" />
			<display:column property="end" title="${end}" />
			<display:column property="dayWeek" title="${dayWeek}" />
			<display:column property="time" title="${time}" />
			<display:column title="${academy}">
				<a href="academy/listByCourse.do?q=${row.id}"> <jstl:out
						value="${row.academy.commercialName}" />
				</a>
			</display:column>
			<display:column title="${style}">
				<a href="style/listByCourse.do?q=${row.id}"> <jstl:out
						value="${row.style.name}" />
				</a>
			</display:column>

			<security:authorize access="hasRole('ACADEMY')">

				<display:column>
					<security:authentication property="principal.id" var="id" />
					<jstl:if test="${row.academy.userAccount.id == id}">
						<a href="course/academy/edit.do?q=${row.id}"> <jstl:out
								value="${edit}" />
						</a>
					</jstl:if>
				</display:column>

				<display:column>
					<security:authentication property="principal.id" var="id" />
					<jstl:if
						test="${row.academy.userAccount.id == id}">
						<a href="course/academy/delete.do?q=${row.id}"> <jstl:out
								value="${delete}" />
						</a>
					</jstl:if>
				</display:column>

			</security:authorize>

			<security:authorize access="hasRole('DANCER')">
				<display:column>
					<a href="application/dancer/apply.do?q=${row.id}"> <jstl:out
							value="${apply}" />
					</a>
				</display:column>
			</security:authorize>

		</display:table>

	</jstl:if>

	<jstl:if test="${a==1}">

		<display:table name="courses" id="row"
			requestURI="course/listByAcademy.do" pagesize="8"
			class="table table-over">
			<display:column property="title" title="${title}" />
			<display:column property="levelCourse.value" title="${levelCourse}" />
			<display:column property="start" title="${start}" />
			<display:column property="end" title="${end}" />
			<display:column property="dayWeek" title="${dayWeek}" />
			<display:column property="time" title="${time}" />
			<display:column title="${style}">
				<a href="style/listByCourse.do?q=${row.id}"> <jstl:out
						value="${row.style.name}" />
				</a>
			</display:column>
		</display:table>

	</jstl:if>

	<jstl:if test="${a==2}">

		<display:table name="courses" id="row"
			requestURI="course/listByStyle.do" pagesize="8"
			class="table table-over">
			<display:column property="title" title="${title}" />
			<display:column property="levelCourse.value" title="${levelCourse}" />
			<display:column property="start" title="${start}" />
			<display:column property="end" title="${end}" />
			<display:column property="dayWeek" title="${dayWeek}" />
			<display:column property="time" title="${time}" />
			<display:column title="${academy}">
				<a href="academy/listByCourse.do?q=${row.id}"> <jstl:out
						value="${row.academy.commercialName}" />
				</a>
			</display:column>
		</display:table>

	</jstl:if>

</security:authorize>

<security:authorize access="hasRole('ACADEMY')">

	<jstl:if test="${a==3}">
		<acme:list list="${courses}" requestURI="course/listByActor.do"
			hidden_fields="id,version,academy,levelCourse"
			entityUrl="{style: style/listByCourse.do, applications: application/listByCourse.do}"
			editUrl="course/academy/edit.do" deleteUrl="course/academy/delete.do" />
	</jstl:if>

	<br />
	<div>
		<a href="course/academy/create.do"> <spring:message
				code="course.create" />
		</a>
	</div>


</security:authorize>
