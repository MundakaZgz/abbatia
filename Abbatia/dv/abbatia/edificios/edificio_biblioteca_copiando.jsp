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
		<font color="#FFFFFF">
            <b><bean:message key="edificios.abadia.biblioteca.tab.local"/></b>
        </font>
   </html:link>
  </td>
  <td align="center" bgcolor="#780A00">
   <html:link action="/mostrarEdificio?Tab=region" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
        <font color="#FFFFFF">
            <b><bean:message key="edificios.abadia.biblioteca.tab.region"/></b>
        </font>
    </html:link>
  </td>
  <td align="center" bgcolor="#780A00">
   <html:link action="/mostrarEdificio?Tab=general" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
		<font color="#FFFFFF">
            <b><bean:message key="edificios.abadia.biblioteca.tab.general"/></b>
        </font>
   </html:link>
  </td>
  <td align="center" style="border-bottom: none thin white;border-right: none thin white;" bgcolor="#E4CFA2">
      <font size="2">
          <b><bean:message key="edificios.abadia.biblioteca.tab.copias"/></b>
      </font>
  </td>
    <td align="center" bgcolor="#780A00">
     <html:link action="/mostrarEdificio?Tab=recursos" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
          <font color="#FFFFFF"><b><bean:message key="edificios.abadia.biblioteca.tab.recursos"/></b></font>
     </html:link>
    </td>

</tr>
<tr>

<td bgcolor="#E4CFA2" colspan="5" >

    <!--Libros que están completos -->

    <table border="1" width="100%" cellspacing="0">
      <tr>
          <logic:notEmpty name="Edificio" property="contenido">
            <layout:pager maxPageItems="15" >
                <layout:collection name="Edificio" property="contenido" id="lista" width="100%" >
                    <layout:collectionItem title="edificios.abadia.biblioteca.region" property="nombreRegion" sortable="true" styleClass="COL2" />
                    <layout:collectionItem title="edificios.abadia.biblioteca.abadia" property="nombreAbadia" sortable="true" styleClass="COL2" />
                    <layout:collectionItem title="edificios.abadia.biblioteca.nombre" property="nombreLibroNivel" sortable="true" styleClass="COL2"/>
                    <layout:collectionItem title="edificios.abadia.biblioteca.monje" property="nombreMonje" sortable="true" styleClass="COL2"/>
                    <layout:collectionItem title="edificios.abadia.biblioteca.estado" property="descEstado" sortable="true"/>
                    <layout:collectionItem title="edificio.abadia.biblioteca.progreso" property="progreso" filter="false"/>
                    <layout:collectionItem title="edificios.abadia.tabla.opciones">
                        <layout:link action="/mostrarDetalleLibro.do" paramName="lista" paramProperty="idLibro_origen" paramId="clave" >
                           <layout:img border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.detallelibro"/>
                        </layout:link>
                        <logic:equal value="1" name="lista" property="estado">
                            <layout:link action="/eliminarLibro" paramName="lista" paramProperty="idLibro" paramId="clave">
                                <layout:img border="0" page="/images/iconos/16/cancelar.jpg" altKey="tooltip.borrarlibro"/>
                            </layout:link>
                            <layout:link action="/mostrarMonjesCopia.do" paramName="lista" paramProperty="idLibro_origen" paramId="clave" >
                               <layout:img border="0" page="/images/iconos/16/copiar.gif" altKey="tooltip.retomarcopia"/>
                            </layout:link>
                        </logic:equal>
                    </layout:collectionItem>
                </layout:collection>
            </layout:pager>
          </logic:notEmpty>
        </tr>
    </table>
</td>
</tr>
</table>
