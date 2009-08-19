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
import py.com.roshka.pykasu.interfaces.Form850ManagerInterface;
import py.com.roshka.pykasu.interfaces.FormManager;
import py.com.roshka.pykasu.interfaces.GenericFormManager;
import py.com.roshka.pykasu.util.Globals;

/**
 * 
 * @author jrey
 * @struts.action path = "/getMoraInfo" scope = "request"
 * @struts.action-forward name = "success" path = "/xml/850/fiscalinfo.jsp"
 * 
 */
public class GetMoraInfo extends Action {

    public static final String RUC = "ruc";

    public static final String PAYDMENT_DATE = "paymentDate";

    public static final String FISCAL_PERIOD_MONTH = "fiscalPeriodMounth";

    public static final String FISCAL_PERIOD_YEAR = "fiscalPeriodYear";

    public static final String FORM_TYPE = "form";

    public static final String FISCAL_INFO_TYPE = "fiscalInfoType";

    public static final String FISCAL_ADVANCED_NUMBER = "advancedNumber";

    public static final String FISCAL_EXPIRING_DATE = "expiringDate";

    public static final String FISCAL_MONTH_CLOSE = "clausureMonth";

    static org.apache.log4j.Logger logger = org.apache.log4j.Logger
            .getLogger(GetMoraInfo.class);

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

            String formName = request.getParameter("form");
            String infoType = request.getParameter(FISCAL_INFO_TYPE);
            Date paydmentDate = sdf.parse(request.getParameter(PAYDMENT_DATE));

            Integer month = null;
            if (request.getParameter(FISCAL_PERIOD_MONTH) != null){
            	try{
            	month = new Integer(nf.parse(
                        request.getParameter(FISCAL_PERIOD_MONTH)).intValue());
            	}catch(Throwable e){
            		logger.error(e);
            	}
            }

            Integer year = null;
            if (request.getParameter(FISCAL_PERIOD_YEAR) != null)
                year = new Integer(nf.parse(
                        request.getParameter(FISCAL_PERIOD_YEAR)).intValue());

            Integer advancedNumber = null;
            Integer monthClose = null;
            Date expiringDate = null;
            if (request.getParameter(FISCAL_ADVANCED_NUMBER) != null) {
                advancedNumber = new Integer(nf.parse(
                        request.getParameter(FISCAL_ADVANCED_NUMBER))
                        .intValue());

            }
            if (request.getParameter(FISCAL_MONTH_CLOSE) != null) {
                System.out.println(" FISCAL MONTH CLOSE ->>>"
                        + request.getParameter(FISCAL_MONTH_CLOSE));
                monthClose = new Integer(nf.parse(
                        request.getParameter(FISCAL_MONTH_CLOSE)).intValue());

            }
            if (request.getParameter(FISCAL_EXPIRING_DATE) != null) {
                expiringDate = sdf.parse(request
                        .getParameter(FISCAL_EXPIRING_DATE));
            }

            String ruc = request.getParameter("ruc");

            InitialContext ic = new InitialContext();
            FormManager formManager = (FormManager) ic
                    .lookup("pykasu/FormManager/local");
            GenericFormManager genericForm = formManager
                    .getFormManager(formName);

            Map params = new HashMap();
            params.put("formType", new Integer(formName));
            params.put("fiscalInfoType", infoType);
            params.put("ruc", ruc);
            params.put("paydmentDate", paydmentDate);
            params.put("fiscalPeriodMonth", month);
            params.put("fiscalPeriodYear", year);

            if (advancedNumber != null)
                params.put("advancedNumber", advancedNumber);
            if (monthClose != null)
                params.put("clausureMonth", monthClose);
            if (expiringDate != null) {
                params.put("expiringDate", expiringDate);
            }

            params.put("formType", new Integer(Integer.parseInt(formName)));

            Iterator it = params.keySet().iterator();
            logger.debug("params to welti's function");
            while (it.hasNext()) {
                String key = (String) it.next();
                logger.info(key + "->" + params.get(key));

            }

            infos = genericForm.getFiscalInfo(params);

            // infos = genericForm.getFiscalInfo(ruc, paydmentDate, month,
            // year);

            if (infos == null) {
                more.put("ERROR", "No se encontro informacion para "
                        + request.getParameter(RUC) + " en el periodo " + month
                        + "/" + year + ". Fecha de Pago:"
                        + request.getParameter(PAYDMENT_DATE));

                request.setAttribute(
                        py.com.roshka.pykasu.web.Globals.FISCAL_INFO,
                        new HashMap());
                request.setAttribute(
                        py.com.roshka.pykasu.web.Globals.MORE_MESSAGES, more);

                return mapping.findForward("success");
            }

            long currentDate = System.currentTimeMillis();
            long paymenDate = sdf.parse(request.getParameter(PAYDMENT_DATE))
                    .getTime();
            logger.debug(((currentDate - paymenDate) / (1000 * 60 * 60 * 24))
                    + "dias");

            if ((currentDate - paymenDate) / (1000 * 60 * 60 * 24) > 0) {
                more.put("PAYMENT_DATE_NOT_VALID", "true");
            }
            if (month != null && year != null) {
                Calendar declaracion = new GregorianCalendar();

                declaracion.set(Calendar.MONTH, month.intValue() - 1);
                declaracion.set(Calendar.YEAR, year.intValue());
                declaracion.set(Calendar.DATE, declaracion
                        .getActualMaximum(Calendar.DATE));

                if ((currentDate - declaracion.getTimeInMillis())
                        / (1000 * 60 * 60 * 24) <= 0) {
                    more.put("DECLARATION_DATE_NOT_VALID", "true");
                }
            }
        } catch (Throwable e) {
            infos = new HashMap();
            more.put("ERROR", e.getMessage());
            logger.error("Error to retrieve Fiscal Information!");
            e.printStackTrace();
        } finally {
            request.setAttribute(py.com.roshka.pykasu.web.Globals.FISCAL_INFO,
                    infos);
            request.setAttribute(
                    py.com.roshka.pykasu.web.Globals.MORE_MESSAGES, more);
        }
        Iterator keys = infos.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            logger.info(key + " = " + infos.get(key));
        }
        return mapping.findForward("success");

    }

    public static void main(String[] args) {
        for (int anho = 2000; anho < 2004; anho++) {
            for (int month = 0; month < 12; month++) {
                Calendar pago = new GregorianCalendar();
                pago.set(Calendar.MONTH, month);
                pago.set(Calendar.YEAR, anho);

                SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
                Date d = new Date(pago.getTimeInMillis());
                System.out.println(sdf.format(d));
            }
        }
    }
}
