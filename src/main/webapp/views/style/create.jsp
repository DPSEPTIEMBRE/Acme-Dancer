<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>



<security:authorize access="hasRole('ADMINISTRATOR')">
	<form:form action="style/administrator/save.do" modelAttribute="style"
		method="POST">

		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="courses" />

		<acme:textbox code="style.name" path="name" />
		<acme:textbox code="style.description" path="description" />
		<acme:textarea code="style.pictures" path="pictures" />
		<acme:textarea code="style.videos" path="videos" />

		<spring:message code="acme.save" var="styleSaveHeader" />
		<spring:message code="acme.cancel" var="styleCancelHeader" />


		<br />
		<input class="btn btn-primary" type="submit" name="save" value="${styleSaveHeader}" />
		<input class="btn btn-warning" type="button" name="cancel" value="${styleCancelHeader}"
			onclick="window.location='style/list.do';" />
		<input class="btn btn-danger" type="reset" name="clear"
			value="<spring:message code="acme.clear" />" />
	</form:form>
</security:authorize>