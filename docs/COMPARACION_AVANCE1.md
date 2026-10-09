# Comparación con el documento del Avance 1

Origen: FyteGabriel/PetCare-v0.0, rama main, árbol 21b263731df46f00a6b6d0a9a0690a1df753133b.
Documento: Copia de Construcción de Software Grupo N°4.

Alcance confirmado: únicamente interfaces, navegación y funcionalidades. Conservar el diseño existente. Esta copia no cambia el repositorio de origen.

| Aspecto | Repositorio de origen | Copia preparada |
| --- | --- | --- |
| Diseño | Gris, Arial, tarjetas rectangulares y botones simples | Se conserva la identidad visual; la imagen original de publicidad debe copiarse desde el repositorio de origen |
| Pantallas por entidad | Registro/listado/edición/baja compartidos | Categorías, Servicios, Clientes, Mascotas y Citas con formulario, listado, edición y confirmación dentro de la misma vista |
| Navegación | Enlaces por operación CRUD | Menú por entidad y redirección a cada módulo después de guardar o cambiar registros |
| Bootstrap | No incluido | CSS Bootstrap compartido; estilos propios cargados después para conservar el diseño |
| Login, publicidad, contacto y panel | Existentes | Conservados; el login sigue siendo una demostración |
| Reglas y métricas avanzadas | No coinciden íntegramente con el documento | Fuera de esta etapa por indicación del usuario |

## Funcionalidades e interfaces

| Interfaz | URL | Funcionalidades |
| --- | --- | --- |
| I1 Login | /login | Acceso demostrativo al panel |
| I2 Publicidad | /publicidad | Información pública |
| I3 Contacto | /contacto | Información y formulario de demostración |
| I4 Dashboard | /dashboard | Resumen existente y acceso a citas |
| I5 Categorías | /categorias | F01 registrar; F02 listar; F03 editar; F04 desactivar |
| I6 Servicios | /servicios | F05 registrar; F06 listar; F07 editar; F08 desactivar |
| I7 Clientes | /clientes | F09 registrar; F10 listar; F11 editar; F12 desactivar |
| I8 Mascotas | /mascotas | F13 registrar; F14 listar; F15 editar; F16 desactivar |
| I9 Citas | /citas | F17 agendar; F18 listar; F19 marcar atención; F20 cancelar |

Las rutas anteriores /create, /read, /update y /delete se conservan para compatibilidad. El menú principal apunta a las nuevas interfaces.

## Verificación

- Revisión estática: 105 enlaces/acciones locales apuntan a rutas conocidas. Includes, formularios y etiquetas c:if equilibrados.
- Compilación/ejecución: no verificadas. Maven no pudo resolver Spring Boot 3.4.4 por fallo de DNS hacia repo.maven.apache.org.
- Apariencia en navegador: pendiente de verificación visual en una ejecución del proyecto. Se conservaron CSS y colores originales; no se afirma identidad visual comprobada mediante captura.
- Bootstrap se carga desde CDN y requiere internet; los estilos originales siguen disponibles localmente.

## Recorrido para comprobar las veinte operaciones

1. Ejecutar con JDK 17 y Maven Wrapper: `mvnw.cmd spring-boot:run` en Windows o `bash ./mvnw spring-boot:run` en Linux.
2. Visitar Publicidad, Contacto, Login y Panel.
3. Registrar una categoría y un servicio vinculado a ella; comprobar listado, edición y baja administrativa.
4. Registrar un cliente y una mascota vinculada a él; comprobar listado, edición y baja administrativa.
5. Con registros activos, agendar una cita en un horario libre; verificar listado y atención. Crear otra y verificar cancelación.
6. Copiar src/main/webapp/images/publicidad.png desde el repositorio original: su descarga no devolvió bytes en este entorno. Después, revisar las versiones móviles y la imagen de publicidad.

## Diferencias pendientes respecto al documento completo

Se mantienen el estado AGENDADA, los campos del modelo original, el login demostrativo y los indicadores existentes. Quedan para otra etapa descuentos VIP/fin de semana, diagnóstico obligatorio, métricas de series de tiempo y el resto de la alineación de datos/reglas. Esta entrega no acredita cumplimiento completo de la rúbrica.
