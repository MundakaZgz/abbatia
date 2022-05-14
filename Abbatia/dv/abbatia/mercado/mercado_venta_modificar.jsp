<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
  <head>
    <title><bean:message key="mercado.modificar.venta.titulo" /></title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
  </head>
  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
    <center>
      <p>&nbsp;</p>
      <html:form action="/modificar_venta_fin">

        <table border="1" cellspacing="0" bordercolor="#000000" width="80%" bordercolorlight="#000000" bordercolordark="#000000">
          <tr height="20">
            <td align="center" bgcolor="#996633">
              <b><font color="#FFFFFF"  size="2"><bean:message key="mercado.modificar.venta.principal" /></font></b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2">
              <table border="0" width="100%">
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b><font size="3"><bean:message key="mercado.modificar.venta.producto" /></font></b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <font size="3">
                      <b><bean:write name="DatosVentaForm" property="descripcionFamilia"/></b>(<bean:write name="DatosVentaForm" property="descripcionProducto"/>)
                    </font>
                  </td>
                </tr>
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b><font size="3"><bean:message key="mercado.modificar.venta.cantidad" /></font></b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <font size="3">
                      <bean:write name="DatosVentaForm" property="cantidad"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b><font size="3"><bean:message key="mercado.modificar.venta.preciounidad" /></font></b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <font size="3">
                      <html:text name="DatosVentaForm" property="precio" size="5"/>
                    </font>
                  </td>
                </tr>
               <tr>
                 <td align="center" colspan="2" >
                    <html:checkbox property="venderACiudad" name="DatosVentaForm" /> <bean:message key="mensaje.vender.venderaciudad" /> <bean:write property="precioVentaCiudad" name="DatosVentaForm"/>
                  </td>
               </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <p align="center">
                <input type="button" onclick="window.parent.cClick();" value="Atr�s" />
      					<html:submit>
            		  <bean:message key="mercado.modificar.venta.modificar"/>
                </html:submit>
              </p>
            </td>
          </tr>
			   <tr>
				  <td align="center">
            <html:errors/>
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
