<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>


<table border="1" width="80%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
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
      <td colspan="10" bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.campo.titulo"/>
          </font>
        </b>
      </td>
    </tr>
    <tr>
      <td align="center" colspan="10">
        <html:link action="/nuevo_campo">
          <bean:message key="edificios.abadia.campo.nuevo"/>
         </html:link>
      </td>
    </tr>
    <tr>
      <td bgcolor="#E1C08B" colspan="3"/>
      <td bgcolor="#E1C08B" align="center" colspan="2">
          <b>
            <font color="#FFFFFF">
              <bean:message key="edificios.abadia.campo.fechacultivo"/>
            </font>
          </b>
      </td>
      <td bgcolor="#E1C08B" align="center" colspan="2" >
          <b>
            <font color="#FFFFFF">
              <bean:message key="edificios.abadia.campo.fecharecogida"/>
            </font>
          </b>
      </td>
      <td bgcolor="#E1C08B">

      </td>
      <td bgcolor="#E1C08B">

      </td>
      <td bgcolor="#E1C08B">

      </td>
    </tr>

    <tr>
      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.campo.fechacreacion"/>
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.campo.estado"/>
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <font color="#FFFFFF"><b>
            <bean:message key="edificios.abadia.campo.alimento"/>
          </b>
        </font>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <b>
          <font color="#FFFFFF">
            <bean:message key="edificios.abadia.campo.inicio"/>
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.campo.fin"/>
          </font>
        </b>
      </td>

      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.campo.inicio"/>
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.campo.fin"/>
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.campo.nummonjes"/>
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center">
        <b><font color="#FFFFFF">Stat
          </font>
        </b>
      </td>
      <td bgcolor="#E1C08B" align="center" colspan="3">
        <b><font color="#FFFFFF">
            <bean:message key="edificios.abadia.tabla.opciones"/>
          </font>
        </b>
      </td>
    </tr>
    <logic:iterate id="lista" name="Edificio" property="contenido">
      <tr>
        <td align="center">
          <bean:write property="fechaCreacion" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="descEstado" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="descAlimento" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="fechaInicioCultivo" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="fechaFinCultivo" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="fechaInicioRecogida" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="fechaFinRecogida" name="lista"/>
          <br/>
        </td>
        <td align="center">
          <bean:write property="numMonjes" name="lista"/>
          <br/>
        </td>

        <td align="center">
          <bean:write property="barras_visualiza" name="lista" filter="false"/>
        </td>
        <td align="center">
          &nbsp;
            <a href="javascript:mostrarMonjesAgricultura('<bean:write property="idCultivo" name="lista" />');" >
              <html:img border="0" page="/images/iconos/16/monjes.gif" altKey="tooltip.campo.seleccionar.monjes"/>
            </a>
            
<%--
          <html:link action="/mostrarListaMonjesAgricultura" paramId="clave" paramName="lista" paramProperty="idCultivo">
            <html:img border="0" page="/images/iconos/16/monjes.gif" altKey="tooltip.campo.seleccionar.monjes"/>
          </html:link>
--%>
          <logic:equal name="lista" property="idEstado" value="2">
            <a href="javascript:sembrarCampo('<bean:write property="idCultivo" name="lista" />');" >
              <html:img border="0" page="/images/iconos/16/sembrar.gif" altKey="tooltip.sembrar"/>
            </a>

<%--
            <html:link action="/sembrar_campo" paramId="clave" paramName="lista" paramProperty="idCultivo">
              <html:img border="0" page="/images/iconos/16/sembrar.gif" altKey="tooltip.sembrar"/>
            </html:link>
--%>
          </logic:equal>
          <logic:notEqual name="lista" property="idEstado" value="1">
            <html:link action="/arar_campo" paramId="clave" paramName="lista" paramProperty="idCultivo">
              <html:img border="0" page="/images/iconos/16/ararcampo.gif" altKey="tooltip.arar"/>
            </html:link>
          </logic:notEqual>
          <logic:equal name="lista" property="idEstado" value="1">
            <logic:lessThan name="lista" property="arado_total" value="24000" >
                <logic:greaterThan name="lista" property="arado_total" value="1000" >
                    <a href="javascript:sembrarCampoPrematura('<bean:write property="idCultivo" name="lista" />');" >
                      <html:img border="0" page="/images/iconos/16/sembrar.gif" altKey="tooltip.sembrar.prematuro"/>
                    </a>

<%--
                    <html:link action="/siembraPrematura" paramId="clave" paramName="lista" paramProperty="idCultivo">
                        <html:img border="0" page="/images/iconos/16/sembrar.gif" altKey="tooltip.sembrar.prematuro"/>
                    </html:link>
--%>
                </logic:greaterThan>
            </logic:lessThan>
          </logic:equal>
          <logic:lessEqual name="lista" property="siembra_total" value="0">
              <logic:greaterThan name="lista" property="idEstado" value="3">
                <html:link action="/cancelar_campo" paramId="clave" paramName="lista" paramProperty="idCultivo">
                  <html:img border="0" page="/images/iconos/16/cancelar.jpg" altKey="tooltip.cancelarcampo"/>
                </html:link>
              </logic:greaterThan>
          </logic:lessEqual>
        </td>
      </tr>
    </logic:iterate>
  </table>
  <br/>
</td>


</tr>
</table>
