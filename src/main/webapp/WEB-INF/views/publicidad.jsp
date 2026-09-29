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
        <span class="etiqueta">Novedades</span>
        <h1>Publicidad y promociones</h1>
        <p class="texto-secundario">Espacios simples para mostrar campañas de PetCare.</p>

        <div class="tarjetas publicidad-grid">
            <article class="tarjeta publicidad-item">
                <div class="imagen-wireframe">Imagen</div>
                <strong>Campaña de vacunación</strong>
                <span>Descripción breve de la promoción.</span>
            </article>
            <article class="tarjeta publicidad-item">
                <div class="imagen-wireframe">Imagen</div>
                <strong>Consulta preventiva</strong>
                <span>Descripción breve de la promoción.</span>
            </article>
            <article class="tarjeta publicidad-item">
                <div class="imagen-wireframe">Imagen</div>
                <strong>Cuidado y bienestar</strong>
                <span>Descripción breve de la promoción.</span>
            </article>
        </div>
    </main>
</body>
</html>
