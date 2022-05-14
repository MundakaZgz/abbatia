<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-layout.tld" prefix="layout" %>

<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>


<table border="1" width="95%" cellspacing="0" >
  <tr>
    <td align="center" bgcolor="#996633">
      <b><font color="#FFFFFF"  size="2">
          <bean:message key="mercado.venta.productosenventa"/>
        </font>
      </b>
    </td>
  </tr>
  <tr>

        <logic:notEmpty name="Edificio" property="contenido">
            <layout:pager maxPageItems="15" >
                <layout:collection name="Edificio" property="contenido" id="lista" width="95%" >
                    <layout:collectionItem title="mercado.venta.tabla.descripcion" property="descripcion" sortable="true"  />
                    <layout:collectionItem title="mercado.venta.tabla.inicio" property="fecha_inicial" sortable="true"/>
                    <layout:collectionItem title="mercado.venta.tabla.finalizacion" property="fecha_final" sortable="true"/>
                    <layout:collectionItem title="mercado.venta.tabla.cantidad" property="cantidad" sortable="true"/>
                    <layout:collectionItem title="mercado.venta.tabla.precio" property="precio" sortable="true"/>
                    <layout:collectionItem title="mercado.venta.tabla.volumen" property="volumen" sortable="true"/>
                    <layout:collectionItem title="mercado.venta.tabla.total" property="precioTotal"/>
                    <layout:collectionItem title="mercado.venta.tabla.opcion" >
                        <a href="javascript:cancelarVenta('<bean:write name="lista" property="idProducto"/>');">
                            <layout:img border="0" page="/images/iconos/16/cancelar.jpg" altKey="mercado.venta.cancelar.titulo"/>
                        </a>
<%--
                        <layout:link  action="/cancelar_venta.do" paramName="lista" paramProperty="idProducto" paramId="pid" >
                           <layout:img border="0" page="/images/iconos/16/cancelar.jpg" altKey="mercado.venta.cancelar.titulo"/>
                        </layout:link>
--%>
                        <a href="javascript:modificarVenta('<bean:write name="lista" property="idProducto"/>');">
                            <layout:img border="0" page="/images/iconos/16/modificar.gif" altKey="mercado.modificar.venta.principal"/>
                        </a>

<%--
                        <layout:link action="/modificar_venta.do" paramName="lista" paramProperty="idProducto" paramId="pid" >
                           <layout:img border="0" page="/images/iconos/16/modificar.gif" altKey="mercado.modificar.venta.principal"/>
                        </layout:link>
--%>
                        <layout:link action="/mostrarHistoricoProducto.do" paramName="lista" paramProperty="idProducto" paramId="idproducto" >
                           <layout:img border="0" page="/images/iconos/16/historico.gif" altKey="mercado.modificar.venta.historico"/>
                        </layout:link>
                    </layout:collectionItem>
                </layout:collection>
            </layout:pager>
          </logic:notEmpty>
        </tr>
    </table>
</td>
</tr>
</table>
