<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Ingresar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="pagina-login">
    <main class="login-marco">
        <section class="login-tarjeta">
            <a class="login-logo" href="${pageContext.request.contextPath}/inicio" aria-label="Volver al inicio">+</a>

            <h1>Inicia sesión en tu cuenta</h1>
            <p class="texto-secundario">Bienvenido a PetCare. Ingresa tus datos.</p>

            <form class="login-formulario">
                <label for="correo">Correo electrónico</label>
                <input id="correo" name="correo" type="email" placeholder="Ingresa tu correo">

                <label for="clave">Contraseña</label>
                <input id="clave" name="clave" type="password" placeholder="Ingresa tu contraseña">

                <div class="login-opciones">
                    <label class="recordar">
                        <input name="recordar" type="checkbox">
                        Recordarme
                    </label>
                    <a href="#">¿Olvidaste tu contraseña?</a>
                </div>

                <button class="boton boton-ancho" type="button">Iniciar sesión</button>
            </form>

            <p class="registro-enlace">¿No tienes una cuenta? <a href="#">Regístrate</a></p>
        </section>
    </main>
</body>
</html>
