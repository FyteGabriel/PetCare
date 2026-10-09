<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>PetCare - Actualizar</title><%@ include file="componentes/estilos.jsp" %></head>
<body>
    <%@ include file="componentes/header.jsp" %><%@ include file="componentes/menu.jsp" %>
    <main class="contenedor container">
        <section class="hero"><div><p>Operaciones UPDATE</p><h1>Actualizar registro</h1><p>Modifica únicamente la información necesaria.</p></div><a class="boton secundario" href="${pageContext.request.contextPath}/read">Volver al listado</a></section>
        <c:if test="${not empty error}"><p class="mensaje error"><c:out value="${error}"/></p></c:if>
        <c:if test="${empty clienteEditar and empty mascotaEditar and empty categoriaEditar and empty servicioEditar and empty citaEditar}"><p class="mensaje">Selecciona un registro desde la página Listar.</p></c:if>

        <%-- Actualizar clientes --%>
        <c:if test="${not empty clienteEditar}"><section class="panel"><h2>Editar cliente</h2><form action="${pageContext.request.contextPath}/clientes/actualizar" method="post">
            <input class="form-check-input" name="id" type="hidden" value="${clienteEditar.id}"><label class="form-label" for="editar-nombre">Nombre completo</label><input id="editar-nombre" class="form-control" name="nombre" value="${clienteEditar.nombre}" required><label class="form-label" for="editar-telefono">Teléfono</label><input id="editar-telefono" class="form-control" name="telefono" value="${clienteEditar.telefono}" required><label class="form-label" for="editar-correo">Correo</label><input id="editar-correo" class="form-control" name="correo" type="email" value="${clienteEditar.correo}" required><label><input class="form-check-input" name="vip" type="checkbox" value="true" ${clienteEditar.vip ? 'checked' : ''}> Cliente VIP</label><button class="boton" type="submit">Guardar cambios</button>
        </form></section></c:if>

        <%-- Actualizar mascotas --%>
        <c:if test="${not empty mascotaEditar}"><section class="panel"><h2>Editar mascota</h2><form action="${pageContext.request.contextPath}/mascotas/actualizar" method="post">
            <input class="form-check-input" name="id" type="hidden" value="${mascotaEditar.id}"><label class="form-label" for="editar-nombre">Nombre</label><input id="editar-nombre" class="form-control" name="nombre" value="${mascotaEditar.nombre}" required><label class="form-label" for="editar-especie">Especie</label><input id="editar-especie" class="form-control" name="especie" value="${mascotaEditar.especie}" required><label class="form-label" for="editar-raza">Raza</label><input id="editar-raza" class="form-control" name="raza" value="${mascotaEditar.raza}" required><label class="form-label" for="editar-clienteId">Dueño</label><select id="editar-clienteId" class="form-control" name="clienteId" required><c:forEach items="${clientes}" var="cliente"><c:if test="${cliente.activo}"><option value="${cliente.id}" ${cliente.id == mascotaEditar.cliente.id ? 'selected' : ''}><c:out value="${cliente.nombre}"/></option></c:if></c:forEach></select><button class="boton" type="submit">Guardar cambios</button>
        </form></section></c:if>

        <%-- Actualizar categorías --%>
        <c:if test="${not empty categoriaEditar}"><section class="panel"><h2>Editar categoría</h2><form action="${pageContext.request.contextPath}/categorias/actualizar" method="post">
            <input class="form-check-input" name="id" type="hidden" value="${categoriaEditar.id}"><label class="form-label" for="editar-nombre">Nombre</label><input id="editar-nombre" class="form-control" name="nombre" value="${categoriaEditar.nombre}" required><label class="form-label" for="editar-descripcion">Descripción</label><textarea id="editar-descripcion" class="form-control" name="descripcion" rows="4" required>${categoriaEditar.descripcion}</textarea><button class="boton" type="submit">Guardar cambios</button>
        </form></section></c:if>

        <%-- Actualizar servicios --%>
        <c:if test="${not empty servicioEditar}"><section class="panel"><h2>Editar servicio</h2><form action="${pageContext.request.contextPath}/servicios/actualizar" method="post">
            <input class="form-check-input" name="id" type="hidden" value="${servicioEditar.id}"><label class="form-label" for="editar-nombre">Nombre</label><input id="editar-nombre" class="form-control" name="nombre" value="${servicioEditar.nombre}" required><label class="form-label" for="editar-precio">Precio</label><input id="editar-precio" class="form-control" name="precio" type="number" min="0.01" step="0.01" value="${servicioEditar.precio}" required><label class="form-label" for="editar-categoriaId">Categoría</label><select id="editar-categoriaId" class="form-control" name="categoriaId" required><c:forEach items="${categorias}" var="categoria"><c:if test="${categoria.activo}"><option value="${categoria.id}" ${categoria.id == servicioEditar.categoria.id ? 'selected' : ''}><c:out value="${categoria.nombre}"/></option></c:if></c:forEach></select><button class="boton" type="submit">Guardar cambios</button>
        </form></section></c:if>

        <%-- Atender citas --%>
        <c:if test="${not empty citaEditar}"><section class="panel"><h2>Confirmar atención</h2><p><strong>Fecha:</strong> ${citaEditar.fecha} · <c:out value="${citaEditar.hora}"/></p><p><strong>Mascota:</strong> <c:out value="${citaEditar.mascota.nombre}"/></p><p><strong>Servicio:</strong> <c:out value="${citaEditar.servicio.nombre}"/></p><p><strong>Motivo:</strong> <c:out value="${citaEditar.motivo}"/></p><form action="${pageContext.request.contextPath}/citas/atender" method="post"><input class="form-check-input" name="id" type="hidden" value="${citaEditar.id}"><button class="boton" type="submit">Marcar como atendida</button></form></section></c:if>
    </main>
<%@ include file="componentes/footer.jsp" %></body>
</html>

