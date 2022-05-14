<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<table border="1" width="80%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
<tr>
  <td align="center" bgcolor="#780A00">
    <html:link action="/mostrarEdificio?Tab=init" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
	<b><font color="#FFFFFF" size="2">
		<bean:message key="edificios.abadia.contenido"/>
	  </font>
	</b>
   </html:link>
  </td>
  <td align="center" style="border-bottom: none thin white;border-right: none thin white;" bgcolor="#E4CFA2">
		<b><bean:message key="edificios.abadia.cocina.elaboracion.titulo"/></b>
  </td>
</tr>
<tr>
    <td align="center" colspan="2" bgcolor="#E4CFA2" style="border-top: none thin white;" >
    <html:form action="/elaborarAlimentos">
        <bean:message key="edificios.abadia.almacen.elaboracion.seleccion"/>
        <html:select name="datosElaboracion" property="idProducto"  onchange="elaborarRecurso(forms.datosElaboracion.idProducto.value);">
          <html:options collection="elaborables" property="id" labelProperty="description"/>
        </html:select>
<%--
        <html:submit>
            <bean:message key="edificios.abbatia.cocina.elaboracion.link" />
        </html:submit>
--%>
     </html:form>
    </td>
</tr>
<tr>
<td bgcolor="#E4CFA2" colspan=3 >
  <logic:notEmpty name="Edificio" property="contenido">
    <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
      <tr>
        <td colspan="6" bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.cocina.elaboracion.enelaboracion"/>
            </font>
          </b>
        </td>
      </tr>
      <tr>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.cocina.elaboracion.tabla.producto"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <font color="#FFFFFF"><b>
              <bean:message key="edificios.abadia.cocina.elaboracion.tabla.cantidad"/>
            </b>
          </font>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.cocina.elaboracion.tabla.fecha_inicio"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.cocina.elaboracion.tabla.estado"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.cocina.elaboracion.tabla.elaborado"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="usuario.opciones"/>
            </font>
          </b>
        </td>
      </tr>
      <logic:iterate id="lista" name="Edificio" property="contenido">
        <tr>
          <td>
            <bean:write property="descProducto" name="lista"/>
            <br/>
          </td>
          <td align="center" >
            <bean:write property="cantidad" name="lista"/>
            <br/>
          </td>
          <td align="center">
            <bean:write property="fecha_inicio" name="lista"/>
            <br/>
          </td>
          <td align="center">
            <bean:write property="descEstado" name="lista"/>
            <br/>
          </td>
          <td align="center">
            <bean:write property="elaboradoS" name="lista"/>
            <br/>
          </td>
          <td align="center">
            <logic:equal value="1" property="estado" name="lista">
              <html:link action="/elaboracion_pausar" paramName="lista" paramProperty="idElaboracion" paramId="clave" >
                <html:img border="0" page="/images/iconos/16/pausar.gif" altKey="tooltip.pausar"/>
              </html:link>
            </logic:equal>
            <logic:equal value="7" property="estado" name="lista">
              <html:link action="/elaboracion_reanudar" paramName="lista" paramProperty="idElaboracion" paramId="clave" >
                <html:img border="0" page="/images/iconos/16/reanudar.gif" altKey="tooltip.reanudar"/>
              </html:link>
            </logic:equal>
            <html:link action="/elaboracion_eliminar" paramName="lista" paramProperty="idElaboracion" paramId="clave" >
                <html:img border="0" page="/images/iconos/16/eliminar.gif" altKey="tooltip.eliminarelaboracion"/>
            </html:link>
            <br/>
          </td>
        </tr>
      </logic:iterate>
    </table>
  </logic:notEmpty>
  <logic:empty name="Edificio" property="contenido">
  	&nbsp;
  </logic:empty>
</td>

</tr>
</table>
