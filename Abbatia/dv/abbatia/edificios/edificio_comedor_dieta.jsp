<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<table border="1" width="60%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
<tr>
  <td align="center" style="border-bottom: none thin white" bgcolor="#E4CFA2">
		<b><bean:message key="edificios.comedor.dieta"/></b>
  </td>
</tr>
<tr>

<td bgcolor="#E4CFA2" style="border-top: none thin white;">
   <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
      <tr>
        <td colspan="4" bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.comedor.dieta.detalle"/>
            </font>
          </b>
        </td>
      </tr>
      <tr>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.comedor.dieta.familia"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <font color="#FFFFFF"><b>
              <bean:message key="edificios.comedor.dieta.disponible"/>
            </b>
          </font>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.comedor.dieta.requisitosdiarios"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.comedor.dieta.deficid"/>
            </font>
          </b>
        </td>
      </tr>
      <logic:iterate id="lista" name="familias">
        <tr>
          <td align="left">
            <logic:lessEqual value="0" property="deficid" name="lista">
                <font color="red">
            </logic:lessEqual>
            <b><bean:write property="descripcion" name="lista"/></b>
            <logic:lessEqual value="0" property="deficid" name="lista">
                </font>
            </logic:lessEqual>
            <br/>
          </td>
          <td align="right" >
            <logic:lessEqual value="0" property="deficid" name="lista">
                <font color="red">
            </logic:lessEqual>
            <bean:write property="cantidadDisponibleString" name="lista"/>
            <logic:lessEqual value="0" property="deficid" name="lista">
                </font>
            </logic:lessEqual>
            <br/>
          </td>
          <td align="right">
            <logic:lessEqual value="0" property="deficid" name="lista">
              <font color="red">
            </logic:lessEqual>
            <bean:write property="cantidadNecesariaString" name="lista"/>
            <logic:lessEqual value="0" property="deficid" name="lista">
              </font>
            </logic:lessEqual>
            <br/>
          </td>
          <td align="right">
           <logic:lessEqual value="0" property="deficid" name="lista">
            <font color="red">
           </logic:lessEqual>
            <bean:write property="deficid" name="lista"/>
           <logic:lessEqual value="0" property="deficid" name="lista">
            </font>
           </logic:lessEqual>
            <br/>
          </td>
        </tr>
      </logic:iterate>
   	</table>
</td>

</tr>
</table>
