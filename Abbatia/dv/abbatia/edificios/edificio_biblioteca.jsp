<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>


<table border="1" width="95%" cellspacing="0">
<tr>
    <td align="center" style="border-bottom: none thin white;border-right: none thin white;" bgcolor="#E4CFA2">
        <b><font size="2">
            <bean:message key="edificios.abadia.biblioteca.tab.local"/>
        </font>
        </b>
    </td>
    <td align="center" bgcolor="#780A00">
        <html:link action="/mostrarEdificio?Tab=region" paramId="clave" paramName="Edificio"
                   paramProperty="idDeEdificio">
            <font color="#FFFFFF"><b>
                <bean:message key="edificios.abadia.biblioteca.tab.region"/>
            </b></font>
        </html:link>
    </td>
    <td align="center" bgcolor="#780A00">
        <html:link action="/mostrarEdificio?Tab=general" paramId="clave" paramName="Edificio"
                   paramProperty="idDeEdificio">
            <font color="#FFFFFF"><b>
                <bean:message key="edificios.abadia.biblioteca.tab.general"/>
            </b></font>
        </html:link>
    </td>
    <td align="center" bgcolor="#780A00">
        <html:link action="/mostrarEdificio?Tab=copias" paramId="clave" paramName="Edificio"
                   paramProperty="idDeEdificio">
            <font color="#FFFFFF"><b>
                <bean:message key="edificios.abadia.biblioteca.tab.copias"/>
            </b></font>
        </html:link>
    </td>
    <td align="center" bgcolor="#780A00">
     <html:link action="/mostrarEdificio?Tab=recursos" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
          <font color="#FFFFFF"><b><bean:message key="edificios.abadia.biblioteca.tab.recursos"/></b></font>
     </html:link>
    </td>

</tr>
<tr>

<td bgcolor="#E4CFA2" colspan="5">
<logic:notEmpty name="Edificio" property="contenido">
<!--Libros que están completos -->
<table border="1" width="100%" cellspacing="0">
<tr>
    <td colspan="9" bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.biblioteca.titulo"/>
        </font>
        </b>
    </td>
</tr>
<tr>
    <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.biblioteca.nombre"/>
        </font>
        </b>
    </td>
    <td bgcolor="#E1C08B" align="center">
        <font color="#FFFFFF"><b>
            <bean:message key="edificios.abadia.biblioteca.preciocopia"/>
        </b>
        </font>
    </td>
    <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.biblioteca.idioma"/>
        </font>
        </b>
    </td>
    <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.biblioteca.estado"/>
        </font>
        </b>
    </td>
    <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.biblioteca.deterioro"/>
        </font>
        </b>
    </td>
    <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.biblioteca.ocupacion"/>
        </font>
        </b>
    </td>
    <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.biblioteca.fecha_creacion"/>
        </font>
        </b>
    </td>
    <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.biblioteca.fecha_adquisicion"/>
        </font>
        </b>
    </td>
    <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.tabla.opciones"/>
        </font>
        </b>
    </td>
</tr>
<logic:iterate id="lista" name="Edificio" property="contenido">
<logic:equal value="2" name="lista" property="estado">
    <tr>
        <td align="center">
            <bean:write property="nombreLibro" name="lista"/>
            (
            <bean:write property="nivel" name="lista"/>
            )
        </td>
        <td align="center">
            <html:link action="/actualizarPrecioCopia" paramName="lista" paramProperty="idLibro" paramId="clave">
                <bean:write property="precioCopiaS" name="lista"/>
            </html:link>
        </td>
        <td align="center">
            <bean:write property="idioma_desc" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="descEstado" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="deterioro" name="lista" filter="false"/>
        </td>
        <td align="center">
            <bean:write property="ocupacion" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="fecha_creacion" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="fecha_adquisicion" name="lista"/>
        </td>
        <td align="center">
            <html:link action="/mostrarMonjesCopia" paramName="lista" paramProperty="idLibro" paramId="clave">
                <html:img border="0" page="/images/iconos/16/copiar.gif" altKey="tooltip.copiarlibro"/>
            </html:link>
            <html:link action="/mostrarDetalleLibro" paramName="lista" paramProperty="idLibro" paramId="clave">
                <html:img border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.detallelibro"/>
            </html:link>
            <html:link action="/mostrarMonjesSubirNivelCopia" paramName="lista" paramProperty="idLibro" paramId="clave">
                <html:img border="0" page="/images/iconos/16/subirnivel.gif" altKey="tooltip.libro.subirnivel"/>
            </html:link>
            <logic:greaterThan value="0" name="lista" parameter="desgaste" >
                <html:link action="/restaurarLibro" paramName="lista" paramProperty="idLibro" paramId="clave">
                    <html:img border="0" page="/images/iconos/16/restaurarlibro.gif" altKey="tooltip.libro.restaurar"/>
                </html:link>
            </logic:greaterThan>
        </td>
    </tr>
</logic:equal>
<logic:equal value="7" name="lista" property="estado">
    <tr>
        <td align="center">
            <bean:write property="nombreLibro" name="lista"/>
            (
            <bean:write property="nivel" name="lista"/>
            )
        </td>
        <td align="center">
            <html:link action="/actualizarPrecioCopia" paramName="lista" paramProperty="idLibro" paramId="clave">
                <bean:write property="precioCopiaS" name="lista"/>
            </html:link>
        </td>
        <td align="center">
            <bean:write property="idioma_desc" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="descEstado" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="deterioro" name="lista" filter="false"/>
        </td>
        <td align="center">
            <bean:write property="ocupacion" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="fecha_creacion" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="fecha_adquisicion" name="lista"/>
        </td>
        <td align="center">
            <html:link action="/mostrarDetalleLibro" paramName="lista" paramProperty="idLibro" paramId="clave">
                <html:img border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.detallelibro"/>
            </html:link>
            <html:link action="/restaurarLibro" paramName="lista" paramProperty="idLibro" paramId="clave">
                <html:img border="0" page="/images/iconos/16/restaurarlibro.gif" altKey="tooltip.libro.restaurar"/>
            </html:link>
        </td>
    </tr>
</logic:equal>
<logic:equal value="8" name="lista" property="estado">
    <tr>
        <td align="center">
            <bean:write property="nombreLibro" name="lista"/>
            (
            <bean:write property="nivel" name="lista"/>
            )
        </td>
        <td align="center">
            <html:link action="/actualizarPrecioCopia" paramName="lista" paramProperty="idLibro" paramId="clave">
                <bean:write property="precioCopiaS" name="lista"/>
            </html:link>
        </td>
        <td align="center">
            <bean:write property="idioma_desc" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="descEstado" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="deterioro" name="lista" filter="false"/>
        </td>
        <td align="center">
            <bean:write property="ocupacion" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="fecha_creacion" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="fecha_adquisicion" name="lista"/>
        </td>
        <td align="center">
            <html:link action="/mostrarDetalleLibro" paramName="lista" paramProperty="idLibro" paramId="clave">
                <html:img border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.detallelibro"/>
            </html:link>
            <html:link action="/cancelarRestauracionLibro" paramName="lista" paramProperty="idLibro" paramId="clave">
                <html:img border="0" page="/images/iconos/16/anular_restaurarlibro.gif"
                          altKey="tooltip.libro.abandonarrestauracion"/>
            </html:link>
        </td>
    </tr>
</logic:equal>

<logic:equal value="5" name="lista" property="estado">
    <tr>
        <td align="center">
            <bean:write property="nombreLibro" name="lista"/>
            (
            <bean:write property="nivel" name="lista"/>
            )
        </td>
        <td align="center">
            <html:link action="/actualizarPrecioCopia" paramName="lista" paramProperty="idLibro" paramId="clave">
                <bean:write property="precioCopiaS" name="lista"/>
            </html:link>
        </td>
        <td align="center">
            <bean:write property="idioma_desc" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="descEstado" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="deterioro" name="lista" filter="false"/>
        </td>
        <td align="center">
            <bean:write property="ocupacion" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="fecha_creacion" name="lista"/>
        </td>
        <td align="center">
            <bean:write property="fecha_adquisicion" name="lista"/>
        </td>
        <td align="center">
            <html:link action="/mostrarDetalleLibro" paramName="lista" paramProperty="idLibro" paramId="clave">
                <html:img border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.detallelibro"/>
            </html:link>
            <html:link action="/encuadernarLibro" paramName="lista" paramProperty="idLibro" paramId="clave">
                <html:img border="0" page="/images/iconos/16/encuadernar.gif" altKey="tooltip.encuadernarlibro"/>
            </html:link>
        </td>
    </tr>
</logic:equal>
</logic:iterate>
</table>
<!--Libros que no están completos -->
<table border="1" width="100%" cellspacing="0">
    <tr>
        <td colspan="7" bgcolor="#E1C08B" align="center">
            <b><font color="#FFFFFF">
                <bean:message key="edificios.abadia.biblioteca.titulocopiando"/>
            </font>
            </b>
        </td>
    </tr>
    <tr>
        <td bgcolor="#E1C08B" align="center">
            <b><font color="#FFFFFF">
                <bean:message key="edificios.abadia.biblioteca.nombre"/>
            </font>
            </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
            <b><font color="#FFFFFF">
                <bean:message key="edificios.abadia.biblioteca.monje"/>
            </font>
            </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
            <b><font color="#FFFFFF">
                <bean:message key="edificios.abadia.biblioteca.idioma"/>
            </font>
            </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
            <b><font color="#FFFFFF">
                <bean:message key="edificios.abadia.biblioteca.estado"/>
            </font>
            </b>
        </td>
            <%--
                    <td bgcolor="#E1C08B" align="center">
                      <b><font color="#FFFFFF">
                          <bean:message key="edificios.abbatia.biblioteca.fecha_creacion"/>
                        </font>
                      </b>
                    </td>
            --%>
        <td bgcolor="#E1C08B" align="center">
            <b><font color="#FFFFFF">
                <bean:message key="edificio.abadia.biblioteca.progreso"/>
            </font>
            </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
            <b><font color="#FFFFFF">
                <bean:message key="edificios.abadia.tabla.opciones"/>
            </font>
            </b>
        </td>
    </tr>
    <logic:iterate id="lista" name="Edificio" property="contenido">
        <logic:notEqual value="2" name="lista" property="estado">
            <logic:notEqual value="5" name="lista" property="estado">
                <logic:notEqual value="7" name="lista" property="estado">
                    <logic:notEqual value="8" name="lista" property="estado">
                        <tr>
                            <td align="center">
                                <bean:write property="nombreLibro" name="lista"/>
                                (
                                <bean:write property="nivel" name="lista"/>
                                )
                            </td>
                            <td>
                                <bean:write property="nombreMonje" name="lista"/>
                                (<b>
                                <bean:write property="nombreAbadia" name="lista"/>
                            </b>)
                            </td>
                            <td align="center">
                                <bean:write property="idioma_desc" name="lista"/>
                            </td>
                            <td align="center">
                                <bean:write property="descEstado" name="lista"/>
                            </td>
                                <%--              <td align="center" >
                                  <bean:write property="fecha_creacion" name="lista"/>
                                </td>--%>
                            <td align="center">
                                <bean:write property="progreso" name="lista" filter="false"/>
                            </td>
                            <td align="center">
                                <html:link action="/mostrarDetalleLibro" paramName="lista" paramProperty="idLibro_origen"
                                           paramId="clave">
                                    <html:img border="0" page="/images/iconos/16/ojo.gif"
                                              altKey="tooltip.detallelibro"/>
                                </html:link>
                                <logic:equal value="1" name="lista" property="esCopiaLocal">
                                    <html:link action="/eliminarLibro" paramName="lista" paramProperty="idLibro"
                                               paramId="clave">
                                        <html:img border="0" page="/images/iconos/16/cancelar.jpg"
                                                  altKey="tooltip.borrarlibro"/>
                                    </html:link>
                                </logic:equal>
                            </td>
                        </tr>
                    </logic:notEqual>
                </logic:notEqual>
            </logic:notEqual>
        </logic:notEqual>
    </logic:iterate>
</table>
</logic:notEmpty>
</td>
</tr>
</table>
