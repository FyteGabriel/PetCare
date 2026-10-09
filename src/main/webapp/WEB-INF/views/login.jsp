<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetCare - Ingresar</title>
    <%@ include file="componentes/estilos.jsp" %>
</head>
<body class="pagina-login">
    <%-- Interfaz de acceso simple, sin autenticación real --%>
    <main class="login panel">
        <a class="marca" href="${pageContext.request.contextPath}/inicio"><span aria-hidden="true">+</span><strong>PetCare</strong></a>
        <h1>Inicia sesión</h1>
        <p>Acceso de demostración al panel veterinario.</p>
        <c:if test="${not empty error}"><p class="mensaje error"><c:out value="${error}"/></p></c:if>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <label class="form-label" for="correo">Correo electrónico</label>
            <input class="form-control" id="correo" name="correo" type="email" placeholder="nombre@correo.com" required>
            <label class="form-label" for="clave">Contraseña</label>
            <input class="form-control" id="clave" name="clave" type="password" placeholder="Tu contraseña" required>
            <label><input class="form-check-input" name="recordar" type="checkbox"> Recordarme</label>
            <button class="boton" type="submit">Ingresar</button>
        </form>
        <a href="${pageContext.request.contextPath}/inicio">← Volver al inicio</a>
    </main>
</body>
</html>

