<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
<head>
    <title><html:messages id="edificios.abadia.listado.title"/></title>
    <link REL="STYLESHEET" HREF="${pageContext.request.contextPath}/theme/style-global.css" TYPE="text/css"/>
    <link REL="STYLESHEET" HREF="${pageContext.request.contextPath}/theme/style-revised.css" TYPE="text/css"/>
    <link REL="STYLESHEET" HREF="${pageContext.request.contextPath}/theme/styles.css" TYPE="text/css"/>
</head>
<body>
<div id="container">
    <div class="alignCenter">
        <logic:equal value="1" name="Links">
            <h3><bean:message key="edificios.abadia.titulo"/></h3>
        </logic:equal>
        <logic:equal value="0" name="Links">
            <h3><bean:message key="mercado.historico.abadia"/>: ${Nombre}</h3><br/>
        </logic:equal>
    </div>

    <div class="alignCenter">
        <%--<p>--%>
        <logic:equal value="1" name="Nieve">
            <img alt="" STYLE="position:absolute;top:40; left:50%; margin-left:-300;"
                 src="/images/mapas/nieve/fondo.gif"/>
        </logic:equal>
        <logic:equal value="0" name="Nieve">
            <logic:equal value="0" name="Noche">
                <img alt="" STYLE="position:absolute;top:40; left:50%; margin-left:-300;"
                     src="/images/mapas/fondo_vacio.jpg"/>
