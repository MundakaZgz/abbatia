package org.abbatia.base;

import org.abbatia.exception.base.AbadiaException;

/**
 * todas las acciones asociadas a las solicitudes deberan definirse hereando de esta clase
 */
public abstract class ProcesoBase {
    protected String sParams;

    /**
     * Recoge los posibles par�metros definidos para el par�metro y ejecuta el m�todo run
     * correspondiente.
     *
     * @param sParams
     * @throws AbadiaException
     */
    public void run(String sParams) throws AbadiaException {
        this.sParams = sParams;
        this.run();
    }

    /**
     * m�todo que implementar� la funcionalidad que se debe ejecutar con cada proceso
     */
    public abstract void run() throws AbadiaException;

}
