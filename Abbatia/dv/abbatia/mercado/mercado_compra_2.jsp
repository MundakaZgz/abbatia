<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
  <head>
    <title>Pantalla mercado venta</title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
  </head>
  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
    <center>
      <p>&nbsp;</p>
      <logic:iterate id="lista" name="MercadosListas" property="lstCompra">
        <bean:write property="description" name="lista" filter="false"/>
      </logic:iterate>
      <p align="center">
        <html:link action="/mercado_compra">Volver al mercado</html:link>
      </p>
    </center>
    <!--Inicio Script para google-analytics-->
    <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost +
        "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
        var pageTracker = _gat._getTracker("UA-302272-1");
        pageTracker._initData();
        pageTracker._trackPageview();
    </script>
    <!--Fin Script para google-analytics-->
  
  </body>
</html>
