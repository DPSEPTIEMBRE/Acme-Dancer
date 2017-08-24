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

<spring:message code="style.create" var="createHeader" />

<security:authorize access="permitAll()">

	<jstl:if test="${a==0}">
		<acme:list list="${styles}" requestURI="style/list.do"
			hidden_fields="id,version"
			entityUrl="{courses: course/listByStyle.do}" video_fields="videos"
			image_fields="pictures" pagesize="6">
		</acme:list>
	</jstl:if>


	<jstl:if test="${a==1}">
		<acme:list list="${styles}" requestURI="style/listByCourse.do"
			hidden_fields="id,version,courses" video_fields="videos"
			image_fields="pictures" pagesize="6">
		</acme:list>
	</jstl:if>

</security:authorize>

<security:authorize access="hasRole('ADMINISTRATOR')">

	<jstl:if test="${a==2}">
		<acme:list list="${styles}"
			requestURI="style/listAdministratorStyle.do"
			hidden_fields="id,version"
			entityUrl="{courses: course/listByStyle.do}"
			editUrl="style/administrator/edit.do" video_fields="videos"
			image_fields="pictures">
		</acme:list>
		<br />
		<div>
			<a href="style/administrator/create.do">${createHeader}</a>
		</div>
	</jstl:if>

</security:authorize>