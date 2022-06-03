<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <link rel="stylesheet" href="theme/style-global.css" type="text/css"/>
    <link rel="stylesheet" href="theme/style-revised.css" type="text/css"/>
</head>
<body>
<div id="container">
<h3 class="textCenter">
    <bean:message key="principal.portal.informacion"/>
</h3>

<div class="infoEntrada">
    <h4>
        <bean:message key="principal.portal.bienvenida"/>
    </h4>

    <p>
        <bean:message key="principal.portal.desc1"/>
        (<strong>
        <bean:message key="principal.portal.desc2"/>
    </strong>)
        <bean:message key="principal.portal.desc3"/>
    </p>

    <p>
        <bean:message key="principal.portal.desc4"/>
    </p>

    <p>
        <bean:message key="principal.portal.desc5"/>
    </p>
</div>
<div class="break"></div>
<!--Novedades-->
<div class="floatLeft" style="width: 75%">
    <div class="infoEntrada">
        <h4>
            <bean:message key="principal.portal.novedades"/>
            <a href="index_main.do?param=novedad"><img src="images/iconos/16/corner_right.gif"
                                                       alt="<bean:message key="principal.portal.vermas"/>"/></a></h4>
        <logic:iterate id="novedades" name="DatosInicio" property="ultimasNovedades">
            <h5>
                <bean:write property="fecha" name="novedades" filter="false"/>
            </h5>

            <div id="novedades">
                <dl>
                    <logic:iterate id="novedad" name="novedades" property="msg">
                        <dt>*</dt>
                        <dd>
                            <bean:write name="novedad"/>
                        </dd>
                    </logic:iterate>
                </dl>
            </div>
        </logic:iterate>
    </div>
    <!-- ACONTECIMIENTOS -->
    <div class="infoEntrada">
        <h4>
            <bean:message key="principal.portal.acontecimientos"/>
            <a href="index_main.do?param=mensaje"><img src="images/iconos/16/corner_right.gif"
                                                       alt="<bean:message key="principal.portal.vermas"/>"/></a></h4>

        <div id="mensajes">
            <dl>
                <logic:iterate id="ultacont" name="DatosInicio" property="ultimosAcontecimientos">
                    <dt>
                        <bean:write property="fechaReal" name="ultacont"/>
                    </dt>
                    <dd>( <strong>
                        <bean:write property="nombreAbadia" name="ultacont"/>
                    </strong> )
                        <bean:write property="mensaje" name="ultacont" filter="false"/>
                    </dd>
                </logic:iterate>
            </dl>
        </div>
    </div>
    <!-- FOROS -->
    <div class="infoEntrada">
        <h4>
            <bean:message key="principal.portal.foros"/>
            <a href="http://foros.abbatia.net"><img src="images/iconos/16/corner_right.gif"
                                                    alt="<bean:message key="principal.portal.vermas"/>"/></a></h4>
        <iframe src="http://foros.abbatia.net/last_connections.php" width="100%" height="500" scrolling="auto">
            [Your user agent does not support frames or is currently configured not to display frames. However, you may
            visit]
        </iframe>
    </div>
</div>

<div class="floatRight" style="width: 20%">

    <!-- SOPORTE Y COLABORADORES -->
    <div class="infoEntrada textCenter">
        <h4>
            <bean:message key="principal.portal.info"/>
        </h4>
        <ul>
            <li><a href="/ayudas.do">
                <bean:message key="index.ayudas"/>
            </a></li>
            <li><a href="http://foros.abbatia.net">
                <bean:message key="outlook.menu.foros"/>
            </a></li>
            <li><a href="http://www.irc-hispano.org/index.php?seccion=canal&sec=&can=abbatia">
                <bean:message key="index.ayudas.chat"/>
            </a></li>
            <li><a href="http://bugs.abbatia.net" target="_blank">
                <bean:message key="principal.portal.bugs"/>
            </a></li>
        </ul>
        <hr/>
        <ul>
            <li><a href="/equipo_desarrollo.do">
                <bean:message key="principal.portal.equipo"/>
            </a><br/>
            <li><a href="/supporters.do">
                <bean:message key="principal.portal.supporters"/>
            </a><br/>
        </ul>
        <hr/>
        <ul>
            <li><a href="/Publicidad.do">
                <bean:message key="publicidad.titulo"/>
            </a></li>
            <li><a href="/proteccion_datos.do">
                <bean:message key="principal.portal.LOPD"/>
            </a></li>
            <li><a href="http://abbatia.shirtcity.com" target="_blank">
                <bean:message key="productos.abbatia"/>
            </a></li>
        </ul>
    </div>

    <!-- SCORES -->
    <div class="infoEntrada">
        <h4>
            <bean:message key="principal.portal.top10"/>
        </h4>

        <div class="floatLeft" style="width: 20%">
            <img alt="" src="images/grial.gif"/>
        </div>
        <div class="floatRight" style="width: 75%">
            <ol>
                <logic:iterate id="ultmejores" name="DatosInicio" property="ultimosMejoresAbadias">
                    <li>
                        <bean:write property="description" name="ultmejores" filter="false"/>
                    </li>
                </logic:iterate>
            </ol>
        </div>
        <div class="break"></div>
        <p class="textCenter"><a href="index_main.do?param=topusers">(<bean:message key="principal.portal.vermas"/>)</a></p>
    </div>

    <!-- ULTIMAS CONEXIONES -->
    <div class="infoEntrada">
        <h4>
            <bean:message key="principal.portal.conexiones"/>
        </h4>
        <logic:iterate id="ultconex" name="DatosInicio" property="ultimasConexiones">
            <bean:write property="description" name="ultconex" filter="false"/>
        </logic:iterate>
    </div>

    <!-- ESTADISTICAS -->
    <div class="infoEntrada textCenter">
        <h4>
            <bean:message key="principal.portal.Estat"/>
        </h4>
        <ul>
            <li>
                <bean:write name="UsuariosConectados" filter="false"/> <bean:message key="principal.portal.conectados"/>
            </li>
            <li>
                <bean:write name="UsuariosActivos" filter="false"/> <bean:message key="principal.portal.activos"/>
            </li>
            <li>
                <bean:write name="UsuariosRegistrados" filter="false"/> <bean:message key="principal.portal.registrados"/>
            </li>
            <li>
                <bean:write name="AltasPendientes" filter="false"/> <bean:message key="principal.portal.altaspendientes"/>
            </li>
        </ul>
    </div>
    <div class="break">&nbsp;</div>
    <div id="publicidad">
        <html:link action="/Publicidad" target="_blank" paramId="id" paramName="Banner125" paramProperty="id">
            <img border=0 alt="<bean:write property="hint" name="Banner125" filter="false" />"
                 src="images/publicidad/<bean:write property="imagen" name="Banner125" filter="false" />"/>
        </html:link>
        <br/>
     </div>
     <div id="publicidad2">
        <p>
            <!-- Anuncio Google -->
            <script type="text/javascript"><!--
            google_ad_client = "pub-9882482426608676";
            google_ad_width = 120;
            google_ad_height = 240;
            google_ad_format = "120x240_as";
            google_ad_channel = "";
            google_color_border = "000000";
            google_color_bg = "E4CFA2";
            google_color_link = "0000FF";
            google_color_url = "008000";
            google_color_text = "000000";
            google_language = "es";
            google_page_url = document.location;
            google_ad_type = "text_image";
            //-->
            </script>
            <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
        </p>
    </div>

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

</div>
<div class="break">&nbsp;</div>
<div id="banner468">
    <html:link action="/Publicidad" target="_blank" paramId="id" paramName="Banner468" paramProperty="id">
        <img border=0 alt="<bean:write property="hint" name="Banner468" filter="false" />"
             src="images/publicidad/<bean:write property="imagen" name="Banner468" filter="false" />"/>
    </html:link>
</div>
<jsp:include page="/varios/publicidad.jsp"/>


<div id="tecnologias">
    <div class="floatLeft" style="width: 24%; text-align: center;">
        <a href="http://www.debian.org/" target="_blank">
            <img src="images/ads/debian.jpg" alt="Logo Debian" />
            <br/>Debian</a>
    </div>
    <div class="floatLeft" style="width: 24%; text-align: center;">
        <a href="http://jakarta.apache.org/tomcat/" target="_blank">
            <img border="0" src="images/ads/tomcat.gif" alt="Logo Apache/Tomcat" />
            <br/>Apache Tomcat/5.5.17</a>
    </div>
    <div class="floatLeft" style="width: 24%; text-align: center;">
        <a href="http://jakarta.apache.org/struts/" target="_blank">
            <img border="0" src="images/ads/struts.gif" alt="Logo Struts"/>
            <br/>Struts 1.2</a>
    </div>
    <div class="floatLeft" style="width: 24%; text-align: center;">
        <a href="http://www.mysql.org/" target="_blank">
            <img border="0" src="images/ads/mysql.png" alt="Logo mySQL"/>
            <br/>MySQL</a>
    </div>
    <div class="break"></div>
</div>
<p class="textCenter">© <a href="http://www.mitdata.net" target="_blank">MITDATA S.C.P.</a>
    <bean:message key="principal.portal.copyright"/>
</p>
</div>
<div class="break">&nbsp;</div>
</body>
</html>