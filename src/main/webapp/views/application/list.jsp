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

<security:authorize access="hasRole('DANCER')">

	<jstl:if test="${a==1}">
		<acme:list list="${applications}"
			requestURI="application/listByDancer.do"
			hidden_fields="id,version,course"
			entityUrl=" course: course/list.do" />
	</jstl:if>
	
</security:authorize>


<security:authorize access="hasRole('ACADEMY')">

	<jstl:if test="${a==2}">
		<acme:list list="${applications}"
			requestURI="application/listByCourse.do"
			hidden_fields="id,version,course" />
	</jstl:if>

	<jstl:if test="${a==3}">
		<acme:list list="${applications}"
			requestURI="application/listByAcademy.do"
			hidden_fields="id,version,course"
			extraColumns=" accept: application/accept.do, denied: application/denied.do" />
	</jstl:if>

</security:authorize>
