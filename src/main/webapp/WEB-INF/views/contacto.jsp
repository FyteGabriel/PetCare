<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Contacto</title>
    <%@ include file="componentes/estilos.jsp" %>
</head>
<body>
    <%-- Página estática de contacto --%>
    <%@ include file="componentes/header.jsp" %>
    <%@ include file="componentes/menu.jsp" %>
    <main class="contenedor container">
        <section class="hero"><div><p>Estamos para ayudarte</p><h1>Contacto</h1><p>Envíanos una consulta o comunícate con la veterinaria.</p></div></section>
        <div class="rejilla">
            <section class="panel"><h2>Información</h2><p><strong>Teléfono</strong><br>999 999 999</p><p><strong>Correo</strong><br>contacto@petcare.com</p><p><strong>Horario</strong><br>Lunes a sábado, 8:00 a 18:00</p></section>
            <section class="panel">
                <h2>Enviar mensaje</h2>
                <form onsubmit="return false;">
                    <label class="form-label" for="nombre">Nombre</label><input class="form-control" id="nombre" name="nombre" placeholder="Tu nombre" required>
                    <label class="form-label" for="mensaje">Mensaje</label><textarea class="form-control" id="mensaje" name="mensaje" rows="5" placeholder="¿En qué podemos ayudarte?" required></textarea>
                    <button class="boton" type="button">Enviar mensaje</button>
                </form>
            </section>
        </div>
    </main>
<%@ include file="componentes/footer.jsp" %></body>
</html>

