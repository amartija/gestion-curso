<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>    
<c:set scope="request" var="seccion" value="Listado de Cursos" /> 
<jsp:include page="../includes/header.jsp" />
<main class="container-fluid">
	<section class="row">
		<header class="col-xs-12"><h2><spring:message code="cursos" text="Listado de Cursos" /></h2></header>
		<div class="col-xs-12">
		<a class="btn btn-primary" href="<c:url value="/cursos/addCurso"/>">Crear Curso</a> 
		</div>
		<div class="col-xs-12">
			<div class="row">
				<div class="col-xs-4">Codigo Curso</div>				
				<div class="col-xs-5">Nombre</div>
				<div class="col-xs-3"></div>
			</div>
			<c:choose>
				<c:when test="${not empty listadoCursos}">
					<c:forEach var="coleccion" items="${listadoCursos}">
						<div class="row">
							<div class="col-xs-4">
								<a href="<c:url value='/cursos/${curso.codigo}'/>">${curso.codCodigo}</a>
							</div>
							<div class="col-xs-5">
								${curso.nombre}
				            </div>

				            <div class="col-md-3">
				            	<a class="btn btn-warning" href="<c:url value="/cursos/editCurso/${curso.codigo}"/>">Editar curso</a>
				            	<a class="btn btn-danger" href="<c:url value="/cursos/deleteCurso/${curso.codigo}"/>">Borrar curso</a>
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
<%@include file="../includes/footer.html" %>