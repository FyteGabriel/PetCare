<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Inicio</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@ include file="componentes/header.jsp" %>
    <%@ include file="componentes/menu.jsp" %>

    <main class="contenedor">
        <h1>Bienvenido a PetCare</h1>
        <p>Selecciona un módulo para continuar.</p>

        <div class="contenido-dos-columnas">
            <aside class="panel lista-simple">
                <h2>Acciones</h2>
                <a href="${pageContext.request.contextPath}/create">Registrar</a>
                <a href="${pageContext.request.contextPath}/read">Listar</a>
                <a href="${pageContext.request.contextPath}/update">Actualizar</a>
                <a href="${pageContext.request.contextPath}/delete">Desactivar</a>
            </aside>

            <section class="tarjetas">
                <article class="tarjeta">
                    <h2>Clientes</h2>
                    <p>Gestión de clientes.</p>
                </article>
                <article class="tarjeta">
                    <h2>Mascotas</h2>
                    <p>Gestión de mascotas.</p>
                </article>
                <article class="tarjeta">
                    <h2>Categorías</h2>
                    <p>Gestión de categorías.</p>
                </article>
                <article class="tarjeta">
                    <h2>Servicios</h2>
                    <p>Gestión de servicios.</p>
                </article>
                <article class="tarjeta">
                    <h2>Citas</h2>
                    <p>Gestión de citas.</p>
                </article>
            </section>
        </div>
    </main>

    <footer class="pie">PetCare · Proyecto académico</footer>
</body>
</html>
