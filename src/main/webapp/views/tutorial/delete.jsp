<%--
 * action-2.jsp
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

<security:authorize access="hasRole('ACADEMY')">

	<h1>
		<spring:message code="tutorial.erase" />
	</h1>

	<spring:message code="tutorial.delete" var="tutorialDeleteHeader" />
	<spring:message code="tutorial.cancel" var="tutorialCancelHeader" />
	<input
		onclick="window.location='tutorial/delete-delete.do?q=${tutorial}';"
		class="btn btn-primary" name="save" value="${tutorialDeleteHeader}" />
	<input onclick="window.location='tutorial/list.do?a=0';"
		class="btn btn-warning" type="button" name="cancel"
		value="${tutorialCancelHeader}" />



</security:authorize>