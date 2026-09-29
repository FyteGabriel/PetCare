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
        <section class="hero-wireframe">
            <div>
                <span class="etiqueta">Sistema veterinario</span>
                <h1>Bienvenido a PetCare</h1>
                <p>Administra clientes, mascotas, servicios y citas desde un solo lugar.</p>
                <a class="boton" href="${pageContext.request.contextPath}/create">Registrar información</a>
            </div>
            <div class="imagen-wireframe">Espacio para imagen</div>
        </section>

        <section>
            <h2>Accesos rápidos</h2>
            <div class="tarjetas">
                <a class="tarjeta" href="${pageContext.request.contextPath}/create">
                    <strong>Registrar</strong>
                    <span>Nuevos datos</span>
                </a>
                <a class="tarjeta" href="${pageContext.request.contextPath}/read">
                    <strong>Listar</strong>
                    <span>Consultar registros</span>
                </a>
                <a class="tarjeta" href="${pageContext.request.contextPath}/update">
                    <strong>Actualizar</strong>
                    <span>Editar información</span>
                </a>
                <a class="tarjeta" href="${pageContext.request.contextPath}/delete">
                    <strong>Desactivar</strong>
                    <span>Confirmar una baja</span>
                </a>
            </div>
        </section>
    </main>

    <footer class="pie">PetCare · Proyecto académico</footer>
</body>
</html>
