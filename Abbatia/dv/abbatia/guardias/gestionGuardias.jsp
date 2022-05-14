<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<HTML>
  <HEAD>
    <TITLE>
      <bean:message key="guardias.titulo"/>
    </TITLE>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
  </HEAD>
  <BODY bgcolor="#E1C08B">
    <html:form action="/gestionGuardias.do" >
      <DIV align="center">
        <table border="1" width="70%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
          <tr>
            <td colspan="2" align="center" bgcolor="#996633">
              <b><font color="#FFFFFF"  size="2">
                  <bean:message key="guardias.principal"/>
                </font>
              </b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2">
              <center>
                <img src="images/soldadogrande.gif"/>
              </center>
            </td>
            <td bgcolor="#E4CFA2">
              <TABLE align="center" valign="middle" border="0" bgcolor="#E4CFA2">
                <TR>
                  <TD align="center" >
                    <bean:message key="guardias.numero"/>
                  </TD>
                </TR>
                <TR>
                  <TD align="center" >
                    <hr size="1" width="10%"/>
                    <b><bean:write name="datos_guardias" property="numGuardias"/></b>
                    <hr size="1" width="10%"/>
                  </TD>
                </TR>
                <TR>
                  <TD align="center" >
                    <bean:message key="guardias.coste1" /> <b><bean:write name="datos_guardias" property="salarioTotal"/></b> <bean:message key="viajar.confirmar.monedas" />
                  </TD>
                </TR>
                <TR>
                  <TD align="center" >
                    ( <b><bean:write name="datos_guardias" property="salarioGuardia"/></b> <bean:message key="guardias.coste2" /> )
                  </TD>
                </TR>
                <TR>
                  <TD colspan="2" align="center">
                    <table border="1" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000"  onMouseover="over_effect(event,'outset')" onMouseout="over_effect(event,'solid')" onMousedown="over_effect(event,'inset')" onMouseup="over_effect(event,'outset')">
                       <tr>
                         <br />
                         <td class="menu" width="90" align="center" valign="bottom">
                           <html:link action="/gestionGuardias?accion=contratar" >
                                <html:img  border="0" page="/images/iconos/guardia_contratar.gif" />
                                <br/>
                                <bean:message key="guardias.contratar"/>
                           </html:link>
                        </td>
                         <td class="menu" width="90" align="center" valign="bottom">
                           <html:link action="/gestionGuardias?accion=despedir">
                                <html:img  border="0" page="/images/iconos/guardia_despedir.gif" />
                                <br/>
                                <bean:message key="guardias.despedir"/>
                           </html:link>
                        </td>
                         <br />
                       </tr>
                     </table>
                  </TD>
                </TR>
                <tr>
                    <td align="center" >
                        <hr size="1" width="100%"/>
                        <bean:message key="guardias.info" />
                    </td>
                </tr>
                <TR>
                  <td align="center" colspan="2">
                     <logic:messagesPresent message="true">
                       <hr size="1" width="100%"/>
                       <html:messages id="msg" message="true">
                         <bean:write name="msg"/><br/>
                       </html:messages>
                     </logic:messagesPresent>
                  </td>
                </TR>
              </TABLE>
            </td>
          </tr>
        </table>
      </DIV>
    </html:form>
      <!-- Publicidad -->
      <logic:notEqual property="registrado" name="usuario" scope="session" value="1">
            <jsp:include page="/varios/publicidad.jsp"/>
      </logic:notEqual>
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
  
  </BODY>
</HTML>
