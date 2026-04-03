# ──── Stage 1: Maven build ──────────────────────────────────────────────────
FROM maven:3.8.8-eclipse-temurin-8 AS build

WORKDIR /workspace
COPY pom.xml ./
COPY src ./src
COPY public_html ./public_html
RUN mkdir -p src/main/resources/org/abbatia && \
    cp src/main/java/org/abbatia/abbatia*.properties src/main/resources/org/abbatia/ && \
    cp src/main/java/org/abbatia/abbatia.properties src/main/resources/MessageResources.properties && \
    for f in src/main/java/org/abbatia/abbatia_*.properties; do \
      base="$(basename "$f")"; \
      out="$(printf '%s' "$base" | sed 's/^abbatia/MessageResources/')"; \
      cp "$f" "src/main/resources/${out}"; \
    done && \
    cp src/main/java/log4j.properties src/main/resources/log4j.properties && \
    sed -i 's|@config.AbbatiaLogLevel@|INFO|g; s|@config.ProcesosLogLevel@|INFO|g; s|@config.AbbatiaLogDir@|/tmp/abbatia.log|g; s|@config.ProcesosLogDir@|/tmp/procesos.log|g' src/main/resources/log4j.properties
  RUN mvn -q -Dmaven.test.skip=true package

# ──── Stage 2: Tomcat 5.5 runtime (sin depender de apsl/tomcat5) ────────────
FROM eclipse-temurin:8-jdk-focal

ARG TOMCAT_VERSION=5.5.36
ENV CATALINA_HOME=/opt/tomcat
ENV PATH="${CATALINA_HOME}/bin:${PATH}"

ENV MANAGER_USER=admin
ENV MANAGER_PASSWORD=admin
ENV DB_HOST=db
ENV DB_PORT=3306
ENV DB_NAME=abbatia
ENV DB_USER=abbatia_inet
ENV DB_PASSWORD=change_me
ENV DB_PROCESS_USER=abbatia_inet
ENV DB_PROCESS_PASSWORD=change_me

# Instalar Tomcat 5.5 desde el archivo oficial de Apache
RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates && \
    wget -q \
      "https://archive.apache.org/dist/tomcat/tomcat-5/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" \
      -O /tmp/tomcat.tar.gz && \
    tar -xzf /tmp/tomcat.tar.gz -C /opt && \
    mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
    wget -q \
      "https://repo1.maven.org/maven2/org/eclipse/jdt/core/compiler/ecj/4.6.1/ecj-4.6.1.jar" \
      -O /opt/tomcat/common/lib/ecj-3.7.2.jar && \
    rm -rf /tmp/tomcat.tar.gz \
           /opt/tomcat/webapps/examples \
          /opt/tomcat/webapps/docs \
          /opt/tomcat/webapps/ROOT && \
    chmod +x /opt/tomcat/bin/*.sh && \
    mkdir -p /opt/tomcat/conf/Catalina/localhost && \
    apt-get purge -y wget && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

# Shared libraries (Struts 1, log4j, taglibs, etc.)
COPY ./lib/log4j-1.2.8.jar                  ${CATALINA_HOME}/shared/lib/
COPY ./lib/struts.jar                        ${CATALINA_HOME}/shared/lib/
COPY ./lib/jakarta-oro.jar                   ${CATALINA_HOME}/shared/lib/
COPY ./lib/commons-validator.jar             ${CATALINA_HOME}/shared/lib/
COPY ./lib/commons-beanutils.jar             ${CATALINA_HOME}/shared/lib/
COPY ./lib/commons-lang-2.3.jar              ${CATALINA_HOME}/shared/lib/
COPY ./lib/commons-collections-3.2.1.jar    ${CATALINA_HOME}/shared/lib/
COPY ./lib/commons-digester.jar              ${CATALINA_HOME}/shared/lib/
COPY ./lib/jstl.jar                          ${CATALINA_HOME}/shared/lib/
COPY ./lib/standard.jar                      ${CATALINA_HOME}/shared/lib/
COPY ./lib/commons-el.jar                    ${CATALINA_HOME}/shared/lib/

# Common libraries (JDBC driver — disponible para todos los webapps y Tomcat)
COPY ./lib/mysql-connector-java-5.0.7-bin.jar ${CATALINA_HOME}/common/lib/

# Configuración de Tomcat
COPY ./tomcat-config/tomcat-users.xml        ${CATALINA_HOME}/conf/tomcat-users.xml
COPY ./tomcat-config/context.xml             ${CATALINA_HOME}/webapps/manager/META-INF/context.xml

# Desplegar la app como /abbatia
COPY --from=build /workspace/target/Abbatia-1.0-SNAPSHOT.war ${CATALINA_HOME}/webapps/abbatia.war

# Entrypoint: genera ROOT.xml (JNDI datasources) con las variables de entorno
COPY ./tomcat-config/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR ${CATALINA_HOME}
EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["catalina.sh", "run"]
