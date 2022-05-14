<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
<head>
    <link REL="STYLESHEET" HREF="theme/styles.css" TYPE="text/css"/>
    <title>Literales</title>
</head>
<body bgcolor="#E1C08B">

<center>
<form name="formulario" action="AdminLiterales.do">
  <input type="hidden" name="change" value="1" />
<table border="0" width="100%">
  <tr>
    <td width="80%" align="center">
<table style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" borderColor="#000000" cellSpacing="0" width="40%" border="1">
  <tbody>
    <tr>
      <td bgColor="#e4cfa2">
        <table border="0" width="100%">
          <tbody>
            <tr>
              <td align="right"><font  size="2">Idioma 1</font></td>
              <td><select size="1" name="Idioma1">
                <option value="1">Castellano</option>
                <option value="2">Catalán</option>
                <option value="3">Inglés</option>
                <option value="4">Francés</option>
                <option value="5">Alemán</option>
                <option value="6">Italiano</option>
                <option value="7">Portugues</option>
                <option value="8">Gallego</option>
                <option value="9">Euskera</option>
                <option value="10">Latín</option>
                </select></td>
            </tr>
            <font  size="2">
            <tr>
              <td align="right"><font  size="2">Idioma 2</font></td>
              <td><select size="1" name="Idioma2">
                <option value="1">Castellano</option>
                <option value="2">Catalán</option>
                <option value="3">Inglés</option>
                <option value="4">Francés</option>
                <option value="5">Alemán</option>
                <option value="6">Italiano</option>
                <option value="7">Portugues</option>
                <option value="8">Gallego</option>
                <option value="9">Euskera</option>
                <option value="10">Latín</option>
                </select></td>
            </tr>
            <tr>
              <td>
                <input type="checkbox" name="Nuevos" value="S"> ¿Nuevos?
              </td>
              <td>
                <p align="center"><input type="submit" value="Submit" name="B1"></p>
              </td>
              </tr>
            </font>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>
</form>
</td>
<td width="20%" valign="middle" align="center">
  <a href="ayudas/docs/abadia_properties.zip">Descargar constantes ( 26.10.2004 )</a>
  <br>Al finalizar enviar al administrador
</td>
</tr>
</table>
&nbsp;
<bean:write name="Navega" filter="false"/>
 <br/>
<form name="literales" action="AdminLiterales.do">
  <input type="hidden" name="post" value="1" />
  <input type="hidden" name="pagina" value="<bean:write name="Pagina" filter="false"/>" />
  <input type="hidden" name="Idioma1" value="<bean:write name="Idioma1" filter="false"/>" />
  <input type="hidden" name="Idioma2" value="<bean:write name="Idioma2" filter="false"/>" />
  <input type="hidden" name="Nuevos" value="<bean:write name="Nuevos" filter="false"/>" />
<table cellSpacing="0" width="90%" bgColor="#996633" border="0">
  <tbody>
    <tr>
      <td width="20"></td>
      <td>
        <p align="center"><b><font  color="#ffffff" size="2">Literales</font></b></p>
      </td>
    </tr>
  </tbody>
</table>
<table style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" borderColor="#000000" cellSpacing="0" width="90%" border="1">
  <tbody>
    <tr>
      <td bgColor="#e4cfa2">
        <table width="100%">
          <tr>
            <td><b>ID</b></td>
            <td><b>Idioma 1 - <bean:write name="sIdioma1" filter="false"/></b></td>
            <td><b>Idioma 2 - <bean:write name="sIdioma2" filter="false"/></b></td>
            <td><b>Modificado</b></td>
          </tr>
          <logic:iterate id="lista" name="literales">
		 <font  size="2">
		   <bean:write property="description" name="lista" filter="false"/>
		 </font>
	   </logic:iterate>
        </table>
      </td>
    </tr>
  </tbody>
</table>
 <p align="center"><input type="submit" value="Modificar" name="Modifica"></p>
</form>
&nbsp;
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

</script>
<!--Fin Script para google-analytics-->

</body>

</html>
