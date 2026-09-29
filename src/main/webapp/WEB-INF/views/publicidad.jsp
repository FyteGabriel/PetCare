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
        <div class="migas">Inicio <span>›</span> Publicidad</div>

        <div class="layout-catalogo">
            <aside class="barra-lateral">
                <h2>Publicidad</h2>
                <a href="#campanas">Campañas</a>
                <a href="#promociones">Promociones</a>
                <a href="#novedades">Novedades</a>
                <hr>
                <h3>Filtros</h3>
                <span>□ Vigentes</span>
                <span>□ Próximas</span>
            </aside>

            <section class="contenido-catalogo">
                <div class="titulo-listado">
                    <div>
                        <span class="etiqueta">Novedades</span>
                        <h1>Publicidad y promociones</h1>
                        <p class="texto-secundario">Wireframe para campañas de PetCare.</p>
                    </div>
                    <span class="contador-wireframe">3 resultados</span>
                </div>

                <div class="modulos-grid" id="campanas">
                    <article class="modulo-card">
                        <div class="imagen-wireframe">Imagen Campaña</div>
                        <span class="etiqueta">Campaña</span>
                        <h2>Vacunación</h2>
                        <p>Descripción breve de la campaña.</p>
                        <button class="boton boton-ancho" type="button">Ver detalle</button>
                    </article>
                    <article class="modulo-card" id="promociones">
                        <div class="imagen-wireframe">Imagen Promoción</div>
                        <span class="etiqueta">Promoción</span>
                        <h2>Consulta preventiva</h2>
                        <p>Descripción breve de la promoción.</p>
                        <button class="boton boton-ancho" type="button">Ver detalle</button>
                    </article>
                    <article class="modulo-card" id="novedades">
                        <div class="imagen-wireframe">Imagen Novedad</div>
                        <span class="etiqueta">Novedad</span>
                        <h2>Cuidado y bienestar</h2>
                        <p>Descripción breve de la novedad.</p>
                        <button class="boton boton-ancho" type="button">Ver detalle</button>
                    </article>
                </div>
            </section>
        </div>
    </main>
</body>
</html>
