<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html>
  <head>
    <title>
      <bean:message key="registro.abadia.titulo"/>
    </title>
    <link REL="STYLESHEET" HREF="theme/styles.css" TYPE="text/css"/>
  </head>
  <body bgcolor="#E1C08B">
    <html:form action="/registroAbadia?accion=registro2">
      <DIV align="center">
        <table border="1" width="80%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
          <tr>
            <td colspan="2" align="center" bgcolor="#996633">
              <b><font color="#FFFFFF"  size="2">
                <bean:message key="registro.abadia.titulo" />
              </font></b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2" align="center">
              <img src="images/registro.gif"/>
            </td>
            <td bgcolor="#E4CFA2">
              <table cellspacing="2" cellpadding="3" border="0" width="100%">
                <tr>
                  <td width="50%">
                    <div align="right">
                      <bean:message key="registro.abadia.nombre"/>
                    </div>
                  </td>
                  <td width="50%">
                    <html:text property="nombreAbadia" maxlength="15" name="AbadiaForm" size="15"/>
                  </td>
                </tr>
                <tr>
                  <td width="50%">
                    <div align="right">
                      <bean:message key="registro.abadia.region"/>
                    </div>
                  </td>
                  <td>
                    <html:select name="AbadiaForm" property="region">
                      <html:options collection="regiones" property="id" labelProperty="description"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td width="50%">
                    <div align="right">
                      <bean:message key="registro.abadia.orden"/>
                    </div>
                  </td>
                  <td width="50%">
                    <html:select name="AbadiaForm" property="orden">
                      <html:options collection="ordenes" property="id" labelProperty="description"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td width="50%">
                    <div align="right">
                      <bean:message key="registro.abadia.actividad"/>
                    </div>
                  </td>
                  <td width="50%">
                    <html:select name="AbadiaForm" property="actividad">
                      <html:options collection="actividades" property="id" labelProperty="description"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <TD align="center" width="100%" colspan="2">
                    <html:submit>
                      <bean:message key="registro.abadia.siguiente"/>
                    </html:submit>
                  </TD>
                </tr>
                <tr>
                  <td align="center" width="100%" colspan="2">
                    <html:errors/>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </DIV>
    </html:form>
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
