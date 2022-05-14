<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-layout.tld" prefix="layout" %>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<layout:html>



  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">

      <table border="1" cellspacing="0" bordercolor="#000000" width="95%" bordercolorlight="#000000" bordercolordark="#000000">
        <tr height="20">
          <td align="center" bgcolor="#996633">
            <b><font color="#FFFFFF"  size="2">
                <bean:message key="puntuacion.tabla.cabecera"/>
              </font>
            </b>
          </td>
        </tr>
        <tr>
          <td bgcolor="#E4CFA2">
          <layout:pager maxPageItems="20" >
              <layout:collection name="puntuaciones" id="lista" width="100%">
                  <layout:collectionItem title="puntuacion.tabla.fecha" property="fechaAbadia" sortable="true"  />
                  <layout:collectionItem title="puntuacion.tabla.jerarquia" property="monjesNivel" />
                  <layout:collectionItem title="puntuacion.tabla.habilidades" property="monjesHabilidad" />
                  <layout:collectionItem title="puntuacion.tabla.actividades" property="monjesActividad" />
                  <layout:collectionItem title="puntuacion.tabla.monjesmuertos" property="monjesMuertos" styleClass="COLRED" />
                  <layout:collectionItem title="puntuacion.tabla.santos" property="santos" />
                  <layout:collectionItem title="puntuacion.tabla.animales" property="animales" />
                  <layout:collectionItem title="puntuacion.tabla.edificios" property="edificios" />
                  <layout:collectionItem title="puntuacion.tabla.libros" property="libros" />
                  <layout:collectionItem title="puntuacion.tabla.total" property="total" />
                  <layout:collectionItem title="puntuacion.tabla.clasificacion" property="clasificacion" />
                  <layout:collectionItem title="puntuacion.tabla.clasificacionregional" property="clasificacionRegional" />
              </layout:collection>
          </layout:pager>

          </td>
        </tr>
      </table>
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
</layout:html>
