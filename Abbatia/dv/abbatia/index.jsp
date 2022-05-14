<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>

<head>
<title>ABBATIA</title>
<meta name="ROBOTS" content="index, follow">
<meta name="description"
content="Abbatia es un juego on-line gratuito (actualmente en construcci�n) ambientado en la �poca de los monasterios medievales.
Los jugadores se hacen cargo de la gesti�n y desarrollo de una Abad�a en un condado, ducado o reino de la Europa del 1000. El objetivo es intentar llegar a lo m�s alto del escalaf�n eclesi�stico convirtiendo tu Abad�a en un referente cultural y/o econ�mico de la �poca.
Para ello, tendr�s que gestionar de forma adecuada los recursos de tu monasterio, elaborar productos, comerciar, formar monjes, copiar libros y mucho m�s... as� poco a poco ir�s ampliando el poder de tu Abad�a. ">
<meta name="KEYWORDS" content="Abbatia, abadias, abadia, juego, on-line, gratuito, monasterios, monjes, circenses, a�o del se�or, juegos">
<LINK REL="SHORTCUT ICON" HREF="images/iconito.gif"/>
</head>

<frameset framespacing="0" border="0" rows="100,*" frameborder="0">
  <frame name="titulo" scrolling="no" noresize target="contenido" src="cabecera.do">
  <frameset cols="135,1,*">
    <logic:notEmpty name="usuario" scope="session">
        <frame name='contenido' target='principal' src='index_menu.do' scrolling='no' noresize>
        <frame name='contenido' target='principal' src='index_border.html' scrolling='no' noresize>
        <frame name='principal' target='principal' src='main.do' marginwidth='0' marginheight='0' scrolling='auto' noresize target='_self'>
    </logic:notEmpty>

    <logic:empty name="usuario" scope="session">
        <frame name='contenido' target='principal' src='index_main_menu.do' scrolling='no' noresize>
        <frame name='contenido' target='principal' src='index_border.html' scrolling='no' noresize>
        <frame name='principal' target='principal' src='index_main.do' marginwidth='0' marginheight='0' scrolling='auto' noresize target='_self'>
    </logic:empty>
  </frameset>
</frameset>

<script type="text/javascript" src="http://stats.abbatia.net/php-stats.js.php"></script>
<noscript><img src="http://stats.abbatia.net/php-stats.php" border="0" alt=""></noscript>

</html>
