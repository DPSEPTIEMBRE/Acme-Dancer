<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<security:authorize access="hasRole('ACADEMY')">

<form:form action="course/academy/save-edit.do" modelAttribute="course" method="POST">

	<form:hidden path="academy"/>
	<form:hidden path="applications"/>
	<form:hidden path="style"/>
	
	<acme:textbox code="course.title" path="title"/>
	<acme:textbox code="course.levelCourse" path="levelCourse" />
	<acme:textbox code="course.start" path="start"/>
	<acme:textbox code="course.end" path="end"/>
	<acme:textbox code="course.dayWeek" path="dayWeek"/>
	<acme:textbox code="course.time" path="time"/>
	
		<spring:message code="course.save" var="courseSave"/>
		<spring:message code="course.cancel" var="cancel" />
		<spring:message code="course.delete" var="deleteSave" />

		<input type="submit" name="save" value="${courseSave}" />
			<input type="submit" name="delete" value="${deleteSave}" />
		<input onclick="window.location='';" type="button" name="cancel" value="${cancel}" />

</form:form>


</security:authorize>