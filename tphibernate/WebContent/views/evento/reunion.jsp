<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<jsp:include page="evento_header.jsp"></jsp:include>
	
	<link href='<c:url value="/views/ui/css/jquery-ui.css"/>' rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/views/ui/js/jquery-ui-1.11.4.js" />"></script>
	

	<jsp:include page="evento_time.jsp"></jsp:include>
	
	<jsp:include page="reunion_autocomplete.jsp"></jsp:include>
		
	<title><fmt:message key="reunion.tituloAgregar"/></title>
  
</head>



<body>
	<jsp:include page="evento_menu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar"></div>
			<div class="span9" id="content">
				<div class="row-fluid">
					<div class="block">
					
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left"><fmt:message key='reunion.titulo'/></div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
					        <c:choose>
					            <c:when test='${reunionForm.estado=="reunionNoConfirmado"}'>
									<c:url value="/calendario/modificarAsistenciaReunion.do" var="x"></c:url>
								</c:when>
								<c:otherwise>
									<c:url value="/calendario/agregarReunion.do" var="x"></c:url>
								</c:otherwise>
							</c:choose>
							<form:form method="POST" commandName="reunionForm" action="${x}" cssClass="form-horizontal" >
									<fieldset>
										<legend><fmt:message key='reunion.tituloAgregar'/></legend>
										
										<c:set value='${(reunionForm.estado!="reunionAutor")&&(not empty reunionForm.idEvento)}' var="soloLectura"/>
										<!-- idEvento --------------------------------------------------------------------------------------------------->
										<form:hidden path="idEvento"/>
										<form:hidden path="estado"/>										
										<!-- titulo ----------------------------------------------------------------------------------------------------->	
										<div class="control-group">
											<fmt:message key='evento.label.titulo' var="titulo" />
											<label class="control-label" for="titulo"><fmt:message key="evento.label.titulo" /></label>
											<div class="controls">
												<form:input id="titulo" path="titulo" cssClass="input-xxlarge focused"  placeholder="${titulo}" autofocus="true" disabled="${soloLectura}" />
												<div><form:errors path="titulo" cssStyle="color: red" /></div>
											</div>
											
										</div>
										
										
										<!-- fecha y hora ------------------------------------------------------------------------------------------------>
										<div class="control-group">
											<fmt:message key='evento.label.fecha' var="fecha" />
										    <span class="control-label"><fmt:message key="evento.label.fecha" /></span>
										    <div class="controls form-inline">

												<!--fecha-->
												<form:input id="fecha" path="fecha" cssClass="input-small "  placeholder="${fecha}" disabled="${soloLectura}" autocomplete="off"/>
												
												<!--horainicio-->
									            <fmt:message key='evento.label.horaInicio' var="horaInicio" />
												<label for="horaInicio"><fmt:message key="evento.label.horaInicio" /></label>
												<form:input id="horaInicio" path="horaInicio" cssClass="input-small "  placeholder="${horaInicio}" disabled="${soloLectura}"/>
												
												<!--horafin-->
												<fmt:message key='evento.label.horaFin' var="horaFin" />
												<label for="horaFin"><fmt:message key="evento.label.horaFin" /></label>
												<form:input id="horaFin" path="horaFin" cssClass="input-small "  placeholder="${horaInicio}" disabled="${soloLectura}"/>

												<!--errores-->
												<div><form:errors path="fecha" cssStyle="color: red" /></div>
									  			<div><form:errors path="horaInicio" cssStyle="color: red" /></div>
												<div><form:errors path="horaFin" cssStyle="color: red" /></div>
												
									    	</div>
									  	</div>

									  	
									  	<!-- temario ------------------------------------------------------------------------------------------------>
										<div class="control-group">
											<fmt:message key='reunion.label.temario' var="temario" />
											<label class="control-label" for="temario"><fmt:message key="reunion.label.temario" /></label>
											<div class="controls">
												<form:input id="temario" path="temario" cssClass="input-xxlarge "  placeholder="${temario}" disabled="${soloLectura}"/>
												<div><form:errors path="temario" cssStyle="color: red" /></div>
											</div>
										</div>
										
										<!-- sala ------------------------------------------------------------------------------------------------>
										<div class="control-group">
											<fmt:message key='reunion.label.sala' var="sala" />
											<label class="control-label" for="sala"><fmt:message key="reunion.label.sala" /></label>
											<div class="controls">
												<%-- <form:input id="sala" path="sala" cssClass="input-xxlarge "  placeholder="${sala}" />--%>
												<%-- <form:select path="sala" items="salas"></form:select>--%>
												<form:select path="idSala" multiple="false" items="${reunionForm.salas}" itemLabel="descripcion" itemValue="id" disabled="${soloLectura}"/>
												
											</div>
										</div>


										
										<!-- usuarios a invitar ------------------------------------------------------------------------------------->
										<c:if test='${!soloLectura}'>
										
										<div class="control-group">
											<fmt:message key='reunion.label.participantes' var="participantes" />
											<label class="control-label" for="invitados"><fmt:message key="reunion.label.participantes" /></label>
											<div class="controls">
											

												<input id="usuariosAutocomplete" class="input-xxlage" placeholder="${usuariosainvitar}" <%--  disabled="${soloLectura}" --%> />

											</div><!-- controls -->
										</div><!-- control-group -->
										</c:if>
										
										
										<!-- invitaciones------------------------------------------------------------------------------------------------>
										
										<c:if test="${not empty reunionForm.idEvento}"><!-- si se esta editando -->
										
											<!-- estado -->		
											<c:if test='${reunionForm.estado!="reunionAutor"}'><!-- si no soy el autor -->
												<div class="control-group">
													<label class="control-label" ><fmt:message key="reunion.label.estado" /></label> 
													<div class="controls">
														 <c:if test='${reunionForm.estado=="reunionNoConfirmado"}'><!-- si no soy el autor y no caonfirme ni cancele-->
															<form:radiobutton path="idEstado" value="1" /><fmt:message key="reunion.estado.confirmado" /> 
															<form:radiobutton path="idEstado" value="2" /><fmt:message key="reunion.estado.cancelado" />

														
														</c:if>
														<c:if test='${reunionForm.estado=="reunionConfirmada"}'><fmt:message key="reunion.estado.confirmado" /> </c:if>
														<c:if test='${reunionForm.estado=="reunionCancelada"}'><fmt:message key="reunion.estado.cancelado" /></c:if>
														
													</div>
												</div>
											</c:if>
										</c:if>
										
										<!-- tabla invitaciones(usuario+estado) -->
										<div class="control-group">
											<label class="control-label" ><fmt:message key="reunion.label.invitados" /></label> 
											<div class="controls">
											<table id="tablaInvitaciones">
												<tr>
													<th><fmt:message key="usuario.nombre" /></th>
													<th><fmt:message key="reunion.label.estado" /></th>
												</tr>
												<tr>
													<td>${reunionForm.autor.nombre} ${reunionForm.autor.apellido} (${reunionForm.autor.nombreUsuario})</td>
													<td>Autor</td>
													<td>&nbsp;</td>
												</tr>
												<c:forEach var="invitacion" items="${reunionForm.invitaciones}">
													<tr>
														<td class="celdaNombreCompuesto">${invitacion.usuario.nombre} ${invitacion.usuario.apellido} (${invitacion.usuario.nombreUsuario})</td>
														<td> 
														<c:if test="${invitacion.aceptado==0}"><fmt:message key="reunion.estado.pendiente" /></c:if>
														<c:if test="${invitacion.aceptado==1}"><fmt:message key="reunion.estado.confirmado" /></c:if>
														<c:if test="${invitacion.aceptado==2}"><fmt:message key="reunion.estado.cancelado" /></c:if>
														</td>
														<td >
												      		<input type="hidden" name="invitados"  class="hiddenIdInvitado" value="${invitacion.usuario.id}" />
															<input type="button" class="borrar" value="<fmt:message key="evento.label.eliminar" />"  														
															 <%-- <c:if test="${invitacion.aceptado==2}">cancelado</c:if> --%>
															<c:if test="${soloLectura==true}">disabled</c:if>
															/>
														</td>
													</tr>
												</c:forEach>
												<%-- </tr>  --%>
											</table>
											</div>
										</div>
									<div><form:errors path="invitados" cssStyle="color: red" /></div>																			
										
										<!-- Botones ---------------------------------------------------------------------------------------->
 										<div class="form-actions">
 											<c:if test='${reunionForm.estado=="reunionAutor" || reunionForm.estado=="reunionNoConfirmado"|| reunionForm.idEvento==null}'>
												<button type="submit" class="btn btn-primary" > <fmt:message key="evento.label.guardar" /></button>
												<a class="btn" href="#" onclick="evaluarCancelar('${reunionForm.fecha}');">
													<fmt:message key="evento.label.cancelar" />
												</a>
											</c:if>

											<c:if test='${soloLectura==true && reunionForm.estado!="reunionNoConfirmado"}'>
												<a class="btn" href="#" onclick="cancelar('${reunionForm.fecha}');">
													<fmt:message key="evento.label.volver" />
												</a>
											</c:if>

											
											<c:if test='${reunionForm.idEvento!=null && soloLectura!=true}'>
												<a class="btn btn-cancel" href="<c:url value='/calendario/eliminarReunion.do?idEvento=${reunionForm.idEvento}' />"><fmt:message key="evento.label.eliminar" /></a>
											</c:if>
										</div>
										
									</fieldset>
									
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>