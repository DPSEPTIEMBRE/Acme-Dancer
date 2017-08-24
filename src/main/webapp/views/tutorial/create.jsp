<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<security:authorize access="isAuthenticated()">

	<security:authorize access="hasRole('ACADEMY')">
		<jstl:set var="url" value="tutorial/academy/save-create.do" />
	</security:authorize>

	<form:form method="POST" action="${url}" modelAttribute="tutorial">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="numShows" />


		<security:authorize access="hasRole('ACADEMY')">

			<form:label path="title">
				<spring:message code="tutorial.title" />
			</form:label>
			<br />
			<form:input path="title" />
			<form:errors cssClass="error" path="title" />
			<br />


			<form:label path="description">
				<spring:message code="tutorial.description" />
			</form:label>
			<br />
			<script>tinymce.init({ selector:'textarea' });</script>
			<form:textarea path="description" />
			<form:errors cssClass="error" path="description" />
			<br />



			<form:label path="video">
				<spring:message code="tutorial.video" />
			</form:label>
			<br />
			<form:input path="video" />
			<form:errors cssClass="error" path="video" />
			<br />


		</security:authorize>


		<br />
		<spring:message code="tutorial.save" var="tutorialSaveHeader" />
		<spring:message code="tutorial.cancel" var="tutorialCancelHeader" />
		<spring:message code="tutorial.clear" var="tutorialClearHeader" />
		<input class="btn btn-primary" type="submit" name="save" value="${tutorialSaveHeader}" />
		<security:authentication property="principal.id" var="id" />
		<input class="btn btn-warning" onclick="window.location='tutorial/listByMyAcademy.do?q=${id}';" type="button"
			name="cancel" value="${tutorialCancelHeader}" />
		<input class="btn btn-danger" type="reset" name="clear"
			value="<spring:message code="acme.clear" />" />
	
	</form:form>

</security:authorize>

