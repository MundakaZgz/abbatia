<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>


<script language="javascript">
	var fecha
	var CronoID = null
	var browserName=navigator.appName;

	function InicializarCrono () {

		if (fecha == null) {
			fecha = new Date();
			fecha.setYear(<bean:write name="Tiempo" property="year" />);
			fecha.setMonth(<bean:write name="Tiempo" property="mes" />);
			fecha.setDate(<bean:write name="Tiempo" property="dia" />);
			fecha.setHours(<bean:write name="Tiempo" property="hora" />);
			fecha.setMinutes(<bean:write name="Tiempo" property="minuto" />);
			fecha.setSeconds(0);
		}
		MostrarCrono ();
	}

	function MostrarCrono () {


		//configura la salida
		anyo = fecha.getYear();
		mes = fecha.getMonth()+1;
		dia = fecha.getDate();

		hora = fecha.getHours();
		minutos = fecha.getMinutes();
		if (browserName=="Microsoft Internet Explorer") {
			anyo = fecha.getYear();
		} else {
			anyo = <bean:write name="Tiempo" property="year" />;
		}


		if (hora < 10) {
			hora = "0" + hora;
		}
		if (minutos < 10) {
			minutos = "0" + minutos;
		}
		if (mes < 10) {
			mes = "0" + mes;
		}
		if (dia < 10) {
			dia = " " + dia;
		}


         var ValorCrono = dia + "-" + mes + "-" + anyo + " " + hora + ":" + minutos;

	  document.getElementById("reloj").innerHTML= ValorCrono;

	  fecha.setMinutes(fecha.getMinutes() + 1);

	  CronoID = setTimeout("InicializarCrono ()", 5000);
	}

</script>


  <head>
    <base target="principal"/>
    <link REL="STYLESHEET" HREF="theme/styles.css" TYPE="text/css">
  </head>
  <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="InicializarCrono();">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td width="140" height="100" >
          <!-- Publicidad -->
          <img STYLE="position:absolute;top:0; left:0;" border="0" src="images/head-frame-left.gif"/>
          <img STYLE="position:absolute;top:0; left:20;" SRC="images/underconstructionchurch.jpg"/>
        </td>
        <td width="300" height="100" background="images/head-frame-bot.gif">
        </td>
        <td background="images/head-frame-bot.gif" align="center">
            <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
                <input type="hidden" name="cmd" value="_s-xclick">
                <input type="image" src="images/iconos/x-click-but04.gif" border="0" name="submit" alt="Realice pagos con PayPal: es rápido, gratis y seguro.">
                <img alt="" border="0" src="https://www.paypal.com/es_ES/i/scr/pixel.gif" width="1" height="1">
                <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----MIIHXwYJKoZIhvcNAQcEoIIHUDCCB0wCAQExggEwMIIBLAIBADCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwDQYJKoZIhvcNAQEBBQAEgYAx7EAAb5a4DUOcnlYRsXh6qDLQkdlv3e2itAiZAmG8U0jXsslCAQLnTm3HIdMZLjS+Gp1u7gqAW5DLtdkn/Fbv5zJPdZWnFpmRng5wd9wigH6se6O4O1jdujr/LFAPRyFqkEwFWzvmry3FwAuUJZxAGasgNOjvwBfL53W0ie8dGTELMAkGBSsOAwIaBQAwgdwGCSqGSIb3DQEHATAUBggqhkiG9w0DBwQIKcsjUxPispaAgbiQ8isoYW+HfAch+Na2iDGnEmYXmWeCv6SrN29zplWwMXBOnXI11groEtxeNYoHevHW0l3br4OH71lGYc3SX3PLpztG/RwHNLS7U/oc9zYdYVoytYC+KKhGRh5wNT4xRNO+D05a3T9Jn/hqJE8a6L5m7T/SW3QKhS7WUPpdQxvQ/9gUsxmRDqYQWej+W5sYfjX3VpA50LmEj7HvCCeTvhXkD/bPfMGaI4b9/DLtJdBZfySk/u0vwX1ZoIIDhzCCA4MwggLsoAMCAQICAQAwDQYJKoZIhvcNAQEFBQAwgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMB4XDTA0MDIxMzEwMTMxNVoXDTM1MDIxMzEwMTMxNVowgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDBR07d/ETMS1ycjtkpkvjXZe9k+6CieLuLsPumsJ7QC1odNz3sJiCbs2wC0nLE0uLGaEtXynIgRqIddYCHx88pb5HTXv4SZeuv0Rqq4+axW9PLAAATU8w04qqjaSXgbGLP3NmohqM6bV9kZZwZLR/klDaQGo1u9uDb9lr4Yn+rBQIDAQABo4HuMIHrMB0GA1UdDgQWBBSWn3y7xm8XvVk/UtcKG+wQ1mSUazCBuwYDVR0jBIGzMIGwgBSWn3y7xm8XvVk/UtcKG+wQ1mSUa6GBlKSBkTCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb22CAQAwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQCBXzpWmoBa5e9fo6ujionW1hUhPkOBakTr3YCDjbYfvJEiv/2P+IobhOGJr85+XHhN0v4gUkEDI8r2/rNk1m0GA8HKddvTjyGw/XqXa+LSTlDYkqI8OwR8GEYj4efEtcRpRYBxV8KxAW93YDWzFGvruKnnLbDAF6VR5w/cCMn5hzGCAZowggGWAgEBMIGUMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbQIBADAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDYxMDAxMjEyNTM3WjAjBgkqhkiG9w0BCQQxFgQUt+pRe3sjC9I0zbjyZeuC70YVNuswDQYJKoZIhvcNAQEBBQAEgYBuR8ErX4c4mJfID+DCvRb4RN1607eQkaVKaU71dTzF8dK8xj3fZ0byf27IsYXio9ngLjQ0O0DA0LPkB9yRNNcflGDNUo03X6p/7SfM6BnrowRTBIP0zdbYZ9p6x2sXoBj7Ejz3+XQiMlrT6wwDJSWr1hh1UWw112MZfNJ+vPkGEQ==-----END PKCS7-----">
            </form>

        </td>
        <td width="700" height="100" background="images/head-frame-bot.gif" align="center">

            <a href="index_main.do" target="principal">
              <img border="0" src="images/titulo.gif"/>
            </a>
        </td>
        <td align="left" valign="bottom" background="images/head-frame-bot.gif" width="177">
          <br />
          <table width="100%" border="0" cellspacing="3" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
            <tr >
              <td align="center">
                <img alt="" src="images/Tiempo/relojarena.gif"/>
              </td>
              <td align="center">
                <font size="2" ><B>
                    <bean:message name="Tiempo" property="diaSemana" />
                  </B>
                  <br/>
                  <div id="reloj">calculando...</div>
                </font>
              </td>
            </tr>
            <tr >
              <td colspan=2>
                	&nbsp;
              </td>
            </tr>
          </table>
        </td>
        <!-- manual -->
        <td align="center" valign="bottom" background="images/head-frame-bot.gif" width="161">
          <a href="/ayudas.do" target="principal">
            <img border="0" src="images/iconos/manual.gif" ><br/><b><bean:message key="index.ayudas"/></b>
          </a><br />&nbsp;<br />&nbsp;
        </td>
      </tr>
    </table>
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
