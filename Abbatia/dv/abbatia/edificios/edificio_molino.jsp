<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<table border="1" width="60%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
<tr>
  <td align="center" bgcolor="#996633">
	<b><font color="#FFFFFF"  size="2">
		<bean:message key="edificios.abadia.contenido"/>
	  </font>
	</b>
  </td>
</tr>
<tr>

<td bgcolor="#E4CFA2">
  <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
    <tr>
      <td colspan="9" bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificio.abadia.molino.titulo"/>
          </font>
        </b>
      </td>
    </tr>
    <tr>
      <td align="center" colspan="6">
        <a href="javascript:molerCereales();">
            <bean:message key="edificio.abadia.molino.moler"/>
        </a>
<%--
        <html:link action="/molerCereales.do">
          <bean:message key="edificio.abbatia.molino.moler"/>
         </html:link>
--%>
      </td>
    </tr>

    <tr>
      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificio.abadia.molino.tabla.producto"/>
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificio.abadia.molino.tabla.recurso"/>
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <font color="#FFFFFF"><b>
            <bean:message key="edificio.abadia.molino.tabla.fecha_entrada"/>
          </b>
        </font>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <b>
          <font color="#FFFFFF">
            <bean:message key="edificio.abadia.molino.tabla.cantidadinicial"/>
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificio.abadia.molino.tabla.cantidadactual"/>
          </font>
        </b>
      </td>

      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificio.abadia.molino.tabla.estado"/>
          </font>
        </b>
      </td>
    </tr>
    <logic:iterate id="lista" name="Edificio" property="contenido">
      <tr>
        <td align="center">
          <bean:write property="productoid_desc" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="recursoid_desc" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="fecha_inicio" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="cantidad_ini" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="cantidad_act" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="barra_HTML" name="lista" filter="false" />
          <br/>
        </td>
      </tr>
    </logic:iterate>
  </table>
  <br/>
</td>


</tr>
</table>
