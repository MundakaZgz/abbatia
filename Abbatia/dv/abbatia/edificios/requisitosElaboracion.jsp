<%@ page import="org.abbatia.bean.datosElaboracion"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
  <head>
    <title>Pantalla elaboraci�n</title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
  </head>

  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
    <center>
      <html:form action="/elaborarAlimentos" >
        <table border="1" cellspacing="0" bordercolor="#000000" width="80%" bordercolorlight="#000000" bordercolordark="#000000">
          <tr height="20">
            <td align="center" bgcolor="#996633">
              <b>
                <font color="#FFFFFF"  size="2">
                  <bean:message key="edificios.abadia.elaboracion.requisitos.titulo" />
                </font>
              </b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2">
              <table border="0" width="100%">
                <tr>
                  <td width="25%" align="center" colspan="2" >
                    <font size="3">
                        <bean:message key="mensajes.elaboracion.alimentos.requisitos" />
                        <b><bean:write name="datosElaboracion" property="descProducto"/></b> <bean:message key="mensajes.elaboracion.alimentos.requisitos2" /> <br>
                        <bean:message key="mensajes.elaboracion.alimentos.requisitos3"/> <bean:write name="datosElaboracion" property="unidadMedida"/>
                        <bean:message key="mensajes.elaboracion.alimentos.requisitos4"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td width="25%" colspan="2" >
                    <p align="center">
                      <b>
                        <font size="2">
                          <bean:message key="mercado.venta2.detalle" />
                        </font>
                      </b>
                    </p>
                  </td>
                </tr>
               </table>
               <table width="90%" align="center" border="1"  >
                <tr height="20">
                  <td align="center" bgcolor="#E1C08B">
                    <b>
                      <font color="#FFFFFF"  size="2">
                        <bean:message key="edificios.abadia.elaboracion.requisitos.tabla.producto" />
                      </font>
                    </b>
                  </td>
                  <td align="center" bgcolor="#E1C08B">
                    <b>
                      <font color="#FFFFFF"  size="2">
                        <bean:message key="edificios.abadia.elaboracion.requisitos.tabla.cantidad" />
                      </font>
                    </b>
                  </td>
                </tr>

                <logic:iterate id="lista" name="datosElaboracion" property="requisitos">
                  <tr>
                    <td align="center" >
                      <bean:write property="producto" name="lista"/>
                      <br/>
                    </td>
                    <td align="center" >
                      <bean:write property="cantidad" name="lista"/>
                      <br/>
                    </td>
                  </tr>
                </logic:iterate>
                </table>
                <table border="0" width="100%">
                    <tr>
                      <td width="25%" colspan="2" align="center"  >
                            <font size="3">
                              <bean:message key="mensajes.elaboracion.alimentos.cantidad" /> <html:text name="datosElaboracion" property="cantidad" size="7"/>
                            </font>
                      </td>
                    </tr>
                </table>
                <tr>
                  <td align="center"  >
                      <input type="button" onClick="window.parent.cClick();" value="Atr�s"/>&nbsp;
                      <html:submit>
                        <bean:message key="edificios.abadia.elaboracion.requisitos.confirmar" />
                      </html:submit>
                  </td>
                </tr>
                <TR>
                  <TD align="center" colspan="2">
                    <html:errors/>
                  </TD>
                </TR>

            </table>
      </html:form>
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
