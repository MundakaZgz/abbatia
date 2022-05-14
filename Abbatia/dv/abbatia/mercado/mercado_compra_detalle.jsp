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

    <link rel="stylesheet" href="/theme/popup.css" type="text/css">
    <script type="text/javascript" src="/theme/overlibmws/overlibmws.js"></script>
    <script type="text/javascript" src="/theme/overlibmws/ajaxcontentmws.js"></script>
    <script type="text/javascript" src="/theme/overlibmws/iframecontentmws.js"></script>
    <script type="text/javascript" src="/theme/overlibmws/overlibmws_draggable.js"></script>
    <script type="text/javascript" src="/theme/overlibmws/overlibmws_scroll.js"></script>
    <script type="text/javascript" src="/theme/popup.js"></script>


<script language="JavaScript" type="text/javascript">
<%-- Funciones javascript para la gestión de los filtros --%>
<!--
function resetear() {
  document.BuscarMercadoCompraForm.ordenid.value=0;
  document.BuscarMercadoCompraForm.orden.value=0;
  document.BuscarMercadoCompraForm.pagina.value=0;
}

function buscaPorFiltro(filtro,filtrocontents) {
  resetear();
  document.BuscarMercadoCompraForm.filtro.value=filtro;
  document.BuscarMercadoCompraForm.filtrocontents.value=filtrocontents;
  document.BuscarMercadoCompraForm.submit();
}

function ordenarLista(campo,sentido) {
  document.BuscarMercadoCompraForm.ordenid.value=campo;
  document.BuscarMercadoCompraForm.orden.value=sentido;
  document.BuscarMercadoCompraForm.pagina.value=0;
  document.BuscarMercadoCompraForm.submit();
}

function saltarPagina(pagina) {
  document.BuscarMercadoCompraForm.pagina.value=pagina;
  document.BuscarMercadoCompraForm.submit();
}
function comprar(p_ProductoId)
{
    openPopupIFrame('/mercado_comprar.do?pid=' + p_ProductoId,600,390,"CompraProducto");
}

-->
</script>

      <%-- Formulario para las búsquedas --%>
      <html:form action="/mercado_compra_detalle">
        <html:hidden name="BuscarMercadoCompraForm" property="orden" />
        <html:hidden name="BuscarMercadoCompraForm" property="ordenid" />
        <html:hidden name="BuscarMercadoCompraForm" property="pagina" />
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
                      <b><bean:message key="mercado.compra.mercado"/></b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <p align="left">
                      <html:select  property="mercado">
                        <html:options collection="mercado" property="id" labelProperty="description"/>
                      </html:select>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <p align="right">&nbsp;
                      <b><bean:message key="mercado.compra.tipo"/></b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <html:select property="tipo">
                      <html:options collection="compra_tipo" property="id" labelProperty="description"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b><bean:message key="mercado.venta.mercancias"/></b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <p align="left">
                      <html:select property="mercancia">
                        <html:options collection="mercancia_tipo" property="id" labelProperty="description"/>
                      </html:select>
                    </p>
                  </td>
                  <td width="25%">
                    <p align="right">
                      <b><bean:message key="mercado.venta.familias"/></b>
                    </p>
                  </td>
                  <td width="25%">
                    <p align="left">
                      <select size="1" name="familia">
                        <option>Todos</option>&nbsp;
                      </select>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td width="25%">
                    <p align="right">
                      <b><bean:message key="mercado.compra.avanzada"/></b>
                    </p>
                  </td>
                  <td width="25%" align="left">
                    <html:select property="filtro">
                      <html:options collection="filtro" property="id" labelProperty="description"/>
                    </html:select>
                  </td>
                  <td width="50%" colspan="2">
                    <html:text property="filtrocontents" size="30" onkeypress="if ((event.which ? event.which : event.keyCode) == 13) {   resetear();  }"/>
                  </td>
                </tr>
              </table>
              <hr size="1" width="80%"/>
              <center>
                <html:submit property="mercado.compra.buscar" onclick="javascript:resetear();" >
                  <bean:message key="mercado.compra.buscar"/>
                </html:submit>
                &nbsp;&nbsp;
                <html:link href="mercado_compra_agrupado.do" ><bean:message key="mercado.compra.veragrupado"/></html:link>
              </center>
              <%--<html:hidden property="agrupar" value="1"/>--%>
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

    <%-- Incluimos el resultado de la búsqueda --%>
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
                     <bean:message key="mercado.compra.tabla.mercado"/>
                 </font></b>
             </td>
             <td bgcolor="#E1C08B" align="center">
                 <b><font color="#FFFFFF">
                     <bean:message key="mercado.compra3.fechainicio"/>
                 </font></b>
             </td>
             <td bgcolor="#E1C08B" align="center">
                 <b><font color="#FFFFFF">
                     <bean:message key="mercado.compra3.fechafin"/>
                 </font></b>
             </td>
             <td bgcolor="#E1C08B" align="center">
                 <b><font color="#FFFFFF">
                     <bean:message key="mercado.compra3.desc"/>
                 </font></b>
             </td>
            <logic:equal value="2" property="mercancia" name="BuscarMercadoCompraForm">
              <td bgcolor="#E1C08B" align="center">
                <b><font color="#FFFFFF">
                  <bean:message key="mercado.compra3.salud"/>
                </font></b>
              </td>
            </logic:equal>
             <td bgcolor="#E1C08B" align="center">
                 <b><font color="#FFFFFF">
                     <logic:equal name="mercancia_tipo_f" value="1">
                        <bean:message key="mercado.compra3.caducidad"/>
                     </logic:equal>
                     <logic:notEqual name="mercancia_tipo_f" value="1">
                        <bean:message key="mercado.compra3.tipo"/>
                     </logic:notEqual>
                 </font></b>
             </td>
             <td bgcolor="#E1C08B" align="center">
                 <table border=0><tr>
                   <td align="left">
                       <a href="javascript:ordenarLista(2,1);">
                           <html:img border="0" page="/images/iconos/16/arrowdown.gif" />
                       </a>
                   </td>
                   <td align="center">
                       <b><font color="#FFFFFF">
                           <bean:message key="mercado.compra3.ctddispo"/>
                       </font></b>
                   </td>
                   <td align="left">
                       <a href="javascript:ordenarLista(2,2);">
                       <html:img border="0" page="/images/iconos/16/arrowup.gif" />
                       </a>
                   </td>
                 </tr></table>
             </td>
             <td bgcolor="#E1C08B" align="center">
                 <table width="100%" border=0><tr>
                     <td align="left">
                         <a href="javascript:ordenarLista(3,1);">
                             <html:img border="0" page="/images/iconos/16/arrowdown.gif" />
                         </a>
                     </td>
                 <td align="center">
                     <b><font color="#FFFFFF">
                         <bean:message key="mercado.compra3.punidad"/>
                     </font></b>
                 </td>
                     <td align="left">
                         <a href="javascript:ordenarLista(3,2);">
                         <html:img border="0" page="/images/iconos/16/arrowup.gif"/>
                         </a>
                     </td>
                 </tr></table>
             </td>
             <td bgcolor="#E1C08B" align="center">
                 <b><font color="#FFFFFF">
                     <bean:message key="mercado.compra3.opcion"/>
                 </font></b>
             </td>
           </tr>
           <%-- Cuerpo Tabla --%>
           <tr>
             <td bgcolor="#E4CFA2">
               <logic:iterate id="lista" name="MercadosListas" property="lstCompra">
               <tr>
                  <%-- Mercado --%>
                  <logic:empty property="region" name="lista">
                    <td align="center"><bean:write property="abadia" name="lista" filter="false"/></td>
                  </logic:empty>
                  <logic:notEmpty property="region" name="lista">
                    <td align="center">
                      <a style="color:000000" href="javascript:buscaPorFiltro('4','<bean:write property="region" name="lista" filter="false"/>');">
                        <bean:write property="region" name="lista" filter="false"/>
                      </a>
                      <br>Abadia ( <font color="#888888">
                        <b>
                        <a style="color:888888" href="javascript:buscaPorFiltro('3','<bean:write property="abadia" name="lista" filter="false"/>');">
                          <bean:write property="abadia" name="lista" filter="false"/>
                        </a>
                      </b></font> )
                    </td>
                  </logic:notEmpty>
                  <%-- Fecha Inicio --%>
                  <td align="center"><bean:write property="fecha_inicial" name="lista" filter="false"/></td>
                  <%-- Fecha Caducidad --%>
                  <td align="center"><bean:write property="fecha_final" name="lista" filter="false"/></td>
                  <%-- Descripción producto --%>
                  <td>
                    <logic:notEmpty property="familia" name="lista">
                      <bean:write property="familia" name="lista" filter="false"/> :
                    </logic:notEmpty>
                    <b><a style="color:000000" href="javascript:buscaPorFiltro('5','<bean:write property="descripcion" name="lista" filter="false"/>');">
                      <bean:write property="descripcion" name="lista" filter="false"/>
                    </a></b>
                    <logic:equal value="2" property="mercancia" name="lista">
                      <font size=1> ( <bean:write property="idAnimalNivel" name="lista" filter="false"/> )</font>
                      <td><bean:write property="barra_HTML" name="lista" filter="false" /></td>
                    </logic:equal>
                  </td>
                  <%-- Tipo compra --%>
                  <td align="center">
                    <logic:equal name="mercancia_tipo_f" value="1">
                       <bean:write property="fecha_caduca" name="lista" filter="false"/> 
                    </logic:equal>
                    <logic:notEqual name="mercancia_tipo_f" value="1">
                       <bean:write property="tipo_desc" name="lista" filter="false"/>
                    </logic:notEqual>
                  </td>
                  <%-- Cantidad disponible --%>
                  <td align="right">
                    <bean:write property="ctd_actual" name="lista" filter="false"/>&nbsp;<bean:write property="unidad_desc" name="lista" filter="false"/>
                  </td>
                  <%-- Precio --%>
                  <td align="right">
                    <bean:write property="precio" name="lista" filter="false"/>
                  </td>
                  <%-- Acción --%>
                  <td align="center">
                    <a href="javascript:comprar(<bean:write property="idProducto" name="lista" filter="false"/>)">
                      <html:img border="0" page="/images/iconos/16/comprar.jpg" altKey="mercado.compra2.titulo" />
                    </a>
                  </td>
               </tr>
               </logic:iterate>
               <%-- Si no se encuentran productos en la lista --%>
               <logic:empty name="MercadosListas" property="lstCompra">
                  <tr>
                    <td colspan=8><center><bean:message key="mercado.compra3.nohay" /></center><td>
                  </tr>
               </logic:empty>
             </td>
           </tr>
           </table>

         </td>
       </tr>
     </table>
    </div>

    <%-- Incluimos la barra de navegación --%>
    <logic:greaterThan name="MercadosListas" property="pages" value="0">
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
