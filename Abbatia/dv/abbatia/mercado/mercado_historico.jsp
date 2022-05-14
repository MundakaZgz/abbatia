<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>


<html>
<head>
	<title>Pantalla mercado historico</title>
	<link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css">
</head>
<body topmargin="2" leftmargin="2"  bgcolor="#E1C08B" text="#000000">

    <center>
      <html:form action="/mercado_historico">
        <table border="1" cellspacing="0" bordercolor="#000000" width="30%" bordercolorlight="#000000" bordercolordark="#000000" cellpadding="2">
          <tr height="20"><td align="center" bgcolor="#996633" colspan="4">
              <b><font color="#FFFFFF"  size="2">
                  <bean:message key="mercado.venta.filtro"/>
                </font>
              </b>
          </td></tr>
          <tr>
            <td bgcolor="#E4CFA2">
              <table border="0" width="100%">
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b><bean:message key="mercado.venta.mercancias"/></b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <p align="left">
                      <html:select name="MercadoAdminForm" property="mercancia">
                        <html:options collection="mercancia_tipo" property="id" labelProperty="description"/>
                      </html:select>
                    </p>
                  </td>
                  <td>
                    <html:submit>
                      <bean:message key="mercado.compra.buscar"/>
                    </html:submit>
                  </td>
                </tr>
              </table>
          </td>
         </tr>
        </table>
      </html:form>
      <br/>
    </center>

    <center>
            <table border="1" cellspacing="0" bordercolor="#000000" width="80%" bordercolorlight="#000000" bordercolordark="#000000">
              <tr height=20>
                <td align="center" bgcolor="#996633"><b><font color="#FFFFFF"  size="2"><bean:message key="mercado.historico.titulo.compras"/></font></b></td>
              </tr>
              <tr>
                <td bgcolor="#E4CFA2">
                  <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
                    <tr>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.abadia"/></font></b></td>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.fecha"/></font></b></td>
                      <td bgcolor="#E1C08B" align="center"><font color="#FFFFFF"><b><bean:message key="mercado.historico.descripcion"/></b></font></td>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.cantidad"/></font></b></td>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.punitario"/></font></b></td>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.ptotal"/></font></b></td>
                    </tr>

	                <logic:iterate id="lista" name="compras">
                      <tr>
                        <td><bean:write name="lista" property="abadia" /></td>
                        <td align="center" ><bean:write name="lista" property="fecha" /></td>
                        <td><b><bean:write name="lista" property="descripcion" /></b></td>
                        <td align="right" ><bean:write name="lista" property="cantidad" /></td>
                        <td align="right" ><bean:write name="lista" property="precioUnidad" /></td>
                        <td align="right" ><bean:write name="lista" property="precioTotal" /></td>
                      </tr>
        	        </logic:iterate>
           	     </table>
               </td>
            </tr>
          </table>
    </center>

    <center>
            <table border="1" cellspacing="0" bordercolor="#000000" width="80%" bordercolorlight="#000000" bordercolordark="#000000">
              <tr height=20>
                <td align="center" bgcolor="#996633"><b><font color="#FFFFFF"  size="2"><bean:message key="mercado.historico.titulo.ventas"/></font></b></td>
              </tr>
              <tr>
                <td bgcolor="#E4CFA2">
                  <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
                    <tr>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.abadia"/></font></b></td>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.fecha"/></font></b></td>
                      <td bgcolor="#E1C08B" align="center"><font color="#FFFFFF"><b><bean:message key="mercado.historico.descripcion"/></b></font></td>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.cantidad"/></font></b></td>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.punitario"/></font></b></td>
                      <td bgcolor="#E1C08B" align="center"><b><font color="#FFFFFF"><bean:message key="mercado.historico.ptotal"/></font></b></td>
                    </tr>

	                <logic:iterate id="lista" name="ventas">
                    <tr>
                      <td><bean:write name="lista" property="abadia" /></td>
                      <td align="center" ><bean:write name="lista" property="fecha" /></td>
                      <td><b><bean:write name="lista" property="descripcion" /></b></td>
                      <td align="right"><bean:write name="lista" property="cantidad" /></td>
                      <td align="right"><bean:write name="lista" property="precioUnidad" /></td>
                      <td align="right"><bean:write name="lista" property="precioTotal" /></td>
                    </tr>
        	        </logic:iterate>
           	      </table>
               </td>
            </tr>
          </table>
    </center>


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
</html>
