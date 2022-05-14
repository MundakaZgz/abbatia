package org.abbatia.process;

import org.abbatia.base.ProcesoBase;
import org.abbatia.exception.base.AbadiaException;
import org.abbatia.process.bbean.ProcesosBBean;

/**
 * Created by Benjam�n Rodr�guez.
 * User: Benjamin
 * Date: 23-feb-2006
 * Time: 23:31:50
 */
public class PRTrabajosMonje extends ProcesoBase {
    /**
     * m�todo que implementar� la funcionalidad que se debe ejecutar con cada proceso
     */
    public void run() throws AbadiaException {
        int iFranjaHoraria;
        iFranjaHoraria = Integer.valueOf(sParams);
        ProcesosBBean oProcesosBBean = new ProcesosBBean();
        oProcesosBBean.trabajosMonje(iFranjaHoraria);
    }
}
