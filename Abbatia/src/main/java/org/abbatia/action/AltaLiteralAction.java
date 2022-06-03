package org.abbatia.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.abbatia.bbean.AdminBBean;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class AltaLiteralAction extends Action {
    public ActionForward execute(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {
        String szLiteral;
        AdminBBean oAdminBBean;

        try
        {
            szLiteral = (String) PropertyUtils.getSimpleProperty(form, "literal");
            if (szLiteral != "")
            {
                oAdminBBean = new AdminBBean();
                oAdminBBean.altaNuevoLiteral(szLiteral);
            }
        }catch(NullPointerException e){}

        return mapping.findForward("success");
    }
}