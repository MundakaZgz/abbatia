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
  <logic:notEmpty name="Edificio" property="contenido">
    <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
      <tr>
        <td colspan="10" bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales"/>
            </font>
          </b>
        </td>
      </tr>
      <tr>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.cantidad"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.nivel"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.descripcion"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.salud"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <font color="#FFFFFF"><b>
              <bean:message key="edificios.abadia.granja.animales.tabla.fechanacimiento"/>
            </b>
          </font>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.carne"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center" colspan="4">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.tabla.opciones"/>
            </font>
          </b>
        </td>
      </tr>
      <logic:iterate id="lista" name="Edificio" property="contenido">
        <logic:equal name="lista" property="fecha_embarazo" value="00-00-0000" >
          <logic:equal name="lista" property="aislado" value="0" >
          <tr>
            <td align="center">
              <bean:write property="cantidad" name="lista"/>
              <br/>
            </td>
            <td align="center">
              <bean:write property="nivel" name="lista"/>
              <br/>
            </td>
            <td>
              <bean:write property="descTipo" name="lista"/><b> (<bean:write property="nombre" name="lista"/>)</b>
              <br/>
            </td>
            <td align="center">
              <bean:write property="barra_HTML" name="lista" filter="false" />
              <br/>
            </td>
            <td align="center">
              <bean:write property="fecha_nacimiento" name="lista"/>
              <br/>
            </td>
            <td align="center">
              <bean:write property="carneMin" name="lista"/>/
              <bean:write property="carneMax" name="lista"/>
              <br/>
            </td>
            <td align="center">
              <a href="javascript:sacrificarAnimal('<bean:write property="clave" name="lista" />');" >
                <html:img border="0" page="/images/iconos/16/sacrificar.jpg" altKey="tooltip.sacrificar"/>
              </a>
              <a href="javascript:vender('<bean:write property="clave" name="lista" />', 'N');" >
                <html:img border="0" page="/images/iconos/16/vender.jpg" altKey="tooltip.vender"/>
              </a>
              <a href="aislarAnimal.do?clave=<bean:write property="animalid" name="lista" />" >
                <html:img border="0" page="/images/iconos/16/separar.gif" altKey="tooltip.aislar"/>
              </a>
              <logic:equal name="lista" property="tipoAnimalid" value="11" >
                <logic:greaterEqual name="lista" property="nivel" value="3" >
                    <a href="caparToro.do?clave=<bean:write property="animalid" name="lista" />" >
                      <html:img border="0" page="/images/iconos/16/capar.gif" altKey="tooltip.capar"/>
                    </a>
                </logic:greaterEqual>
              </logic:equal>
              <logic:equal name="lista" property="puedeTrabajar" value="1" >
                  <html:link action="/asignarAnimalAgricultura" paramId="clave" paramName="lista" paramProperty="animalid">
                    <logic:equal property="trabaja" name="lista" value="1">
                        <html:img border="0" page="/images/iconos/16/trabaja_no.gif" altKey="tooltip.trabaja.agricultura.no"/>
                    </logic:equal>
                    <logic:equal property="trabaja" name="lista" value="0">
                        <html:img border="0" page="/images/iconos/16/trabaja_si.gif" altKey="tooltip.trabaja.agricultura.si"/>
                    </logic:equal>
                  </html:link>
              </logic:equal>
              </td>
           </tr>
          </logic:equal>
        </logic:equal>
      </logic:iterate>
    </table>
    <br/>

    <!--Muestra los animales aislados-->
    <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
      <tr>
        <td colspan="10" bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.aislados"/>
            </font>
          </b>
        </td>
      </tr>
      <tr>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.cantidad"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.nivel"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.descripcion"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.salud"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <font color="#FFFFFF"><b>
              <bean:message key="edificios.abadia.granja.animales.tabla.fechanacimiento"/>
            </b>
          </font>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.carne"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center" colspan="4">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.tabla.opciones"/>
            </font>
          </b>
        </td>
      </tr>
      <logic:iterate id="lista" name="Edificio" property="contenido">
        <logic:equal name="lista" property="fecha_embarazo" value="00-00-0000" >
          <logic:equal name="lista" property="aislado" value="1" >
              <tr>
                <td align="center">
                  <bean:write property="cantidad" name="lista"/>
                  <br/>
                </td>
                <td align="center">
                  <bean:write property="nivel" name="lista"/>
                  <br/>
                </td>
                <td>
                  <bean:write property="descTipo" name="lista"/><b> (<bean:write property="nombre" name="lista"/>)</b>
                  <br/>
                </td>
                <td align="center">
                  <bean:write property="barra_HTML" name="lista" filter="false" />
                  <br/>
                </td>
                <td align="center">
                  <bean:write property="fecha_nacimiento" name="lista"/>
                  <br/>
                </td>
                <td align="center">
                  <bean:write property="carneMin" name="lista"/>/
                  <bean:write property="carneMax" name="lista"/>
                  <br/>
                </td>
                <td align="center">
                  <a href="javascript:sacrificarAnimal('<bean:write property="clave" name="lista" />');" >
                    <html:img border="0" page="/images/iconos/16/sacrificar.jpg" altKey="tooltip.sacrificar"/>
                  </a>
                  <a href="javascript:vender('<bean:write property="clave" name="lista" />', 'N');" >
                    <html:img border="0" page="/images/iconos/16/vender.jpg" altKey="tooltip.vender"/>
                  </a>
                  <html:link action="/devolverAnimal" paramId="clave" paramName="lista" paramProperty="animalid">
                    <html:img border="0" page="/images/iconos/16/juntar.gif" altKey="tooltip.juntar"/>
                  </html:link>

                  <logic:equal name="lista" property="tipoAnimalid" value="11" >
                      <logic:greaterEqual name="lista" property="nivel" value="3" >
                          <html:link action="/caparToro" paramId="clave" paramName="lista" paramProperty="animalid">
                            <html:img border="0" page="/images/iconos/16/capar.gif" altKey="tooltip.capar"/>
                          </html:link>
                      </logic:greaterEqual>
                  </logic:equal>
                  <logic:equal name="lista" property="puedeTrabajar" value="1" >
                      <html:link action="/asignarAnimalAgricultura" paramId="clave" paramName="lista" paramProperty="animalid">
                        <logic:equal property="trabaja" name="lista" value="1">
                            <html:img border="0" page="/images/iconos/16/trabaja_no.gif" altKey="tooltip.trabaja.agricultura.si"/>
                        </logic:equal>
                        <logic:equal property="trabaja" name="lista" value="0">
                            <html:img border="0" page="/images/iconos/16/trabaja_si.gif" altKey="tooltip.trabaja.agricultura.no"/>
                        </logic:equal>
                      </html:link>
                </logic:equal>
                </td>
              </tr>
          </logic:equal>
        </logic:equal>
      </logic:iterate>
    </table>

    <br/>
    <!--Muestra las hembras preñadas-->
    <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
      <tr>
        <td colspan="7" bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.embarazadas"/>
            </font>
          </b>
        </td>
      </tr>
      <tr>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.cantidad"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.nivel"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.descripcion"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.salud"/>
            </font>
          </b>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <font color="#FFFFFF"><b>
              <bean:message key="edificios.abadia.granja.animales.tabla.fechanacimiento"/>
            </b>
          </font>
        </td>
        <td bgcolor="#E1C08B" align="center">
          <b><font color="#FFFFFF">
              <bean:message key="edificios.abadia.granja.animales.tabla.fechaparto"/>
            </font>
          </b>
        </td>
      </tr>
      <logic:iterate id="lista" name="Edificio" property="contenido">
        <logic:notEqual name="lista" property="fecha_embarazo" value="00-00-0000" >
        <tr>
          <td align="center">
            <bean:write property="cantidad" name="lista"/>
            <br/>
          </td>
          <td align="center">
            <bean:write property="nivel" name="lista"/>
            <br/>
          </td>
          <td>
            <bean:write property="descTipo" name="lista"/><b> (<bean:write property="nombre" name="lista"/>)</b>
            <br/>
          </td>
          <td align="center">
            <bean:write property="barra_HTML" name="lista" filter="false" />
            <br/>
          </td>
          <td align="center">
            <bean:write property="fecha_nacimiento" name="lista"/>
            <br/>
          </td>
          <td align="center">
            <bean:write property="fecha_embarazo" name="lista"/>
          </td>
        </tr>
        </logic:notEqual>
      </logic:iterate>
    </table>

  </logic:notEmpty>
</td>


</tr>
</table>
