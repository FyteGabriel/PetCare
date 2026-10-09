<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Listar</title><%@ include file="componentes/estilos.jsp" %>
</head>
<body>
    <%@ include file="componentes/header.jsp" %><%@ include file="componentes/menu.jsp" %>
    <main class="contenedor container">
        <section class="hero"><div><p>Operaciones READ</p><h1>Registros de PetCare</h1><p>Consulta todos los módulos y accede a sus acciones desde una sola pantalla.</p></div><a class="boton" href="${pageContext.request.contextPath}/create">Nuevo registro</a></section>
        <c:if test="${not empty mensaje}"><p class="mensaje"><c:out value="${mensaje}"/></p></c:if>
        <c:if test="${not empty error}"><p class="mensaje error"><c:out value="${error}"/></p></c:if>

        <%-- Listar clientes --%>
        <section class="panel" id="clientes"><header><h2>Clientes</h2><a href="${pageContext.request.contextPath}/clientes#registrar-cliente">+ Registrar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Nombre</th><th>Teléfono</th><th>Correo</th><th>Tipo</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty clientes}"><tr><td colspan="6">No hay clientes registrados.</td></tr></c:when><c:otherwise><c:forEach items="${clientes}" var="cliente"><tr>
                <td><strong><c:out value="${cliente.nombre}"/></strong></td><td><c:out value="${cliente.telefono}"/></td><td><c:out value="${cliente.correo}"/></td><td>${cliente.vip ? 'VIP' : 'Regular'}</td><td><span class="estado ${cliente.activo ? '' : 'inactivo'}">${cliente.activo ? 'Activo' : 'Inactivo'}</span></td>
                <td class="acciones"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/clientes?id=${cliente.id}">Editar</a><c:if test="${cliente.activo}"><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/clientes?accion=desactivar&id=${cliente.id}">Desactivar</a></c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>

        <%-- Listar mascotas --%>
        <section class="panel" id="mascotas"><header><h2>Mascotas</h2><a href="${pageContext.request.contextPath}/mascotas#registrar-mascota">+ Registrar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Nombre</th><th>Especie</th><th>Raza</th><th>Dueño</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty mascotas}"><tr><td colspan="6">No hay mascotas registradas.</td></tr></c:when><c:otherwise><c:forEach items="${mascotas}" var="mascota"><tr>
                <td><strong><c:out value="${mascota.nombre}"/></strong></td><td><c:out value="${mascota.especie}"/></td><td><c:out value="${mascota.raza}"/></td><td><c:out value="${mascota.cliente.nombre}"/></td><td><span class="estado ${mascota.activo ? '' : 'inactivo'}">${mascota.activo ? 'Activo' : 'Inactivo'}</span></td>
                <td class="acciones"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/mascotas?id=${mascota.id}">Editar</a><c:if test="${mascota.activo}"><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/mascotas?accion=desactivar&id=${mascota.id}">Desactivar</a></c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>

        <%-- Listar categorías --%>
        <section class="panel" id="categorias"><header><h2>Categorías</h2><a href="${pageContext.request.contextPath}/categorias#registrar-categoria">+ Registrar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Nombre</th><th>Descripción</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty categorias}"><tr><td colspan="4">No hay categorías registradas.</td></tr></c:when><c:otherwise><c:forEach items="${categorias}" var="categoria"><tr>
                <td><strong><c:out value="${categoria.nombre}"/></strong></td><td><c:out value="${categoria.descripcion}"/></td><td><span class="estado ${categoria.activo ? '' : 'inactivo'}">${categoria.activo ? 'Activo' : 'Inactivo'}</span></td>
                <td class="acciones"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/categorias?id=${categoria.id}">Editar</a><c:if test="${categoria.activo}"><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/categorias?accion=desactivar&id=${categoria.id}">Desactivar</a></c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>

        <%-- Listar servicios --%>
        <section class="panel" id="servicios"><header><h2>Servicios</h2><a href="${pageContext.request.contextPath}/servicios#registrar-servicio">+ Registrar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Nombre</th><th>Precio</th><th>Categoría</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty servicios}"><tr><td colspan="5">No hay servicios registrados.</td></tr></c:when><c:otherwise><c:forEach items="${servicios}" var="servicio"><tr>
                <td><strong><c:out value="${servicio.nombre}"/></strong></td><td>S/ <c:out value="${servicio.precio}"/></td><td><c:out value="${servicio.categoria.nombre}"/></td><td><span class="estado ${servicio.activo ? '' : 'inactivo'}">${servicio.activo ? 'Activo' : 'Inactivo'}</span></td>
                <td class="acciones"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/servicios?id=${servicio.id}">Editar</a><c:if test="${servicio.activo}"><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/servicios?accion=desactivar&id=${servicio.id}">Desactivar</a></c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>

        <%-- Listar y gestionar citas --%>
        <section class="panel" id="citas"><header><h2>Citas</h2><a href="${pageContext.request.contextPath}/citas#agendar-cita">+ Agendar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Fecha</th><th>Mascota</th><th>Servicio</th><th>Motivo</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty citas}"><tr><td colspan="6">No hay citas registradas.</td></tr></c:when><c:otherwise><c:forEach items="${citas}" var="cita"><tr>
                <td>${cita.fecha} · <c:out value="${cita.hora}"/></td><td><strong><c:out value="${cita.mascota.nombre}"/></strong></td><td><c:out value="${cita.servicio.nombre}"/></td><td><c:out value="${cita.motivo}"/></td><td><span class="estado ${cita.estado == 'CANCELADA' ? 'inactivo' : ''}"><c:out value="${cita.estado}"/></span></td>
                <td class="acciones"><c:if test="${cita.estado == 'AGENDADA'}"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/citas?id=${cita.id}">Atender</a><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/citas?accion=desactivar&id=${cita.id}">Cancelar</a></c:if><c:if test="${cita.estado != 'AGENDADA'}">—</c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>
    </main>
<%@ include file="componentes/footer.jsp" %></body>
</html>

