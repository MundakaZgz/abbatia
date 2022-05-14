<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=windows-1252"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <link REL="STYLESHEET" HREF="theme/styles.css" TYPE="text/css"/>
    <title>untitled</title>
  </head>
  <body bgcolor="#E1C08B">
    <html:form action="/registroAbadia?accion=registro3">
    <html:hidden property="nombreAbadia"/>
      <center>
        <table border="1" cellspacing="0" bordercolor="#000000" width="70%" bordercolorlight="#000000" bordercolordark="#000000">
          <tr height="20">
            <td align="center" bgcolor="#996633">
              <b><font color="#FFFFFF"  size="2">
                  <bean:message key="registro.abadia.tabla.cabecera"/>
                </font>
              </b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2">
              <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
                <tr>
                  <td bgcolor="#E1C08B" align="center">
                    <b><font color="#FFFFFF">
                        <bean:message key="registro.abadia.tabla.id"/>
                      </font>
                    </b>
                  </td>
                  <td bgcolor="#E1C08B" align="center">
                    <b><font color="#FFFFFF">
                        <bean:message key="registro.abadia.tabla.nombre"/>
                      </font>
                    </b>
                  </td>
                  <td bgcolor="#E1C08B" align="center">
                    <b><font color="#FFFFFF">
                        <bean:message key="registro.abadia.tabla.ciudad"/>
                      </font>
                    </b>
                  </td>
                  <td bgcolor="#E1C08B" align="center">
                    <b><font color="#FFFFFF">
                        <bean:message key="registro.abadia.tabla.jerarquia"/>
                      </font>
                    </b>
                  </td>
                  <td bgcolor="#E1C08B" align="center">
                    <font color="#FFFFFF"><b>
                        <bean:message key="registro.abadia.tabla.fechanacimiento"/>
                      </b>
                    </font>
                  </td>
                  <td bgcolor="#E1C08B" align="center">
                    <b><font color="#FFFFFF">
                        <bean:message key="registro.abadia.tabla.fechaentrada"/>
                      </font>
                    </b>
                  </td>
                </tr>
                <logic:iterate id="monje" property="monjes" name="AbadiaForm">
                  <tr>
                    <td align="center">
                      <bean:write property="idDeMonje" name="monje"/>
                    </td>
                    <td align="center">
                      <bean:write property="nombre" name="monje"/>
                    </td>
                    <td align="center">
                      <bean:write property="primerApellido" name="monje"/>
                    </td>
                    <td align="center">
                      <bean:write property="jerarquia" name="monje"/>
                    </td>
                    <td align="center">
                      <bean:write property="fechaDeNacimiento" name="monje"/>
                    </td>
                    <td align="center">
                      <bean:write property="fechaDeEntradaEnAbadia" name="monje"/>
                    </td>
                  </tr>
                </logic:iterate>
              </table>
            </td>
          </tr>
        </table>
        <tr>
          <td colspan="5" align="center">
            <html:submit>
              <bean:message key="registro.abadia.aceptar"/>
            </html:submit>
          </td>
        </tr>
      </center>
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
