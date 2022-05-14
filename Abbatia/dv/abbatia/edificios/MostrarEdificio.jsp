<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
  <head>
    <title>
      <bean:message key="edificios.abadia.mostrar.titulo"/>
    </title>
    <!--link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/-->
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
          openPopupIFrame('/mostrarRequisitosElaboracionAlimentos.do?pid=' + p_ProductoId + '&tipo=A',600,250,"ElaborarAlimentos");
        }
      }
      function elaborarRecurso(p_ProductoId)
      {
        if (p_ProductoId != 0)
        {
          openPopupIFrame('/mostrarRequisitosElaboracionAlimentos.do?pid=' + p_ProductoId + '&tipo=R',600,250,"ElaborarAlimentos");
        }
      }

      function molerCereales()
      {
          openPopupIFrame('/molerCereales_inicio.do',600,250,'MolerCereales');
      }

      function sembrarCampo(p_CampoId)
      {
          openPopupIFrame('/sembrar_campo.do?clave=' + p_CampoId,600,250,'SembrarCampo');
      }
      function sembrarCampoPrematura(p_CampoId)
      {
          openPopupIFrame('/siembraPrematura.do?clave=' + p_CampoId,600,250,'SembrarCampoPrematura');
      }

      function mostrarMonjesAgricultura(p_CampoId)
      {
          openPopupIFrame('/mostrarListaMonjesAgricultura.do?clave=' + p_CampoId,700,550,'MostrarMonjesAsignados');
      }

      -->
    </script>

  </head>


  <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
    <center>
      <table border="1" width="50%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
        <tr>
          <td align="center" bgcolor="#996633" colspan="2">
            <b><font color="#FFFFFF"  size="2">
                <bean:message key="edificios.abadia.datosedificio"/>
              </font>
            </b>
          </td>
        </tr>
        <tr>
          <td align="center" bgcolor="#E4CFA2">
            <img border="0" alt="<bean:write name="Edificio" property="descripcion"/>" SRC="images/mapas/<bean:write name="Edificio" property="grafico_construccion"/>_<bean:write name="Edificio" property="nivel"/>.gif"/><br /><br >
		    <b><bean:write name="Edificio" property="nombre" filter="false"/></b>

          </td>
          <td bgcolor="#E4CFA2">
            <table border="0" width="100%">
              <logic:notEqual property="administrador" name="usuario" scope="session" value="0">
              <tr>
                <td align="left">
                  <b>
                    <bean:message key="edificios.abadia.mostrar.id"/>
                  </b>
                </td>
                <td align="left">
                  <bean:write name="Edificio" property="idDeEdificio" filter="false"/>
                </td>
              </tr>
              </logic:notEqual>
              <tr>
                <td align="left">
                  <b>
                    <bean:message key="edificios.abadia.fechaconstruccion"/>
                  </b>
                </td>
                <td align="left">
                  <bean:write name="Edificio" property="fechaDeConstruccion" filter="false"/>
                </td>
              </tr>
              <tr>
                <td align="left">
                  <b>
                    <bean:message key="edificios.abadia.mostrar.nivel"/>
                  </b>
                </td>
                <td align="left">
                  <bean:write name="Edificio" property="nivel" filter="false"/>
                  <logic:equal value="N" name="Edificio" property="enConstruccion">
                	  <logic:present name="DatosNivel">
	                      <html:link action="/SubirNivel" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
        	                ( <bean:message key="edificios.abadia.subirnivel"/>&nbsp;<bean:write name="DatosNivel" property="nivel" filter="false"/> )
                	      </html:link>
	                  </logic:present>
                  </logic:equal>
                </td>
              </tr>
              <tr>
                <td align="left">
                  <b>
                    <bean:message key="edificios.abadia.mostrar.estado"/>
                  </b>
                </td>
                <td align="left">
                  <bean:write name="Edificio" property="barraEstado" filter="false"/>
                </td>
              </tr>
                <tr>
                  <td align="left">
                    <b>
                      <bean:message key="edificios.abadia.mostrar.mantenimiento"/>
                    </b>
                  </td>
                  <td align="left">
                    <html:link action="/mantenimientoEdificio">
                        <bean:write name="Edificio" property="mantenimientoDesc"/>
                    </html:link>
                  </td>
                </tr>
              <tr>
                <td align="left">
                  <b>
                    <bean:message key="edificios.abadia.mostrar.almacenamiento"/>
                  </b>
                </td>
                <td align="left">
                  <bean:write name="Edificio" property="almacenamientoActualStr" filter="false"/>/
                  <bean:write name="Edificio" property="almacenamiento" filter="false"/>
                  <b> +<bean:write name="Edificio" property="almacenamiento_plus" filter="false"/></b>  
                </td>
              </tr>
              <tr>
                <td align="left">
                  <b>
                    <bean:message key="edificios.abadia.descripcion"/>:
                  </b>
                </td>
                <td align="left">
                    <bean:write name="Edificio" property="descripcion" filter="false"/>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <logic:equal value="S" name="Edificio" property="enConstruccion">
        <table border="1" width="50%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
          <tr>
            <td align="center" bgcolor="#996633">
              <b><font color="#FFFFFF"  size="2">
                  <bean:message key="edificios.abadia.enamplicacion"/>
                </font>
              </b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2">
              <table border="0" width="100%">
                <tr align="center">
                  <td colspan="2">
                    <b>
                      <bean:message key="edificios.abadia.ampliando"/>
                    </b>
                  </td>
                </tr>
                <tr align="center">
                  <td>
                    <b>
                      <bean:message key="edificios.abadia.fechaprevista"/>
                    </b>
                  </td>
                  <td>
                    <bean:write name="Edificio" property="fechaFinPrevista" filter="false"/>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </logic:equal>
      <table>
        <TR>
          <TD colspan="4">
            <div align="center">
              <html:errors/>
            </div>
          </TD>
        </TR>
      </table>
      <br>

          <!-- Si se trata del oratorio.... -->
          <logic:equal value="1" name="Edificio" property="idDeTipoDeEdificio">
              <jsp:include page="/edificios/edificio_oratorio.jsp"/>
          </logic:equal>
          <!-- Si se trata del dormitorio.... -->
          <logic:equal value="3" name="Edificio" property="idDeTipoDeEdificio">
            <logic:equal value="init" name="Tab">
              <jsp:include page="/edificios/edificio_dormitorio.jsp"/>
            </logic:equal>
            <logic:equal value="monjes" name="Tab">
              <jsp:include page="/edificios/edificio_dormitorio_monjes.jsp"/>
            </logic:equal>
          </logic:equal>
          <!-- Si se trata del comedor.... -->
          <logic:equal value="4" name="Edificio" property="idDeTipoDeEdificio">
              <jsp:include page="/edificios/edificio_comedor_dieta.jsp"/>
          </logic:equal>
          <!-- Si se trata de la cocina.... -->
          <logic:equal value="5" name="Edificio" property="idDeTipoDeEdificio">
            <logic:equal value="init" name="Tab">
              <jsp:include page="/edificios/edificio_cocina.jsp"/>
            </logic:equal>
            <logic:equal value="elaboracion" name="Tab">
              <jsp:include page="/edificios/edificio_cocina_elaboracion.jsp"/>
            </logic:equal>
            <logic:equal value="salar" name="Tab">
              <jsp:include page="/edificios/edificio_cocina_salar.jsp"/>
            </logic:equal>
            <logic:equal value="monjes" name="Tab">
              <jsp:include page="/edificios/edificio_cocina_monjes.jsp"/>
            </logic:equal>
          </logic:equal>
          <!-- Si se trata de la biblioteca.... -->
          <logic:equal value="6" name="Edificio" property="idDeTipoDeEdificio">
            <logic:equal value="init" name="Tab">
              <jsp:include page="/edificios/edificio_biblioteca.jsp"/>
            </logic:equal>

            <logic:equal value="region" name="Tab">
              <jsp:include page="/edificios/edificio_biblioteca_region.jsp"/>
            </logic:equal>

            <logic:equal value="general" name="Tab">
              <jsp:include page="/edificios/edificio_biblioteca_todos.jsp"/>
            </logic:equal>

            <logic:equal value="copias" name="Tab">
              <jsp:include page="/edificios/edificio_biblioteca_copiando.jsp"/>
            </logic:equal>

            <logic:equal value="recursos" name="Tab">
              <jsp:include page="/edificios/edificio_biblioteca_recursos.jsp"/>
            </logic:equal>

          </logic:equal>
          <!-- Si se trata del cementerio.... -->
          <logic:equal value="26" name="Edificio" property="idDeTipoDeEdificio">
            <logic:equal value="velatorio" name="Tab">
              <jsp:include page="/edificios/edificio_cementerio_velatorio.jsp"/>
            </logic:equal>
            <logic:equal value="init" name="Tab">
              <jsp:include page="/edificios/edificio_cementerio_velatorio.jsp"/>
            </logic:equal>
            <logic:equal value="cementerio" name="Tab">
              <jsp:include page="/edificios/edificio_cementerio_enterrados.jsp"/>
            </logic:equal>
            <logic:equal value="osario" name="Tab">
              <jsp:include page="/edificios/edificio_cementerio_osario.jsp"/>
            </logic:equal>
          </logic:equal>

          <!-- Si se trata del taller de costura.... -->
          <logic:equal value="10" name="Edificio" property="idDeTipoDeEdificio">
            <logic:equal value="init" name="Tab">
              <jsp:include page="/edificios/edificio_taller_costura.jsp"/>
            </logic:equal>
            <logic:equal value="elaboracion" name="Tab">
              <jsp:include page="/edificios/edificio_taller_costura_elaboracion.jsp"/>
            </logic:equal>
          </logic:equal>

          <!-- Si se trata del taller de artesania.... -->
          <logic:equal value="11" name="Edificio" property="idDeTipoDeEdificio">
            <logic:equal value="init" name="Tab">
              <jsp:include page="/edificios/edificio_taller_artesania.jsp"/>
            </logic:equal>
            <logic:equal value="elaboracion" name="Tab">
              <jsp:include page="/edificios/edificio_taller_artesania_elaboracion.jsp"/>
            </logic:equal>
          </logic:equal>


          <!-- Si se trata de la granero.... -->
          <logic:equal value="8" name="Edificio" property="idDeTipoDeEdificio">
            <jsp:include page="/edificios/edificio_granero.jsp"/>
          </logic:equal>
          <!-- Si se trata de la granja.... -->
          <logic:equal value="7" name="Edificio" property="idDeTipoDeEdificio">
            <jsp:include page="/edificios/edificio_granja.jsp"/>
          </logic:equal>
          <!-- Si se trata del establo.... -->
          <logic:equal value="22" name="Edificio" property="idDeTipoDeEdificio">
            <jsp:include page="/edificios/edificio_establo.jsp"/>
          </logic:equal>
          <!-- Si se trata del almacen.... -->
          <logic:equal value="12" name="Edificio" property="idDeTipoDeEdificio">
            <logic:equal value="init" name="Tab">
              <jsp:include page="/edificios/edificio_almacen.jsp"/>
            </logic:equal>
            <logic:equal value="elaboracion" name="Tab">
              <jsp:include page="/edificios/edificio_almacen_elaboracion.jsp"/>
            </logic:equal>
          </logic:equal>
          <!-- Si se trata de un campo.... -->
          <logic:equal value="23" name="Edificio" property="idDeTipoDeEdificio">
            <jsp:include page="/edificios/edificio_campo.jsp"/>
          </logic:equal>
          <!-- Si se trata de una iglesia.... -->
          <logic:equal value="24" name="Edificio" property="idDeTipoDeEdificio">
            <jsp:include page="/edificios/edificio_iglesia.jsp"/>
          </logic:equal>
          <!-- Si se trata del molino.... -->
          <logic:equal value="9" name="Edificio" property="idDeTipoDeEdificio">
            <jsp:include page="/edificios/edificio_molino.jsp"/>
          </logic:equal>
          <logic:equal value="25" name="Edificio" property="idDeTipoDeEdificio">
            <jsp:include page="/edificios/edificio_mercado.jsp"/>
          </logic:equal>

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
