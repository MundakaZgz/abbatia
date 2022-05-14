 <%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
 <%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
 <logic:notPresent name="usuario" scope="session">
     <logic:forward name="error"/>
 </logic:notPresent>


<table border="1" width="80%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000" >
<tr>
  <td align="center" bgcolor="#996633">
	<b><font color="#FFFFFF"  size="2">
		<bean:message key="edificios.abadia.contenido"/>
	  </font>
	</b>
  </td>
</tr>
<tr>

 <td bgcolor="#E4CFA2">
   <logic:notEmpty name="Edificio" property="contenido">
     <table border="1" width="100%" cellspacing="0" bordercolorlight="#808080" bordercolor="#808080" bordercolordark="#808080">
       <tr>
         <td colspan="5" bgcolor="#E1C08B" align="center">
           <b><font color="#FFFFFF">
               <bean:message key="edificios.abadia.cocina.alimentos"/>
             </font>
           </b>
         </td>
       </tr>
       <tr>
         <td bgcolor="#E1C08B" align="center">
           <b><font color="#FFFFFF">
               <bean:message key="edificios.abadia.cocina.alimentos.tabla.descripcion"/>
             </font>
           </b>
           </td>
         <td bgcolor="#E1C08B" align="center">
           <font color="#FFFFFF"><b>
               <bean:message key="edificios.abadia.cocina.alimentos.tabla.cantidad"/>
             </b>
           </font>
         </td>
         <td bgcolor="#E1C08B" align="center">
           <b><font color="#FFFFFF">
               <bean:message key="edificios.abadia.cocina.alimentos.tabla.fechacaducidad_ini"/>
             </font>
           </b>
         </td>
         <td bgcolor="#E1C08B" align="center">
           <b><font color="#FFFFFF">
               <bean:message key="edificios.abadia.cocina.alimentos.tabla.fechacaducidad_fin"/>
             </font>
           </b>
         </td>
         <td bgcolor="#E1C08B" align="center">
           <b><font color="#FFFFFF">
               <bean:message key="edificios.abadia.tabla.opciones"/>
             </font>
           </b>
         </td>
       </tr>
       <logic:iterate id="lista" name="Edificio" property="contenido">
         <tr>
           <td>
             <bean:write property="familiaDescripcion" name="lista"/>&nbsp;(<b><bean:write property="descripcion" name="lista"/></b>)
             <br/>
           </td>
           <td align="right" >
             <bean:write property="cantidad" name="lista"/>
             <br/>
           </td>
           <td align="center">
             <bean:write property="fechaCaducidad_desde" name="lista"/>
             <br/>
           </td>
           <td align="center">
             <bean:write property="fechaCaducidad_hasta" name="lista"/>
             <br/>
           </td>
           <td align="center">
             <a href="javascript:venderAgrupado('<bean:write property="idAlimento" name="lista" />', 'A')" >
               <html:img border="0" page="/images/iconos/16/vender.jpg" altKey="tooltip.vender"/>
             </a>
             <br/>
           </td>
         </tr>
       </logic:iterate>
     </table>
   </logic:notEmpty>
 </td>


</tr>
</table>
