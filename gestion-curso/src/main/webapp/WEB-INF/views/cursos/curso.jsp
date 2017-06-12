<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>    
<c:set scope="request" var="seccion" value="Curso ${curso.nombre}"/>

<body>
	<header>
	<h1>Gestion Curso - Curso</h1>
	</header>

	<section>
		<header><h2>Datos del curso</h2></header>
		<div>
			<p>CodCurso: ${curso.codCurso}</p>
			<p>Nombre: ${curso.nombre}</p>
	            
        </div>
		
	</section>

</body>
