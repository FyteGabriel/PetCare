<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PetCare - Mascotas</title><%@ include file="componentes/estilos.jsp" %></head><body>
<%@ include file="componentes/header.jsp" %><%@ include file="componentes/menu.jsp" %>
<main class="contenedor container"><section class="hero"><div><p>Gestión veterinaria</p><h1>Mascotas</h1><p>F13–F16: Registrar, listar, editar y desactivar.</p></div><a class="boton secundario" href="${pageContext.request.contextPath}/dashboard">Volver al panel</a></section>
<c:if test="${not empty mensaje}"><p class="mensaje" role="status"><c:out value="${mensaje}"/></p></c:if>
<c:if test="${not empty error}"><p class="mensaje error" role="alert"><c:out value="${error}"/></p></c:if>
<c:if test="${param.id ne null and empty mascotaEditar and empty mascotaEliminar}"><p class="alert alert-warning">El registro solicitado no existe.</p></c:if>
<c:if test="${not empty mascotaEditar}"><section class="panel"><h2>Editar mascota</h2><form action="${pageContext.request.contextPath}/mascotas/actualizar" method="post">
            <input class="form-check-input" name="id" type="hidden" value="${mascotaEditar.id}"><label class="form-label" for="editar-nombre">Nombre</label><input id="editar-nombre" class="form-control" name="nombre" value="${mascotaEditar.nombre}" required><label class="form-label" for="editar-especie">Especie</label><input id="editar-especie" class="form-control" name="especie" value="${mascotaEditar.especie}" required><label class="form-label" for="editar-raza">Raza</label><input id="editar-raza" class="form-control" name="raza" value="${mascotaEditar.raza}" required><label class="form-label" for="editar-clienteId">Dueño</label><select id="editar-clienteId" class="form-control" name="clienteId" required><c:forEach items="${clientes}" var="cliente"><c:if test="${cliente.activo}"><option value="${cliente.id}" ${cliente.id == mascotaEditar.cliente.id ? 'selected' : ''}><c:out value="${cliente.nombre}"/></option></c:if></c:forEach></select><button class="boton" type="submit">Guardar cambios</button>
        </form></section></c:if>
<c:if test="${not empty mascotaEliminar}"><section class="panel"><h2>Desactivar mascota</h2><p>¿Deseas desactivar a <strong><c:out value="${mascotaEliminar.nombre}"/></strong>?</p><form action="${pageContext.request.contextPath}/mascotas/desactivar" method="post"><input class="form-check-input" name="id" type="hidden" value="${mascotaEliminar.id}"><div class="acciones"><button class="boton peligro" type="submit">Sí, desactivar</button><a class="boton secundario" href="${pageContext.request.contextPath}/mascotas#mascotas">Cancelar</a></div></form></section></c:if>
<c:if test="${empty mascotaEditar and empty mascotaEliminar}"><section class="panel" id="registrar-mascota">
                <h2>Registrar mascota</h2><p>Asocia cada mascota con un cliente activo.</p>
                <form action="${pageContext.request.contextPath}/mascotas/guardar" method="post">
                    <label class="form-label" for="mascota-nombre">Nombre</label><input class="form-control" id="mascota-nombre" name="nombre" required>
                    <label class="form-label" for="mascota-especie">Especie</label><input class="form-control" id="mascota-especie" name="especie" placeholder="Perro, gato..." required>
                    <label class="form-label" for="mascota-raza">Raza</label><input class="form-control" id="mascota-raza" name="raza" required>
                    <label class="form-label" for="mascota-cliente">Dueño</label>
                    <select class="form-control" id="mascota-cliente" name="clienteId" required><option value="">Seleccione un cliente</option><c:forEach items="${clientes}" var="cliente"><c:if test="${cliente.activo}"><option value="${cliente.id}"><c:out value="${cliente.nombre}"/></option></c:if></c:forEach></select>
                    <button class="boton" type="submit">Guardar mascota</button>
                </form>
            </section></c:if>
<section class="panel" id="mascotas"><header><h2>Mascotas</h2><a href="${pageContext.request.contextPath}/mascotas#registrar-mascota">+ Registrar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Nombre</th><th>Especie</th><th>Raza</th><th>Dueño</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty mascotas}"><tr><td colspan="6">No hay mascotas registradas.</td></tr></c:when><c:otherwise><c:forEach items="${mascotas}" var="mascota"><tr>
                <td><strong><c:out value="${mascota.nombre}"/></strong></td><td><c:out value="${mascota.especie}"/></td><td><c:out value="${mascota.raza}"/></td><td><c:out value="${mascota.cliente.nombre}"/></td><td><span class="estado ${mascota.activo ? '' : 'inactivo'}">${mascota.activo ? 'Activo' : 'Inactivo'}</span></td>
                <td class="acciones"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/mascotas?id=${mascota.id}">Editar</a><c:if test="${mascota.activo}"><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/mascotas?accion=desactivar&id=${mascota.id}">Desactivar</a></c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>
</main><%@ include file="componentes/footer.jsp" %></body></html>