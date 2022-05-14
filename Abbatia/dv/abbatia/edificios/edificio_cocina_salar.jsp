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
  <td align="center" bgcolor="#780A00">
   <html:link action="/mostrarEdificio?Tab=elaboracion" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
		<font color="#FFFFFF"><b><bean:message key="edificios.abadia.cocina.elaboracion.titulo"/></b></font>
   </html:link>
  </td>
  <td align="center" style="border-bottom: none thin white;border-right: none thin white;" bgcolor="#E4CFA2">
        <b><bean:message key="edificios.abadia.cocina.salar.titulo"/></b>
  </td>
  <td align="center" bgcolor="#780A00">
   <html:link action="/mostrarEdificio?Tab=monjes" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
		<font color="#FFFFFF"><b><bean:message key="edificios.abadia.monjes"/></b></font>
   </html:link>
  </td>
</tr>
<tr>

<td bgcolor="#E4CFA2" colspan=4 style="border-top: none thin white;">
  <logic:notEmpty name="Edificio" property="contenido">
    <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
      <tr>
        <td colspan="4" bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.cocina.alimentos.lote"/>
            </font>
          </b>
        </td>
      </tr>
      <tr>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.cocina.alimentos.tabla.descripcion"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <font color="#FFFFFF"><b>
              <bean:message key="edificios.abadia.cocina.alimentos.tabla.cantidad"/>
            </b>
          </font>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.cocina.alimentos.tabla.fechacaducidad"/>
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
          <td align="left">
            <bean:write property="familiaDescripcion" name="lista"/>&nbsp;(<b><bean:write property="descripcion" name="lista"/></b>)
            <br/>
          </td>
          <td align="right" >
            <bean:write property="cantidadS" name="lista"/>
            <br/>
          </td>
          <td align="center">
            <bean:write property="fechaCaducidad" name="lista"/>
            <br/>
          </td>
          <td align="center">
            <a href="javascript:vender('<bean:write property="idLote" name="lista" />', 'A');" >
              <html:img border="0" page="/images/iconos/16/vender.jpg" altKey="tooltip.vender"/>
            </a>
            <logic:greaterThan value="0" name="lista" property="idAlimentoSalado">
                <a href="salar_alimento_lote.do?clave=<bean:write property="idLote" name="lista" />" >
                  <html:img border="0" page="/images/iconos/16/salar.gif" altKey="tooltip.salar"/>
                </a>
            </logic:greaterThan>
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
