<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Registrar</title><%@ include file="componentes/estilos.jsp" %>
</head>
<body>
    <%@ include file="componentes/header.jsp" %><%@ include file="componentes/menu.jsp" %>
    <main class="contenedor container">
        <section class="hero"><div><p>Operaciones CREATE</p><h1>Nuevos registros</h1><p>Elige el formulario que necesitas. Todos comparten el mismo diseño para que el sistema sea fácil de aprender.</p></div><a class="boton secundario" href="${pageContext.request.contextPath}/read">Ver registros</a></section>
        <c:if test="${not empty mensaje}"><p class="mensaje"><c:out value="${mensaje}"/></p></c:if>
        <c:if test="${not empty error}"><p class="mensaje error"><c:out value="${error}"/></p></c:if>

        <div class="rejilla">
            <%-- Crear clientes --%>
            <section class="panel" id="registrar-cliente">
                <h2>Registrar cliente</h2><p>Información básica del responsable de la mascota.</p>
                <form action="${pageContext.request.contextPath}/clientes/guardar" method="post">
                    <label class="form-label" for="cliente-nombre">Nombre completo</label><input class="form-control" id="cliente-nombre" name="nombre" required>
                    <label class="form-label" for="cliente-telefono">Teléfono</label><input class="form-control" id="cliente-telefono" name="telefono" required>
                    <label class="form-label" for="cliente-correo">Correo</label><input class="form-control" id="cliente-correo" name="correo" type="email" required>
                    <label><input class="form-check-input" name="vip" type="checkbox" value="true"> Cliente VIP</label>
                    <button class="boton" type="submit">Guardar cliente</button>
                </form>
            </section>

            <%-- Crear mascotas --%>
            <section class="panel" id="registrar-mascota">
                <h2>Registrar mascota</h2><p>Asocia cada mascota con un cliente activo.</p>
                <form action="${pageContext.request.contextPath}/mascotas/guardar" method="post">
                    <label class="form-label" for="mascota-nombre">Nombre</label><input class="form-control" id="mascota-nombre" name="nombre" required>
                    <label class="form-label" for="mascota-especie">Especie</label><input class="form-control" id="mascota-especie" name="especie" placeholder="Perro, gato..." required>
                    <label class="form-label" for="mascota-raza">Raza</label><input class="form-control" id="mascota-raza" name="raza" required>
                    <label class="form-label" for="mascota-cliente">Dueño</label>
                    <select class="form-control" id="mascota-cliente" name="clienteId" required><option value="">Seleccione un cliente</option><c:forEach items="${clientes}" var="cliente"><c:if test="${cliente.activo}"><option value="${cliente.id}"><c:out value="${cliente.nombre}"/></option></c:if></c:forEach></select>
                    <button class="boton" type="submit">Guardar mascota</button>
                </form>
            </section>

            <%-- Crear categorías --%>
            <section class="panel" id="registrar-categoria">
                <h2>Registrar categoría</h2><p>Agrupa servicios similares para encontrarlos rápido.</p>
                <form action="${pageContext.request.contextPath}/categorias/guardar" method="post">
                    <label class="form-label" for="categoria-nombre">Nombre</label><input class="form-control" id="categoria-nombre" name="nombre" required>
                    <label class="form-label" for="categoria-descripcion">Descripción</label><textarea class="form-control" id="categoria-descripcion" name="descripcion" rows="4" required></textarea>
                    <button class="boton" type="submit">Guardar categoría</button>
                </form>
            </section>

            <%-- Crear servicios --%>
            <section class="panel" id="registrar-servicio">
                <h2>Registrar servicio</h2><p>Define el nombre, precio y categoría.</p>
                <form action="${pageContext.request.contextPath}/servicios/guardar" method="post">
                    <label class="form-label" for="servicio-nombre">Nombre</label><input class="form-control" id="servicio-nombre" name="nombre" required>
                    <label class="form-label" for="servicio-precio">Precio</label><input class="form-control" id="servicio-precio" name="precio" type="number" min="0.01" step="0.01" required>
                    <label class="form-label" for="servicio-categoria">Categoría</label>
                    <select class="form-control" id="servicio-categoria" name="categoriaId" required><option value="">Seleccione una categoría</option><c:forEach items="${categorias}" var="categoria"><c:if test="${categoria.activo}"><option value="${categoria.id}"><c:out value="${categoria.nombre}"/></option></c:if></c:forEach></select>
                    <button class="boton" type="submit">Guardar servicio</button>
                </form>
            </section>

            <%-- Agendar citas --%>
            <section class="panel" id="agendar-cita">
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
            </section>
        </div>
    </main>
<%@ include file="componentes/footer.jsp" %></body>
</html>

