# Abbatia (resurrección local - fase 1)

## Objetivo de esta fase
- Arranque reproducible con un solo comando.
- Build del WAR desde código fuente (sin depender de `target/`).
- Secretos y credenciales fuera de `docker-compose.yml`.

## Requisitos
- Docker Desktop
- Docker Compose v2

## ⚠️ Fix obligatorio: DNS de Docker Desktop

Si ves errores como `lookup auth.docker.io: i/o timeout` al hacer `docker compose up --build`,
el daemon de Docker no puede resolver DNS (habitual con hotspots o algunas redes corporativas).

**Solución:**

1. Abre Docker Desktop → ⚙️ Settings → **Docker Engine**.
2. Añade `"dns"` al JSON de configuración:
   ```json
   {
     "dns": ["8.8.8.8", "8.8.4.4"]
   }
   ```
3. Pulsa **Apply & Restart**.

## Arranque rápido
1. Crea el fichero de entorno:
   ```
   cp .env.example .env
   ```
2. Ajusta contraseñas en `.env` (`DB_PASSWORD`, `MYSQL_ROOT_PASSWORD`).
3. Levanta servicios:
   ```
   docker compose up --build
   ```

## Bootstrap de BD por ingeniería inversa (sin dump)

Se ha añadido carga automática de MySQL desde [db/init/001_schema_from_code.sql](db/init/001_schema_from_code.sql) y [db/init/002_routines_stubs.sql](db/init/002_routines_stubs.sql), generados desde SQL embebido en Java.

Para regenerar esos ficheros tras cambios de código:

```
python3 tools/generate_schema_from_java.py
```

Si cambias contenido de `public_html/` o `src/`, reconstruye la imagen (`docker compose up --build`) para que el WAR se regenere.

⚠️ MySQL solo ejecuta `docker-entrypoint-initdb.d` cuando el volumen está vacío. Para reinicializar:

```
docker compose down -v
docker compose up --build
```

## URLs
- Juego: http://localhost:8080/abbatia/
- Manager Tomcat: http://localhost:8080/manager/html  (user: admin / pass: admin)
- Buzon local de correos (MailHog): http://localhost:8025/

## Registro y correos en local
- Por defecto en este entorno local se activa `ABBATIA_AUTO_APPROVE_REGISTRATION=true` para que el alta no quede pendiente de validacion manual.
- El envio de correo usa SMTP configurable por variables `MAIL_*`.
- Configuracion por defecto: usa MailHog local (`MAIL_SMTP_HOST=mailhog`, `MAIL_SMTP_PORT=1025`) para que puedas ver los correos en `http://localhost:8025`.
- Si quieres enviar correos reales, cambia `MAIL_*` en `.env` para apuntar a tu SMTP externo y ajusta auth/SSL/STARTTLS segun proveedor.

## Qué hace la imagen de app
- Compila el proyecto con Maven en un stage de build (`maven:3.8.8-eclipse-temurin-8`).
- Construye el WAR desde `public_html` (web legacy completa, incluyendo `WEB-INF/tld`).
- Instala Tomcat 5.5.36 desde el archivo oficial de Apache en una imagen base `eclipse-temurin:8-jre-focal`.
- Despliega la app como `abbatia.war` (accesible en `/abbatia/`).
- Genera dinámicamente el datasource JNDI (`jdbc/Abadias`, `jdbc/Procesos`) en el arranque usando variables de entorno.

## Notas
- La fase 1 garantiza infraestructura y arranque; no garantiza integridad funcional del juego si faltan scripts de esquema de base de datos (fase 2).
- El directorio `script_bdd/` contiene inserciones de datos semilla y actualizaciones, no el DDL del esquema completo.

