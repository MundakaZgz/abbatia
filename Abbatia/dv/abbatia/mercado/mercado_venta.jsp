<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html:html>
  <head>
    <title><bean:message key="mercado.venta.tituloventa" /> </title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
      <link REL="STYLESHEET" HREF="/theme/default.css" TYPE="text/css"/>
      <link rel="stylesheet" href="/theme/popup.css" type="text/css">
      <script type="text/javascript" src="/theme/overlibmws/overlibmws.js"></script>
      <script type="text/javascript" src="/theme/overlibmws/ajaxcontentmws.js"></script>
      <script type="text/javascript" src="/theme/overlibmws/iframecontentmws.js"></script>
      <script type="text/javascript" src="/theme/overlibmws/overlibmws_draggable.js"></script>
      <script type="text/javascript" src="/theme/overlibmws/overlibmws_scroll.js"></script>
      <script type="text/javascript" src="/theme/popup.js"></script>
      <script type="text/javascript">
        <!--
        function vender(p_ProductoId, p_MercTipo)
        {
            openPopupIFrame('/mercado_vender.do?lid=' + p_ProductoId + '&merc=' + p_MercTipo,700,390,"VentaProducto");
        }
        function venderAgrupado(p_ProductoId, p_MercTipo)
        {
            openPopupIFrame('/mercado_vender_agrupado_inicio.do?lid=' + p_ProductoId + '&merc=' + p_MercTipo,700,450,"VentaProductoAgrupado");
        }
        function sacrificarAnimal(p_Clave)
        {
            openPopupIFrame('/sacrificar_animal.do?clave=' + p_Clave,600,300,"SacrificarAnimal");
        }
        function cancelarVenta(p_ProductoId)
        {
            openPopupIFrame('/cancelar_venta_inicio.do?pid=' + p_ProductoId,600,300,"CancelarVenta");
        }
        function modificarVenta(p_ProductoId)
        {
            openPopupIFrame('/modificar_venta_inicio.do?pid=' + p_ProductoId,600,300,"ModificarVenta");
        }
        function elaborarAlimento(p_ProductoId)
        {
          if (p_ProductoId != 0)
          {
            openPopupIFrame('/mostrarRequisitosElaboracionAlimentos.do?pid=' + p_ProductoId,600,250,"ElaborarAlimentos");
          }
        }
        function molerCereales()
        {
            openPopupIFrame('/molerCereales_inicio.do',600,250,'MolerCereales');
        }

        -->
      </script>

  </head>
  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
    <html:form method="POST" action="/mercado_venta_1">
      <DIV align="center">
        <html:submit value="Poner a la venta productos"></html:submit>
      </DIV>
    </html:form>
    <div align="center">
      <table border="1" cellspacing="0" bordercolor="#000000" width="90%" bordercolorlight="#000000" bordercolordark="#000000">
        <tr height="20">
          <td align="center" bgcolor="#996633"><b><font color="#FFFFFF" ><bean:message key="mercado.venta.productosenventa"/></font></b> </td>
        </tr>
        <tr>
          <td bgcolor="#E4CFA2">
            <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
              <tr>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"></font></b></FONT></td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tipoventa" /></font></b> </FONT></td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.descripcion" /> </font></b> </FONT></td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.fecha" />
                        <br/><bean:message key="mercado.venta.tabla.inicio" />
                      </font>
                    </b>
                  </FONT>
                </td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.fecha" />
                        <br/><bean:message key="mercado.venta.tabla.finalizacion" />
                      </font>
                    </b>
                  </FONT>
                </td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.cantidad" /></font></b> </FONT></td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.precio" /></font></b> </FONT></td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.precio" />
                        <br/><bean:message key="mercado.venta.tabla.total" />
                      </font>
                    </b>
                  </FONT>
                </td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.opcion" /></font></b> </FONT></td>
              </tr><FONT size="1">
                <logic:iterate id="lista" name="MercadosListas" property="lstVenta">
                  <bean:write property="description" name="lista" filter="false"/>
                </logic:iterate>
              </FONT>
            </table>
          </td>
        </tr>
      </table>
    </div>
    <br>
    <div align="center">
      <table border="1" cellspacing="0" bordercolor="#000000" width="90%" bordercolorlight="#000000" bordercolordark="#000000">
        <tr height="20">
          <td align="center" bgcolor="#996633">
              <b><font color="#FFFFFF" ><bean:message key="mercado.venta.productosenventacerrada"/></font></b>
          </td>
      </tr>
        <tr>
            <td bgcolor="#E4CFA2">
                <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080"
                       bordercolordark="#808080">
                    <tr>
                        <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"></font></b></FONT>
                        </td>
                        <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tipoventa" /></font></b> </FONT></td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.descripcion" /> </font></b> </FONT></td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.fecha" />
                        <br/><bean:message key="mercado.venta.tabla.inicio" />
                      </font>
                    </b>
                  </FONT>
                </td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.fecha" />
                        <br/><bean:message key="mercado.venta.tabla.finalizacion" />
                      </font>
                    </b>
                  </FONT>
                </td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.cantidad" /></font></b> </FONT></td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.precio" /></font></b> </FONT></td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.precio" />
                        <br/><bean:message key="mercado.venta.tabla.total" />
                      </font>
                    </b>
                  </FONT>
                </td>
                <td bgcolor="#E1C08B" align="center"><FONT size="1"><b><font color="#FFFFFF"><bean:message key="mercado.venta.tabla.opcion" /></font></b> </FONT></td>
              </tr>
              <FONT size="1">
                <logic:iterate id="lista" name="MercadosListas" property="lstVenta2">
                  <bean:write property="description" name="lista" filter="false"/>
                </logic:iterate>
              </FONT>
            </table>
          </td>
        </tr>
      </table>
    </div>

    <p>&nbsp;</p>
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
  <jsp:include page="/abadias/congelado.jsp"/>
</html:html>
