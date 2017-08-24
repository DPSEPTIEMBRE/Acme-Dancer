<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<spring:message code="course.select" var="select" />

<security:authorize access="isAuthenticated()">

	<security:authorize access="hasRole('ACADEMY')">
		<jstl:set var="url" value="course/academy/save-create.do" />
	</security:authorize>

	<form:form method="POST" action="${url}" modelAttribute="course">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="applications" />
		<form:hidden path="academy" />


		<security:authorize access="hasRole('ACADEMY')">

			<form:label path="title">
				<spring:message code="course.title" />
			</form:label>
			<br />
			<form:input path="title" />
			<form:errors cssClass="error" path="title" />
			<br />


			<form:label path="levelCourse">
				<spring:message code="course.levelCourse" />
			</form:label>
			<br />
			<form:select path="levelCourse">
				<form:option value="${levelCourse}" label="${select}" />
				<form:options items="${levelsCourse}" />
			</form:select>
			<form:errors cssClass="error" path="levelCourse" />
			<br />

			<form:label path="start">
				<spring:message code="course.start" />
			</form:label>
			<br />
			<form:input path="start" />
			<form:errors cssClass="error" path="start" />
			<br />

			<form:label path="end">
				<spring:message code="course.end" />
			</form:label>
			<br />
			<form:input path="end" />
			<form:errors cssClass="error" path="end" />
			<br />

			<form:label path="dayWeek">
				<spring:message code="course.dayWeek" />
			</form:label>
			<br />
			<form:input path="dayWeek" />
			<form:errors cssClass="error" path="dayWeek" />
			<br />

			<form:label path="time">
				<spring:message code="course.time" />
			</form:label>
			<br />
			<form:input path="time" />
			<form:errors cssClass="error" path="time" />
			<br />

			<form:label path="style">
				<spring:message code="course.style" />
			</form:label>
			<br />
			<form:select path="style">
				<form:option value="${style}" label="${select}" />
				<jstl:forEach var="s" items="${styles}">
					<form:option value="${s}" label="${s.name}" />
				</jstl:forEach>
			</form:select>
			<form:errors cssClass="error" path="style" />
			<br />
		</security:authorize>


		<br />
		<spring:message code="course.save" var="courseSaveHeader" />
		<spring:message code="course.cancel" var="courseCancelHeader" />
		<spring:message code="course.clear" var="courseClearHeader" />
		<input class="btn btn-primary" type="submit" name="save"
			value="${courseSaveHeader}" />
		<input class="btn btn-warning"
			onclick="window.location='course/list.do?a=0';" type="button"
			name="cancel" value="${courseCancelHeader}" />
		<input class="btn btn-danger" type="reset" name="clear"
			value="<spring:message code="acme.clear" />" />



	</form:form>

</security:authorize>

