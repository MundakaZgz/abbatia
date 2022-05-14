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
  <td align="center" style="border-bottom: none thin white;border-right: none thin white;" bgcolor="#E4CFA2">
	<b><font size="2">
		<bean:message key="edificios.abadia.biblioteca.tab.region"/>
	  </font>
	</b>
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
        <html:form action="/mostrarEdificio">
            <input type="hidden" id="Tab" name="Tab" value="region"/>
            <input type="hidden" id="clave" name="clave" value="<bean:write name='Edificio' property='idDeEdificio'/>"/>
            <td>
                <!--filtro por abadías-->
                <html:select property="abadia" name="FiltroLibros" titleKey="edificios.abadia.biblioteca.abadia"  >
                    <html:options collection="tabla_abadias" property="id" labelProperty="description"/>
                </html:select>
            </td>
            <td>
                <!--filtro por nombre libro-->
                <html:select name="FiltroLibros" property="libro" titleKey="edificios.abadia.biblioteca.nombre" >
                    <html:options collection="tabla_libros" property="id" labelProperty="description"/>
                </html:select>
            </td>
            <td>
                <!--filtro por idioma-->
                <html:select name="FiltroLibros" property="idioma" titleKey="edificios.abadia.biblioteca.idioma" >
                    <html:options collection="tabla_idiomas" property="id" labelProperty="description"/>
                </html:select>
            </td>
            <td>
                <html:checkbox name="FiltroLibros" property="disponible">
                    <b><bean:message key="libro.detalle.disponible" /></b>
                </html:checkbox>
            </td>
            <td>
                <html:submit>
                    <bean:message key="buscar.abadia.boton.buscar"/>
                </html:submit>
            </td>
        </html:form>
      </tr>
      <tr>
          <logic:notEmpty name="Edificio" property="contenido">
            <layout:pager maxPageItems="15" >
                <layout:collection name="Edificio" property="contenido" id="lista" width="100%" >
                    <layout:collectionItem title="edificios.abadia.biblioteca.abadia" property="nombreAbadia" sortable="true"  />
                    <layout:collectionItem title="edificios.abadia.biblioteca.nombre" property="nombreLibroNivel" sortable="true"/>
                    <layout:collectionItem title="edificios.abadia.biblioteca.preciocopia" property="precioCopiaS" sortable="true"/>
                    <layout:collectionItem title="edificios.abadia.biblioteca.idioma" property="idioma_desc" sortable="true"/>
                    <layout:collectionItem title="edificios.abadia.biblioteca.estado" property="descEstado" sortable="true"/>
                    <layout:collectionItem title="edificios.abadia.biblioteca.deterioro" property="deterioro" sortable="true" filter="false"/>
                    <layout:collectionItem title="edificios.abadia.biblioteca.ocupacion" property="ocupacion"/>
                    <layout:collectionItem title="edificios.abadia.biblioteca.fecha_creacion" property="fecha_creacion" />
                    <layout:collectionItem title="edificios.abadia.biblioteca.fecha_adquisicion" property="fecha_adquisicion" />
                    <layout:collectionItem title="edificios.abadia.tabla.opciones">
                        <logic:equal value="2" property="estado" name="lista">
                            <layout:link action="/mostrarMonjesCopia.do" paramName="lista" paramProperty="idLibro" paramId="clave" >
                               <layout:img border="0" page="/images/iconos/16/copiar.gif" altKey="tooltip.copiarlibro"/>
                            </layout:link>
                        </logic:equal>
                        <layout:link action="/mostrarDetalleLibro.do" paramName="lista" paramProperty="idLibro" paramId="clave" >
                           <layout:img border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.detallelibro"/>
                        </layout:link>
                    </layout:collectionItem>
                </layout:collection>
            </layout:pager>
          </logic:notEmpty>
        </tr>
    </table>
</td>
</tr>
</table>
