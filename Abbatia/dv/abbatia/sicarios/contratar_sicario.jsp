<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
  <head>
    <title>Pantalla para contratar sicario</title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
  </head>
  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
    <p>&nbsp;</p>
    <center>
      <table border="1" cellspacing="0" bordercolor="#000000" width="90%" bordercolorlight="#000000" bordercolordark="#000000">
        <tr height="20">
          <td align="center" bgcolor="#996633">
            <b><font color="#FFFFFF"  size="2">
                <bean:message key="sicario.titulo"/>
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
                       <bean:message key="usuario.nombre"/>
                    </font>
                  </b>
                </td>
                <td bgcolor="#E1C08B" align="center">
                  <b><font color="#FFFFFF">
                       <bean:message key="sicario.ase_obispo"/>
                    </font>
                  </b>
                </td>
                <td bgcolor="#E1C08B" align="center">
                  <b><font color="#FFFFFF">
                       <bean:message key="sicario.ase_cardenal"/>
                    </font>
                  </b>
                </td>
                <td bgcolor="#E1C08B" align="center">
                  <font color="#FFFFFF">
                    <b>
                       <bean:message key="sicario.ase_papa"/>
                    </b>
                  </font>
                </td>
              </tr>
              <logic:iterate id="lista" name="Contents">
                <tr>
                  <td>
					<html:link action="/buscar_eminencias?opcion=1" paramId="clave" paramName="lista" paramProperty="idSicario">
                        <bean:write property="nombre" name="lista"/>&nbsp;<bean:write property="apellido" name="lista"/>
					</html:link>
                  </td>
                  <td align="center">
                    <bean:write property="obispos_muertos" name="lista"/>
                  </td>
                  <td align="center">
                    <bean:write property="cardenales_muertos" name="lista"/>
                  </td>
                  <td align="center">
                    <bean:write property="papas_muertos" name="lista"/>
                  </td>
                </tr>
              </logic:iterate>
            </table>
          </td>
        </tr>
      </table>
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
  <!-- Mostrar la abadia congelada -->
  <jsp:include page="/abadias/congelado.jsp"/>
</html>
