<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

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
<spring:message code="course.save" var="save" />
<spring:message code="course.cancel" var="cancel" />
<spring:message code="course.apply" var="apply" />
<spring:message code="course.select" var="select" />

<security:authorize access="hasRole('ACADEMY')">


	<form:form action="course/academy/save-create.do"
		modelAttribute="course" method="POST">

		<form:hidden path="academy" />
		<form:hidden path="applications" />
		<form:hidden path="id" />
		<form:hidden path="version" />


		<form:label path="title">
			<spring:message code="course.title" />:
	</form:label>
		<form:input path="title" />
		<form:errors cssClass="error" path="title" />
		<br />

		<form:label path="levelCourse">
			<spring:message code="course.levelCourse" />:
	</form:label>
		<form:select path="levelCourse">
			<form:options items="${levelsCourse}" />
		</form:select>
		<br />

		<form:label path="start">
			<spring:message code="course.start" />:
	</form:label>
		<form:input path="start" />
		<form:errors cssClass="error" path="start" />
		<br />

		<form:label path="end">
			<spring:message code="course.end" />:
	</form:label>
		<form:input path="end" />
		<form:errors cssClass="error" path="end" />
		<br />

		<form:label path="dayWeek">
			<spring:message code="course.dayWeek" />:
	</form:label>
		<form:input path="dayWeek" />
		<form:errors cssClass="error" path="dayWeek" />
		<br />

		<form:label path="time">
			<spring:message code="course.time" />:
	</form:label>
		<form:input path="time" />
		<form:errors cssClass="error" path="time" />
		<br />

		<form:label path="style">
			<spring:message code="course.style" />:
	</form:label>
		<form:select path="style">
			<jstl:forEach var="s" items="${styles}">
				<form:option value="${s}" label="${s.name}" />
			</jstl:forEach>
		</form:select>
		<form:errors cssClass="error" path="style" />
		<br />

		<br />
		<br />

		<input type="submit" name="save" value="${save}"
			class="btn btn-primary" />
		<input onclick="window.location='course/academy/list.do';"
			type="button" name="cancel" value="${cancel}" class="btn btn-warning" />


	</form:form>

</security:authorize>