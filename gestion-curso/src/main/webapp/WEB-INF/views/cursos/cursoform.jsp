
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	<html>
		<head>
		<meta charset="UTF-8">
		<title>Gestion Curso - Curso</title>
		</head>
		<jsp:include page="../includes/header.jsp" />
			
			<body>
			<spring:message var="men" code="form.crear" text="nombre" />
			<c:if test="${curso.codigo > 0}" >
				<spring:message var="men"  code="form.editar" text="nombre" />
			</c:if> 
			<c:set scope="request" var="seccion" value="Curso"/>
			<c:set scope="request" var="seccion" value="${men} ${seccion}"/>
			
			
			
				<section class= "row">
				
				<c:url var ="sendUrl" value = "/cursos/save"/>
				<c:url var ="cancelUrl" value = "/cursos"/>
				
					
					<form:form action="${sendUrl}"  enctype="multipart/form-data" method="post" cssClass="form-horizontal" modelAttribute="curso">
						<c:if test="${!empty curso}">
							<form:hidden path="codigo"/>
						</c:if>
						<div class="form-group">
						<form:label path="nombre" cssClass="control-label  col-xs-2"><spring:message code="form.nombre" text="Nombre"/></form:label>
						<div class="col-xs-4">
							<form:input type="text" path="nombre" cssClass="form-control" cssErrorClass="form-control text-danger"/>
						</div>
							<form:errors path="nombre" cssClass="text-danger col-xs-6"></form:errors>
						</div>
						<div class="form-group">
							<form:label path="codCurso" cssClass="control-label  col-xs-2">Codigo Curso</form:label>
						<div class="col-xs-4">
							<form:input type="text" path="codCurso" cssClass="form-control" cssErrorClass="form-control text-danger"/>
						</div>
							<form:errors path="codCurso" cssClass="text-danger col-xs-6"></form:errors>
						</div>


						
				<div class="form-group">
					<div class="col-md-offset-3">
						<button type="submit" class="btn btn-success">${men}</button>
						<a class="btn btn-warning" href="${cancelUrl}">Cancelar</a>
					</div>
				</div>
				

					</form:form>
				</section>
			
		</body>
	</html>
	<%@include file="../includes/footer.html" %>