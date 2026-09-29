# PetCare

Estructura inicial del proyecto académico PetCare.

Tecnologías preparadas: Java 17, Spring Boot, Spring MVC, Spring Data JPA, H2, JSP, JSTL, HTML, CSS y Maven.

En esta base solo se incluye la configuración mínima y las declaraciones vacías de clases e interfaces que delimitan los módulos. No contiene CRUD, pantallas implementadas ni lógica de negocio.

## Estructura

```text
src/main/java/com/petcare/
├── controller/
├── model/
├── repository/
└── service/

src/main/webapp/
├── css/
└── WEB-INF/views/
    ├── componentes/
    ├── cliente-registrar.jsp
    ├── cliente-listar.jsp
    ├── cliente-editar.jsp
    ├── cliente-desactivar.jsp
    ├── mascota-registrar.jsp
    ├── mascota-listar.jsp
    ├── mascota-editar.jsp
    ├── mascota-desactivar.jsp
    ├── categoria-registrar.jsp
    ├── categoria-listar.jsp
    ├── categoria-editar.jsp
    ├── categoria-desactivar.jsp
    ├── servicio-registrar.jsp
    ├── servicio-listar.jsp
    ├── servicio-editar.jsp
    ├── servicio-desactivar.jsp
    ├── cita-agendar.jsp
    ├── cita-listar.jsp
    ├── cita-atender.jsp
    └── cita-cancelar.jsp
```

Cada JSP queda reservado para una sola operación. Las pantallas aún no contienen formularios ni lógica.
