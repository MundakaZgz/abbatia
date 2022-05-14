<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>untitled</title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
  </head>
  <body bgcolor="#E1C08B">
    <center>
      <html:form action="/sembrar_campo">
        <html:hidden name="SiembraActForm" property="accion" value="confirmar"/>
        <html:hidden name="SiembraActForm" property="idCampo"/>
        <table border="1" cellspacing="0" bordercolor="#000000" width="60%" bordercolorlight="#000000" bordercolordark="#000000">
          <tr height="20">
            <td align="center" bgcolor="#996633" colspan="4">
              <b><font color="#FFFFFF"  size="2">
                  <bean:message key="edificios.abadia.campo.seleccionsemilla"/>
                </font>
              </b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2" style="border-top: none thin white;">
              <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
                <tr>
                  <td bgcolor="#E1C08B" align="center" colspan="3">
                    <b><font color="#FFFFFF">
                        <bean:message key="edificios.abadia.campo.semillas"/>
                      </font>
                    </b>
                  </td>
                </tr>
                <logic:notEmpty name="SiembraActForm" property="semillas">
                  <logic:iterate id="lista" name="SiembraActForm" property="semillas">
                    <tr>
                      <td align="right" >
                       <html:radio name="SiembraActForm" property="seleccion" idName="lista" value="recursoID" />
                      </td>
                      <td>
                        <bean:write name="lista" property="descripcion" />
                      </td>
                      <td>
                        <bean:write name="lista" property="cantidad" />
                      </td>
                    </tr>
                  </logic:iterate>
                </logic:notEmpty>
                <logic:empty name="SiembraActForm" property="semillas">
                <tr>
                  <td align="center">
                    <bean:message key="mensajes.aviso.notienessemillas"/>
                  </td>
                </tr>
                </logic:empty>
                <tr>
                  <td align="center" colspan="4">
                    <input type="button" onclick="window.parent.cClick();" value="Atr�s"/>
                    <logic:notEmpty name="SiembraActForm" property="semillas">
                      <html:submit>
                        <bean:message key="edificios.abadia.campo.sembrar"/>
                      </html:submit>
                    </logic:notEmpty>
                  </td>
                </tr>
              </table>
             </td>
          </tr>
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
