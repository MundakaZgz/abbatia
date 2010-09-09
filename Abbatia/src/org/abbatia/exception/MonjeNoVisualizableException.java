package org.abbatia.exception;

import org.abbatia.exception.base.ApplicationException;
import org.apache.log4j.Logger;

public class MonjeNoVisualizableException extends ApplicationException {

    /**
     * Unico constructor for ConfigurationException
     *
     * @param message   Mensaje explicativo
     * @param throwable Excepcion original
     * @param logger    Un objeto Logger
     */
    public MonjeNoVisualizableException(String message, Throwable throwable, Logger logger) {
        super(message, throwable, logger);
    }

    public MonjeNoVisualizableException(String message, Logger logger) {
        super(message, null, logger);
    }

    /**
     * Log de la excepcion
     */
    protected void log(Logger logger) {
        logger.error(getMessage());
    }

}
