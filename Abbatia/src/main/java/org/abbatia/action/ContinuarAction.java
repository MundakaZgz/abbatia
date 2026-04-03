package org.abbatia.action;

import org.abbatia.bbean.UsuarioBBean;
import org.abbatia.bean.Abadia;
import org.abbatia.bean.Usuario;
import org.abbatia.exception.base.AbadiaException;
import org.abbatia.utils.Constantes;
import org.apache.log4j.Logger;
import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

public class ContinuarAction extends Action {

    private static Logger log = Logger.getLogger(ContinuarAction.class.getName());

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionMessages mensajes = new ActionMessages();
        Abadia abadia = (Abadia) request.getSession().getAttribute(Constantes.ABADIA);
        Usuario usuario = (Usuario) request.getSession().getAttribute(Constantes.USER_KEY);

        try {
            if (usuario == null) {
                return mapping.findForward("login");
            }

            if (abadia == null) {
                // Si el usuario aun no tiene abadia, cargamos catalogos y mostramos el alta.
                UsuarioBBean oUsuarioBBean = new UsuarioBBean();
                HashMap hmRequest = oUsuarioBBean.cargarTablasRegistro();
                request.setAttribute("regiones", hmRequest.get("regiones"));
                request.setAttribute("ordenes", hmRequest.get("ordenes"));
                request.setAttribute("actividades", hmRequest.get("actividades"));
                return new ActionForward("/abadias/registroAbadia_1.jsp");
            }

            //adAbadia.actualizarFechaEliminacion(abbatia.getIdDeAbadia(), null);
            return mapping.findForward("principal");

        } catch (AbadiaException e) {
            log.error("ContinuarAction. Error cargando tablas de registro de abadia", e);
            mensajes.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("error.general.aplicacion"));
            saveMessages(request.getSession(), mensajes);
            return mapping.findForward("failure");
        } catch (Exception e) {
            mensajes.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("error.general.aplicacion"));
            saveMessages(request.getSession(), mensajes);
            return mapping.findForward("failure");
        }
    }
}
