<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Panel</title><%@ include file="componentes/estilos.jsp" %>
</head>
<body>
    <%-- Indicadores y gestión rápida de citas --%>
    <%@ include file="componentes/header.jsp" %><%@ include file="componentes/menu.jsp" %>
    <main class="contenedor container">
        <section class="hero"><div><p>Resumen de registros</p><h1>Panel de control</h1><p>Indicadores básicos del sistema y estado de las citas.</p></div><a class="boton" href="${pageContext.request.contextPath}/citas#agendar-cita">Nueva cita</a></section>
        <c:if test="${not empty mensaje}"><p class="mensaje"><c:out value="${mensaje}"/></p></c:if>
        <section class="metricas">
            <article class="panel"><span class="numero">${clientesActivos}</span><p>Clientes activos</p></article>
            <article class="panel"><span class="numero">${mascotasActivas}</span><p>Mascotas activas</p></article>
            <article class="panel"><span class="numero">${serviciosActivos}</span><p>Servicios activos</p></article>
            <article class="panel"><span class="numero">${citasPendientes}</span><p>Citas pendientes</p></article>
            <article class="panel"><span class="numero">${citasAtendidas}</span><p>Citas atendidas</p></article>
            <article class="panel"><span class="numero">${citasCanceladas}</span><p>Citas canceladas</p></article>
        </section>
        <section class="panel">
            <header><h2>Control de citas</h2><a href="${pageContext.request.contextPath}/citas#citas">Ver listado completo</a></header>
            <div class="tabla table-responsive"><table class="table">
                <thead><tr><th>Fecha</th><th>Mascota</th><th>Servicio</th><th>Estado</th><th>Acciones</th></tr></thead>
                <tbody><c:choose>
                    <c:when test="${empty citas}"><tr><td colspan="5">Todavía no hay citas registradas.</td></tr></c:when>
                    <c:otherwise><c:forEach items="${citas}" var="cita"><tr>
                        <td>${cita.fecha} · <c:out value="${cita.hora}"/></td><td><c:out value="${cita.mascota.nombre}"/></td><td><c:out value="${cita.servicio.nombre}"/></td>
                        <td><span class="estado ${cita.estado == 'CANCELADA' ? 'inactivo' : ''}"><c:out value="${cita.estado}"/></span></td>
                        <td class="acciones"><c:if test="${cita.estado == 'AGENDADA'}"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/citas?id=${cita.id}">Atender</a><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/citas?accion=desactivar&id=${cita.id}">Cancelar</a></c:if><c:if test="${cita.estado != 'AGENDADA'}">—</c:if></td>
                    </tr></c:forEach></c:otherwise>
                </c:choose></tbody>
            </table></div>
        </section>
    </main>
<%@ include file="componentes/footer.jsp" %></body>
</html>

