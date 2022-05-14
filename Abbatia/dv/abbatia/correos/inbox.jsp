<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-layout.tld" prefix="layout" %>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<layout:html>



  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
    <html:form action="/borrarMensajes" >

      
      <table border="1" cellspacing="0" bordercolor="#000000" width="90%" bordercolorlight="#000000" bordercolordark="#000000">
        <tr height="20">
          <td align="center" bgcolor="#996633">
            <b><font color="#FFFFFF"  size="2">
                <bean:message key="mensajes.inbox.recibidos"/>
              </font>
            </b>
          </td>
        </tr>
        <tr>
          <td bgcolor="#E4CFA2">
          <layout:pager maxPageItems="20" >
              <layout:collection name="MensajeForm" property="correos" id="lista" width="100%">
                  <layout:collectionItem title="mensajes.inbox.table.seleccion">
                      <html:multibox name="MensajeForm" property="seleccion" >
                        <bean:write name="lista" property="idCorreo"/>
                      </html:multibox>
                   </layout:collectionItem>
                  <layout:collectionItem title="mensajes.inbox.table.origen" property="abadiaDestino" sortable="true"  />
                  <layout:collectionItem title="mensajes.inbox.table.fecha_abadia" property="fecha_abadia" />
                  <layout:collectionItem title="mensajes.inbox.table.fecha_real" property="fecha_real" />
                  <layout:collectionItem title="mensajes.inbox.table.msg" property="texto" action="/mensajes_recibidos" paramName="lista" paramId="correoid" paramProperty="idCorreo" styleClass="COL2"  />
                  <layout:collectionItem title="mensajes.inbox.table.leido" property="descEstado">
                      <center>
                          <logic:equal name="lista" property="estado" value="NO" >
                            <layout:img border="0" page="/images/iconos/16/sinleer.gif" altKey="tooltip.sinleer" />
                          </logic:equal>
                          <logic:equal name="lista" property="estado" value="SI" >
                            <layout:img border="0" page="/images/iconos/16/leido.gif" altKey="tooltip.leido"/>
                          </logic:equal>
                      </center>
                  </layout:collectionItem>
                  <layout:collectionItem title="mensajes.inbox.table.borrar" property="deterioro" filter="false">
                      <layout:link action="/borrarMensajes" paramName="lista" paramId="correoid" paramProperty="idCorreo" >
                        <layout:img border="0" page="/images/iconos/16/cancelar.jpg" altKey="tooltip.borrar"/>
                      </layout:link>
                  </layout:collectionItem>
              </layout:collection>
          </layout:pager>

          </td>
        </tr>
        <tr>
          <td align="center" >
              <html:submit>
                <bean:message key="outlook.menu.eliminarseleccion" />
              </html:submit>
          </td>
        </tr>
      </table>
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
  <!-- Mostrar la abadia congelada -->
  <jsp:include page="/abadias/congelado.jsp"/>
</layout:html>
