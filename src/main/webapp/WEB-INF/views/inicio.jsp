<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Inicio</title>
    <%@ include file="componentes/estilos.jsp" %>
</head>
<body>
    <%-- Inicio y navegación común --%>
    <%@ include file="componentes/header.jsp" %>
    <%@ include file="componentes/menu.jsp" %>

    <main class="contenedor container">
        <section class="hero">
            <div>
                <p>Atención simple para cada mascota</p>
                <h1>Organiza tu veterinaria desde un solo lugar</h1>
                <p>Registra clientes, mascotas, servicios y citas con una interfaz clara y fácil de usar.</p>
            </div>
            <div class="acciones">
                <a class="boton" href="${pageContext.request.contextPath}/create">Nuevo registro</a>
                <a class="boton secundario" href="${pageContext.request.contextPath}/dashboard">Ver panel</a>
            </div>
        </section>

        <h2>Módulos del sistema</h2>
        <div class="rejilla">
            <article class="panel"><h3>Clientes</h3><p>Datos de contacto, estado y condición VIP.</p><a href="${pageContext.request.contextPath}/clientes#clientes">Ver clientes →</a></article>
            <article class="panel"><h3>Mascotas</h3><p>Información de cada mascota y su dueño.</p><a href="${pageContext.request.contextPath}/mascotas#mascotas">Ver mascotas →</a></article>
            <article class="panel"><h3>Categorías</h3><p>Clasificación sencilla de los servicios.</p><a href="${pageContext.request.contextPath}/categorias#categorias">Ver categorías →</a></article>
            <article class="panel"><h3>Servicios</h3><p>Catálogo, precio y categoría de atención.</p><a href="${pageContext.request.contextPath}/servicios#servicios">Ver servicios →</a></article>
            <article class="panel"><h3>Citas</h3><p>Agenda y consulta de las próximas atenciones.</p><a href="${pageContext.request.contextPath}/citas#citas">Ver citas →</a></article>
            <article class="panel"><h3>Dashboard</h3><p>Indicadores, atención y cancelación de citas.</p><a href="${pageContext.request.contextPath}/dashboard">Abrir panel →</a></article>
        </div>
    </main>

    <footer class="pie">PetCare · Proyecto académico</footer>
<%@ include file="componentes/footer.jsp" %></body>
</html>

