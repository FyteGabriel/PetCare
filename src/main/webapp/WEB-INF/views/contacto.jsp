<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Contacto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@ include file="componentes/header.jsp" %>
    <%@ include file="componentes/menu.jsp" %>

    <main class="contenedor">
        <span class="etiqueta">Ayuda</span>
        <h1>Contacto</h1>

        <div class="contacto-grid">
            <section class="panel">
                <h2>Información</h2>
                <p><strong>Teléfono:</strong> 999 999 999</p>
                <p><strong>Correo:</strong> contacto@petcare.com</p>
                <p><strong>Horario:</strong> Lunes a sábado</p>
                <div class="mapa-wireframe">Espacio para mapa</div>
            </section>

            <section class="panel">
                <h2>Enviar mensaje</h2>
                <form>
                    <label for="nombre">Nombre</label>
                    <input id="nombre" name="nombre" type="text" placeholder="Tu nombre">

                    <label for="mensaje">Mensaje</label>
                    <textarea id="mensaje" name="mensaje" rows="5" placeholder="Escribe tu mensaje"></textarea>

                    <button class="boton" type="button">Enviar</button>
                </form>
            </section>
        </div>
    </main>
</body>
</html>
