<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html:html>
<head>
	<title></title>
	<link REL="STYLESHEET" HREF="theme/styles.css" TYPE="text/css">
</head>
 <body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
   <center>

      <table border="1" width="80%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
        <tr>
          <td align="center" bgcolor="#996633" >
            <b><font color="#FFFFFF"  size="2">
                <bean:message key="principal.elecciones.arzobispo"/> <bean:write name="DatosVotacion" property="nombreRegion"/>
              </font>
            </b>
          </td>
        </tr>
        <tr>
          <td>
             <table border="0" width="100%" cellspacing="2" >
               <tr>
	            <td align="right" >
        	        <font color="#FFFFFF" size="2" >
	                    <bean:message key="elecciones.candidatos.inicio"/>
        	        </font>
	            </td>
        	    <td align="left" >
	                <font color="#FFFFFF" size="2">
                	    <bean:write name="DatosVotacion" property="fechaInicio"/>
        	        </font>
	            </td>
        	    <td align="right" >
	                <font color="#FFFFFF" size="2">
        		            <bean:message key="elecciones.candidatos.fin"/>
	                </font>
        	    </td>
	            <td align="left" >
	                <font color="#FFFFFF" size="2">
                	    <bean:write name="DatosVotacion" property="fechaFin"/>
        	        </font>
	            </td>
               </tr>
               <tr>
	            <td align="right" >
        	        <font color="#FFFFFF" size="2" >
	                    <bean:message key="elecciones.candidatos.restantes"/>
        	        </font>
	            </td>
        	    <td align="left" >
	                <font color="#FFFFFF" size="2">
                	    <bean:write name="DatosVotacion" property="pendientesVoto"/>
        	        </font>
	            </td>
        	    <td align="right" >
	                <font color="#FFFFFF" size="2">
        		            <bean:message key="elecciones.candidatos.total"/>
	                </font>
        	    </td>
	            <td align="left" >
	                <font color="#FFFFFF" size="2">
                	    <bean:write name="DatosVotacion" property="totalVotantes"/>
        	        </font>
	            </td>
               </tr>

            </table>
          </td>
        </tr>
        <tr>

        <td bgcolor="#E4CFA2" colspan="4" >
             <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
               <tr>
                 <td colspan="5" bgcolor="#E1C08B" align="center">
                   <b><font color="#FFFFFF">
                       <bean:message key="elecciones.candidatos.lista"/>
                     </font>
                   </b>
                 </td>
               </tr>
               <tr>
                 <td bgcolor="#E1C08B" align="center">
                   <b><font color="#FFFFFF">
                       <bean:message key="elecciones.candidatos.tabla.candidato"/>
                     </font>
                   </b>
                   </td>
                 <td bgcolor="#E1C08B" align="center">
                   <b><font color="#FFFFFF">
                       <bean:message key="elecciones.candidatos.tabla.abadia"/>
                     </font>
                   </b>
                   </td>
                 <td bgcolor="#E1C08B" align="center">
                   <font color="#FFFFFF"><b>
                       <bean:message key="elecciones.candidatos.tabla.orden"/>
                     </b>
                   </font>
                 </td>
                 <td bgcolor="#E1C08B" align="center">
                   <b><font color="#FFFFFF">
                       <bean:message key="elecciones.candidatos.tabla.votos"/>
                     </font>
                   </b>
                 </td>
                 <td bgcolor="#E1C08B" align="center">
                     <logic:equal name="DatosVotacion" property="puedeVotar" value="1" >
                       <b><font color="#FFFFFF">
                           <bean:message key="edificios.abadia.tabla.opciones"/>
                         </font>
                       </b>
                     </logic:equal>
                 </td>
               </tr>
               <logic:iterate id="lista" name="DatosVotacion" property="candidatos">
                 <tr>
                   <td>
                     <b><bean:write property="nombreMonje" name="lista"/></b><br/>
                     <bean:write property="descripcion" name="lista"/>
                     <logic:equal name="lista" property="votable" value="0" >
		        <html:form action="/votar_obispado">
		          <html:hidden property="seleccion" name="DatosVotacion" value="-1"/>
                          <html:text property="descripcion" name="DatosVotacion" size="30" maxlength="100"/>
	                  <html:submit value="Modificar"/>
		        </html:form>
                     </logic:equal>
                   </td>
                   <td align="center" >
                     <bean:write property="nombreAbadia" name="lista"/>
                     <br/>
                   </td>
                   <td align="center">
                     <bean:write property="nombreOrden" name="lista"/>
                     <br/>
                   </td>
                   <td align="center">
                     <bean:write property="votos" name="lista"/>
                     <br/>
                   </td>
                   <td align="center">
                    <logic:equal name="DatosVotacion" property="puedeVotar" value="1" >
                     <logic:equal name="lista" property="votable" value="1" >
                        <html:link action="/votar_obispado" paramId="seleccion" paramName="lista" paramProperty="idAbadia">
                          <html:img border="0" page="/images/iconos/16/votar.gif" altKey="tooltip.votar"/>
                        </html:link>
                     </logic:equal>
                    </logic:equal>
                   </td>
                 </tr>
               </logic:iterate>
             </table>
            </td>
        </tr>
      </table>
    <br />
    <p>
      <logic:equal name="DatosVotacion" property="puedeVotar" value="0" >
                       <b><bean:message key="principal.elecciones.nopuedesvotar"/>
                       </b>
      </logic:equal>
    </p>
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
</html:html>
