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

<security:authorize
	access="permitAll()">

	<acme:list list="${academies}" requestURI="academy/list.do"
		hidden_fields="id, version, actorName, surname, follower, chirps"
		entityUrl="{tutorials: tutorial/listByAcademy.do, courses: course/listByAcademy.do}" />


	<jstl:if test="${a==1}">

		<acme:list list="${academy}" requestURI="academy/listByCourse.do"
			hidden_fields="id, version, email, actorName, surname, follower, chirps"
			entityUrl="{tutorials: tutorial/listByAcademy.do}" />

	</jstl:if>

</security:authorize>
