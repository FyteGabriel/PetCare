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
        <div class="migas">Inicio <span>›</span> Módulos</div>

        <div class="layout-catalogo">
            <aside class="barra-lateral">
                <h2>Módulos</h2>
                <a href="#clientes">Clientes</a>
                <a href="#mascotas">Mascotas</a>
                <a href="#categorias">Categorías</a>
                <a href="#servicios">Servicios</a>
                <a href="#citas">Citas</a>

                <hr>

                <h3>Acciones CRUD</h3>
                <a href="${pageContext.request.contextPath}/create">+ Registrar</a>
                <a href="${pageContext.request.contextPath}/read">+ Listar</a>
                <a href="${pageContext.request.contextPath}/update">+ Actualizar</a>
                <a href="${pageContext.request.contextPath}/delete">+ Desactivar</a>
            </aside>

            <section class="contenido-catalogo">
                <div class="titulo-listado">
                    <div>
                        <span class="etiqueta">Panel principal</span>
                        <h1>Gestión PetCare</h1>
                        <p class="texto-secundario">Selecciona un módulo para continuar.</p>
                    </div>
                    <span class="contador-wireframe">5 módulos</span>
                </div>

                <div class="modulos-grid">
                    <article class="modulo-card" id="clientes">
                        <div class="imagen-wireframe">Imagen Cliente</div>
                        <span class="etiqueta">Módulo</span>
                        <h2>Clientes</h2>
                        <p>Registro y consulta de clientes.</p>
                        <a class="boton boton-ancho" href="${pageContext.request.contextPath}/read">Abrir módulo</a>
                    </article>

                    <article class="modulo-card" id="mascotas">
                        <div class="imagen-wireframe">Imagen Mascota</div>
                        <span class="etiqueta">Módulo</span>
                        <h2>Mascotas</h2>
                        <p>Registro y consulta de mascotas.</p>
                        <a class="boton boton-ancho" href="${pageContext.request.contextPath}/read">Abrir módulo</a>
                    </article>

                    <article class="modulo-card" id="categorias">
                        <div class="imagen-wireframe">Imagen Categoría</div>
                        <span class="etiqueta">Módulo</span>
                        <h2>Categorías</h2>
                        <p>Organización de los servicios.</p>
                        <a class="boton boton-ancho" href="${pageContext.request.contextPath}/read">Abrir módulo</a>
                    </article>

                    <article class="modulo-card" id="servicios">
                        <div class="imagen-wireframe">Imagen Servicio</div>
                        <span class="etiqueta">Módulo</span>
                        <h2>Servicios</h2>
                        <p>Servicios disponibles en PetCare.</p>
                        <a class="boton boton-ancho" href="${pageContext.request.contextPath}/read">Abrir módulo</a>
                    </article>

                    <article class="modulo-card" id="citas">
                        <div class="imagen-wireframe">Imagen Cita</div>
                        <span class="etiqueta">Módulo</span>
                        <h2>Citas</h2>
                        <p>Agenda y atención de citas.</p>
                        <a class="boton boton-ancho" href="${pageContext.request.contextPath}/read">Abrir módulo</a>
                    </article>
                </div>
            </section>
        </div>
    </main>

    <footer class="pie">PetCare · Proyecto académico</footer>
</body>
</html>
