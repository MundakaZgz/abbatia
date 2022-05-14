<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>


<html:html>
  <head>
    <title>
      <bean:message key="mercado.compra.titulo" />
    </title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
  </head>
  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
    <center>

    <%-- Formulario para las búsquedas --%>
      <html:form action="/mercado_compra_agrupado">
        <table border="1" cellspacing="0" bordercolor="#000000" width="60%" bordercolorlight="#000000" bordercolordark="#000000" cellpadding="2">
          <tr height="20"><td align="center" bgcolor="#996633" colspan="4">
              <b><font color="#FFFFFF"  size="2">
                  <bean:message key="mercado.venta.filtro"/>
                </font>
              </b>
          </td></tr>
          <tr><td bgcolor="#E4CFA2">
              <table border="0" width="100%">
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b><bean:message key="mercado.venta.mercancias"/></b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <p align="left">
                      <html:select name="BuscarMercadoAgrupadoCompraForm" property="mercancia">
                        <html:options collection="mercancia_tipo" property="id" labelProperty="description"/>
                      </html:select>
                    </p>
                  </td>
                  <td>
                    <html:submit>
                      <bean:message key="mercado.compra.buscar"/>
                    </html:submit>
                    &nbsp;&nbsp;
                    <html:link href="mercado_compra_detalle.do" ><bean:message key="mercado.compra.avanzada"/></html:link>
                  </td>
                </tr>
              </table>
          </td></tr>
        </table>
      </html:form>
      <br/>

    <%-- Incluimos la barra de navegación --%>
    <logic:greaterThan name="MercadosListas" property="pages" value="0">
    <br/>
        <bean:write name="MercadosListas" property="navigate" filter="false"/>
    <br/>
    </logic:greaterThan>


    <div align="center">
      <table border="1" cellspacing="0" bordercolor="#000000" width="90%" bordercolorlight="#000000" bordercolordark="#000000">
         <%-- Título --%>
         <tr height="20">
             <td align="center" bgcolor="#996633">
              <b>
                  <font color="#FFFFFF"  size="2">
                      <bean:message key="mercado.compra.tabla.cabecera" />
                  </font>
              </b>
             </td>
         </tr>
         <tr>
          <td bgcolor="#E4CFA2">
            <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
            <%-- Cabecera --%>
            <tr>
              <td bgcolor="#E1C08B" align="center">
                  <b><font color="#FFFFFF">
                      <bean:message key="mercado.venta.tabla.descripcion"/>
                  </font></b>
              </td>
              <td bgcolor="#E1C08B" align="center">
                  <b><font color="#FFFFFF">
                      <bean:message key="mercado.venta.tabla.nrventas"/>
                  </font></b>
              </td>
              <td bgcolor="#E1C08B" align="center">
                  <b><font color="#FFFFFF">
                      <bean:message key="mercado.venta.tabla.ctotal"/>
                  </font></b>
              </td>
              <td bgcolor="#E1C08B" align="center">
                  <b><font color="#FFFFFF">
                      <bean:message key="mercado.venta.tabla.pminimo"/>
                  </font></b>
              </td>
              <td bgcolor="#E1C08B" align="center">
                  <b><font color="#FFFFFF">
                      <bean:message key="mercado.venta.tabla.pmaximo"/>
                  </font></b>
              </td>
              <td bgcolor="#E1C08B" align="center">
                  <b><font color="#FFFFFF">
                      <bean:message key="mercado.venta.tabla.opcion"/>
                  </font></b>
              </td>
            </tr>
            <%-- Cuerpo Tabla --%>
            <tr>
              <td bgcolor="#E4CFA2">
                <%-- Si la lista está vacía mostrar mensaje amigable --%>
                <logic:empty name="MercadosListas" property="lstCompra">
                  <tr><td colspan=6><center>No hay elementos disponibles</center><td></tr>
                </logic:empty>
                <%-- Mostrar la lista si tiene contenido --%>
                <logic:iterate id="lista" name="MercadosListas" property="lstCompra">
                  <tr>
                  <td>
                      <logic:notEmpty property="familia" name="lista">
                        <bean:write property="familia" name="lista" filter="false"/>&nbsp;:&nbsp;
                      </logic:notEmpty>
                      <b><a style="color:000000" href="mercado_compra_detalle.do?action=inicio&filtro=5&mercancia=<bean:write property="mercancia" name="lista" filter="false"/>&filtrocontents=<bean:write property="descripcion" name="lista" filter="false"/>">
                          <bean:write property="descripcion" name="lista" filter="false"/>
                      </a></b>
                      <logic:notEmpty property="nivel" name="lista">
                        &nbsp;(<bean:write property="nivel" name="lista" filter="false"/>)
                      </logic:notEmpty>
                  </td>
                  <td align="right">
                      <bean:write property="ventas" name="lista" filter="false"/>
                  </td>
                  <td align="right">
                      <bean:write property="cantidad" name="lista" filter="false"/>&nbsp;
                      <bean:write property="unidadDescripcion" name="lista" filter="false"/>
                  </td>
                  <td align="right">
                      <bean:write property="precioMinimo" name="lista" filter="false"/>
                  </td>
                  <td align="right">
                      <bean:write property="precioMaximo" name="lista" filter="false"/>
                  </td>
                  <td align="center">
                      <b><a style="color:000000" href="mercado_compra_detalle.do?action=inicio&filtro=5&mercancia=<bean:write property="mercancia" name="lista" filter="false"/>&filtrocontents=<bean:write property="descripcion" name="lista" filter="false"/>">
                          <bean:message key="mercado.ver"/>
                      </a></b>
                  </td>
                  </tr>
                </logic:iterate>
              </td>
            </tr>

          </table>
          </td>
        </tr>
      </table>
    </div>

    <%-- Incluimos la barra de navegación --%>
    <logic:greaterThan name="MercadosListas" property="pages" value="0">
    <br/>
        <bean:write name="MercadosListas" property="navigate" filter="false"/>
    <br/>
    </logic:greaterThan>

    </center>

    <%-- Publicidad --%>
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
  

  </body>
  <jsp:include page="/abadias/congelado.jsp"/>
</html:html>