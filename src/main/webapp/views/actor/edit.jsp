<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<jsp:include page="/WEB-INF/tags/patternPhone.tag"/>

<security:authorize access="isAuthenticated()">


	<security:authorize access="hasRole('DANCER')">
		<jstl:set var="url" value="actor/save-dancer.do" />
	</security:authorize>

	<security:authorize access="hasRole('ACADEMY')">
		<jstl:set var="url" value="actor/save-academy.do" />
	</security:authorize>

	<security:authorize access="hasRole('ADMINISTRATOR')">
		<jstl:set var="url" value="actor/save-administrator.do" />
	</security:authorize>

	<form:form method="POST" onsubmit="return patternPhone()" name="formActor" action="${url}" modelAttribute="person">

		<security:authorize access="hasRole('DANCER')">
			<form:hidden path="applications" />
		</security:authorize>

		<security:authorize access="hasRole('ACADEMY')">

			<form:label path="commercialName">
				<spring:message code="actor.commercialName" />
			</form:label>
			<br />
			<form:input path="commercialName" />
			<form:errors cssClass="error" path="commercialName" />
			<br />

			<form:hidden path="tutorials" />
			<form:hidden path="courses" />
		</security:authorize>

		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="userAccount.username" />
		<form:hidden path="userAccount.password" />
		<form:hidden path="userAccount.authorities" />
		<form:hidden path="chirps" />
		<form:hidden path="follower" />


		<form:label path="actorName">
			<spring:message code="actor.actorName" />
		</form:label>
		<br />
		<form:input path="actorName" />
		<form:errors cssClass="error" path="actorName" />
		<br />

		<form:label path="surname">
			<spring:message code="actor.surname" />
		</form:label>
		<br />
		<form:input path="surname" />
		<form:errors cssClass="error" path="surname" />
		<br />

		<form:label path="email">
			<spring:message code="actor.email" />
		</form:label>
		<br />
		<form:input path="email" />
		<form:errors cssClass="error" path="email" />
		<br />

		<form:label name="phone" path="phone">
			<spring:message code="actor.phone" />
		</form:label>
		<br />
		<form:input path="phone" />
		<form:errors cssClass="error" path="phone" />
		<br />

		<form:label path="address">
			<spring:message code="actor.address" />
		</form:label>
		<br />
		<form:input path="address" />
		<form:errors cssClass="error" path="address" />
		<br />
		

		<br />
		<spring:message code="actor.save" var="actorSaveHeader" />
		<spring:message code="actor.cancel" var="actorCancelHeader" />
		<input type="submit" class="btn btn-primary" name="save" value="${actorSaveHeader}" />
		<input class="btn btn-warning" onclick="window.location='welcome/index.do';" type="button"
			name="cancel" value="${actorCancelHeader}" />


	</form:form>

</security:authorize>


