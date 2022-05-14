<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html:html>
<head>
	<title>Pantalla muestra monje</title>
	<link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css">
</head>

<body topmargin="0" leftmargin="0" bgcolor="#E1C08B">

<center>
<table borderColor="#000000" width="400" cellSpacing="0" borderColorDark="#000000" borderColorLight="#000000" border="1">
    <tr>
      <td bgColor="#e4cfa2" colSpan="3">
	<table width="100%" background="images/backgrounds/madera.jpg" cellSpacing="0" border="0">
          <tr>
	    <td align="middle" width="5%">
	      <logic:notEqual name="Monje" property="anteriorID" value="0">
        	<html:link action="/mostrarMonje" paramId="clave" paramName="Monje" paramProperty="anteriorID">
		     <html:img  border="0" page="/images/iconos/16/corner_left.gif" altKey="general.anterior" />
	        </html:link>
	      </logic:notEqual>
	    </td>
	    <td align="middle" width="90%">
	      <p align="center"><b><font color="#ffffff" face="Tahoma" size="2"><bean:message key="monjes.abadia.datos"/></font></b></p>
	    </td>
	    <td align="middle" width="5%">
	      <logic:notEqual name="Monje" property="siguienteID" value="0">
	        <html:link action="/mostrarMonje" paramId="clave" paramName="Monje" paramProperty="siguienteID">
	          <html:img  border="0" page="/images/iconos/16/corner_right.gif" altKey="general.siguiente" />
	        </html:link>
	      </logic:notEqual>
	    </td>
          </tr>
          </table>
      </td>
    </tr>
    <tr>
      <td bgColor="#e4cfa2" colSpan="3">
        <table border="0">
            <tr>
              <td align="center" width="50" rowspan="5" valign="middle">
                <p align="center">
                    <logic:lessEqual value="18" property="edad" name="Monje">
                        <img src="/images/monje_1.gif">
                    </logic:lessEqual>
                    <logic:greaterThan value="18" property="edad" name="Monje">
                        <logic:lessEqual value="40" property="edad" name="Monje">
                            <img src="/images/iconos/monje.gif">
                        </logic:lessEqual>
                        <logic:greaterThan value="40" property="edad" name="Monje">
                            <img src="/images/monje_3.gif">
                        </logic:greaterThan>
                    </logic:greaterThan>
                </p>
                <p align="center"><bean:write name="Monje" property="HTMLEnfermedad" filter="false" /> </p>
              </td>
              <td align="right"><b><bean:message key="monjes.abadia.nombre"/></b></td>
              <td colspan="2">
                <bean:write name="Monje" property="nombre" filter="false"/>&nbsp;<bean:message key="monjes.abadia.nomciudad"/>&nbsp;
                <bean:write name="Monje" property="primerApellido" filter="false"/>
              </td>
            </tr>
            <tr>
            <td align="right">
                <p align="right"><b><bean:message key="monjes.abadia.fecha_nacimiento"/></b></p>
            </td>
            <td colspan="2">
                <bean:write name="Monje" property="fechaDeNacimiento" filter="false"/>
            </td>
            </tr>
            <tr>
              <td align="right"><b><bean:message key="monjes.abadia.edad"/></b></td>
              <td colspan="2"><bean:write name="Monje" property="edad"/>&nbsp;<bean:message key="monjes.abadia.anyos"/></td>
            </tr>
            <tr>
              <td align="right"><b><bean:message key="monjes.abadia.fecha_entrada"/></b></td>
              <td colspan="2">
                <bean:write name="Monje" property="fechaDeEntradaEnAbadia" filter="false"/>
              </td>
            </tr>
            <!-- Est&aacute; muerto???? -->
            <logic:equal property="estado" name="Monje" value="1">
              <tr>
                <td>
                  <font  size="2"><b><bean:message key="monjes.abadia.fecha_fallecimiento"/></b></font>
                </td>
                <td colspan="2">
                  <bean:write name="Monje" property="fechaDeFallecimiento" filter="false"/>
                </td>
              </tr>
            </logic:equal>
            <tr>
              <td align="right"><b><bean:message key="monjes.abadia.jerarquia"/></b></td>
              <td colspan="2">
                <bean:write name="Monje" property="jerarquia" filter="false"/>
                <logic:equal value="0" name="hayabad">
                  <logic:equal value="1" name="Monje" property="idDeJerarquia">
                   <logic:equal property="estado" name="Monje" value="0">
	                  <html:link action="/nombrarAbad"  paramId="clave" paramName="Monje" paramProperty="idDeMonje" >
        	            ( <bean:message key="monjes.abadia.abad"/> )
                	  </html:link>
                    </logic:equal>  
                  </logic:equal>
                </logic:equal>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center">
                  <logic:equal value="1" name="Monje" property="idDeJerarquia">
                   <logic:equal property="estado" name="Monje" value="0">
	                  <html:link action="/expulsarMonje" paramId="clave" paramName="Monje" paramProperty="idDeMonje" >
        	            <b>( <bean:message key="monjes.abadia.expulsar"/> )</b>
                	  </html:link>
                    </logic:equal>
                  </logic:equal>
              </td>
            </tr>
            <tr>
              <td colspan="4">
                <hr  size="1">
              </td>
            </tr>
            <logic:notEqual property="estado" name="Monje" value="1">
              <tr>
                <td colspan="2">
                    <table border="0" width="100%">
                     <tr>
                                <td align="right"><b><bean:message key="monjes.abadia.salud"/></b></td>
                                <td><bean:write name="Monje" property="barra_salud" filter="false"/></td>
                                <logic:present name="evaluar" scope="request" >
                                    <td><bean:write name="Monje" property="imgSalud_eval" filter="false" /></td>
                                </logic:present>

                     </tr>
                     <tr>
                                <td align="right"><b><bean:message key="monjes.abadia.fe"/></b></td>
                                <td><b><bean:write name="Monje" property="barra_fe" filter="false"/></b></td>
                     </tr>
                    </table>
                </td>
                <td colspan="2">
                        <table border="0" width="100%">
                          <tr>
                                <td align="right"><font face="Tahoma" size="1"><bean:message key="monjes.abadia.proteinas"/></font></td>
                                <td><bean:write name="Monje" property="barra_proteinas" filter="false"/></td>
                                <logic:present name="evaluar" scope="request" >
                                    <td><bean:write name="Monje" property="imgProteinas_eval" filter="false" /></td>
                                </logic:present>
                                <td align="right"><font face="Tahoma" size="1"><bean:message key="monjes.abadia.grasas"/></font></td>
                                <td><bean:write name="Monje" property="barra_lipidos" filter="false"/></td>
                                <logic:present name="evaluar" scope="request" >
                                    <td><bean:write name="Monje" property="imgLipidos_eval" filter="false" /></td>
                                </logic:present>

                          </tr>
                          <tr>
                                <td align="right"><font face="Tahoma" size="1"><bean:message key="monjes.abadia.carbono"/></font></td>
                                <td><bean:write name="Monje" property="barra_hidratosCarbono" filter="false"/></td>
                                <logic:present name="evaluar" scope="request" >
                                    <td><bean:write name="Monje" property="imgHidratos_eval" filter="false" /></td>
                                </logic:present>

                                <td align="right"><font face="Tahoma" size="1"><bean:message key="monjes.abadia.vitaminas"/></font></td>
                                <td><bean:write name="Monje" property="barra_vitaminas" filter="false"/></td>
                                <logic:present name="evaluar" scope="request" >
                                    <td><bean:write name="Monje" property="imgVitaminas_eval" filter="false" /></td>
                                </logic:present>
                          </tr>
                        </table>
                </td>
            </tr>
            <tr>
              <td colspan="4">
                <hr size="1">
              </td>
            </tr>
            </logic:notEqual>

            <tr>
                      <td align="right" width="48"><b><bean:message key="monjes.abadia.idioma"/></b></td>
                      <td><bean:write name="Monje" property="barra_idioma" filter="false"/></td>
                      <td align="right"><b><bean:message key="monjes.abadia.talento"/></b></td>
                      <td width="129"><bean:write name="Monje" property="barra_talento" filter="false"/></td>
            </tr>
            <tr>
                      <td align="right" width="48"><b><bean:message key="monjes.abadia.carisma"/></b></td>
                      <td><bean:write name="Monje" property="barra_carisma" filter="false"/></td>
                      <td align="right"><b><bean:message key="monjes.abadia.sabiduria"/></b></td>
                      <td width="129"><bean:write name="Monje" property="barra_sabiduria" filter="false"/></td>
            </tr>
            <tr>
                      <td align="right" width="48"><b><bean:message key="monjes.abadia.fuerza"/></b></td>
                      <td><bean:write name="Monje" property="barra_fuerza" filter="false"/></td>
                      <td align="right"><b><bean:message key="monjes.abadia.destreza"/></b></td>
                      <td width="129"><bean:write name="Monje" property="barra_destreza" filter="false"/></td>
            </tr>
        </table>
      </td>
    </tr>
</table>
&nbsp;
<!--- TAREAS DEL MONJE -->
<logic:notEqual property="estado" name="Monje" value="1">  <!-- no esta muerto -->
 <logic:notEqual property="estado" name="Monje" value="3">  <!-- no esta de viaje -->
  <logic:notEqual property="estado" name="Monje" value="2">  <!-- no esta enfermo -->
   <logic:lessThan property="nivelEnfermedad" name="Monje" value="3">  <!-- no esta enfermo -->
    <table width="90%" >
    <tr>
      <td vAlign="top" align="middle" width="100%">
        <html:form action="/actualizarDatosMonje">
          <html:hidden property="idMonje" />
          <table borderColor="#000000" cellSpacing="0" borderColorDark="#000000" width="100%" borderColorLight="#000000" border="1">
              <tr>
                <td align="middle" bgColor="#996633">
                  <p align="center"><b><font color="#ffffff"><bean:message key="monjes.trabajos"/></font></b></p>
                </td>
              </tr>
              <tr>
                <td bgColor="#e4cfa2">
                  <table width="100%" border="0">
                      <tr>
                        <td align="left">
                          <p align="center"><font face="Tahoma" size="1">(0h 15m)</font><br>
                          <b><bean:message key="monjes.trabajos.maitines"/></b></p>
                        </td>
                        <td align="left"><p align="center"><font face="Tahoma" size="1">(2h 15m)</font><br>
                          <b><bean:message key="monjes.trabajos.laudes" /></b></p>
                        </td>
                        <td align="left"><p align="center"><font face="Tahoma" size="1">(7h 00m)</font><br>
                          <b><bean:message key="monjes.trabajos.prima" /></b></p>
                        </td>
                        <td align="left"><p align="center"><font face="Tahoma" size="1">(10h 00m)</font><br>
                          <b><bean:message key="monjes.trabajos.tercia" /></b></p>
                        </td>
                        <td align="left"><p align="center"><font face="Tahoma" size="1">(12h 00m)</font><br>
                          <b><bean:message key="monjes.trabajos.sexta" /></b></p>
                        </td>
                        <td align="left"><p align="center"><font face="Tahoma" size="1">(14h 00m)</font><br>
                          <b><bean:message key="monjes.trabajos.nona" /></b></p>
                        </td>
                        <td align="left"><p align="center"><font face="Tahoma" size="1">(16h 15m)</font><br>
                          <b><bean:message key="monjes.trabajos.visperas" /></b></p>
                        </td>
                        <td align="left"><p align="center"><font face="Tahoma" size="1">(18h 45m)</font><br>
                          <b><bean:message key="monjes.trabajos.angelus" /></b></p>
                        </td>
                      </tr>
                      <tr>
                        <td align="center"><bean:message key="monjes.tarea.rezar"/></td>
                        <td align="center"><bean:message key="monjes.tarea.rezar"/></td>
                        <td align="center">
                            <!--si el periodo NO está bloqueado Prima-->
                            <logic:equal value="0" name="MonjeForm" property="actPrima_bloqueado" >
                                <html:select name="MonjeForm" property="actPrima">
                                  <html:options collection="actividades" property="id" labelProperty="description"/>
                                </html:select>
                            </logic:equal>
                            <!--si el periodo está bloqueado Prima-->
                            <logic:equal value="1" name="MonjeForm" property="actPrima_bloqueado" >
                                 <bean:write name="MonjeForm" property="actPrima_link" filter="false" />
                                 <html:hidden name="MonjeForm" property="actPrima" />
                            </logic:equal>
	                        <html:link action="/mostrar_produccion" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
		                      <html:img  border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.ver" />
  			                </html:link>
                       	</td>
                        <td align="center">
                            <!--si el periodo NO está bloqueado Tercia-->
                            <logic:equal value="0" name="MonjeForm" property="actTercia_bloqueado" >
                                <html:select name="MonjeForm" property="actTercia">
                                  <html:options collection="actividades" property="id" labelProperty="description"/>
                                </html:select>
                            </logic:equal>
                            <!--si el periodo está bloqueado Tercia-->
                            <logic:equal value="1" name="MonjeForm" property="actTercia_bloqueado" >
                                 <bean:write name="MonjeForm" property="actTercia_link" filter="false" />
                                 <html:hidden name="MonjeForm" property="actTercia" />
                            </logic:equal>
	                        <html:link action="/mostrar_produccion" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
		                      <html:img  border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.ver" />
  			                </html:link>
                        </td>
                        <td align="center">
                        	<bean:message key="monjes.tarea.comer" />
                        </td>
                        <td align="center">
                            <!--si el periodo NO está bloqueado Nona-->
                            <logic:equal value="0" name="MonjeForm" property="actNona_bloqueado" >
                                <html:select name="MonjeForm" property="actNona">
                                  <html:options collection="actividades" property="id" labelProperty="description"/>
                                </html:select>
                            </logic:equal>
                            <!--si el periodo está bloqueado Nona-->
                            <logic:equal value="1" name="MonjeForm" property="actNona_bloqueado" >
                                 <bean:write name="MonjeForm" property="actNona_link" filter="false" />
                                 <html:hidden name="MonjeForm" property="actNona" />
                            </logic:equal>
	                        <html:link action="/mostrar_produccion" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
		                      <html:img  border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.ver" />
  			                </html:link>
                        </td>
                        <td align="center">
                            <!--si el periodo NO está bloqueado Vispera-->
                            <logic:equal value="0" name="MonjeForm" property="actVispera_bloqueado" >
                                <html:select name="MonjeForm" property="actVispera">
                                  <html:options collection="actividades" property="id" labelProperty="description"/>
                                </html:select>
                            </logic:equal>
                            <!--si el periodo está bloqueado Vispera-->
                            <logic:equal value="1" name="MonjeForm" property="actVispera_bloqueado" >
                                 <bean:write name="MonjeForm" property="actVispera_link" filter="false" />
                                 <html:hidden name="MonjeForm" property="actVispera" />
                            </logic:equal>
	                        <html:link action="/mostrar_produccion" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
		                      <html:img  border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.ver" />
  			                </html:link>
                        </td>
                        <td align="center"><bean:message key="monjes.tarea.rezar"/></td>
                      </tr>
                      <tr>
                        <td align="center">
                          <logic:equal name="Monje" property="actMaitines_completado" value="1">
			                <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.realizado" />
                          </logic:equal>
                        </td>
                        <td align="center">
                          <logic:equal name="Monje" property="actLaudes_completado" value="1">
			                <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.realizado" />
                          </logic:equal>
                        </td>
                        <td align="center">
                          <logic:equal name="Monje" property="actPrima_completado" value="1">
			                <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.realizado" />
                          </logic:equal>
                        </td>
                        <td align="center">
                          <logic:equal name="Monje" property="actTercia_completado" value="1">
			                <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.realizado" />
                          </logic:equal>
                        </td>
                        <td align="center">
                          <logic:equal name="Monje" property="actSexta_completado" value="1">
			                <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.realizado" />
                          </logic:equal>
                        </td>
                        <td align="center">
                          <logic:equal name="Monje" property="actNona_completado" value="1">
			                <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.realizado" />
                          </logic:equal>
                        </td>
                        <td align="center">
                          <logic:equal name="Monje" property="actVispera_completado" value="1">
			                <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.realizado" />
                          </logic:equal>
                        </td>
                        <td align="center">
                          <logic:equal name="Monje" property="actAngelus_completado" value="1">
			                <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.realizado" />
                          </logic:equal>
                        </td>
                      </tr>
                  </table>
                </td>
              </tr>
              <tr>
              <%-- Aqui insertamos la gestion de las dietas--%>
              <table borderColor="#000000" cellSpacing="0" borderColorDark="#000000" width="100%" borderColorLight="#000000" border="1">
                  <tr>
                    <td align="middle" bgColor="#996633">
                      <p align="center"><b><font color="#ffffff" face="Tahoma" size="2"><bean:message key="monjes.abadia.dieta" /></font></b></p>
                    </td>
                  </tr>
                  <tr>
                    <td bgColor="#e4cfa2">
                      <table width="100%" border="0">
                          <tr>
                            <td align="center"><b><bean:message key="monjes.abadia.dieta1" /></b></td>
                            <td align="center"><b><bean:message key="monjes.abadia.dieta2" /></b></td>
                            <td align="center"><b><bean:message key="monjes.abadia.dieta3" /></b></td>
                            <td align="center"><b><bean:message key="monjes.abadia.dieta4" /></b></td>
                            <td align="center"><b><bean:message key="monjes.abadia.dieta5" /></b></td>
                          </tr>
                          <tr>
                            <td align="center">
                              <html:select name="MonjeForm" property="comeFamiliaID1" disabled="true" >
                                <html:options collection="alifam" property="id" labelProperty="description"/>
                              </html:select>
                              <!--img alt="Tarea Realizada" src="marca.gif" border="0" width="16" height="16"-->
                            </td>
                            <td align="center">
                              <html:select name="MonjeForm" property="comeFamiliaID2" disabled="true">
                                <html:options collection="alifam" property="id" labelProperty="description"/>
                              </html:select>
                              <!--img alt="Tarea Realizada" src="marca.gif" border="0" width="16" height="16"-->
                            </td>
                            <td align="center">
                              <html:select name="MonjeForm" property="comeFamiliaID3" disabled="true">
                                <html:options collection="alifam" property="id" labelProperty="description"/>
                              </html:select>
                              <!--img alt="Tarea Realizada" src="marca.gif" border="0" width="16" height="16"-->
                            </td>
                            <td align="center">
                              <html:select name="MonjeForm" property="comeFamiliaID4" disabled="true">
                                <html:options collection="alifam" property="id" labelProperty="description"/>
                              </html:select>
                              <!--img alt="Tarea Realizada" src="marca.gif" border="0" width="16" height="16"-->
                            </td>
                            <td align="center">
                              <html:select name="MonjeForm" property="comeFamiliaID5" disabled="true">
                                <html:options collection="alifam" property="id" labelProperty="description"/>
                              </html:select>
                              <!--img alt="Tarea Realizada" src="marca.gif" border="0" width="16" height="16"-->
                            </td>
                          </tr>
                          <tr>
                            <td align="center">
                              <logic:notEqual property="comeFamiliaID1" name="Monje" value="0">
                                  <logic:equal property="ha_comidoFamiliaID1" name="Monje" value="-1">
                                    <html:img  border="0" page="/images/iconos/16/marca_roja.gif" altKey="tooltip.nocomido" />
                                  </logic:equal>
                                  <logic:equal property="ha_comidoFamiliaID1" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.comido" />
                                  </logic:equal>
                                  <logic:greaterThan property="ha_comidoFamiliaID1" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca_azul.gif" altKey="tooltip.nocomidolomismo" />
                                  </logic:greaterThan>
                              </logic:notEqual>
                            </td>
                            <td align="center">
                              <logic:notEqual property="comeFamiliaID2" name="Monje" value="0">
                                  <logic:equal property="ha_comidoFamiliaID2" name="Monje" value="-1">
                                    <html:img  border="0" page="/images/iconos/16/marca_roja.gif" altKey="tooltip.nocomido" />
                                  </logic:equal>
                                  <logic:equal property="ha_comidoFamiliaID2" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.comido" />
                                  </logic:equal>
                                  <logic:greaterThan property="ha_comidoFamiliaID2" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca_azul.gif" altKey="tooltip.nocomidolomismo" />
                                  </logic:greaterThan>
                              </logic:notEqual>
                            </td>
                            <td align="center">
                              <logic:notEqual property="comeFamiliaID3" name="Monje" value="0">
                                  <logic:equal property="ha_comidoFamiliaID3" name="Monje" value="-1">
                                    <html:img  border="0" page="/images/iconos/16/marca_roja.gif" altKey="tooltip.nocomido" />
                                  </logic:equal>
                                  <logic:equal property="ha_comidoFamiliaID3" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.comido" />
                                  </logic:equal>
                                  <logic:greaterThan property="ha_comidoFamiliaID3" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca_azul.gif" altKey="tooltip.nocomidolomismo" />
                                  </logic:greaterThan>
                              </logic:notEqual>
                            </td>
                            <td align="center">
                              <logic:notEqual property="comeFamiliaID4" name="Monje" value="0">
                                  <logic:equal property="ha_comidoFamiliaID4" name="Monje" value="-1">
                                    <html:img  border="0" page="/images/iconos/16/marca_roja.gif" altKey="tooltip.nocomido" />
                                  </logic:equal>
                                  <logic:equal property="ha_comidoFamiliaID4" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.comido" />
                                  </logic:equal>
                                  <logic:greaterThan property="ha_comidoFamiliaID4" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca_azul.gif" altKey="tooltip.nocomidolomismo" />
                                  </logic:greaterThan>
                              </logic:notEqual>
                            </td>
                            <td align="center">
                              <logic:notEqual property="comeFamiliaID5" name="Monje" value="0">
                                  <logic:equal property="ha_comidoFamiliaID5" name="Monje" value="-1">
                                    <html:img  border="0" page="/images/iconos/16/marca_roja.gif" altKey="tooltip.nocomido" />
                                  </logic:equal>
                                  <logic:equal property="ha_comidoFamiliaID5" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca.gif" altKey="tooltip.comido" />
                                  </logic:equal>
                                  <logic:greaterThan property="ha_comidoFamiliaID5" name="Monje" value="0" >
                                    <html:img  border="0" page="/images/iconos/16/marca_azul.gif" altKey="tooltip.nocomidolomismo" />
                                  </logic:greaterThan>
                              </logic:notEqual>
                            </td>
                          </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td height=40>
                      <p align="center">
                          <!-- Sólo se puede modificar si está en tú abadia, si esta de visita en mi abadia y es un monje, o
                              si es un obispo, cardenal o papa y esta de visita en otra abadia ( la abadia destino no puede modificar ) -->
                          <!-- ABADIA ORIGEN -->
                          <logic:equal name="Visita_miabadia" value="0">
                             <logic:notEqual property="estado" name="Monje" value="4">
                                <html:submit value="Modificar" property="accion" />
                                <html:reset value="Restablecer"/>
                                <!--html:submit value="Evaluar Dieta" property="accion" /-->
                             </logic:notEqual>
                             <logic:equal property="estado" name="Monje" value="4">
                                  <logic:lessThan property="idDeJerarquia" name="Monje" value="3">
                                      <bean:message key="monjes.abadia.dieta.devisita" />
                                  </logic:lessThan>
                                  <logic:greaterThan property="idDeJerarquia" name="Monje" value="2">
                                     <html:submit value="Modificar" property="accion" />
                                     <html:reset value="Restablecer"/>
                                     <!--html:submit value="Evaluar Dieta" property="accion" /-->
                                  </logic:greaterThan>
                             </logic:equal>
                          </logic:equal>
                          <!-- ABADIA DESTINO, MONJE DE VISITA -->
                          <logic:equal name="Visita_miabadia" value="1">
                              <logic:lessThan property="idDeJerarquia" name="Monje" value="3">
                                 <html:submit value="Modificar" property="accion" />
                                 <html:reset value="Restablecer"/>
                                 <!--html:submit value="Evaluar Dieta" property="accion" /-->
                              </logic:lessThan>
                              <logic:greaterThan property="idDeJerarquia" name="Monje" value="2">
                                  <bean:message key="monjes.abadia.dieta.visita" />
                              </logic:greaterThan>
                          </logic:equal>
                        </p>
                    </td>
                  </tr>
              </table>
                <%-- Fin insercion de gestion de dietas.--%>
              </tr>
          </table>
        </html:form>
      </td>
    </tr>
</table>


<br>

 </logic:lessThan>
</logic:notEqual>
</logic:notEqual>
</logic:notEqual>


<!-- MENSAJES -->
      <table cellSpacing="0" bgColor="#780A00" width="90%" border="0">
        <tr>
          <td>
            <p align="center"><b><font color="#ffffff"><bean:message key="monjes.abadia.mensajes" /></font></b></p>
          </td>
        </tr>
      </table>
      <table borderColor="#000000" cellSpacing="0" style="border-style:solid; border-width:1; border-color: 000000;" width="90%" border="1">
        <tr>
          <td bgcolor="#E4CFA2">
            <table width="100%">
              <logic:iterate id="ultamens" name="Monje" property="mensajesMonje">
                <tr>
                  <td>
                     <bean:write property="description" name="ultamens" filter="false"/>
                  </td>
                </tr>
              </logic:iterate>
            </table>&nbsp;
          </td>
        </tr>
      </table>

  </center>
      <!-- Publicidad -->
      <logic:present name="usuario" scope="session" >
          <logic:notEqual property="registrado" name="usuario" scope="session" value="1">
                <jsp:include page="/varios/publicidad.jsp"/>
          </logic:notEqual>
      </logic:present>

<!--Inicio Script para google-analytics-->
<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost +
    "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-302272-1");
    pageTracker._initData();
    pageTracker._trackPageview();
</script>
<!--Fin Script para google-analytics-->


</body>
</html:html>
