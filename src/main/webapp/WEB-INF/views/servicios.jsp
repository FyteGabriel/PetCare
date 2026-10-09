<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PetCare - Servicios</title><%@ include file="componentes/estilos.jsp" %></head><body>
<%@ include file="componentes/header.jsp" %><%@ include file="componentes/menu.jsp" %>
<main class="contenedor container"><section class="hero"><div><p>Gestión veterinaria</p><h1>Servicios</h1><p>F05–F08: Registrar, listar, editar y desactivar.</p></div><a class="boton secundario" href="${pageContext.request.contextPath}/dashboard">Volver al panel</a></section>
<c:if test="${not empty mensaje}"><p class="mensaje" role="status"><c:out value="${mensaje}"/></p></c:if>
<c:if test="${not empty error}"><p class="mensaje error" role="alert"><c:out value="${error}"/></p></c:if>
<c:if test="${param.id ne null and empty servicioEditar and empty servicioEliminar}"><p class="alert alert-warning">El registro solicitado no existe.</p></c:if>
<c:if test="${not empty servicioEditar}"><section class="panel"><h2>Editar servicio</h2><form action="${pageContext.request.contextPath}/servicios/actualizar" method="post">
            <input class="form-check-input" name="id" type="hidden" value="${servicioEditar.id}"><label class="form-label" for="editar-nombre">Nombre</label><input id="editar-nombre" class="form-control" name="nombre" value="${servicioEditar.nombre}" required><label class="form-label" for="editar-precio">Precio</label><input id="editar-precio" class="form-control" name="precio" type="number" min="0.01" step="0.01" value="${servicioEditar.precio}" required><label class="form-label" for="editar-categoriaId">Categoría</label><select id="editar-categoriaId" class="form-control" name="categoriaId" required><c:forEach items="${categorias}" var="categoria"><c:if test="${categoria.activo}"><option value="${categoria.id}" ${categoria.id == servicioEditar.categoria.id ? 'selected' : ''}><c:out value="${categoria.nombre}"/></option></c:if></c:forEach></select><button class="boton" type="submit">Guardar cambios</button>
        </form></section></c:if>
<c:if test="${not empty servicioEliminar}"><section class="panel"><h2>Desactivar servicio</h2><p>¿Deseas desactivar <strong><c:out value="${servicioEliminar.nombre}"/></strong>?</p><form action="${pageContext.request.contextPath}/servicios/desactivar" method="post"><input class="form-check-input" name="id" type="hidden" value="${servicioEliminar.id}"><div class="acciones"><button class="boton peligro" type="submit">Sí, desactivar</button><a class="boton secundario" href="${pageContext.request.contextPath}/servicios#servicios">Cancelar</a></div></form></section></c:if>
<c:if test="${empty servicioEditar and empty servicioEliminar}"><section class="panel" id="registrar-servicio">
                <h2>Registrar servicio</h2><p>Define el nombre, precio y categoría.</p>
                <form action="${pageContext.request.contextPath}/servicios/guardar" method="post">
                    <label class="form-label" for="servicio-nombre">Nombre</label><input class="form-control" id="servicio-nombre" name="nombre" required>
                    <label class="form-label" for="servicio-precio">Precio</label><input class="form-control" id="servicio-precio" name="precio" type="number" min="0.01" step="0.01" required>
                    <label class="form-label" for="servicio-categoria">Categoría</label>
                    <select class="form-control" id="servicio-categoria" name="categoriaId" required><option value="">Seleccione una categoría</option><c:forEach items="${categorias}" var="categoria"><c:if test="${categoria.activo}"><option value="${categoria.id}"><c:out value="${categoria.nombre}"/></option></c:if></c:forEach></select>
                    <button class="boton" type="submit">Guardar servicio</button>
                </form>
            </section></c:if>
<section class="panel" id="servicios"><header><h2>Servicios</h2><a href="${pageContext.request.contextPath}/servicios#registrar-servicio">+ Registrar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Nombre</th><th>Precio</th><th>Categoría</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty servicios}"><tr><td colspan="5">No hay servicios registrados.</td></tr></c:when><c:otherwise><c:forEach items="${servicios}" var="servicio"><tr>
                <td><strong><c:out value="${servicio.nombre}"/></strong></td><td>S/ <c:out value="${servicio.precio}"/></td><td><c:out value="${servicio.categoria.nombre}"/></td><td><span class="estado ${servicio.activo ? '' : 'inactivo'}">${servicio.activo ? 'Activo' : 'Inactivo'}</span></td>
                <td class="acciones"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/servicios?id=${servicio.id}">Editar</a><c:if test="${servicio.activo}"><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/servicios?accion=desactivar&id=${servicio.id}">Desactivar</a></c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>
</main><%@ include file="componentes/footer.jsp" %></body></html>