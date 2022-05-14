<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-layout.tld" prefix="layout" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>


<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<layout:html>
    <table border="1" cellspacing="0" bordercolor="#000000" width="90%" bordercolorlight="#000000" bordercolordark="#000000">
      <tr height="20">
        <td align="center" bgcolor="#996633">
          <b><font color="#FFFFFF"  size="2">
              <bean:message key="usuario.altas.pendientes"/>
            </font>
          </b>
        </td>
      </tr>
      <tr>
        <td bgcolor="#E4CFA2">
            <layout:pager maxPageItems="20" >
                <layout:collection name="AltasPendientes" id="lista" >
                    <layout:collectionItem title="usuario.id" property="idDeUsuario" sortable="true"  />
                    <layout:collectionItem title="usuario.nick" property="nick" sortable="true"/>
                    <layout:collectionItem title="usuario.nombre" property="nombre" sortable="true"/>
                    <layout:collectionItem title="usuario.apellido1" property="primerApellido" sortable="true"/>
                    <layout:collectionItem title="usuario.apellido2" property="segundoApellido" sortable="true"/>
                    <layout:collectionItem title="usuario.email" property="email" sortable="true"/>
                    <layout:collectionItem title="usuario.ip" property="ipActual" sortable="true"/>
                    <layout:collectionItem title="usuario.fechaalta" property="fecha_alta" sortable="true"/>
                    <layout:collectionItem title="mensajes.inbox.table.seleccion">
                        <layout:link action="/autorizarAlta" paramName="lista" paramId="clave" paramProperty="idDeUsuario" >
                          <layout:img border="0" page="/images/iconos/16/autorizar.jpg" altKey="tooltip.administracion.alta.ok"/>
                        </layout:link>
                    </layout:collectionItem>
                    <layout:collectionItem title="mensajes.inbox.table.seleccion">
                        <layout:link action="/denegarAlta" paramName="lista" paramId="clave" paramProperty="idDeUsuario" >
                          <layout:img border="0" page="/images/iconos/16/cancelar.jpg" altKey="tooltip.administracion.alta.ko"/>
                        </layout:link>
                    </layout:collectionItem>
                </layout:collection>
            </layout:pager>
        </td>
        </tr>
        </table>
  </layout:html>
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
