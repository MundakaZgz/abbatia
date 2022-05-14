<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
    <title></title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css"/>
</head>
<body topmargin="2" leftmargin="2" bgcolor="#E1C08B" text="#000000">
<P>&nbsp;</P>
<P>&nbsp;</P>
<center>
    <table border="1" cellspacing="0" bordercolor="#000000" width="80%" bordercolorlight="#000000" bordercolordark="#000000">

        <tr height="20">

            <td align="center" bgcolor="#996633">

                <b>
                    <font color="#FFFFFF"  size="2">
                        <bean:message key="mensajes.abadia.avisos"/>
                    </font>
                </b>

            </td>

        </tr>

        <tr>

            <td bgcolor="#E4CFA2">

                <table border="0" width="100%">
                    <tr>
                        <td align="center">
                            <html:errors/>
                            <logic:messagesPresent message="true">
                                <html:messages id="msg" message="true">
                                    <div class="success">
                                        <STRONG>
                                            <FONT size="3">
                                                <bean:write name="msg" filter="false"/><br/>
                                            </FONT>
                                        </STRONG>
                                    </div>
                                </html:messages>
                            </logic:messagesPresent>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <logic:notEmpty name="notificacion">
                                <br><br>
                                <table cellspacing=30 border=0>
                                <tr>
                                <logic:iterate id="notas" name="notificacion">
                                    <logic:equal name="notas" property="salto" value="1">
                                        </tr>
                                        </table>
                                        <table>
                                        <tr>
                                    </logic:equal>
                                    <td>
                                        <center>
                                            <a href="<bean:write name="notas" property="action"/>" >
                                                <logic:notEmpty name="notas" property="grafico">
                                                    <img border=0 alt="" src="/images/mapas/<bean:write name="notas" property="grafico"/>"/>
                                                </logic:notEmpty>
                                                <br/>
                                                <bean:write name="notas" property="texto"/>
                                            </a>
                                        </center>
                                    </td>
                                </logic:iterate>
                                </tr>
                                </table>
                            </logic:notEmpty>
                        </td>
                    </tr>
                    <logic:present name="msg_stacktrace" >
                        <tr>
                            <td align="center">
                               <!--
                               --------------------------------- RENDERER ERROR ------------------------------------------
                               <bean:write name="msg_stacktrace" />
                                -->
                            </td>
                        </tr>
                    </logic:present>
                    
                </table>
            </td>
        </tr>
    </table>
</center>
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
</html>
