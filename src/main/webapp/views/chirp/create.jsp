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

	<form:form action="${url}" modelAttribute="chirp">

		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="actor" />
		<form:hidden path="momentWritten" />

	    <div class="form-group" style="width: 20%;">

			<label> <spring:message code="chirp.text" />
			</label><br />
			<textarea class="form-control" name="text">${chirp.text}</textarea>
			<form:errors cssClass="error" path="text" />
			<br />

		</div>

		<spring:message code="chirp.save" var="actorSaveHeader" />
		<spring:message code="chirp.cancel" var="actorCancelHeader" />
		<input type="submit" class="btn btn-primary" name="save"
			value="${actorSaveHeader}" />
		<input onclick="window.location='welcome/index.do';"
			class="btn btn-warning" type="button" name="cancel"
			value="${actorCancelHeader}" />
		<input class="btn btn-danger" type="reset" name="clear"
			value="<spring:message code="acme.clear" />" />

	</form:form>
</security:authorize>

