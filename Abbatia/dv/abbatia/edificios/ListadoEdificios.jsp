<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
  <head>
    <title>Pantalla principal de prueba</title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
  </head>
  <body bgcolor="#E1C08B">
    <p align="center">
      <b>
	<logic:equal value="1" name="Links">
	    <bean:message key="edificios.abadia.titulo"/>
       </logic:equal>
	<logic:equal value="0" name="Links">
		<bean:message key="mercado.historico.abadia"/>:<br />
                <bean:write name="Nombre" />
       </logic:equal>
      </b>
    </p>
    <p>
   	 <logic:equal value="1" name="Nieve">
         <img alt="" STYLE="position:absolute;top:40; left:50%; margin-left:-300;" src="/images/mapas/nieve/fondo.gif"/>
     </logic:equal>
  	 <logic:equal value="0" name="Nieve">
      	 <logic:equal value="0" name="Noche">
             <img alt="" STYLE="position:absolute;top:40; left:50%; margin-left:-300;" src="/images/mapas/fondo_vacio.jpg"/>
             <!-- añadir objetos animados -->
             <img border="0" alt="Puente" STYLE="position:absolute;top:277; left:50%; margin-left:166;" SRC="/images/mapas/rio_animado.gif"/>
             <!-- esquina izq. -->
             <img border="0" alt="Arbol2" STYLE="position:absolute;top:46; left:50%; margin-left:-250;" SRC="/images/mapas/arbol2.gif"/>
             <img border="0" alt="Arbol2" STYLE="position:absolute;top:80; left:50%; margin-left:-280;" SRC="/images/mapas/arbol2.gif"/>
             <img border="0" alt="Arbol" STYLE="position:absolute;top:68; left:50%; margin-left:-230;" SRC="/images/mapas/arbolanimado1.gif"/>
             <!-- esquina dcha. -->
             <img border="0" alt="Arbol2" STYLE="position:absolute;top:46; left:50%; margin-left:130;" SRC="/images/mapas/arbol2.gif"/>
             <img border="0" alt="Arbol2" STYLE="position:absolute;top:58; left:50%; margin-left:152;" SRC="/images/mapas/arbol2.gif"/>
             <img border="0" alt="Arbol2" STYLE="position:absolute;top:48; left:50%; margin-left:163;" SRC="/images/mapas/arbol2.gif"/>
             <img border="0" alt="Arbol2" STYLE="position:absolute;top:46; left:50%; margin-left:178;" SRC="/images/mapas/arbol2.gif"/>
             <img border="0" alt="Arbol" STYLE="position:absolute;top:76; left:50%; margin-left:180;" SRC="/images/mapas/arbolanimado1.gif"/>
             <img border="0" alt="Arbol" STYLE="position:absolute;top:86; left:50%; margin-left:240;" SRC="/images/mapas/arbolanimado1.gif"/>
         </logic:equal>
      	 <logic:equal value="1" name="Noche">
             <img alt="" STYLE="position:absolute;top:40; left:50%; margin-left:-300;" src="/images/mapas/noche/fondo.jpg"/>
         </logic:equal>
     </logic:equal>
      <!--img alt=&quot;&quot; STYLE=&quot;position:absolute;top:40; left:50%; margin-left:-300;&quot; SRC=&quot;images/mapas/murallasmadera.gif&quot;-->
      <logic:iterate id="Edificio" name="Edificios">
 	 <logic:equal value="1" name="Links">
         	<html:link action="/mostrarEdificio" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
          	 <logic:equal value="1" name="Nieve">
                 <img border="0" alt="<bean:write name="Edificio" property="nombre"/>" STYLE="position:absolute;top:<bean:write name="Edificio" property="map_y"/>; left:50%; margin-left:<bean:write name="Edificio" property="map_x"/>;" SRC="images/mapas/nieve/<bean:write name="Edificio" property="grafico_visualizacion"/>_<bean:write name="Edificio" property="nivel"/>.gif"/>
             </logic:equal>
          	 <logic:equal value="0" name="Nieve">
              	 <logic:equal value="0" name="Noche">
                     <img border="0" alt="<bean:write name="Edificio" property="nombre"/>" STYLE="position:absolute;top:<bean:write name="Edificio" property="map_y"/>; left:50%; margin-left:<bean:write name="Edificio" property="map_x"/>;" SRC="images/mapas/<bean:write name="Edificio" property="grafico_visualizacion"/>_<bean:write name="Edificio" property="nivel"/>.gif"/>
                 </logic:equal>
              	 <logic:equal value="1" name="Noche">
                     <img border="0" alt="<bean:write name="Edificio" property="nombre"/>" STYLE="position:absolute;top:<bean:write name="Edificio" property="map_y"/>; left:50%; margin-left:<bean:write name="Edificio" property="map_x"/>;" SRC="images/mapas/noche/<bean:write name="Edificio" property="grafico_visualizacion"/>_<bean:write name="Edificio" property="nivel"/>.gif"/>
                 </logic:equal>
             </logic:equal>
        	</html:link>
       </logic:equal>
	<logic:equal value="0" name="Links">
         	<a>
	          <img border="0" alt="<bean:write name="Edificio" property="nombre"/>" STYLE="position:absolute;top:<bean:write name="Edificio" property="map_y"/>; left:50%; margin-left:<bean:write name="Edificio" property="map_x"/>;" SRC="images/mapas/<bean:write name="Edificio" property="grafico_visualizacion"/>_<bean:write name="Edificio" property="nivel"/>.gif"/>
        	</a>
       </logic:equal>
      </logic:iterate>
    </p>
    <div STYLE="position:absolute;top:400; left:0">
    <center>
      <table cellspacing="2" cellpadding="3" border="0" width="100%" align="center">
        <tr>
          <%  int n = 0;
%>
          <logic:iterate id="Edificio" name="Edificios">
            <td>
              <table align="center"  border="1" width="160" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
                <tr>
                  <td align="center" bgcolor="#F0AF1C">
                    <font color="#000000" size="1">
                      <bean:write name="Edificio" property="nombre"/>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td bgcolor="#F7FEEA" align="center">
                    <font color="#000000" size="1">
                      <bean:message key="edificios.abadia.fechaconstruccion"/>
                      <bean:write name="Edificio" property="fechaDeConstruccion"/>
                      <br/>
                      <bean:message key="edificios.abadia.nivel"/>
                      <bean:write name="Edificio" property="nivel"/>
                      <br/>
                      <bean:message key="edificios.abadia.estado"/>
                      <bean:write name="Edificio" property="barraEstado" filter="false"/>
                      <br/>
                      <bean:message key="edificios.abadia.mostrar.mantenimiento"/>
                      <bean:write name="Edificio" property="mantenimientoDesc"/>
                      <br/>
                      <bean:message key="edificios.abadia.capacidad"/>
                      <bean:write name="Edificio" property="capacidadVital"/>
                      <br/>
                      <bean:message key="edificios.abadia.almacen"/>
                      <bean:write name="Edificio" property="almacenamientoActual" filter="false"/>/
                      <bean:write name="Edificio" property="almacenamiento"/>
                      <b> +<bean:write name="Edificio" property="almacenamiento_plus" filter="false"/></b>
                    </font>
                  </td>
                </tr>
                <tr>
                  <td bgcolor="#F7FEEA" align="center">
                    <font size="1">
                      <logic:equal value="1" name="Links">
                	      <html:link action="/mostrarEdificio" paramId="clave" paramName="Edificio" paramProperty="idDeEdificio">
        	                <bean:message key="edificios.abadia.masinfo"/>
	                      </html:link>
                      </logic:equal>
                    </font>
                  </td>
                </tr>
              </table>
            </td>
            <%  if (n > 2) {
        	out.println ("<tr></tr>");
                n = 0;
      	} else n++;
      %>
          </logic:iterate>
        </tr>
      </table>
     </center>
    </div>
      <!-- Publicidad -->
    <logic:present name="usuario" >
      <logic:notEqual property="registrado" name="usuario" scope="session" value="1">
            <jsp:include page="/varios/publicidad.jsp"/>
      </logic:notEqual>
    </logic:present>
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
