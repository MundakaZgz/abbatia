<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<logic:notPresent name="usuario" scope="session">
    <logic:forward name="error"/>
</logic:notPresent>

<html>
<head>
    <title>Pantalla principal de prueba</title>
    <link REL="STYLESHEET" HREF="/theme/styles.css" TYPE="text/css">
</head>
<body bgcolor="#E1C08B">

<br>

<!-- Monjes en la abadia -->
<table borderColor="#000000" width="90%" cellSpacing="0" align="center" borderColorDark="#000000" borderColorLight="#000000" border="1">
    <tr>
      <td bgColor="#996633">
		<p align="center"><font color="#FFFFFF"><b><bean:message key="monjes.abadia.titulo"/></b></font></p>
      </td>
    </tr>
    <tr>
    <td>
	<table cellspacing="0" border="0" background="images/backgrounds/papel.jpg" width="100%" align="center">

		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
	<%
		int n = 0;
	%>
	  <logic:iterate id="Monje" name="Monjes">
		  <td>

					<table border="1" width="130" align="center" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
					<tr>
					  <td align="center" bgcolor="#F0AF1C">
							<font color="#000000" size="1" >
							<bean:write name="Monje" property="nombre"/>&nbsp;<bean:message key="monjes.abadia.nomciudad"/>&nbsp;<bean:write name="Monje" property="primerApellido"/>
                            <bean:write name="Monje" property="HTMLEnfermedad" filter="false" />
						</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
							<font color="#000000" size="1">
							<bean:message key="monjes.abadia.edad"/>
							  <bean:write name="Monje" property="edad"/>
							<br>
  							  <bean:message key="monjes.abadia.salud"/>
							  <bean:write name="Monje" property="barra_salud" filter="false" />
  							  <bean:message key="monjes.abadia.fe"/>
							  <bean:write name="Monje" property="barra_fe" filter="false" />
							<br>
							</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
					     <table width="100%" align="center" border=0>
				            <tr>
		                      <td align="center"><font size=1>I:</font><bean:write name="Monje" property="barra_idioma" filter="false"/></td>
		                      <td align="center"><font size=1>T:</font><bean:write name="Monje" property="barra_talento" filter="false"/></td>
            				</tr>
				            <tr>
		                      <td align="center"><font size=1>C:</font><bean:write name="Monje" property="barra_carisma" filter="false"/></td>
		                      <td align="center"><font size=1>S:</font><bean:write name="Monje" property="barra_sabiduria" filter="false"/></td>
				            </tr>
				            <tr>
		                      <td align="center"><font size=1>F:</font><bean:write name="Monje" property="barra_fuerza" filter="false"/></td>
		                      <td align="center"><font size=1>D:</font><bean:write name="Monje" property="barra_destreza" filter="false"/></td>
				            </tr>
						 </table>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E1C08B" align="center">
						<font color="#000000" size="1">
							<html:link action="/mostrarMonje" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
								  <bean:message key="monjes.abadia.masinfo"/>
							</html:link><br>
	                        <html:link action="/mostrar_produccion" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
		                      <html:img  border="0" page="/images/iconos/16/ojo.gif" altKey="tooltip.produccion" />
  			                </html:link>
						</font>
					  </td>
					</tr>

				  </table>

		  </td>
		  <%
			if (n > 2) {
				out.println ("<tr></tr>");
					n = 0;
			} else n++;
		  %>
	  </logic:iterate>
 	  </tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</table>
    </td>
    </tr>

<!-- ENFERMOS -->
<logic:notEmpty name="Monjes_enfermos">
    <tr>
      <td bgColor="#996633">
		<p align="center"><font color="#FFFFFF"><b><bean:message key="monjes.abadia.enfermos"/></b></font></p>
      </td>
    </tr>
    <tr>
    <td>
	<table cellspacing="0" border="0" background="images/backgrounds/papel.jpg" width="100%" align="center">

		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
	<%
		n = 0;
	%>
	  <logic:iterate id="Monje" name="Monjes_enfermos">
		  <td>

					<table border="1" width="130" align="center" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
					<tr>
					  <td align="center" bgcolor="#F0AF1C">
							<font color="#000000" size="1" >
							<bean:write name="Monje" property="nombre"/>&nbsp;<bean:message key="monjes.abadia.nomciudad"/>&nbsp;<bean:write name="Monje" property="primerApellido"/>
                            <bean:write name="Monje" property="HTMLEnfermedad" filter="false" />
						</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
							<font color="#000000" size="1">
							<bean:message key="monjes.abadia.edad"/>
							  <bean:write name="Monje" property="edad"/>
							<br>
  							  <bean:message key="monjes.abadia.salud"/>
							  <bean:write name="Monje" property="barra_salud" filter="false" />
  							  <bean:message key="monjes.abadia.fe"/>
							  <bean:write name="Monje" property="barra_fe" filter="false" />
							<br>
							</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
					     <table width="100%" align="center" border=0>
				            <tr>
		                      <td align="center"><font size=1>I:</font><bean:write name="Monje" property="barra_idioma" filter="false"/></td>
		                      <td align="center"><font size=1>T:</font><bean:write name="Monje" property="barra_talento" filter="false"/></td>
            				</tr>
				            <tr>
		                      <td align="center"><font size=1>C:</font><bean:write name="Monje" property="barra_carisma" filter="false"/></td>
		                      <td align="center"><font size=1>S:</font><bean:write name="Monje" property="barra_sabiduria" filter="false"/></td>
				            </tr>
				            <tr>
		                      <td align="center"><font size=1>F:</font><bean:write name="Monje" property="barra_fuerza" filter="false"/></td>
		                      <td align="center"><font size=1>D:</font><bean:write name="Monje" property="barra_destreza" filter="false"/></td>
				            </tr>
						 </table>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E1C08B" align="center">
						<font color="#000000" size="1">
							<html:link action="/mostrarMonje" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
								  <bean:message key="monjes.abadia.masinfo"/>
							</html:link><br>
						</font>
					  </td>
					</tr>

				  </table>

		  </td>
		  <%
			if (n > 2) {
				out.println ("<tr></tr>");
					n = 0;
			} else n++;
		  %>
	  </logic:iterate>
 	  </tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</table>
    </td>
    </tr>
  </logic:notEmpty>


<!-- VIAJANDO -->
<logic:notEmpty name="Monjes_viaje">
    <tr>
      <td bgColor="#996633">
		<p align="center"><font color="#FFFFFF"><b><bean:message key="monjes.abadia.viaje"/></b></font></p>
      </td>
    </tr>
    <tr>
    <td>
	<table cellspacing="0" border="0" background="images/backgrounds/papel.jpg" width="100%" align="center">

		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
	<%
		n = 0;
	%>
	  <logic:iterate id="Monje" name="Monjes_viaje">
		  <td>
					<table border="1" width="130" align="center" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
					<tr>
					  <td align="center" bgcolor="#F0AF1C">
							<font color="#000000" size="1" >
							<bean:write name="Monje" property="nombre"/>&nbsp;<bean:message key="monjes.abadia.nomciudad"/>&nbsp;<bean:write name="Monje" property="primerApellido"/>
                            <bean:write name="Monje" property="HTMLEnfermedad" filter="false" />
						</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
							<font color="#000000" size="1">
							<bean:message key="monjes.abadia.edad"/>
							  <bean:write name="Monje" property="edad"/>
							</font>
							<br>
  							  <bean:message key="monjes.abadia.salud"/>
							  <bean:write name="Monje" property="barra_salud" filter="false" />
							<br>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
  							  <bean:message key="monjes.abadia.destino"/><br>
                              <bean:write name="Monje" property="abadia" filter="false" /><br>
                              <bean:write name="Monje" property="region" filter="false" /><br>
					  </td>
					</tr>
                    <tr>
					  <td bgcolor="#E4CFA2" align="center">
                              <bean:message key="monjes.abadia.llegada"/><br>
                              <bean:write name="Monje" property="fechallegada" filter="false" />
                       </td>
					</tr>
				  </table>
		  </td>
		  <%
			if (n > 2) {
				out.println ("<tr></tr>");
					n = 0;
			} else n++;
		  %>
	  </logic:iterate>
 	  </tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</table>
    </td>
    </tr>
  </logic:notEmpty>

<!-- VISITA -->
<logic:notEmpty name="Monjes_visita">
    <tr>
      <td bgColor="#996633">
		<p align="center"><font color="#FFFFFF"><b><bean:message key="monjes.abadia.visita"/></b></font></p>
      </td>
    </tr>
    <tr>
    <td>
	<table cellspacing="0" border="0" background="images/backgrounds/papel.jpg" width="100%" align="center">

		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
	<%
		n = 0;
	%>
	  <logic:iterate id="Monje" name="Monjes_visita">
		  <td>
					<table border="1" width="130" align="center" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
					<tr>
					  <td align="center" bgcolor="#F0AF1C">
							<font color="#000000" size="1" >
							<bean:write name="Monje" property="nombre"/>&nbsp;<bean:message key="monjes.abadia.nomciudad"/>&nbsp;<bean:write name="Monje" property="primerApellido"/>
                            <bean:write name="Monje" property="HTMLEnfermedad" filter="false" />
						</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
							<font color="#000000" size="1">
							<bean:message key="monjes.abadia.edad"/>
							  <bean:write name="Monje" property="edad"/>
							<br>
  							  <bean:message key="monjes.abadia.salud"/>
							  <bean:write name="Monje" property="barra_salud" filter="false" />
  							  <bean:message key="monjes.abadia.fe"/>
							  <bean:write name="Monje" property="barra_fe" filter="false" />
							<br>
							</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
					     <table width="100%" align="center" border=0>
				            <tr>
		                      <td align="center"><font size=1>I:</font><bean:write name="Monje" property="barra_idioma" filter="false"/></td>
		                      <td align="center"><font size=1>T:</font><bean:write name="Monje" property="barra_talento" filter="false"/></td>
            				</tr>
				            <tr>
		                      <td align="center"><font size=1>C:</font><bean:write name="Monje" property="barra_carisma" filter="false"/></td>
		                      <td align="center"><font size=1>S:</font><bean:write name="Monje" property="barra_sabiduria" filter="false"/></td>
				            </tr>
				            <tr>
		                      <td align="center"><font size=1>F:</font><bean:write name="Monje" property="barra_fuerza" filter="false"/></td>
		                      <td align="center"><font size=1>D:</font><bean:write name="Monje" property="barra_destreza" filter="false"/></td>
				            </tr>
						 </table>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
  							  <b><bean:message key="monjes.abadia.en"/>:</b><br>
                              <bean:write name="Monje" property="abadia" filter="false" /><br>
                              <bean:write name="Monje" property="region" filter="false" />
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E1C08B" align="center">
						<font color="#000000" size="1">
							<html:link action="/mostrarMonje" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
								  <bean:message key="monjes.abadia.masinfo"/>
							</html:link><br>
						</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E1C08B" align="center">
						<font color="#000000" size="1">
							<html:link action="/visita?action=marchar" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
								  <bean:message key="monjes.abadia.visita.marchar"/>
							</html:link><br>
                            <logic:greaterThan name="Monje" property="idDeJerarquia" value="2"  >
                                <html:link action="/visita?action=enfadado" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
                                      <bean:message key="monjes.abadia.visita.marchar.enfadado"/>
                                </html:link><br>
                            </logic:greaterThan>
						</font>
					  </td>
					</tr>

				  </table>
		  </td>
		  <%
			if (n > 2) {
				out.println ("<tr></tr>");
					n = 0;
			} else n++;
		  %>
	  </logic:iterate>
 	  </tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</table>
    </td>
    </tr>
  </logic:notEmpty>


<!-- VISITA LA ABADIA -->
<logic:notEmpty name="Monjes_visita_miabadia">
    <tr>
      <td bgColor="#996633">
		<p align="center"><font color="#FFFFFF"><b><bean:message key="monjes.abadia.visita_miabadia"/></b></font></p>
      </td>
    </tr>
    <tr>
    <td>
	<table cellspacing="0" border="0" background="images/backgrounds/papel.jpg" width="100%" align="center">

		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
	<%
		n = 0;
	%>
	  <logic:iterate id="Monje" name="Monjes_visita_miabadia">
		  <td>
					<table border="1" width="130" align="center" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
					<tr>
					  <td align="center" bgcolor="#F0AF1C">
							<font color="#000000" size="1" >
							<bean:write name="Monje" property="nombre"/>&nbsp;<bean:message key="monjes.abadia.nomciudad"/>&nbsp;<bean:write name="Monje" property="primerApellido"/>
                            <bean:write name="Monje" property="HTMLEnfermedad" filter="false" />
						</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
							<font color="#000000" size="1">
							<bean:message key="monjes.abadia.edad"/>
							  <bean:write name="Monje" property="edad"/>
							<br>
  							  <bean:message key="monjes.abadia.salud"/>
							  <bean:write name="Monje" property="barra_salud" filter="false" />
  							  <bean:message key="monjes.abadia.fe"/>
							  <bean:write name="Monje" property="barra_fe" filter="false" />
							<br>
							</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
  							  <b><bean:message key="monjes.abadia.de"/>:</b><br>
                              <bean:write name="Monje" property="abadia" filter="false" /><br>
                              <bean:write name="Monje" property="region" filter="false" />
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E1C08B" align="center">
						<font color="#000000" size="1">
							<html:link action="/mostrarMonje" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
								  <bean:message key="monjes.abadia.masinfo"/>
							</html:link><br>
						</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E1C08B" align="center">
						<font color="#000000" size="1">
							<html:link action="/visita?action=expulsar&" paramId="clave" paramName="Monje" paramProperty="idDeMonje">
								  <bean:message key="monjes.abadia.visita.expulsar"/>
							</html:link><br>
						</font>
					  </td>
					</tr>

				  </table>
		  </td>
		  <%
			if (n > 2) {
				out.println ("<tr></tr>");
					n = 0;
			} else n++;
		  %>
	  </logic:iterate>
 	  </tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</table>
    </td>
    </tr>
  </logic:notEmpty>


<!-- VELATORIO -->
<logic:notEmpty name="Monjes_muertos">
    <tr>
      <td bgColor="#996633">
		<p align="center"><font color="#FFFFFF"><b><bean:message key="monjes.abadia.velatorio"/></b></font></p>
      </td>
    </tr>
    <tr>
    <td>
	<table cellspacing="0" border="0" background="images/backgrounds/papel.jpg" width="100%" align="center">

		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
	<%
		n = 0;
	%>
	  <logic:iterate id="Monje" name="Monjes_muertos">
		  <td>
					<table border="1" width="130" align="center" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
					<tr>
					  <td align="center" bgcolor="#F0AF1C">
							<font color="#000000" size="1" >
							<bean:write name="Monje" property="nombre"/>&nbsp;<bean:message key="monjes.abadia.nomciudad"/>&nbsp;<bean:write name="Monje" property="primerApellido"/>
                            <bean:write name="Monje" property="HTMLEnfermedad" filter="false" />
						</font>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center">
							<font color="#000000" size="1">
							<bean:message key="monjes.abadia.edad"/>
                                                        <bean:write name="Monje" property="edad"/>
							<br>
							<bean:message key="monjes.abadia.nacimiento"/>
							  <bean:write name="Monje" property="fechaDeNacimiento"/>
							  <bean:message key="monjes.abadia.fecha_defuncion"/>
							  <bean:write name="Monje" property="fechaDeFallecimiento"/>
      							</font>

					  </td>
					</tr>
				  </table>
		  </td>
		  <%
			if (n > 2) {
				out.println ("<tr></tr>");
					n = 0;
			} else n++;
		  %>
	  </logic:iterate>
 	  </tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</table>
    </td>
    </tr>
  </logic:notEmpty>
</table>

<!-- CEMENTERIO -->
<p>&nbsp;</p>

<logic:notEmpty name="Monjes_cementerio">
<table borderColor="#000000" width="90%" cellSpacing="0" align="center" borderColorDark="#000000" borderColorLight="#000000" border="1">
    <tr>
      <td bgColor="#996633">
		<p align="center"><font color="#FFFFFF"><b><bean:message key="monjes.abadia.cementerio"/></b></font></p>
      </td>
    </tr>
    <tr>
    <td>
		<table cellspacing="0" border="0" background="images/backgrounds/marmol.gif" width="100%" align="center">
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr>
		<%
		n = 0;
		%>
		<logic:iterate id="Monje1" name="Monjes_cementerio">
		  <td>

					<table border="1" width="130" align="center" cellspacing="0" bordercolor="#000000" bordercolorlight="#000000" bordercolordark="#000000">
					<tr>
					  <td align="center" bgcolor="#8B1411">
							<font color="#FFFFFF" size="1" >
						   <bean:write name="Monje1" property="nombre"/>&nbsp;<bean:message key="monjes.abadia.nomciudad"/>&nbsp;<bean:write name="Monje1" property="primerApellido"/>
						  </font>
					  </td>
					  <td>
						<DIV align="center">
						  <html:img border="0" page="/images/iconos/16/cementerio.gif"/>
						</DIV>
					  </td>
					</tr>
					<tr>
					  <td bgcolor="#E4CFA2" align="center" colspan="2">
							<font color="#000000" size="1" >
							<bean:message key="monjes.abadia.nacimiento"/>
							  <bean:write name="Monje1" property="fechaDeNacimiento"/>
							<br>
							  <bean:message key="monjes.abadia.fecha_defuncion"/>
							  <bean:write name="Monje1" property="fechaDeFallecimiento"/>
							</font>
					  </td>
					</tr>
				  </table>

		  </td>
		  <%
			if (n > 2) {
				out.println ("<tr></tr>");
					n = 0;
			} else n++;
		  %>
		</logic:iterate>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</table>
</table>
</logic:notEmpty>

      <!-- Publicidad -->
      <logic:notEqual property="registrado" name="usuario" scope="session" value="1">
            <jsp:include page="/varios/publicidad.jsp"/>
      </logic:notEqual>

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
