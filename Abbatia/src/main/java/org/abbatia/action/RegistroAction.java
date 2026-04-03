package org.abbatia.action;

import org.abbatia.actionform.RegistroActForm;
import org.abbatia.bbean.UsuarioBBean;
import org.abbatia.bean.Email;
import org.abbatia.bean.Notificacion;
import org.abbatia.bean.Table;
import org.abbatia.bean.Usuario;
import org.abbatia.exception.*;
import org.abbatia.exception.base.AbadiaException;
import org.abbatia.utils.AbadiaConfiguracion;
import org.abbatia.utils.Constantes;
import org.abbatia.core.CoreMail;
import org.apache.struts.action.*;
import org.apache.struts.util.MessageResources;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;

public class RegistroAction extends Action {

    private static Logger log = Logger.getLogger(RegistroAction.class.getName());
    private static boolean isEnvTrue(String key) {
        String value = System.getenv(key);
        return value != null && "true".equalsIgnoreCase(value.trim());
    }

    private static void enviarCorreoAltaUsuario(MessageResources resource, Usuario usuario) throws AbadiaException {
        Email email = new Email();
        email.setAsunto(resource.getMessage("mensajes.mail.asunto"));
        String sMensaje = resource.getMessage("mensajes.mail.body");
        sMensaje = sMensaje + resource.getMessage("mensajes.mail.body.usuario", usuario.getNick());
        sMensaje = sMensaje + resource.getMessage("mensajes.mail.body.password", usuario.getContrasena());
        sMensaje = sMensaje + resource.getMessage("mensajes.mail.body.link");
        sMensaje = sMensaje + resource.getMessage("mensajes.mail.body.fin");
        email.setTo(usuario.getEmail());
        email.setMsg(sMensaje);
        CoreMail.enviarEmail(email);
    }

    public ActionForward execute(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {

        ActionErrors errors = new ActionErrors();
        ActionMessages mensajes = new ActionMessages();
        ArrayList<Notificacion> notas = new ArrayList<Notificacion>();
        MessageResources resource = getResources(request);
        Usuario usuario;
        UsuarioBBean oUsuarioBBean;
        HashMap<String, ArrayList<Table>> hmRequest;

        try {

            oUsuarioBBean = new UsuarioBBean();
            if (request.getParameter("accion") == null) {
                hmRequest = oUsuarioBBean.registroUsuario();

                request.getSession().setAttribute("languages", hmRequest.get("languages"));
                request.getSession().setAttribute("paises", hmRequest.get("paises"));
                request.getSession().setAttribute("edades", hmRequest.get("edades"));
                request.getSession().setAttribute("sexo", hmRequest.get("sexo"));

                return mapping.findForward("pantallaregistro");
            }

            RegistroActForm usuariof = (RegistroActForm) form;

            if (!usuariof.isAceptaNormas())
            {
                throw new AceptacionNormasException("Es obligatorio aceptar las normas del juego", log);
            }
            usuario = oUsuarioBBean.registroUsuarioFin(usuariof, request.getRemoteAddr());
            //si el usuario tiene 14 a�os o menos, enviamos un correo al usuario indicando que debe enviarnos autorizaci�n.
            if (usuario.getEdad() <= 1)
            {
                //mandamos correo.
                // en este punto, gestionaremos el envio de un correo electr�nico y redirigimos a una pantalla que lo notifique.
                Email email = new Email();
                email.setTo(usuario.getEmail());
                email.setAsunto(resource.getMessage("solicitud.autorizacion.alta.asunto"));
                email.setMsg(resource.getMessage("solicitud.autorizacion.alta.body"));
                email.setFilename(AbadiaConfiguracion.getBasePath() + AbadiaConfiguracion.getPropiedad("ruta.fichero.autorizacion"));
                //email.setFilename(AbadiaConfiguracion.getBasePath() + "/ayudas/docs/autorizacionmenores.pdf");
                CoreMail.enviarEmail(email);
            } else if (isEnvTrue("ABBATIA_AUTO_APPROVE_REGISTRATION")) {
                // Modo local: evita dejar altas pendientes y envia el correo con credenciales al registrar.
                oUsuarioBBean.aprobarAltaPendiente(usuario.getIdDeUsuario());
                usuario.setAdministrador(Constantes.USUARIO_BASICO);
                enviarCorreoAltaUsuario(resource, usuario);
            }

            notas.add(new Notificacion("/Continuar.do", "Inicio"));
            request.getSession().setAttribute("notificacion", notas);

            mensajes.add("msg", new ActionMessage("mensajes.info.registro.notificacion"));
            mensajes.add("msg", new ActionMessage("mensajes.info.registro.notificacion2"));
            saveMessages(request.getSession(), mensajes);
            return mapping.findForward("mensajes");

        } catch (CorreoNoEnviadoException e) {
            mensajes.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("mensajes.info.correonoenviado"));
            saveMessages(request.getSession(), mensajes);
            return mapping.findForward("error");
        } catch (YaExisteMailException yece) {
            //request.getSession().setAttribute("languages", new adUtils().getTable(Constantes.TABLA_IDIOMA));
            errors.add(ActionErrors.GLOBAL_ERROR, new ActionError("error.email.repetido"));
            saveErrors(request, errors);
            return (new ActionForward(mapping.getInput()));
        } catch (YaExisteAliasException yeae) {
            //request.getSession().setAttribute("languages", new adUtils().getTable(Constantes.TABLA_IDIOMA));
            errors.add(ActionErrors.GLOBAL_ERROR, new ActionError("error.nick.repetido"));
            saveErrors(request, errors);
            return (new ActionForward(mapping.getInput()));
        } catch (AbadiaSQLException ex) {
            mensajes.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("error.general.aplicacion"));
            saveMessages(request.getSession(), mensajes);
            return mapping.findForward("error");
        } catch (AceptacionNormasException ex) {
            mensajes.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("usuario.condiciones.mandatory"));
            saveMessages(request.getSession(), mensajes);
            return mapping.findForward("error");
        } catch (AbadiaDBConnectionException adbce) {
            mensajes.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("error.general.aplicacion"));
            saveMessages(request.getSession(), mensajes);
            return mapping.findForward("error");
        } catch (java.lang.SecurityException adbce) {
            errors.add(ActionErrors.GLOBAL_ERROR, new ActionError("mensajes.info.correonoenviado"));
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

    }
}
