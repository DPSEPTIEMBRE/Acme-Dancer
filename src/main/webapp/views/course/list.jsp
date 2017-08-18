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

<security:authorize access="permitAll()">

	<acme:list list="${courses}" requestURI="course/list.do"
		hidden_fields="id,version,applications"
		entityUrl="{style: style/list.do, academy: academy/listByCourse.do}" />

	<jstl:if test="${a==1}">

		<acme:list list="${courses}" requestURI="course/listByAcademy.do"
			hidden_fields="id,version,academy,applications"
			entityUrl="{style: style/list.do}" />

	</jstl:if>

	<jstl:if test="${a==2}">

		<acme:list list="${courses}" requestURI="course/listByStyle.do"
			hidden_fields="id,version,applications"
			entityUrl="{academy: academy/listByCourse.do}" />

	</jstl:if>

</security:authorize>
