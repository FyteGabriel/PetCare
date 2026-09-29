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
    ├── create.jsp
    ├── read.jsp
    ├── update.jsp
    └── delete.jsp
```

Las cuatro vistas CRUD son compartidas por todos los módulos:

- `create.jsp`: registrar clientes, mascotas, categorías y servicios; agendar citas.
- `read.jsp`: mostrar todos los listados.
- `update.jsp`: editar registros y atender citas.
- `delete.jsp`: desactivar registros y cancelar citas.

Cada módulo conserva por separado su Entity, Repository, Interface Service, Service y Controller. Las vistas todavía no contienen formularios ni lógica.
