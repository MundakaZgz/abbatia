<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
  <head>
    <title>Pantalla mercado venta</title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
    <script type="text/javascript" src="/theme/validator.js"></script>
    <script type="text/javascript" src="/theme/overlibmws/overlibmws.js"></script>
    <script type="text/javascript" src="/theme/overlibmws/ajaxcontentmws.js"></script>
    <script type="text/javascript" src="/theme/overlibmws/iframecontentmws.js"></script>
    <script type="text/javascript" src="/theme/overlibmws/overlibmws_draggable.js"></script>
    <script type="text/javascript" src="/theme/overlibmws/overlibmws_scroll.js"></script>
    <script type="text/javascript" src="/theme/popup.js"></script>
    <html:javascript formName="MercadoCompraForm" dynamicJavascript="true" staticJavascript="false" />
  </head>
  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">

  <center>
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
                <img border="0" src="/images/iconos/16/monedas.jpg" alt="<bean:message key="principal.hint.moneda"/>"/>
              </td>
              <td width="50%" align="right">
               <logic:present name="monedas" >
                    <bean:write name="monedas" filter="false"/>
               </logic:present>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    
      <p>&nbsp;</p>
      <html:form action="/mercado_comprar" onsubmit="return validateMercadoCompraForm(this);">
        <html:hidden property="accion" value="comprar"/>
        <table border="1" cellspacing="0" bordercolor="#000000" width="80%" bordercolorlight="#000000" bordercolordark="#000000">
          <tr height="20">
            <td align="center" bgcolor="#996633">
              <b>
                <font color="#FFFFFF"  size="2">
                  <bean:message key="mercado.compra2.titulo" />
                </font>
              </b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2">
              <table border="0" width="100%">
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b>
                        <font size="3">
                          <bean:message key="mercado.compra2.producto" />
                        </font>
                      </b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <font size="3">
                      <b><bean:write name="MercadoCompraForm" property="descripcionFamilia"/></b>(<bean:write name="MercadoCompraForm" property="descripcionProducto"/>)
                    </font>
                  </td>
                </tr>
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b>
                        <font size="3">
                          <bean:message key="mercado.compra2.cantidad" />
                        </font>
                      </b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <font size="3">
                      <bean:write name="MercadoCompraForm" property="cantidadDisp"/> <bean:write name="MercadoCompraForm" property="descripcionUnidad"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b>
                        <font size="3">
                          <bean:message key="mercado.compra2.preciounidad" />
                        </font>
                      </b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <font size="3">
                      <bean:write name="MercadoCompraForm" property="precio"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b>
                        <font size="3">
                          <bean:message key="mercado.compra2.preciototal" />
                        </font>
                      </b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <font size="3">
                      <bean:write name="MercadoCompraForm" property="precioTotal"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b>
                        <font size="3">
                          <bean:message key="mercado.compra2.cantidad" />
                        </font>
                      </b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <html:text property="cantidad" size="5"/>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="center">
                    <html:checkbox property="volverAlMercado">
                        <bean:message key="mercado.compra2.volveralmercado" />
                    </html:checkbox>
                  </td>
                </tr>
                <logic:notEmpty name="MercadoCompraForm" property="impuestoRegion">
                    <tr>
                        <td align="center" colspan="2"  >
                            <hr size="1" width="80%"/>
                            <font size="3">
                              <b><bean:message key="mercado.compra.comisiones.transito" /></b>
                            </font>
                        </td>
                    </tr>
                    <logic:iterate id="impuestos" property="impuestoRegion" name="MercadoCompraForm"  >
                    <tr>
                       <td align="right" >
                        <bean:write name="impuestos" property="nombreRegion"/>
                       </td>
                       <td align="left" >
                        <bean:write name="impuestos" property="valorImpuesto"/> %
                       </td>
                    </tr>
                    </logic:iterate>
                  </logic:notEmpty>
                <tr>
                  <td align="center" colspan="2">
                    <hr size="1" width="80%"/>
                    <input type="button" onClick="window.parent.cClick();" value="<bean:message key="mercado.compra2.cerrar"/>"/>&nbsp;
                    <html:submit>
                      <bean:message key="mercado.compra2.comprar"/>
                    </html:submit>
                  </td>
                </tr>
                <TR>
                  <TD align="center" colspan="2">
                    <html:errors/>
                  </TD>
                </TR>
            </table>
          </table>
      </html:form>
      <!-- Publicidad -->
    <logic:present name="usuario" >
      <logic:notEqual property="registrado" name="usuario" scope="session" value="1">
            <jsp:include page="/varios/publicidad.jsp"/>
      </logic:notEqual>
    </logic:present>
    </center>
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
