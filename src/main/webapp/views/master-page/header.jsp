<%--
 * header.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div>
	<img src="images/logo.png" alt="Acme-Dancer Co., Inc." />
</div>

<div style="width: 60%">
	<nav class="navbar navbar-default" style="margin-bottom: 0px">
		<div class="container-fluid">
			<div class="navbar-header">
				<ul class="nav navbar-nav">
					<security:authorize access="isAnonymous()">
						<li><a class="fNiv" href="security/login.do"><spring:message
									code="master.page.login" /></a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><spring:message
									code="master.page.register" /><span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a class="fNiv" href="academy/create.do"><spring:message
											code="master.page.academy.signup" /></a></li>
								<li><a class="fNiv" href="dancer/create.do"><spring:message
											code="master.page.dancer.signup" /></a></li>
							</ul></li>

						<li><a href="academy/list.do?a=0"><spring:message
									code="master.page.academy" /></a></li>
						<li><a href="course/list.do?a=0"><spring:message
									code="master.page.course" /></a></li>
						<li><a href="style/list.do?a=0"><spring:message
									code="master.page.style" /></a></li>
					</security:authorize>

					<security:authorize access="isAuthenticated()">
						<security:authentication property="principal.id" var="id" />
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><spring:message
									code="master.page.profile" /><span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="actor/edit.do?userAccountID=${id}"><spring:message
											code="master.page.actor.edit" /></a></li>
								<li><a href="j_spring_security_logout"><spring:message
											code="master.page.logout" /> </a></li>

							</ul></li>
						<li><a class="fNiv" href="academy/list.do?a=0"><spring:message
									code="master.page.academy" /></a></li>
						<security:authorize access="hasRole('DANCER')">
							<li><a class="fNiv" href="course/list.do?a=0"><spring:message
										code="master.page.course" /></a></li>
						</security:authorize>
						<security:authorize access="hasRole('ACADEMY')">
							<li><a class="fNiv" href="course/list.do?a=0"><spring:message
										code="master.page.course" /></a></li>
						</security:authorize>
						<security:authorize access="hasAnyRole('DANCER','ACADEMY')">
						<li><a class="fNiv" href="style/list.do?a=0"><spring:message
									code="master.page.style" /></a></li>
						</security:authorize>
						<li><a class="fNiv" href="chirp/actor/mylist.do"><spring:message
										code="master.page.chirps" /></a></li>
						<li><a class="fNiv" href="chirp/actor/create.do"><spring:message
										code="master.page.createChirps" /></a></li>
					</security:authorize>

					<security:authorize access="hasRole('ADMINISTRATOR')">
						<security:authentication property="principal.id" var="id" />
						<li class="dropdown"><a href="administrator/dashboard.do"><spring:message
									code="master.page.administrator.dashboard" /> </a></li>
						<li class="dropdown"><a href="style/listAdministratorStyle.do?a=2"><spring:message
									code="master.page.style" /> </a></li>
					</security:authorize>

					<security:authorize access="hasRole('ACADEMY')">
						<security:authentication property="principal.id" var="id" />
						<li class="dropdown"><a href="course/listByActor.do?q=${id}"><spring:message
									code="master.page.academy.courses" /> </a></li>
						<li class="dropdown"><a
							href="application/listByAcademy.do?q=${id}"><spring:message
									code="master.page.academy.applications" /> </a></li>
						<li class="dropdown"><a
							href="application/listByAcademyPending.do?q=${id}"><spring:message
									code="master.page.academy.applicationsPending" /> </a></li>
						<li class="dropdown"><a
							href="tutorial/listByMyAcademy.do?q=${id}"><spring:message
									code="master.page.academy.tutorials" /> </a></li>
					</security:authorize>

					<security:authorize access="hasRole('DANCER')">
						<security:authentication property="principal.id" var="id" />
						<li class="dropdown"><a href="application/listByDancer.do?q=${id}"><spring:message
									code="master.page.academy.applications" /> </a></li>
					</security:authorize>

				</ul>
			</div>
		</div>
	</nav>
	<a href="?language=en"> <img src="images/flag_en.png" />
	</a> <a href="?language=es"> <img src="images/flag_es.png" />
	</a>
</div>


