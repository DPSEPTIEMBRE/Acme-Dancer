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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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

		<security:authorize access="isAnonymous()">
			<acme:list requestURI="course/listNoRegister.do" list="${courses}"
				hidden_fields="id,version,applications"
				field_mapping="{levelCourse:value,academy:commercialName,style:name}"
				entityUrl="{academy:academy/listByCourse.do,style:style/listByCourse.do}">
			</acme:list>
		</security:authorize>

		<acme:list requestURI="course/list.do" list="${courses}"
			hidden_fields="id,version,applications"
			field_mapping="{levelCourse:value,academy:commercialName,style:name}"
			entityUrl="{academy:academy/listByCourse.do,style:style/listByCourse.do}">

			<display:table name="courses" id="row" requestURI="course/list.do">

				<security:authorize access="hasRole('ACADEMY')">
				
					entityUrl="{application:application/academy/listByCourse.do}"

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
						<jstl:if test="${row.academy.userAccount.id == id}">
							<a href="course/academy/delete.do?q=${row.id}"> <jstl:out
									value="${delete}" />
							</a>
						</jstl:if>
					</display:column>

				</security:authorize>

				<security:authorize access="hasRole('DANCER')">

					<display:column>
						<security:authentication property="principal.id" var="id" />
						<jstl:if test="${!coursesApplyActor.contains(row)}">
							<a href="application/dancer/apply.do?q=${row.id}"> <jstl:out
									value="${apply}" />
							</a>
						</jstl:if>
					</display:column>

				</security:authorize>
			</display:table>
		</acme:list>

	</jstl:if>

	<jstl:if test="${a==1}">

		<acme:list requestURI="course/listByAcademy.do" list="${courses}"
			hidden_fields="applications,academy"
			field_mapping="{levelCourse:value,style:name}"
			entityUrl="{style:style/listByCourse.do}">
		</acme:list>

	</jstl:if>

	<jstl:if test="${a==2}">

		<acme:list requestURI="course/listByStyle.do" list="${courses}"
			hidden_fields="id,version,applications,style"
			field_mapping="{levelCourse:value,academy:commercialName}"
			entityUrl="{academy:academy/listByCourse.do}">
		</acme:list>

	</jstl:if>

</security:authorize>

<security:authorize access="hasRole('ACADEMY')">

	<jstl:if test="${a==3}">
		<acme:list list="${courses}" requestURI="course/academy/listByActor.do"
			hidden_fields="id,version,academy"
			field_mapping="{levelCourse:value}"
			entityUrl="{style: style/listByCourse.do, applications: application/academy/listByCourse.do}"
			editUrl="course/academy/edit.do" deleteUrl="course/academy/delete.do" />
	</jstl:if>

	<br />
	<div>
		<a href="course/academy/create.do"> <spring:message
				code="course.create" />
		</a>
	</div>

</security:authorize>
