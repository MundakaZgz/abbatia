<%@page language="java"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
<link REL="STYLESHEET" HREF="../theme/styles.css" TYPE="text/css">
</head>
<body topmargin="2" leftmargin="4" bgcolor="#E1C08B" text="#000000">
<div align="center">
  <table borderColor="#000000" cellSpacing="0" borderColorDark="#000000" width="90%" borderColorLight="#000000" border="1">
    <tr>
      <td align="middle" bgColor="#996633">
        <p align="center"><b><font  color="#ffffff" size="2">Soporte
        económico</font></b></p>
      </td>
    </tr>
    <tr>
      <td bgColor="#e4cfa2">
        <p align="left"><font  size="2"><b><u>¿Quien
        soporta económicamente este proyecto?</u></b></font></p>
        <ul>
          <li>
            <p align="left"><font  size="2">Benjamin
            Rodriguez ( <font color="#808080">cuota mensual 30€</font> )</font></li>
          <li>
            <p align="left"><font  size="2">Javier Lardín (
            <font color="#808080">cuota mensual 30€</font> )</font></li>
          <li>
            <p align="left"><font  size="2">Jordi del Rio ( <font color="#808080">cuota
            mensual 30€</font> )</font></li>
          <li>
            <p align="left"><font  size="2">John Lohmeyer ( <font color="#808080">cuota
            mensual 30€</font> )</font></li>
          <li>
            <p align="left"><font  size="2">Miquel González
            ( <font color="#808080">cuota mensual 30€</font> )</font></li>
        </ul>
        <p align="left">
            <font  size="2" color="#800000">
                <b>Si quieres soportar el proyecto económicamente ya sea con una aportación manual o extraordinaria...</b>
             </font>
        </p>
      <p align="left">
          <font  size="2">
              <center>
                  <b>Cuenta bancaria:</b>&nbsp;1465.0120.31.2008393748  ( Indicar "Benjamín Rodríguez", abbatia y nick en el concepto )<br>
                  <b>IBAN para donaciones desde fuera de España:</b>&nbsp;ES33 1465 0120 31 2008393748
              </center>
          </font>
      </p>
      <p align="left">
          <font  size="2">
            <center>
              <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
                  <input type="hidden" name="cmd" value="_s-xclick">
                  <input type="image" src="images/iconos/x-click-but04.gif" border="0" name="submit" alt="Realice pagos con PayPal: es rápido, gratis y seguro.">
                  <img alt="" border="0" src="https://www.paypal.com/es_ES/i/scr/pixel.gif" width="1" height="1">
                  <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----">
              </form>
            </center>
          </font>    
       </p>
      <p align="left"><font  size="2"><b>Nota: </b>A las
      personas que nos soporten el proyecto económicamente se les quitará
      la publicidad en el juego y se le añadira en esta página como soporter.</font></p>
      </td>
    </tr>
  </table>
</div>
&nbsp;
  <center>
    <bean:write name="Navega" filter="false"/>
    <table borderColor="#000000" cellSpacing="0" borderColorDark="#000000" width="90%" borderColorLight="#000000" border="1">
      <tr>
        <td align="middle" bgColor="#996633">
          <p align="center">
            <b>
              <font color="#ffffff" size="2">
                <bean:message key="supporters.titulo"/>
              </font>
            </b>
          </p>
        </td>
      </tr>
      <tr>
        <td bgColor="#e4cfa2">
          <table width="100%">
            <logic:iterate id="lista" name="supporters">
              <font size="2">
                <bean:write property="description" name="lista" filter="false"/>
              </font>
            </logic:iterate>
          </table>
        </td>
      </tr>
    </table>
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
