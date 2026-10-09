<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PetCare - Categorías</title><%@ include file="componentes/estilos.jsp" %></head><body>
<%@ include file="componentes/header.jsp" %><%@ include file="componentes/menu.jsp" %>
<main class="contenedor container"><section class="hero"><div><p>Gestión veterinaria</p><h1>Categorías</h1><p>F01–F04: Registrar, listar, editar y desactivar.</p></div><a class="boton secundario" href="${pageContext.request.contextPath}/dashboard">Volver al panel</a></section>
<c:if test="${not empty mensaje}"><p class="mensaje" role="status"><c:out value="${mensaje}"/></p></c:if>
<c:if test="${not empty error}"><p class="mensaje error" role="alert"><c:out value="${error}"/></p></c:if>
<c:if test="${param.id ne null and empty categoriaEditar and empty categoriaEliminar}"><p class="alert alert-warning">El registro solicitado no existe.</p></c:if>
<c:if test="${not empty categoriaEditar}"><section class="panel"><h2>Editar categoría</h2><form action="${pageContext.request.contextPath}/categorias/actualizar" method="post">
            <input class="form-check-input" name="id" type="hidden" value="${categoriaEditar.id}"><label class="form-label" for="editar-nombre">Nombre</label><input id="editar-nombre" class="form-control" name="nombre" value="${categoriaEditar.nombre}" required><label class="form-label" for="editar-descripcion">Descripción</label><textarea id="editar-descripcion" class="form-control" name="descripcion" rows="4" required>${categoriaEditar.descripcion}</textarea><button class="boton" type="submit">Guardar cambios</button>
        </form></section></c:if>
<c:if test="${not empty categoriaEliminar}"><section class="panel"><h2>Desactivar categoría</h2><p>¿Deseas desactivar <strong><c:out value="${categoriaEliminar.nombre}"/></strong>?</p><form action="${pageContext.request.contextPath}/categorias/desactivar" method="post"><input class="form-check-input" name="id" type="hidden" value="${categoriaEliminar.id}"><div class="acciones"><button class="boton peligro" type="submit">Sí, desactivar</button><a class="boton secundario" href="${pageContext.request.contextPath}/categorias#categorias">Cancelar</a></div></form></section></c:if>
<c:if test="${empty categoriaEditar and empty categoriaEliminar}"><section class="panel" id="registrar-categoria">
                <h2>Registrar categoría</h2><p>Agrupa servicios similares para encontrarlos rápido.</p>
                <form action="${pageContext.request.contextPath}/categorias/guardar" method="post">
                    <label class="form-label" for="categoria-nombre">Nombre</label><input class="form-control" id="categoria-nombre" name="nombre" required>
                    <label class="form-label" for="categoria-descripcion">Descripción</label><textarea class="form-control" id="categoria-descripcion" name="descripcion" rows="4" required></textarea>
                    <button class="boton" type="submit">Guardar categoría</button>
                </form>
            </section></c:if>
<section class="panel" id="categorias"><header><h2>Categorías</h2><a href="${pageContext.request.contextPath}/categorias#registrar-categoria">+ Registrar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Nombre</th><th>Descripción</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty categorias}"><tr><td colspan="4">No hay categorías registradas.</td></tr></c:when><c:otherwise><c:forEach items="${categorias}" var="categoria"><tr>
                <td><strong><c:out value="${categoria.nombre}"/></strong></td><td><c:out value="${categoria.descripcion}"/></td><td><span class="estado ${categoria.activo ? '' : 'inactivo'}">${categoria.activo ? 'Activo' : 'Inactivo'}</span></td>
                <td class="acciones"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/categorias?id=${categoria.id}">Editar</a><c:if test="${categoria.activo}"><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/categorias?accion=desactivar&id=${categoria.id}">Desactivar</a></c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>
</main><%@ include file="componentes/footer.jsp" %></body></html>