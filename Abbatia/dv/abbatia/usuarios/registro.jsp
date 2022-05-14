<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>
      <bean:message key="index.header"/>
    </title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
    <script type="text/javascript" src="/theme/validator.js"></script>
    <html:javascript formName="RegistroForm" dynamicJavascript="true" staticJavascript="false" />
  </head>
  <body bgcolor="#E1C08B">
    <html:form action="/registrar?accion=registrar" onsubmit="return validateRegistroForm(this);">
      <center>
        <table border="1" width="80%" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
          <tr>
            <td colspan="2" align="center" bgcolor="#996633">
              <b>
              <font color="#FFFFFF"  size="2">
                <bean:message key="registro.abadia.titulo" />
              </font>
              </b>
            </td>
          </tr>
          <tr>
            <td bgcolor="#E4CFA2" align="center">
              <html:img src="/images/registro.gif" altKey="mensajes.mail.asunto"/>
            </td>
            <td bgcolor="#E4CFA2">
              <table border="0" align="center">
                <tr>
                  <th>
                    <div align="right">
                      <bean:message key="usuario.nombre"/>
                    </div>
                  </th>
                  <td>
                    <html:text property="nombre" altKey="usuario.nombrealt" maxlength="10" name="RegistroForm" size="15" styleId="nombre"/>
                  </td>
                </tr>
                <tr>
                  <th>
                    <div align="right">
                      <bean:message key="usuario.apellido1"/>
                    </div>
                  </th>
                  <td>
                    <html:text maxlength="15" property="apellido1" altKey="usuario.apellido1alt" name="RegistroForm" size="20" styleId="apellido1"/>
                  </td>
                </tr>
                <tr>
                  <th>
                    <div align="right">
                      <bean:message key="usuario.apellido2"/>
                    </div>
                  </th>
                  <td>
                    <html:text maxlength="15" property="apellido2" altKey="usuario.apellido2alt" name="RegistroForm" size="20" styleId="apellido2"/>
                  </td>
                </tr>
                <tr>
                  <th>
                    <div align="right">
                      <bean:message key="usuario.edad"/>
                    </div>
                  </th>
                  <td>
                    <html:select name="RegistroForm" property="edad">
                      <html:options collection="edades" property="id" labelProperty="description"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <th>
                    <div align="right">
                      <bean:message key="usuario.sexo"/>
                    </div>
                  </th>
                  <td>
                    <html:select name="RegistroForm" property="sexo">
                      <html:options collection="sexo" property="id" labelProperty="description"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <th>
                    <div align="right">
                      <bean:message key="usuario.pais"/>
                    </div>
                  </th>
                  <td>
                    <html:select name="RegistroForm" property="pais">
                      <html:options collection="paises" property="id" labelProperty="description"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <th>
                    <div align="right">
                      <bean:message key="usuario.alias"/>
                    </div>
                  </th>
                  <td>
                    <html:text maxlength="10" property="nick" alt="Alias para el juego" name="RegistroForm" size="10" styleId="nick"/>
                  </td>
                </tr>
                <tr>
                  <th>
                    <div align="right">
                      <bean:message key="usuario.email"/>
                    </div>
                  </th>
                  <td>
                    <html:text property="email" alt="Correo Electrónico" maxlength="40" name="RegistroForm" size="40" styleId="email" />
                  </td>
                </tr>
                <tr>
                  <th>
                    <div align="right">
                      <bean:message key="usuario.idioma"/>
                    </div>
                  </th>
                  <td>
                    <html:select name="RegistroForm" property="idioma">
                      <html:options collection="languages" property="id" labelProperty="description"/>
                    </html:select>
                  </td>
                </tr>
                <tr>
                  <td align="center" colspan="2">
                    <BR/>
                    <html:submit>
                      <bean:message key="usuario.registrar"/>
                    </html:submit>
                  </td>
                </tr>
                <tr>
                  <td align="center" colspan="2">
                    <html:errors/>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </center>
    </html:form>
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
