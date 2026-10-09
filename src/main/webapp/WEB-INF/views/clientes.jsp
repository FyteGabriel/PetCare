<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PetCare - Clientes</title><%@ include file="componentes/estilos.jsp" %></head><body>
<%@ include file="componentes/header.jsp" %><%@ include file="componentes/menu.jsp" %>
<main class="contenedor container"><section class="hero"><div><p>Gestión veterinaria</p><h1>Clientes</h1><p>F09–F12: Registrar, listar, editar y desactivar.</p></div><a class="boton secundario" href="${pageContext.request.contextPath}/dashboard">Volver al panel</a></section>
<c:if test="${not empty mensaje}"><p class="mensaje" role="status"><c:out value="${mensaje}"/></p></c:if>
<c:if test="${not empty error}"><p class="mensaje error" role="alert"><c:out value="${error}"/></p></c:if>
<c:if test="${param.id ne null and empty clienteEditar and empty clienteEliminar}"><p class="alert alert-warning">El registro solicitado no existe.</p></c:if>
<c:if test="${not empty clienteEditar}"><section class="panel"><h2>Editar cliente</h2><form action="${pageContext.request.contextPath}/clientes/actualizar" method="post">
            <input class="form-check-input" name="id" type="hidden" value="${clienteEditar.id}"><label class="form-label" for="editar-nombre">Nombre completo</label><input id="editar-nombre" class="form-control" name="nombre" value="${clienteEditar.nombre}" required><label class="form-label" for="editar-telefono">Teléfono</label><input id="editar-telefono" class="form-control" name="telefono" value="${clienteEditar.telefono}" required><label class="form-label" for="editar-correo">Correo</label><input id="editar-correo" class="form-control" name="correo" type="email" value="${clienteEditar.correo}" required><label><input class="form-check-input" name="vip" type="checkbox" value="true" ${clienteEditar.vip ? 'checked' : ''}> Cliente VIP</label><button class="boton" type="submit">Guardar cambios</button>
        </form></section></c:if>
<c:if test="${not empty clienteEliminar}"><section class="panel"><h2>Desactivar cliente</h2><p>¿Deseas desactivar a <strong><c:out value="${clienteEliminar.nombre}"/></strong>?</p><form action="${pageContext.request.contextPath}/clientes/desactivar" method="post"><input class="form-check-input" name="id" type="hidden" value="${clienteEliminar.id}"><div class="acciones"><button class="boton peligro" type="submit">Sí, desactivar</button><a class="boton secundario" href="${pageContext.request.contextPath}/clientes#clientes">Cancelar</a></div></form></section></c:if>
<c:if test="${empty clienteEditar and empty clienteEliminar}"><section class="panel" id="registrar-cliente">
                <h2>Registrar cliente</h2><p>Información básica del responsable de la mascota.</p>
                <form action="${pageContext.request.contextPath}/clientes/guardar" method="post">
                    <label class="form-label" for="cliente-nombre">Nombre completo</label><input class="form-control" id="cliente-nombre" name="nombre" required>
                    <label class="form-label" for="cliente-telefono">Teléfono</label><input class="form-control" id="cliente-telefono" name="telefono" required>
                    <label class="form-label" for="cliente-correo">Correo</label><input class="form-control" id="cliente-correo" name="correo" type="email" required>
                    <label><input class="form-check-input" name="vip" type="checkbox" value="true"> Cliente VIP</label>
                    <button class="boton" type="submit">Guardar cliente</button>
                </form>
            </section></c:if>
<section class="panel" id="clientes"><header><h2>Clientes</h2><a href="${pageContext.request.contextPath}/clientes#registrar-cliente">+ Registrar</a></header><div class="tabla table-responsive"><table class="table">
            <thead><tr><th>Nombre</th><th>Teléfono</th><th>Correo</th><th>Tipo</th><th>Estado</th><th>Acciones</th></tr></thead>
            <tbody><c:choose><c:when test="${empty clientes}"><tr><td colspan="6">No hay clientes registrados.</td></tr></c:when><c:otherwise><c:forEach items="${clientes}" var="cliente"><tr>
                <td><strong><c:out value="${cliente.nombre}"/></strong></td><td><c:out value="${cliente.telefono}"/></td><td><c:out value="${cliente.correo}"/></td><td>${cliente.vip ? 'VIP' : 'Regular'}</td><td><span class="estado ${cliente.activo ? '' : 'inactivo'}">${cliente.activo ? 'Activo' : 'Inactivo'}</span></td>
                <td class="acciones"><a class="boton pequeno secundario" href="${pageContext.request.contextPath}/clientes?id=${cliente.id}">Editar</a><c:if test="${cliente.activo}"><a class="boton pequeno peligro" href="${pageContext.request.contextPath}/clientes?accion=desactivar&id=${cliente.id}">Desactivar</a></c:if></td>
            </tr></c:forEach></c:otherwise></c:choose></tbody>
        </table></div></section>
</main><%@ include file="componentes/footer.jsp" %></body></html>