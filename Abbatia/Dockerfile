FROM apsl/tomcat5:latest

# Environment variables
ENV MANAGER_USER=admin
ENV MANAGER_PASSWORD=admin

# Tomcat configuration
COPY ./tomcat-config/tomcat-users.xml /opt/tomcat/conf
COPY ./tomcat-config/context.xml /opt/tomcat/webapps/manager/META-INF/context.xml

# Shared libraries
COPY ./lib/log4j-1.2.8.jar /opt/tomcat/shared/lib/log4j-1.2.8.jar
COPY ./lib/struts.jar /opt/tomcat/shared/lib/struts.jar
COPY ./lib/jakarta-oro.jar /opt/tomcat/shared/lib/jakarta-oro.jar
COPY ./lib/commons-validator.jar /opt/tomcat/shared/lib/commons-validator.jar
COPY ./lib/commons-beanutils.jar /opt/tomcat/shared/lib/commons-beanutils.jar
COPY ./lib/commons-collections-3.2.1.jar /opt/tomcat/shared/lib/commons-collections-3.2.1.jar
COPY ./lib/commons-digester.jar /opt/tomcat/shared/lib/commons-digester.jar
COPY ./lib/displaytag-1.2.jar /opt/tomcat/shared/lib/displaytag-1.2.jar

# Common libraries
COPY ./lib/mysql-connector-java-5.0.7-bin.jar /opt/tomcat/common/lib/mysql-connector-java-5.0.7-bin.jar

COPY abbatia.war /opt/tomcat/webapps
CMD ["catalina.sh", "run"]
