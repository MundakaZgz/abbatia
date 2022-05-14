<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
  <head>
    <link REL="STYLESHEET" HREF="theme/styles.css" TYPE="text/css"/>
  </head>
  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
    <p align="right">
      <logic:notEmpty name="DatosContents">
            <table border="1" width="130" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
              <tr>
                <td align="center" bgcolor="#F0AF1C">
                  <font color="#000000" size="1" ><bean:message key="principal.recursos"/></font>
                </td>
              </tr>
              <tr>
                <td bgcolor="#F7FEEA" align="center">
                  <table border="0" width="100%">
                    <tr>
                      <td width="50%" align="center">
                        <img border="0" src="images/iconos/16/monedas.jpg" alt="<bean:message key="principal.hint.moneda"/>"/>
                      </td>
                      <td width="50%" align="right">
                        <bean:write name="DatosContents" property="recursoMonedas" filter="false"/>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
        </logic:notEmpty>
    </p>
    <center>
    <html:form action="/viajar">
        <html:hidden name="ViajarForm" property="accion" value="aceptar"/>
        <html:hidden name="ViajarForm" property="abadiaid_origen"/>
        <html:hidden name="ViajarForm" property="abadiaid_destino"/>
        <html:hidden name="ViajarForm" property="abadia_origen"/>
        <html:hidden name="ViajarForm" property="abadia_destino"/>
        <html:hidden name="ViajarForm" property="total"/>
        <html:hidden name="ViajarForm" property="total_caballo"/>
        <html:hidden name="ViajarForm" property="dias_pie"/>
        <html:hidden name="ViajarForm" property="dias_caballo"/>

        <table border="1" cellspacing="0" bordercolor="#000000" width="60%" bordercolorlight="#000000" bordercolordark="#000000">
          <tr height="20">
            <td align="center" bgcolor="#996633">
              <b>
              <font color="#FFFFFF"  size="2">
                <bean:message key="viajar.confirmar.cabecera" />
              </font>
              </b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2">
              <table border="0" width="100%">
                <tr>
                  <td align="right">
                    <b><bean:message key="viajar.confirmar.region.origen" />:</b>
                  </td>
                  <td><bean:write name="ViajarForm" property="region_origen" /></td>
                </tr>
                <tr>
                  <td align="right">
                    <b><bean:message key="viajar.confirmar.abadia.origen" />:</b>
                  </td>
                  <td><bean:write name="ViajarForm" property="abadia_origen" /></td>
                </tr>
                <tr>
                  <td align="right">
                    <b><bean:message key="viajar.confirmar.region.destino" />:</b>
                  </td>
                  <td><bean:write name="ViajarForm" property="region_destino" /></td>
                </tr>
                <tr>
                  <td align="right">
                    <b><bean:message key="viajar.confirmar.abadia.destino" />:</b>
                  </td>
                  <td><bean:write name="ViajarForm" property="abadia_destino" /></td>
                </tr>
                <tr>
                  <td align="right">
                    <b><bean:message key="viajar.confirmar.tiempo" />:</b>
                  </td>
                  <td>
                      <html:select name="ViajarForm" property="tiempo">
                        <html:option value="2"><bean:message key="viajar.confirmar.tiempo.2dias"  /></html:option>
                        <html:option value="7"><bean:message key="viajar.confirmar.tiempo.7dias"  /></html:option>
                        <html:option value="15"><bean:message key="viajar.confirmar.tiempo.15dias"  /></html:option>
                        <html:option value="30"><bean:message key="viajar.confirmar.tiempo.1mes"  /></html:option>
                        <html:option value="0"><bean:message key="viajar.confirmar.tiempo.indefinido"  /></html:option>
                      </html:select>
                  </td>
                </tr>
                <tr>
                  <td algin="center" align="center" colspan="2">
                    <hr size=1 width="80%">
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <table width="100%" border="1" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
                       <tr>
                         <td></td>
                         <td align="center"><b><bean:message key="viajar.confirmar.dias.pie" /></b></td>
                         <td align="center"><b><bean:message key="viajar.confirmar.dias.caballo" /></b></td>
                       </tr>
                       <tr>
                         <td align="right"><b><bean:message key="viajar.confirmar.dias.camino" />:</b></td>
                         <td align="right" class="sinborder"><bean:write name="ViajarForm" property="dias_camino_pie" />
                             &nbsp;<bean:message key="viajar.confirmar.dias" />
                         </td>
                         <td align="right" class="sinborder"><bean:write name="ViajarForm" property="dias_camino_caballo" />
                             &nbsp;<bean:message key="viajar.confirmar.dias" />
                         </td>
                       </tr>
                       <tr>
                         <td align="right"><b><bean:message key="viajar.confirmar.dias.montanya" />:</b></td>
                         <td align="right" class="sinborder"><bean:write name="ViajarForm" property="dias_montanya_pie" />
                             &nbsp;<bean:message key="viajar.confirmar.dias" />
                         </td>
                         <td align="right" class="sinborder"><bean:write name="ViajarForm" property="dias_montanya_caballo" />
                             &nbsp;<bean:message key="viajar.confirmar.dias" />
                         </td>
                       </tr>
                       <logic:notEqual name="ViajarForm" property="dias_barco" value="0">
                           <tr>
                             <td align="right"><b><bean:message key="viajar.confirmar.dias.mar" />:</b></td>
                             <td align="right" colspan="2" class="sinborder">
                                <bean:write name="ViajarForm" property="dias_barco" />&nbsp;<bean:message key="viajar.confirmar.dias" />
                             </td>
                        </tr>
                       </logic:notEqual>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td algin="center" algin="center" colspan="2">
                    <hr size=1 width="80%">
                  </td>
                </tr>
                <logic:equal name="Caballo" value="1">
                <tr>
                  <td align="right">
                    <b><bean:message key="viajar.confirmar.coste_caballo" />:</b>
                  </td>
                  <td>
                    <b> <font colo444r="#990000">
                    <bean:write name="ViajarForm" property="total_caballo" />&nbsp;<bean:message key="viajar.confirmar.monedas" />
                    </font>
                    </b>
                  </td>
                </tr>
                </logic:equal>
                <tr>
                  <td align="right">
                    <b><bean:message key="viajar.confirmar.coste_pie" />:</b>
                  </td>
                  <td>
                    <b><font color="#990000">
                      <bean:write name="ViajarForm" property="total" />&nbsp;<bean:message key="viajar.confirmar.monedas" />
                      </font>
                    </b>
                  </td>
                </tr>
                <tr>
                  <td algin="center" algin="center" colspan="2">
                    <hr size=1 width="80%">
                  </td>
                </tr>
                <tr>
                  <td align="right">
                    <b><bean:message key="viajar.confirmar.monje" />:</b>
                  </td>
                  <td>
                      <html:select name="ViajarForm" property="monjeid">
                         <html:options collection="monjes" property="id" labelProperty="description"/>
                      </html:select>
                  </td>
                </tr>
                <logic:equal name="Caballo" value="1">
                <tr>
                  <td align="center" colspan="2">
                    <html:checkbox name="ViajarForm" property="caballo"/> &nbsp;
                    <b><bean:message key="viajar.confirmar.caballo" /></b>
                  </td>
                </tr>
                </logic:equal>
                <logic:notEmpty name="msgCaballo" scope="request" >
                    <tr>
                      <td align="center" colspan="2">
                        <b><bean:write name="msgCaballo" /></b>
                      </td>
                    </tr>
                </logic:notEmpty>
                <tr>
                  <td algin="center" algin="center" colspan="2">
                    <hr size=1 width="80%">
                  </td>
                </tr>
                </table>
            </td>
          </tr>
          <tr>
            <td>
              <p align="center">
                <input type="button" onclick="javascript:history.back();" value="<bean:message key="general.atras"/>" />
      			<html:submit>
            		  <bean:message key="mensajes.confirmacion.boton.aceptar"/>
                </html:submit>
              </p>
            </td>
          </tr>
        </table>
      </html:form>
    </center>
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
</html>
