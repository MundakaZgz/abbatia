package org.abbatia.process;

import org.abbatia.base.ProcesoBase;
import org.abbatia.exception.base.AbadiaException;
import org.abbatia.process.bbean.ProcesosVariosBBean;
import org.abbatia.utils.AbadiaConfiguracion;
import org.abbatia.utils.Constantes;

import java.io.File;

/**
 * Created by Benjam�n Rodr�guez.
 * User: Benjamin
 * Date: 23-feb-2006
 * Time: 23:31:50
 */
public class PRRegenerarMapa extends ProcesoBase {
    /**
     * m�todo que implementar� la funcionalidad que se debe ejecutar con cada proceso
     */
    public void run() throws AbadiaException {
        //AbadiaConfiguracion abadiaconf;
        File fDatos;
        //eliminamos el fichero de datos
        //abadiaconf = new AbadiaConfiguracion();
        fDatos = new File(AbadiaConfiguracion.getBasePath() + AbadiaConfiguracion.getPropiedad("ruta_datos_mapa") + Constantes.FICHERO_DATOS_MAPA);
        //fDatos = new File(AbadiaConfiguracion.getBasePath() + "/" + Constantes.FICHERO_DATOS_MAPA);
        fDatos.delete();
        fDatos = new File(AbadiaConfiguracion.getBasePath() + AbadiaConfiguracion.getPropiedad("ruta_datos_mapa") + Constantes.FICHERO_DATOS_MAPA_IT);
        //fDatos = new File(AbadiaConfiguracion.getBasePath() + "/" + Constantes.FICHERO_DATOS_MAPA_IT);
        fDatos.delete();
        ProcesosVariosBBean oVariosBBean = new ProcesosVariosBBean();
        oVariosBBean.generarDatosMapa();
        oVariosBBean.generarDatosMapaComisiones();
    }

}
