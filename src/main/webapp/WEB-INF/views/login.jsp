<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Ingresar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@ include file="componentes/header.jsp" %>
    <%@ include file="componentes/menu.jsp" %>

    <main class="contenedor pagina-centrada">
        <section class="panel formulario-corto">
            <span class="etiqueta">Acceso</span>
            <h1>Iniciar sesión</h1>
            <p class="texto-secundario">Wireframe del formulario de ingreso.</p>

            <form>
                <label for="correo">Correo</label>
                <input id="correo" name="correo" type="email" placeholder="correo@ejemplo.com">

                <label for="clave">Contraseña</label>
                <input id="clave" name="clave" type="password" placeholder="••••••••">

                <button class="boton" type="button">Ingresar</button>
            </form>
        </section>
    </main>
</body>
</html>
