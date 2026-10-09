<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PetCare - Citas y atención</title><%@ include file="componentes/estilos.jsp" %></head><body>
<%@ include file="componentes/header.jsp" %><%@ include file="componentes/menu.jsp" %>
<main class="contenedor container"><section class="hero"><div><p>Gestión veterinaria</p><h1>Citas y atención</h1><p>F17–F20: Agendar, listar, registrar atención y cancelar.</p></div><a class="boton secundario" href="${pageContext.request.contextPath}/dashboard">Volver al panel</a></section>
<c:if test="${not empty mensaje}"><p class="mensaje" role="status"><c:out value="${mensaje}"/></p></c:if>
<c:if test="${not empty error}"><p class="mensaje error" role="alert"><c:out value="${error}"/></p></c:if>
<c:if test="${param.id ne null and empty citaEditar and empty citaEliminar}"><p class="alert alert-warning">El registro solicitado no existe.</p></c:if>
<c:if test="${not empty citaEditar}"><section class="panel"><h2>Confirmar atención</h2><p><strong>Fecha:</strong> ${citaEditar.fecha} · <c:out value="${citaEditar.hora}"/></p><p><strong>Mascota:</strong> <c:out value="${citaEditar.mascota.nombre}"/></p><p><strong>Servicio:</strong> <c:out value="${citaEditar.servicio.nombre}"/></p><p><strong>Motivo:</strong> <c:out value="${citaEditar.motivo}"/></p><form action="${pageContext.request.contextPath}/citas/atender" method="post"><input class="form-check-input" name="id" type="hidden" value="${citaEditar.id}"><button class="boton" type="submit">Marcar como atendida</button></form></section></c:if>
<c:if test="${not empty citaEliminar}"><section class="panel"><h2>Cancelar cita</h2><p>¿Deseas cancelar la cita de <strong><c:out value="${citaEliminar.mascota.nombre}"/></strong> del ${citaEliminar.fecha} a las <c:out value="${citaEliminar.hora}"/>?</p><form action="${pageContext.request.contextPath}/citas/cancelar" method="post"><input class="form-check-input" name="id" type="hidden" value="${citaEliminar.id}"><div class="acciones"><button class="boton peligro" type="submit">Sí, cancelar cita</button><a class="boton secundario" href="${pageContext.request.contextPath}/citas#citas">Volver</a></div></form></section></c:if>
<c:if test="${empty citaEditar and empty citaEliminar}"><section class="panel" id="agendar-cita">
                <h2>Agendar cita</h2><p>Selecciona una mascota, un servicio y el horario.</p>
                <form action="${pageContext.request.contextPath}/citas/guardar" method="post">
                    <label class="form-label" for="cita-fecha">Fecha</label><input class="form-control" id="cita-fecha" name="fecha" type="date" required>
                    <label class="form-label" for="cita-hora">Hora</label><input class="form-control" id="cita-hora" name="hora" type="time" required>
                    <label class="form-label" for="cita-motivo">Motivo</label><input class="form-control" id="cita-motivo" name="motivo" placeholder="Control, vacuna, baño..." required>
                    <label class="form-label" for="cita-mascota">Mascota</label>
                    <select class="form-control" id="cita-mascota" name="mascotaId" required><option value="">Seleccione una mascota</option><c:forEach items="${mascotas}" var="mascota"><c:if test="${mascota.activo}"><option value="${mascota.id}"><c:out value="${mascota.nombre}"/> · <c:out value="${mascota.cliente.nombre}"/></option></c:if></c:forEach></select>
                    <label class="form-label" for="cita-servicio">Servicio</label>
                    <select class="form-control" id="cita-servicio" name="servicioId" required><option value="">Seleccione un servicio</option><c:forEach items="${servicios}" var="servicio"><c:if test="${servicio.activo}"><option value="${servicio.id}"><c:out value="${servicio.nombre}"/> · S/ <c:out value="${servicio.precio}"/></option></c:if></c:forEach></select>
                    <button class="boton" type="submit">Agendar cita</button>
                </form>
            </section></c:if>
<section class="panel" id="citas"><header><h2>Citas</h2><a href="${pageContext.request.contextPath}/citas#agendar-cita">+ Agendar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Fecha</th><th>Mascota</th><th>Servicio</th><th>Motivo</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty citas}"><tr><td colspan="6">No hay citas registradas.</td></tr></c:when><c:otherwise><c:forEach items="${citas}" var="cita"><tr>
                <td>${cita.fecha} · <c:out value="${cita.hora}"/></td><td><strong><c:out value="${cita.mascota.nombre}"/></strong></td><td><c:out value="${cita.servicio.nombre}"/></td><td><c:out value="${cita.motivo}"/></td><td><span class="estado ${cita.estado == 'CANCELADA' ? 'inactivo' : ''}"><c:out value="${cita.estado}"/></span></td>
                <td class="acciones"><c:if test="${cita.estado == 'AGENDADA'}"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/citas?id=${cita.id}">Atender</a><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/citas?accion=desactivar&id=${cita.id}">Cancelar</a></c:if><c:if test="${cita.estado != 'AGENDADA'}">—</c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>
</main><%@ include file="componentes/footer.jsp" %></body></html>