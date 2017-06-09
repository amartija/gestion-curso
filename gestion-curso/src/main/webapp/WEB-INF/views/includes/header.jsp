<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<spring:message var="nombreApp" scope="request" code="aplicacion.nombre" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gestion Curso </title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<spring:url var="misEstilos" value="resources/css/styles.css"/>

<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
    
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 

</head>
<body>
	<header class="container-fluid">
		<h1 class="row"><span class="text-capitalize text-center">Gestion Curso</span></h1>
		

	</header>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Pincha para visualizar</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>

	    </div>
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li>
				<a href="<c:url value='/cursos'/>">
					<spring:message code="cursos" text="G.Cursos" />
				</a>
	        </li>


	        <li>
				<a href="<c:url value='/'/>">
						<spring:message code="menu.servicios" text="G.Servicios" />
				</a>
	        </li>
	        <li role="separator" class="divider"></li>
	        
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        
			<li>
			<sec:authorize access="isAnonymous()">
			    <form method="POST"  role="form" class="navbar-form navbar-right" action="<c:url value='/login'/>">
			         <div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
				        <input name="userId" type="text" class="form-control" value="${SPRING_SECURITY_LAST_USERNAME}" />
				     </div> 
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input name="password" class="form-control" type="password" />
					</div> 

			        <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
					<div class="form-group ">				
				   		 <button type="submit" class="btn btn-primary">Login</button>
				   	</div>
			    </form>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			    <a class="btn " href="<c:url value="/logout" />">Logout</a>
			</sec:authorize>
			</li>
			
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<div class="container">
		<c:if test="${not empty mensaje}">
			<div class="alert alert-danger">
	   			 <strong></strong> 
	  		</div>
  		</c:if>
	</div>