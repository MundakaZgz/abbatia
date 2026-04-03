#!/bin/sh
set -eu

mkdir -p /opt/tomcat/conf/Catalina/localhost

cat > /opt/tomcat/conf/Catalina/localhost/abbatia.xml <<EOF
<?xml version='1.0' encoding='utf-8'?>
<Context displayName="Abbatia - Gestiona tu propia abadia" docBase="abbatia" path="/abbatia" >
  <Resource name="jdbc/Abadias" auth="Container" type="javax.sql.DataSource"
    url="jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}?autoReconnect=true&amp;noAccessToProcedureBodies=true"
    password="${DB_PASSWORD}"
    maxActive="120"
    maxWait="10"
    driverClassName="com.mysql.jdbc.Driver"
    username="${DB_USER}"
    maxIdle="60"
    removeAbandoned="true"
    removeAbandonedTimeout="20"
    logAbandoned="true"
    />
  <Resource name="jdbc/Procesos" auth="Container" type="javax.sql.DataSource"
    url="jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}?autoReconnect=true&amp;noAccessToProcedureBodies=true"
    password="${DB_PROCESS_PASSWORD}"
    maxActive="20"
    maxWait="50"
    driverClassName="com.mysql.jdbc.Driver"
    username="${DB_PROCESS_USER}"
    maxIdle="2"
    />
</Context>
EOF

# Compatibilidad legacy: muchas JSP referencian recursos con rutas absolutas /images/*
# y la app está desplegada en /abbatia. Extraemos imágenes fuera de appBase y
# publicamos un contexto estático /images.
mkdir -p /opt/static
rm -rf /opt/static/images
(cd /opt/static && jar xf /opt/tomcat/webapps/abbatia.war images)

cat > /opt/tomcat/conf/Catalina/localhost/images.xml <<EOF
<?xml version='1.0' encoding='utf-8'?>
<Context docBase="/opt/static/images" path="/images" />
EOF

exec "$@"
