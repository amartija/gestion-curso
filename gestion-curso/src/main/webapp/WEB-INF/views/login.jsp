<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="includes/header.jsp" />

<head>
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<spring:url var="misEstilos" value="/recources/css/styles.css"/>
	
	<link rel="stylesheet" href="${misEstilos}">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<script
  		src="https://code.jquery.com/jquery-3.1.1.min.js"
  		integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
 		 crossorigin="anonymous"></script>
  
  
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	 
 	<!--[if lt IE 9]>
  		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<![endif]-->
</head>
<body>
	<main class = "container-fluid">
		<section>
			<c:url var = "LoginURL" value="/login.html"/>
			<form:form action="${loginURL}" method ="post">
				<div class = "input-group input-sm">
					<label>Usuario:</label>
					<input type = "text" id="userId" name = "userId" required/>
				
				</div>
				<div class = "input-group input-sm">
					<label>Password:</label>
					<input type = "password" id="password" name = "password" required/>
				
				</div>
				
				<input type = "submit" value ="Log In" class= "btn btn-block btn-primary"/>
			
			</form:form> 		
		
		</section>
		
	
	
	
	</main>



</body>
</html>