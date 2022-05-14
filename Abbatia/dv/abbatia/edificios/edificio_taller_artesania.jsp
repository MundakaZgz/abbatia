<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%> 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<table border="1" width="80%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
<tr>
  <td align="center" style="border-bottom: none thin white;border-right: none thin white;" bgcolor="#E4CFA2">
	<b><font size="2">
		<bean:message key="edificios.abadia.contenido"/>
	  </font>
	</b>
  </td>
  <td align="center" bgcolor="#780A00">
   <html:link action="/mostrarEdificio?Tab=elaboracion" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
		<font color="#FFFFFF"><b><bean:message key="edificios.abadia.cocina.elaboracion.titulo"/></b></font>
   </html:link>
  </td>
</tr>
<tr>

<td bgcolor="#E4CFA2" colspan=2 style="border-top: none thin white;">
  <logic:notEmpty name="Edificio" property="contenido">
    <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
      <tr>
        <td colspan="4" bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.almacen.recursos"/>
            </font>
          </b>
        </td>
      </tr>
      <tr>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.almacen.descripcion"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.almacen.cantidad"/>
            </font>
          </b>
        </td>
          <td bgcolor="#E1C08B" align="center">
            <b><font color="#FFFFFF">
                <bean:message key="edificios.abadia.almacen.estado"/>
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
        <tr>
          <td>
            <bean:write property="descripcion" name="lista"/>
            <br/>
          </td>
          <td align="right">
            <bean:write property="cantidadF" name="lista"/>
            <br/>
          </td>
            <td align="center">
              <bean:write property="barra_HTML" name="lista" filter="false"/>
              <br/>
            </td>
            

          <td align="center">
              <a href="javascript:vender('<bean:write property="recursoID" name="lista" />', 'R');" >
                <html:img border="0" page="/images/iconos/16/vender.jpg" altKey="tooltip.vender"/>
              </a>

<%--
            <a href="mercado_vender.do?lid=<bean:write property="recursoID" name="lista" />&merc=R" >
              <html:img border="0" page="/images/iconos/16/vender.jpg" altKey="tooltip.vender"/>
            </a>
--%>
            <br/>
          </td>
        </tr>
      </logic:iterate>
    </table>
  </logic:notEmpty>
</td>


</tr>
</table>
