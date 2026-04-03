package org.abbatia.action;

import org.abbatia.actionform.AbadiaActForm;
import org.abbatia.bbean.AbadiaBBean;
import org.abbatia.bbean.UsuarioBBean;
import org.abbatia.bean.Abadia;
import org.abbatia.bean.Usuario;
import org.abbatia.exception.AbadiaDBConnectionException;
import org.abbatia.exception.AbadiaSQLException;
import org.abbatia.exception.AbadiaYaExisteException;
import org.abbatia.exception.RegionNoValidaException;
import org.abbatia.exception.base.AbadiaException;
import org.abbatia.utils.Constantes;
import org.apache.log4j.Logger;
import org.apache.struts.action.*;
import org.apache.struts.util.MessageResources;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;

public class RegistroAbadiaAction extends Action {
    private static Logger log = Logger.getLogger(RegistroAbadiaAction.class.getName());

    /**
     * This is the main action called from the Struts framework.
     *
     * @param mapping  The ActionMapping used to select this instance.
     * @param form     The optional ActionForm bean for this request.
     * @param request  The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @return ActionForward
     * @throws IOException
     * @throws ServletException
     */
    public ActionForward execute(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {
        Usuario usuario = (Usuario) request.getSession().getAttribute(Constantes.USER_KEY);
        Abadia abadia = (Abadia) request.getSession().getAttribute(Constantes.ABADIA);
        String sAction = request.getParameter("accion");
        ActionMessages errors = new ActionErrors();
        ActionMessages mensajes = new ActionMessages();
        AbadiaActForm abadiaf = (AbadiaActForm) form;


        MessageResources resource = getResources(request);
        AbadiaBBean oAbadiaBBean;
        Object oReturn;

        try {
            oAbadiaBBean = new AbadiaBBean();
            if (sAction.equals("registrar")) {
                return mapping.findForward("success");
            } else if (sAction.equals("registro2")) {
                oReturn = oAbadiaBBean.registroAbadia2(abadiaf, usuario);

                if (oReturn instanceof Locale) {
                    setLocale(request, (Locale) oReturn);
                    return redirigirAPrincipalOSeguirAlta(mapping, request, usuario, resource, oAbadiaBBean, abadiaf, errors);
                }
                //validamos si el usuario ya dispone de una abad�a.
                if (oReturn instanceof HashMap) {
                    request.getSession().setAttribute("nombre_abadia", abadiaf.getNombreAbadia());
                    request.getSession().setAttribute("regiones", ((HashMap) oReturn).get("regiones"));
                    request.getSession().setAttribute("ordenes", ((HashMap) oReturn).get("ordenes"));
                    request.getSession().setAttribute("actividades", ((HashMap) oReturn).get("actividades"));
                    errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("registro.error.abadiayaexiste"));
                    saveErrors(request, errors);
                    return mapping.findForward("errorregistro");
                }

                request.getSession().setAttribute("AbadiaForm", abadiaf);
                return mapping.findForward("registro2");

            } else if (sAction.equals("registro3")) {
                abadiaf = (AbadiaActForm) request.getSession().getAttribute("AbadiaForm");
                oReturn = oAbadiaBBean.registroAbadia3(abadiaf, usuario, resource);

                if (oReturn instanceof Locale) {
                    setLocale(request, (Locale) oReturn);
                    return redirigirAPrincipalOSeguirAlta(mapping, request, usuario, resource, oAbadiaBBean, abadiaf, errors);
                }

                if (oReturn instanceof Abadia) {
                    request.getSession().setAttribute(Constantes.ABADIA, oReturn);
                }
                return mapping.findForward("success");
            }
            return mapping.findForward("success");
        } catch (AbadiaSQLException e) {
            prepararRetornoRegistroConError(request, abadiaf, errors, "error.general.aplicacion");
            return mapping.findForward("errorregistro");
        } catch (AbadiaDBConnectionException adbce) {
            prepararRetornoRegistroConError(request, abadiaf, errors, "error.general.aplicacion");
            return mapping.findForward("errorregistro");
        } catch (AbadiaYaExisteException ayee) {
            errors.add(ActionErrors.GLOBAL_MESSAGE, new ActionMessage("registro.error.abadiayaexiste"));
            saveErrors(request, errors);
            return mapping.findForward("registro2");
        } catch (RegionNoValidaException e) {
            prepararRetornoRegistroConError(request, abadiaf, errors, "registro.error.regionnovalida");
            return mapping.findForward("errorregistro");
        } catch (Exception e) {
            prepararRetornoRegistroConError(request, abadiaf, errors, "error.general.aplicacion");
            return mapping.findForward("errorregistro");
        }
    }

    private ActionForward redirigirAPrincipalOSeguirAlta(ActionMapping mapping,
                                                         HttpServletRequest request,
                                                         Usuario usuario,
                                                         MessageResources resource,
                                                         AbadiaBBean oAbadiaBBean,
                                                         AbadiaActForm abadiaf,
                                                         ActionMessages errors) {
        try {
            Abadia abadiaSesion = oAbadiaBBean.recuperarAbadiaDeUsuario(usuario, resource);
            request.getSession().setAttribute(Constantes.USER_KEY, usuario);
            request.getSession().setAttribute(Constantes.ABADIA, abadiaSesion);
            return mapping.findForward("principal");
        } catch (AbadiaException e) {
            log.error("RegistroAbadiaAction. Estado inconsistente: el usuario figura con abadia pero no puede recuperarse", e);
            request.getSession().removeAttribute(Constantes.ABADIA);
            prepararRetornoRegistroConError(request, abadiaf, errors, "error.general.noabadia");
            return mapping.findForward("errorregistro");
        }
    }

    private void prepararRetornoRegistroConError(HttpServletRequest request,
                                                  AbadiaActForm abadiaf,
                                                  ActionMessages errors,
                                                  String claveError) {
        HashMap hmRequest = new HashMap();
        try {
            hmRequest = new UsuarioBBean().cargarTablasRegistro();
        } catch (AbadiaException ignored) {
            // Si falla la recarga de catalogos, mantenemos el mensaje de error y la sesion.
        }
        request.getSession().setAttribute("nombre_abadia", abadiaf != null ? abadiaf.getNombreAbadia() : null);
        request.getSession().setAttribute("regiones", hmRequest.get("regiones"));
        request.getSession().setAttribute("ordenes", hmRequest.get("ordenes"));
        request.getSession().setAttribute("actividades", hmRequest.get("actividades"));
        errors.add(ActionErrors.GLOBAL_MESSAGE, new ActionMessage(claveError));
        saveErrors(request, errors);
    }
}
