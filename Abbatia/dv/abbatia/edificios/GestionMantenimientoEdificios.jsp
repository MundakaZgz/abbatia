<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>



  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title><bean:message key="edificios.abadia.mantenimiento.titulo"/></title>
    <script language="javascript" src="/theme/prototype-1.6.0.2.js" type="text/javascript"></script>
    <script language="javascript" src="/theme/number-functions.js" type="text/javascript"></script>
    <link REL="STYLESHEET" HREF="/theme/style-global.css" TYPE="text/css"/>
    <link REL="STYLESHEET" HREF="/theme/style-revised.css" TYPE="text/css"/>
  </head>
  <body>
  <div id="container">
    <h3><bean:message key="edificios.abadia.mantenimiento.titulo"/></h3>
      <html:form action="/mantenimientoEdificio" >
        <table summary="Datos de mantenimiento" class="maintenance">
          <thead>
              <tr>
                  <th colspan="7"><bean:message key="edificios.abadia.mantenimiento.table.header"/></th>
              </tr>
              <tr>
                  <th><bean:message key="edificios.abadia.mantenimiento.table.edificionivel"/></th>
                  <th><bean:message key="edificios.abadia.mantenimiento.table.estado"/></th>
                  <th width="10%"><bean:message key="edificios.abadia.mantenimiento.table.nulo"/></th>
                  <th width="10%"><bean:message key="edificios.abadia.mantenimiento.table.basico"/></th>
                  <th width="10%"><bean:message key="edificios.abadia.mantenimiento.table.moderado"/></th>
                  <th width="10%"><bean:message key="edificios.abadia.mantenimiento.table.intensivo"/></th>
                  <th width="10%"><bean:message key="edificios.abadia.mantenimiento.table.coste"/></th>
                </tr>
              </thead>
              <tbody>
                  <logic:iterate id="lista" name="edificios">
                    <%!String cssClass = null;%>
                    <%
                        if (cssClass == null)
                        {
                            cssClass = "one";
                        }else if (cssClass.equals("one"))
                        {
                            cssClass = "two";
                        }else if (cssClass.equals("two"))
                        {
                            cssClass = "one";
                        }
                    %>
                    <tr class="<%=cssClass%>">
                      <td>
                        <html:link action="/mostrarEdificio" paramName="lista" paramProperty="idDeEdificio" paramId="clave">
                            <bean:write name="lista" property="nombre" /> (<bean:write name="lista" property="nivel" />)
                        </html:link>
                      </td>
                      <td>
                            <bean:write name="lista" property="barraEstado" filter="false" />
                      </td>
                      <td>
                        <logic:equal name="lista" property="mantenimiento" value="0">
                            <input type="radio" name="<bean:write name="lista" property="idDeTipoDeEdificio"/>"
                                   id="<bean:write name="lista" property="idDeTipoDeEdificio"/>" value="0" checked="checked" onclick="actualizarValores(<bean:write name="lista" property="idDeTipoDeEdificio"/>, <bean:write name="lista" property="nivel" />, 0)"/>
                        </logic:equal>
                        <logic:notEqual name="lista" property="mantenimiento" value="0">
                            <input type="radio" name="<bean:write name="lista" property="idDeTipoDeEdificio"/>"
                                   id="<bean:write name="lista" property="idDeTipoDeEdificio"/>" value="0" onclick="actualizarValores(<bean:write name="lista" property="idDeTipoDeEdificio"/>, <bean:write name="lista" property="nivel" />, 0)"/>
                        </logic:notEqual>
                      </td>
                      <td>
                        <logic:equal name="lista" property="mantenimiento" value="1">
                            <input type="radio" name="<bean:write name="lista" property="idDeTipoDeEdificio"/>"
                                   id="<bean:write name="lista" property="idDeTipoDeEdificio"/>" value="1" checked="checked" onclick="actualizarValores(<bean:write name="lista" property="idDeTipoDeEdificio"/>, <bean:write name="lista" property="nivel" />, 1)"/>
                        </logic:equal>
                        <logic:notEqual name="lista" property="mantenimiento" value="1">
                            <input type="radio" name="<bean:write name="lista" property="idDeTipoDeEdificio"/>"
                                   id="<bean:write name="lista" property="idDeTipoDeEdificio"/>" value="1" onclick="actualizarValores(<bean:write name="lista" property="idDeTipoDeEdificio"/>, <bean:write name="lista" property="nivel" />, 1)"/>
                        </logic:notEqual>
                      </td>
                      <td>
                        <logic:equal name="lista" property="mantenimiento" value="2">
                            <input type="radio" name="<bean:write name="lista" property="idDeTipoDeEdificio"/>"
                                   id="<bean:write name="lista" property="idDeTipoDeEdificio"/>" value="2" checked="checked"onclick="actualizarValores(<bean:write name="lista" property="idDeTipoDeEdificio"/>, <bean:write name="lista" property="nivel" />, 2)"/>
                        </logic:equal>
                        <logic:notEqual name="lista" property="mantenimiento" value="2">
                            <input type="radio" name="<bean:write name="lista" property="idDeTipoDeEdificio"/>"
                                   id="<bean:write name="lista" property="idDeTipoDeEdificio"/>" value="2" onclick="actualizarValores(<bean:write name="lista" property="idDeTipoDeEdificio"/>, <bean:write name="lista" property="nivel" />, 2)"/>
                        </logic:notEqual>
                      </td>
                      <td>
                        <logic:equal name="lista" property="mantenimiento" value="3">
                            <input type="radio" name="<bean:write name="lista" property="idDeTipoDeEdificio"/>"
                                   id="<bean:write name="lista" property="idDeTipoDeEdificio"/>" value="3" checked="checked"onclick="actualizarValores(<bean:write name="lista" property="idDeTipoDeEdificio"/>, <bean:write name="lista" property="nivel" />, 3)"/>
                        </logic:equal>
                        <logic:notEqual name="lista" property="mantenimiento" value="3">
                            <input type="radio" name="<bean:write name="lista" property="idDeTipoDeEdificio"/>"
                                   id="<bean:write name="lista" property="idDeTipoDeEdificio"/>" value="3" onclick="actualizarValores(<bean:write name="lista" property="idDeTipoDeEdificio"/>, <bean:write name="lista" property="nivel" />, 3)"/>
                        </logic:notEqual>
                      </td>
                      <td id="totalLinea_<bean:write name="lista" property="idDeTipoDeEdificio"/>">
                        <bean:write name="lista" property="costeMantenimiento"/>
                      </td>
                    </tr>
                  </logic:iterate>
              </tbody>
              <tfoot>
                <tr>
                    <th colspan="7">
                        <html:submit property="aceptar">
                          <bean:message key="buscar.abadia.boton.aceptar"/>
                        </html:submit>
                    </th>
               </tr>
                <logic:messagesPresent message="true">
                  <tr>
                    <th colspan="7" >
                      <html:messages id="msg" message="true">
                          <bean:write name="msg"/><br/>
                      </html:messages>
                    </th>
                  </tr>
                </logic:messagesPresent>
            </tfoot>
            <tfoot>
                <tr>
                    <th colspan="6" class="textRight"><bean:message key="edificios.abadia.mantenimiento.table.total"/></th>
                    <th id="costeTotal"><bean:write name="costeMantenimiento" scope="request" /></th>
                </tr>
            </tfoot>
        </table>
      </html:form>

    <!--Inicio Script para google-analytics-->
    <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost +
        "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));

        function actualizarValores(p_TipoEdificioId, p_Nivel, p_Mantenimiento)
        {
            var sumaTotal=0;
            var sumaParcial;
            console.log("actualizarValores(" + p_TipoEdificioId + ", " + p_Nivel + ", " + p_Mantenimiento + ")");
            document.body.addClassName('waiting');
            
          new Ajax.Request('<html:rewrite page="/json/actualizarValoresMantenimiento.do"/>', {
           parameters: {tipoEdificioId: p_TipoEdificioId, nivelId: p_Nivel},
           onComplete: function() {
                 document.body.removeClassName('waiting');
               },
            onSuccess: function(transport, json) {
             if(json.executeError)
              {
                  console.log(json.executeError);
                  alert(json.executeError);
              }
              else
              {
                  sumaParcial = json.coste * p_Mantenimiento;
                  $('totalLinea_'+p_TipoEdificioId).innerHTML = sumaParcial;
                  for (counter=0;counter<30;counter++)
                  {
                      if ($('totalLinea_'+counter)!=null)
                      {
                        sumaParcial = $('totalLinea_'+counter).innerHTML;
                        sumaTotal += parseInt(sumaParcial);
                      }
                  }
                  $('costeTotal').innerHTML=sumaTotal;
              }

            }
        });
        }
    </script>
    <script type="text/javascript">
        var pageTracker = _gat._getTracker("UA-302272-1");
        pageTracker._initData();
        pageTracker._trackPageview();
    </script>
    <!--Fin Script para google-analytics-->
  </div>
  </body>
</html>
