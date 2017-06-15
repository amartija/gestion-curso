<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>    



<main class="container-fluid">
	<section class="row">
		<center> 

			<h2><b>Buscar por Codigo Curso</b></h2>

			<input type="text" id="bus" name="bus" onkeyup="loadXMLDoc()" required />

				<div id="Div"></div>

	<header class="col-xs-12"><h2>10 ultimos cursos </h2></header>

		<div id ="main div">
		
		</div>
			</center>

	</section>
</main>	
<main class="container-fluid">
	<section class="row">
		<header class="col-xs-12"><h2><spring:message code="cursos" text=" " /></h2></header>
		
			<div class="row">
				<div class="col-xs-4">Codigo Curso</div>				
				<div class="col-xs-5">Nombre</div>
				<div class="col-xs-3"></div>
			</div>
			<c:choose>
				<c:when test="${not empty listadoCursos}">
					<c:forEach var="curso" items="${listadoCursos}">
						<div class="row">
							<div class="col-xs-6">
								<a href="<c:url value='/cursos/${curso.codigo}'/>">${curso.codCurso}</a>
							</div>
							<div class="col-xs-6">
								${curso.nombre}
				            </div>

				            			
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="row">
						<p class="col-xs-12">No existen resultados</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</main>

	
<!-- 		<script>
 		const url="http://localhost:8080/gestioncurso/api";
		jQuery(document).ready(function($) {
			  $.ajax({
			  url : url,
			  dataType : "json",
			  success : function(data) {
				console.log(data);
				for(var i = 0; i < data.length; i++){
					var txt ="<p>"+data[i].nombre+", "+data[i].codCurso+"</p>";

					$("main div").append(txt);
				}
			  }
		  });
			  
		});
</script> -->
<script>
	const url="http://localhost:8080/gestioncurso/api";
	jQuery(document).ready(function($){
		$.ajax({
    	url : url,
    	contentType: "application/json",
    	dataType: "json",
   		success : function(data,textStatus,xhr) {
        console.log("sucess " + data);
        console.log("status " + textStatus)
        console.log("xhr " + xhr.status)

        if (xhr.status == 200)
        {
            var listaCursos = JSON.stringify(data);
            var datosCursos = JSON.parse(listaCursos);
            renderizarBusqueda(datosCursos)
        }
        else
        {
            renderizarError(xhr.status);
        }


    error:( function(data, textStatus, xhr) {})
      
    }
});
});
</script>

	

	
