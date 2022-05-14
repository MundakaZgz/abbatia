<%@ page import="org.abbatia.utils.Constantes"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
   <title>untitled</title>
   <link REL="STYLESHEET" HREF="theme/styles.css" TYPE="text/css"/>
 </head>
 <body bgcolor="#E1C08B">
   <center>
     <html:form action="/actualizarPrecioCopia.do" >
     <html:hidden property="accion" value="actualizar" />
     <html:hidden property="idLibro" />
       <table border="1" cellspacing="0" bordercolor="#000000" width="60%" bordercolorlight="#000000" bordercolordark="#000000">
         <tr height="20">
           <td align="center" bgcolor="#996633">
             <b><font color="#FFFFFF"  size="2">
                 <bean:message key="edificios.abadia.biblioteca.asignarprecio"/> <bean:write name="libroDetalle" property="nombreLibro" />
               </font>
             </b>
             </td>
         </tr>
         <tr>
             <td bgcolor="#E4CFA2" style="border-top: none thin white;" align="center" >
             <b>
                <bean:message key="edificios.abadia.biblioteca.precio" /> <bean:write name="libroDetalle" property="precioMin" />
                <bean:message key="edificio.abadia.sacrificar.texto3" />  <bean:write name="libroDetalle" property="precioMax" /> <bean:message key="sicario.confirmar.precio.monedas" />
             </b>
             </td>
         </tr>
         <tr>
             <td bgcolor="#E4CFA2" style="border-top: none thin white;" align="center" >
                <html:text property="precioCopiaS" name="libroDetalle" size="5" />
             </td>
         </tr>
          <tr>
            <td align="center" bgcolor="#E1C08B" >
              <input type="button" onclick="javascript:history.back();" value="Atrás"/>
              <html:submit>
                <bean:message key="edificios.abadia.biblioteca.actualizarprecio.aceptar"/>
              </html:submit>
            </td>
          </tr>
          <tr>
            <td align="center" >
              <html:errors/>
            </td>
          </tr>
         <tr>
           <td align="center" >
           <logic:messagesPresent message="true">
             <html:messages id="msg" message="true">
                 <bean:write name="msg"/><br/>
             </html:messages>
           </logic:messagesPresent>
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
