<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-layout.tld" prefix="layout" %>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>


<table border="1" width="95%" cellspacing="0" >
<tr>
  <td align="center" bgcolor="#780A00">
   <html:link action="/mostrarEdificio?Tab=init" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
		<font color="#FFFFFF"><b><bean:message key="edificios.abadia.biblioteca.tab.local"/></b></font>
   </html:link>
  </td>
  <td align="center" bgcolor="#780A00">
   <html:link action="/mostrarEdificio?Tab=region" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
		<font color="#FFFFFF"><b><bean:message key="edificios.abadia.biblioteca.tab.region"/></b></font>
   </html:link>
  </td>
  <td align="center" bgcolor="#780A00">
   <html:link action="/mostrarEdificio?Tab=general" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
        <font color="#FFFFFF"><b><bean:message key="edificios.abadia.biblioteca.tab.general"/></b></font>
   </html:link>
  </td>
  <td align="center" bgcolor="#780A00">
   <html:link action="/mostrarEdificio?Tab=copias" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
		<font color="#FFFFFF"><b><bean:message key="edificios.abadia.biblioteca.tab.copias"/></b></font>
   </html:link>
  </td>
  <td align="center" style="border-bottom: none thin white;border-right: none thin white;" bgcolor="#E4CFA2">
    <b><font size="2">
        <bean:message key="edificios.abadia.biblioteca.tab.recursos"/>
      </font>
    </b>
  </td>

</tr>
<tr>

<td bgcolor="#E4CFA2" colspan="5" >

    <!--Libros que están completos -->
    <table border="1" width="100%" cellspacing="0" >
      <logic:notEmpty name="Edificio" property="contenido">
        <tr>
          <layout:pager maxPageItems="15">
              <layout:collection name="Edificio" property="contenido" id="lista" width="100%" >
                  <layout:collectionItem title="edificios.abadia.almacen.descripcion" property="descripcion" sortable="true" />
                  <layout:collectionItem title="edificios.abadia.almacen.cantidad" property="cantidadF" />
                  <layout:collectionItem title="edificios.abadia.almacen.estado" property="barra_HTML" filter="false" />
                  <layout:collectionItem title="edificios.abadia.tabla.opciones">
                    <a href="javascript:vender('<bean:write property="recursoID" name="lista" />', 'R');" >
                      <html:img border="0" page="/images/iconos/16/vender.jpg" altKey="tooltip.vender"/>
                    </a>
                  </layout:collectionItem>
              </layout:collection>
          </layout:pager>
         </tr>
        </logic:notEmpty>
    </table>
</td>
</tr>
</table>
