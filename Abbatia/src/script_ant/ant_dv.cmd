@ECHO OFF
SETLOCAL

@rem Parametrizaci�n del entorno

ant -f build_release_mod.xml -Dentorno=dv deploy-tomcat-desplegado
