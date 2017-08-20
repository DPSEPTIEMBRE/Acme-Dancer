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



<security:authorize access="permitAll() and !hasRole('ACADEMY') and !hasRole('DANCER')">

<form action="course/search1.do">
	<b><spring:message code="course.search" /></b> <input type="search"
		name="searchText" />
</form>


	<jstl:if test="${a==0}">

		<acme:list list="${courses}" requestURI="course/list.do"
			hidden_fields="id,version,applications"
			entityUrl="{style: style/list.do, academy: academy/listByCourse.do}" />

	</jstl:if>

	<jstl:if test="${a==1}">

		<acme:list list="${courses}" requestURI="course/listByAcademy.do"
			hidden_fields="id,version,academy,applications"
			entityUrl="{style: style/list.do}" />

	</jstl:if>

	<jstl:if test="${a==2}">

		<acme:list list="${courses}" requestURI="course/listByStyle.do"
			hidden_fields="id,version,applications,style"
			entityUrl="{academy: academy/listByCourse.do}" />

	</jstl:if>

</security:authorize>

<security:authorize access="hasRole('ACADEMY')">
<form action="course/search2.do">
	<b><spring:message code="course.search" /></b> <input type="search"
		name="searchText" />
</form>
	<jstl:if test="${a==3}">

		<acme:list list="${courses}" requestURI="course/listByActor.do"
			hidden_fields="id,version,academy,levelCourse"
			entityUrl="{style: style/list.do, applications: application/listByCourse.do}"
			editUrl="course/edit.do" deleteUrl="course/delete.do" />
	</jstl:if>
	
	<jstl:if test="${a==0}">

		<acme:list list="${courses}" requestURI="course/list.do"
			hidden_fields="id,version,applications"
			entityUrl="{style: style/list.do, academy: academy/listByCourse.do}" />

	</jstl:if>

</security:authorize>

<security:authorize access="hasRole('DANCER')">
<form action="course/search3.do">
	<b><spring:message code="course.search" /></b> <input type="search"
		name="searchText" />
</form>
	<jstl:if test="${a==4}">

		<acme:list list="${courses}" requestURI="course/list.do"
			hidden_fields="id,version,academy,levelCourse"
			entityUrl="{style: style/list.do, applications: application/listByCourse.do}"
			extraColumns="{application: application/apply.do}" />
	</jstl:if>
	
	<jstl:if test="${a==0}">

		<acme:list list="${courses}" requestURI="course/list.do"
			hidden_fields="id,version,applications"
			entityUrl="{style: style/list.do, academy: academy/listByCourse.do}" />

	</jstl:if>

</security:authorize>
