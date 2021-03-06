package org.abbatia.action;

import org.abbatia.bbean.SolicitudBBean;
import org.abbatia.bean.Abadia;
import org.abbatia.bean.Usuario;
import org.abbatia.exception.base.AbadiaException;
import org.abbatia.utils.Constantes;
import org.apache.struts.action.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

public class SolicitudNoAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionMessages mensajes = new ActionMessages();
        Abadia abadia = (Abadia) request.getSession().getAttribute(Constantes.ABADIA);
        Usuario usuario = (Usuario) request.getSession().getAttribute(Constantes.USER_KEY);
        String idSolicitud = request.getParameter("solicitud");
        SolicitudBBean oSolicitudBBean;
        HashMap hmRequest;
        try {
            oSolicitudBBean = new SolicitudBBean();
            hmRequest = oSolicitudBBean.solicitudSiNo(Integer.parseInt(idSolicitud), abadia, usuario, Constantes.VOTACIONES_NOOK);

            request.setAttribute("solicitudes_propias", hmRequest.get("solicitudes_propias"));
            request.setAttribute("solicitudes_propias_copia", hmRequest.get("solicitudes_propias_copia"));
            request.setAttribute("solicitudes_terceros", hmRequest.get("solicitudes_terceros"));
            request.setAttribute("solicitudes_terceros_copia", hmRequest.get("solicitudes_terceros_copia"));

            return mapping.findForward("solicitudes");

        } catch (AbadiaException e) {
            mensajes.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("error.general.aplicacion"));
            saveMessages(request.getSession(), mensajes);
            return mapping.findForward("failure");
        }
    }
}
