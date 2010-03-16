/*
 * Created on Jul 20, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.actions.forms;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import py.com.roshka.pykasu.ejb.Form850Manager;
import py.com.roshka.pykasu.interfaces.FiscalRulesManager;
import py.com.roshka.pykasu.interfaces.Form850ManagerInterface;
import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.util.Globals;

/**
 * 
 * @author jrey
 * @struts.action path = "/getMoraInfoForm90" scope = "request"
 * @struts.action-forward name = "success" path = "/xml/850/fiscalinfo.jsp"
 * 
 */
public class GetMoraInfoForm90 extends Action {

    static org.apache.log4j.Logger logger = org.apache.log4j.Logger
            .getLogger(GetMoraInfoForm90.class);

    @SuppressWarnings("unchecked")
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm,
            					 HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    	
        Map more = new HashMap();
        Map infos = null;
        try {

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            NumberFormat nf = NumberFormat.getInstance(new Locale("es", "py"));

            //Section
            String section = request.getParameter(Globals.FORM90_SECTION);
            //paymentDate
            Date paydmentDate = null;
            if(request.getParameter(Globals.FORM90_PAYDMENT_DATE) != null && !request.getParameter(Globals.FORM90_PAYDMENT_DATE).trim().equalsIgnoreCase("")){
            	paydmentDate = sdf.parse(request.getParameter(Globals.FORM90_PAYDMENT_DATE));
            }
            //initialDate
            Date initialDate = null;
            if(request.getParameter(Globals.FORM90_INITIAL_DATE) != null && !request.getParameter(Globals.FORM90_INITIAL_DATE).trim().equalsIgnoreCase("")){
            	initialDate = sdf.parse(request.getParameter(Globals.FORM90_INITIAL_DATE));
            }
            //ruc
            String ruc = request.getParameter(Globals.FORM90_RUC);

            Map params = new HashMap();
            params.put(Globals.FORM90_SECTION, section);
            params.put(Globals.FORM90_RUC, ruc);
            params.put(Globals.FORM90_INITIAL_DATE, initialDate);
            params.put(Globals.FORM90_PAYDMENT_DATE, paydmentDate);

            Iterator it = params.keySet().iterator();
            logger.info("params to welti's function");
            while (it.hasNext()) {
                String key = (String) it.next();
                logger.info(key + "->" + params.get(key));

            }
            InitialContext ic = new InitialContext();
            FiscalRulesManager fiscalRuleManager = (FiscalRulesManager) ic
                    .lookup("pykasu/FiscalRulesManager/local");
         
            
            infos = fiscalRuleManager.getFiscalInfoForm90(params);
            request.setAttribute(py.com.roshka.pykasu.web.Globals.FISCAL_INFO,infos);

            // infos = genericForm.getFiscalInfo(ruc, paydmentDate, month,
            // year);

//            if (infos == null) {
//                more.put("ERROR", "No se encontro informacion para "
//                        + request.getParameter(RUC) + " en el periodo " + month
//                        + "/" + year + ". Fecha de Pago:"
//                        + request.getParameter(PAYDMENT_DATE));
//
//                request.setAttribute(
//                        py.com.roshka.pykasu.web.Globals.FISCAL_INFO,
//                        new HashMap());
//                request.setAttribute(
//                        py.com.roshka.pykasu.web.Globals.MORE_MESSAGES, more);
//
//                return mapping.findForward("success");
//            }
//
//            long currentDate = System.currentTimeMillis();
//            long paymenDate = sdf.parse(request.getParameter(PAYDMENT_DATE))
//                    .getTime();
//            logger.info(((currentDate - paymenDate) / (1000 * 60 * 60 * 24))
//                    + "dias");
//
//            if ((currentDate - paymenDate) / (1000 * 60 * 60 * 24) > 0) {
//                more.put("PAYMENT_DATE_NOT_VALID", "true");
//            }
//            if (month != null && year != null) {
//                Calendar declaracion = new GregorianCalendar();
//
//                declaracion.set(Calendar.MONTH, month.intValue() - 1);
//                declaracion.set(Calendar.YEAR, year.intValue());
//                declaracion.set(Calendar.DATE, declaracion
//                        .getActualMaximum(Calendar.DATE));
//
//                if ((currentDate - declaracion.getTimeInMillis())
//                        / (1000 * 60 * 60 * 24) <= 0) {
//                    more.put("DECLARATION_DATE_NOT_VALID", "true");
//                }
//            }
        } catch (Throwable e) {
            infos = new HashMap();
            more.put("ERROR", e.getMessage());
            logger.error("Error to retrieve Fiscal Information!");
            e.printStackTrace();
//        } finally {
//            request.setAttribute(py.com.roshka.pykasu.web.Globals.FISCAL_INFO,
//                    infos);
//            request.setAttribute(
//                    py.com.roshka.pykasu.web.Globals.MORE_MESSAGES, more);
        }
        Iterator keys = infos.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            logger.info(key + " = " + infos.get(key));
        }
        return mapping.findForward("success");

    }


}
