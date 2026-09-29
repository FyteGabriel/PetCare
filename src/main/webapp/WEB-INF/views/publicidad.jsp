<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Publicidad</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@ include file="componentes/header.jsp" %>
    <%@ include file="componentes/menu.jsp" %>

    <main class="contenedor">
        <h1>Publicidad</h1>
        <p>Espacios disponibles para promociones.</p>

        <div class="tarjetas">
            <article class="tarjeta">
                <div class="imagen-wireframe">Imagen</div>
                <h2>Vacunación</h2>
                <p>Descripción de la campaña.</p>
            </article>
            <article class="tarjeta">
                <div class="imagen-wireframe">Imagen</div>
                <h2>Consulta preventiva</h2>
                <p>Descripción de la promoción.</p>
            </article>
            <article class="tarjeta">
                <div class="imagen-wireframe">Imagen</div>
                <h2>Cuidado y bienestar</h2>
                <p>Descripción de la novedad.</p>
            </article>
        </div>
    </main>
</body>
</html>
