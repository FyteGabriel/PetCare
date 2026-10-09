# PetCare

Aplicación académica sencilla para gestionar una veterinaria con Java 17, Spring Boot, Spring MVC, Spring Data JPA, H2 y JSP.

## Funciones

- Clientes: registrar, listar, editar, marcar como VIP y desactivar.
- Mascotas: CRUD básico y relación con su dueño.
- Categorías: CRUD básico.
- Servicios: CRUD básico, precio y relación con categoría.
- Citas: agendar, listar, atender y cancelar.
- Dashboard: indicadores y control rápido de citas.
- Páginas comunes: inicio, login de demostración, publicidad y contacto.

## Interfaces por entidad

- `/categorias`: registrar, listar, editar y desactivar categorías.
- `/servicios`: registrar, listar, editar y desactivar servicios.
- `/clientes`: registrar, listar, editar y desactivar clientes.
- `/mascotas`: registrar, listar, editar y desactivar mascotas.
- `/citas`: agendar, listar, atender y cancelar citas.

Se conserva el diseño original gris con Arial, tarjetas rectangulares y botones simples. Bootstrap se carga antes de styles.css. Las rutas CRUD compartidas siguen disponibles para compatibilidad.

Consultar `docs/COMPARACION_AVANCE1.md` para la matriz de 20 funcionalidades, los cambios y las verificaciones pendientes. La compilación no pudo comprobarse en el entorno de preparación por falta de acceso a Maven Central.

La lógica Java permanece separada por módulo en `controller`, `service`, `repository` y `model`.

## Ejecutar

1. Configurar JDK 17.
2. Ejecutar `PetCareApplication.java` desde IntelliJ, o usar `mvnw.cmd spring-boot:run`.
3. Abrir `http://localhost:8080`.

La base de datos H2 funciona en memoria, por lo que los datos se reinician al detener la aplicación.

