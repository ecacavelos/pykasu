package py.com.roshka.pykasu.ejb;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.EJB;
import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TemporalType;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.FailToGetExpiringDateException;
import py.com.roshka.pykasu.exceptions.FiscalInfoException;
import py.com.roshka.pykasu.exceptions.FiscalPeriodNotFoundException;
import py.com.roshka.pykasu.exceptions.FormSettingRetrieveException;
import py.com.roshka.pykasu.exceptions.GetContributorInfoException;
import py.com.roshka.pykasu.exceptions.InvalidExpiringDateException;
import py.com.roshka.pykasu.exceptions.InvalidFiscalPeriodException;
import py.com.roshka.pykasu.exceptions.PersistException;
import py.com.roshka.pykasu.interfaces.CalendarManager;
import py.com.roshka.pykasu.interfaces.Contributor;
import py.com.roshka.pykasu.interfaces.FiscalRulesManager;
import py.com.roshka.pykasu.interfaces.FormSettingInterface;
import py.com.roshka.pykasu.persistence.fiscal.ExpiringDate;
import py.com.roshka.pykasu.persistence.fiscal.FiscalAdvanced;
import py.com.roshka.pykasu.persistence.fiscal.FiscalContravertionFee;
import py.com.roshka.pykasu.persistence.fiscal.FiscalPercentOverdue;
import py.com.roshka.pykasu.persistence.fiscal.FiscalPeriod;
import py.com.roshka.pykasu.persistence.fiscal.FormSetting;
import py.com.roshka.pykasu.persistence.fiscal.Salary;
import py.com.roshka.pykasu.persistence.ruc.Ruc;
import py.com.roshka.pykasu.util.Globals;
import py.com.roshka.pykasu.util.Utils;

@Stateless
@Local ({FiscalRulesManager.class})
@LocalBinding (jndiBinding="pykasu/FiscalRulesManager/local")
@Remote ({FiscalRulesManager.class})
@RemoteBinding (jndiBinding="pykasu/FiscalRulesManager/remote")
public class FiscalRulesManagerEJB implements FiscalRulesManager{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(FiscalRulesManagerEJB.class);

	@EJB protected Contributor contributor;
	@EJB protected FormSettingInterface formSettingMgr;
	@EJB protected CalendarManager calendarManager;
	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;

	@PersistenceContext(unitName = "tributos")
	protected EntityManager tributos;
	
	public static final String FISCAL_INFO_EXPIRING = "expiring";  
	public static final String FISCAL_INFO_ADVANCED = "advanced";
	
	public static final String FISCAL_FORM_TYPE = "formType";
	public static final String FISCAL_RUC = "ruc";
	public static final String FISCAL_PAYMENT_DATE = "paydmentDate";
	public static final String FISCAL_INFO_TYPE = "fiscalInfoType";
	public static final String FISCAL_PERIOD_MONTH = "fiscalPeriodMonth";
	public static final String FISCAL_PERIOD_YEAR = "fiscalPeriodYear";
	
   
	@SuppressWarnings("unchecked")
	private Map getFiscalInfo(String ruc, Date paydmentDate, FiscalPeriod fp, Integer formType)
       throws FiscalInfoException{
	   
    	try {
    		logger.debug("Computer fiscal Info.");
			Date expiringDate = getExpiringDate(formType, ruc, fp);
			
			Integer diffDate = Utils.DateDiff(expiringDate,paydmentDate);
			logger.debug("Difference in days: " + diffDate);
			 
			Map map = new HashMap();
			
			if(diffDate <= 0){ //no hay multa
		    	map.put("CONTRAVENSION_SMOV", 0); //without movimient
		    	map.put("CONTRAVENSION_CMOV", 0);  //with movimient 
		    	map.put("PORC_MORA",0);//percent table
		    	map.put("PORC_INTERES",0);//percent per day	
			}else{ //hay multa
				Integer diffMonth = Utils.FiscalMonthDiff(expiringDate, paydmentDate);
				FiscalPercentOverdue fpo = getPercentOverdue(850,diffMonth);
			    FiscalContravertionFee fcf = getFiscalContravertionFee(850,diffMonth);
		    	map.put("CONTRAVENSION_SMOV", new Double (50000.0)); //without movimient
		    	
			    map.put("CONTRAVENSION_CMOV", fcf.getContravertion());  //with movimient 	    	
		    	
		    	if(fcf.getMonthFrom().intValue() >= 3){
		    		logger.debug("----> Retrive RUC to know is JURIDICA");
		    		try {
						Ruc r = contributor.getInfo(ruc);
						//if(r.getType().trim().toUpperCase().equals("JURIDICA")){
						if(false){
							//map.put("R7_IE_C2_WM", 100000);  //with movimient and JURIDICA
							map.put("CONTRAVENSION_SMOV", new Double (100000.0));  //without movimient and JURIDICA
							logger.debug("----> RUC " + ruc + " is JURIDICA");
						}
					} catch (GetContributorInfoException e) {
						logger.error("Impossible to retrieve a Contributor Info.",e);
					}
		    	}
		    	
			    
			    map.put("PORC_MORA",fpo.getPercent());
				//double vinteres = ((1.0/30)* diffDate)*0.015;
			    double vinteres = (diffDate * 0.0005 );
				NumberFormat nf = NumberFormat.getIntegerInstance(Locale.US);
				nf.setMinimumFractionDigits(6);
				nf.setGroupingUsed(false);

				logger.debug("setting vinteres  -> " + vinteres + " with number format: " + nf);
				
				
				map.put("PORC_INTERES",nf.format(vinteres));

				Iterator it  = map.keySet().iterator();
				String key = "";
				
				logger.info("-----------  SHOW FISCAL INFO -------------");
				while(it.hasNext()){
					key = (String) it.next();
					logger.info(">>>>>>> " + key + " : " + map.get(key) );
				}
				logger.info(">>>>>>> Different day: " + diffDate);
				logger.info("----------  END SHOW FISCAL INFO -----------");			
			}
			
			return map;
			
		} catch (FailToGetExpiringDateException e) {
			logger.error(e);
			e.printStackTrace();
		}
		return null;
    }
   
    protected FiscalPeriod getFiscalPeriod(Integer month, Integer year)
	 throws FiscalPeriodNotFoundException{
		logger.debug("Getting a Fiscal Period with month->" + month+  " year->"+year);
		try{
			FiscalPeriod fp = (FiscalPeriod) 
				em.createQuery("select fp from FiscalPeriod fp " +
						"where fp.month = :month and fp.year =:year")
					.setParameter("month", month)
					.setParameter("year",year)
 				    .getSingleResult();
 			return fp;
 			
		}catch (NoResultException e){
			logger.error("No result exception",e);
			throw new FiscalPeriodNotFoundException("No se puede recuperar un periodo fiscal de las características solicitadas.");
		}
	}
   
    @SuppressWarnings("unchecked")
	protected Map getFiscalInfo(Date paymentDate, String ruc, Integer formType, Integer advancedNumber, Integer clausureMonth,  Date expiringDate)
	 throws FiscalInfoException{
		logger.debug("Getting a Fiscal Info from Advanced data ->" + expiringDate);
		try{
			
			String lastLetter = ruc.substring(ruc.length()-1);
			if(lastLetter.equals("Ñ") || lastLetter.equals("ñ")){
				lastLetter = "N";
			}
			
			logger.debug("Getting lastLetterRuc: " + lastLetter);
			
			FiscalAdvanced ed = (FiscalAdvanced)
								em.createQuery("select fa from FiscalAdvanced fa " +
											   "where fa.advancedNumber = :advancedNumber AND " +
											   " fa.formType = :formType AND "  +
											   " :lastLetter between fa.charFrom AND fa.charTo AND " +
											   " fa.expiringDate = :expiringDate AND " +
											   " fa.clausureMonth = :clausureMonth")
								.setParameter("advancedNumber", advancedNumber)
								.setParameter("expiringDate", expiringDate,TemporalType.DATE)
								.setParameter("formType", formType)
								.setParameter("lastLetter",lastLetter)
								.setParameter("clausureMonth",clausureMonth)
								.getSingleResult();
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			
			if(!sdf.format(ed.getExpiringDate()).equals(sdf.format(expiringDate))){
				logger.error("Expiring Date is not valid");
				throw new FiscalInfoException("Fecha de vencimiento inválida.");
			}
			Integer diffDate = Utils.DateDiff(expiringDate , paymentDate);
			logger.debug("Difference in days: " + diffDate);
			 
			Map map = new HashMap();
			
			if(diffDate <= 0){ //no hay multa
		    	map.put("R7_IE_C2_WOM", 0); //without movimient
		    	map.put("R7_IE_C2_WM", 0);  //with movimient 
		    	map.put("R7_II_C2_VMORA",0);//percent table
		    	map.put("R7_IJ_C2_VINTERES",0);//percent per day	
			}else{ //hay multa
				Integer diffMonth = Utils.MonthDiff(expiringDate, paymentDate);
				FiscalPercentOverdue fpo = getPercentOverdue(850,diffMonth);
			    FiscalContravertionFee fcf = getFiscalContravertionFee(850,diffMonth);
		    	map.put("R7_IE_C2_WOM", new Double (50000.0)); //without movimient
		    	
			    map.put("R7_IE_C2_WM", fcf.getContravertion());  //with movimient 	    	
		    	
		    	if(fcf.getMonthFrom().intValue() >= 3){
		    		logger.debug("----> Retrive RUC to know is JURIDICA");
		    		try {
						Ruc r = contributor.getInfo(ruc);
						//if(r.getType().trim().toUpperCase().equals("JURIDICA")){
						if(false){ //TODO esto ya no se aplicay se deberia de cambiar todo este método
							//map.put("R7_IE_C2_WM", 100000);  //with movimient and JURIDICA
							map.put("R7_IE_C2_WOM", new Double (100000.0));  //without movimient and JURIDICA
							logger.debug("----> RUC " + ruc + " is JURIDICA");
						}
					} catch (GetContributorInfoException e) {
						logger.error("Impossible to retrieve a Contributor Info.",e);
					}
		    	}
		    	
			    
			    map.put("R7_II_C2_VMORA",fpo.getPercent());
				double vinteres = ((1.0/30)* diffDate)*0.015;
				NumberFormat nf = NumberFormat.getIntegerInstance(Locale.US);
				nf.setMinimumFractionDigits(6);
				nf.setGroupingUsed(false);

				logger.debug("setting vinteres  -> " + vinteres + " with number format: " + nf);
				
				
				map.put("R7_IJ_C2_VINTERES",nf.format(vinteres));
			}

			return map;
				
		}catch (NoResultException e){
			logger.error("No result exception",e);
			throw new FiscalInfoException("Verificar numero de anticipo, mes de cierre, vencimiento");
		}
	} 
    
	protected FiscalPercentOverdue getPercentOverdue(Integer formType, Integer month){
		try{
			 List list = 
				(List) em.createQuery("SELECT fpo from FiscalPercentOverdue fpo " +
					 " WHERE fpo.formType = :formType " +
					 "  AND fpo.amountMonth <= :monthOverdue" +
					 " ORDER BY fpo.amountMonth")
				.setParameter("formType",formType)
				.setParameter("monthOverdue",month)
				.getResultList();

			 FiscalPercentOverdue fpo = null;			 
			 Iterator it = list.iterator();

			 while(it.hasNext()){
				fpo = (FiscalPercentOverdue)it.next();
			 }
			 
			 return fpo;
			 
		}catch(NoResultException e){
			
		}
		return null;
	}
	
	protected FiscalContravertionFee getFiscalContravertionFee(Integer formType, Integer amountMonth){
		FiscalContravertionFee fcf = (FiscalContravertionFee)
			  em.createQuery("SELECT fcf from FiscalContravertionFee fcf " +
							 " WHERE formType = :formType AND " +
							 "       :amountMonth BETWEEN fcf.monthFrom AND fcf.monthTo")
			 .setParameter("formType", formType)
			 .setParameter("amountMonth",amountMonth)
			 .getSingleResult();
		
		return fcf;
	}
	
    protected Date getExpiringDate(Integer formType, String ruc, FiscalPeriod fiscalPeriod) 
	 throws FailToGetExpiringDateException{
		logger.debug("Getting a expiring date with: Ruc-> " + ruc + " formType-> " + formType + " fiscalPeriod->" + fiscalPeriod);												
		String lastLetter = ruc.substring(ruc.length()-1);
		if(lastLetter.equals("Ñ") || lastLetter.equals("ñ")){
			lastLetter = "N";
		}

    	try{
			
			logger.debug("Getting lastLetterRuc: " + lastLetter);
			ExpiringDate ed = (ExpiringDate) 
								em.createQuery("select ed from ExpiringDate ed " +
											   "where ed.fiscalPeriod = :fiscalPeriod AND ed.formType = :formType AND "  +
											   " :lastLetter between ed.charFrom AND ed.charTo")
								.setParameter("fiscalPeriod", fiscalPeriod)
								.setParameter("formType", formType)
								.setParameter("lastLetter",lastLetter)
								.getSingleResult();
			return ed.getDate();
			
		}catch(NoResultException e){
			logger.error("Failed to get a single Expiring Date with TYPE = " + formType + ". Tray to get without  formType parameter.",e);
			try{
				ExpiringDate ed = (ExpiringDate) 
					em.createQuery("select ed from ExpiringDate ed " +
								   "where ed.fiscalPeriod = :fiscalPeriod  AND "  +
								   " :lastLetter between ed.charFrom AND ed.charTo")
							.setParameter("fiscalPeriod", fiscalPeriod)			
							.setParameter("lastLetter",lastLetter)
							.getSingleResult();
				return ed.getDate();
			}catch(NoResultException e1){
				throw new FailToGetExpiringDateException (e1.getMessage());
			}
		}
	
	}

	@SuppressWarnings("unchecked")
	public Map getFiscalInfo(Map params) throws FiscalInfoException{
		//El RUC siempre va a ser el ruc nuevo, dependiendo del tipo de formulario
		//hay que recuperar el ruc viejo para realizar los cálculos en base al calendario anterior

		logger.info(">>>>>> Begin to Fiscal Info Procedure ");
		Iterator it = params.keySet().iterator();
		String key = null;
		while(it.hasNext()){
			key = it.next().toString();
			logger.debug("Params: " + key + " => " + params.get(key));
		}
		
		Integer formType = (Integer) params.get(FISCAL_FORM_TYPE);		
		String ruc = (String) params.get(FISCAL_RUC);
		Date paydmentDate = (Date) params.get(FISCAL_PAYMENT_DATE);
		String fiscalInfoType = (String) params.get(FISCAL_INFO_TYPE);
		Integer fiscalPeriodMonth = (Integer) params.get(FISCAL_PERIOD_MONTH);
		Integer fiscalPeriodYear = (Integer) params.get(FISCAL_PERIOD_YEAR);

		
		Map result = null;	
		boolean validPresentationDate = true;
		try {
			FormSetting fs = formSettingMgr.getFormSetting(formType.toString());
			Calendar c = Calendar.getInstance();
			c.set(fiscalPeriodYear.intValue(), fiscalPeriodMonth.intValue()-1, 5);
			

			
			if(fs.getPeriodBegin() == null || fs.getPeriodEnd() == null){
				logger.warn(">>>>>> TABLA DE FORMULARIOS - LIBRERIA TRIBUTO : " +
						    "Faltan datos para determinación de periodo fiscal. " +
						    "Formulario: " + formType.toString());
			}else{
				validPresentationDate =  c.getTime().after(fs.getPeriodBegin()) 
								      && c.getTime().before(fs.getPeriodEnd()) 
									  && c.getTime().before(new Date(System.currentTimeMillis()))
									  && fiscalPeriodMonth >= 1 && fiscalPeriodMonth <= 12;
			}
			
			
			logger.info(">>>>>>>>>> Evaluate if valid Presentation Date.");
			logger.info("Validate if " + c.getTime() + " is between " + fs.getPeriodBegin() + " and " + fs.getPeriodEnd());
			logger.info("Compare if " + c.getTime() + " is lower than current date:" + new Date(System.currentTimeMillis()));
			logger.info(">>>>>>>>>> End of evaluation. Presentation Date is valid? : " + validPresentationDate );

			if(!validPresentationDate){
				result = new HashMap();
				result.put("DECLARATION_DATE_NOT_VALID",true);
				return result;
			}
			
			
			Ruc rucObj = contributor.getInfo(ruc);
			logger.info("Going to examine form type to know is Active or not");
			if(!fs.isActive().booleanValue()){		
				logger.info("Form is InActive");
				//es del grupo de formularios viejos, debo recuperar el ruc viejo
				logger.info("Going to retrive old RUC from (" + ruc + ") to calculate tax");
				ruc = rucObj.getOldRuc().replace('\\','N');
			
				if(fiscalInfoType.equals(FISCAL_INFO_EXPIRING)){
					//Integer fiscalPeriodMonth = (Integer) params.get("fiscalPeriodMonth");
					//Integer fiscalPeriodYear = (Integer) params.get("fiscalPeriodYear");
					FiscalPeriod fp = getFiscalPeriod(fiscalPeriodMonth, fiscalPeriodYear);
					result = getFiscalInfo(ruc, paydmentDate, fp, formType);
					if(!validPresentationDate){
						result.put("DECLARATION_DATE_NOT_VALID",true);
					}
					return result;
	
				}else if(fiscalInfoType.equals(FISCAL_INFO_ADVANCED)){
					Integer advancedNumber = (Integer) params.get("advancedNumber"); 
					Integer clausureMonth = (Integer) params.get("clausureMonth");  
					Date expiringDate = (Date) params.get("expiringDate");					
					result = getFiscalInfo(paydmentDate, ruc, formType, advancedNumber, clausureMonth, expiringDate);
					if(!validPresentationDate){
						result.put("DECLARATION_DATE_NOT_VALID",true);
					}
					return result;

			}
			}else if(fs.isActive().booleanValue()){
				logger.info("Form is Active");
				//aca hay que poner para que recupere del nuevo caledario perpetuo.
				
				ruc = rucObj.getNewRuc();	
				
				//Integer fiscalPeriodMonth = (Integer) params.get("fiscalPeriodMonth");
				//Integer fiscalPeriodYear = (Integer) params.get("fiscalPeriodYear");
				result = getFiscalInfoToNewForm(ruc,fiscalPeriodMonth,fiscalPeriodYear,paydmentDate, formType); 
				if(!validPresentationDate){
					result.put("DECLARATION_DATE_NOT_VALID",true);
				}

				return result; 

			}

		} catch (FiscalPeriodNotFoundException e) {
			logger.warn("Fiscal Period not found",e);
			if(!validPresentationDate)
				return result;
			else{
				e.printStackTrace();
				throw new FiscalInfoException(e.getMessage());
			}
		} catch (FormSettingRetrieveException e) {
			e.printStackTrace();
			throw new FiscalInfoException(e.getMessage()); 

		} catch (GetContributorInfoException e) {
			e.printStackTrace();
			throw new FiscalInfoException(e.getMessage()); 
		} catch (Exception e){
			e.printStackTrace();
			throw new FiscalInfoException(e.getMessage()); 
		}
		return null;

	}    
	
	
	@SuppressWarnings("unchecked")
	protected Map getFiscalInfoToNewForm(String ruc, Integer presentationMonth, Integer presentationYear, Date paymentDate, Integer formType) 
		throws FiscalInfoException{
		
		
		logger.info(" Get Fiscal Info New Form ");
		Map map = new HashMap();
				
		Calendar permanentCalendar = getPermanentCalendar(ruc, presentationMonth, presentationYear, formType);

		try {
			int i = 0;
			permanentCalendar.set(permanentCalendar.get(Calendar.YEAR),
								  permanentCalendar.get(Calendar.MONTH),
								  permanentCalendar.get(Calendar.DATE),
								  0,
								  0,
								  0);
			Date expiringDate = permanentCalendar.getTime();
			
			
			logger.info("Expiring date from Permanet Calendar is " + expiringDate);
			logger.info("Going to get next 'hablil' date");
			while( //busca el siguiente dia habil					
				(permanentCalendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY)   || 
				(permanentCalendar.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) ||
				(calendarManager.isHoliday(expiringDate).booleanValue()))
			{
				
				permanentCalendar.roll(Calendar.DATE,1);

				i++;
				if(i>30){ //para que no entre en loop infinito en ningún caso
					throw new FiscalInfoException("Problemas al buscar feriados");
				}
				
				expiringDate = permanentCalendar.getTime();
			}
			//en este punto tengo la fecha real de vencimiento
			Date limitDate = new Date(permanentCalendar.getTimeInMillis());
			logger.info("Compute data with Expiring Date " + limitDate);
			int diffDate = Utils.DateDiff(limitDate, paymentDate);

			logger.info("Difference between dates is " + diffDate + " days");
			if(diffDate <= 0){ //no hay multa
				logger.info("There isn't 'MORA'");
				map.put("CONTRAVENSION_SMOV", 0); //without movimient
		    	map.put("CONTRAVENSION_CMOV", 0);  //with movimient 
		    	map.put("PORC_MORA",0);//percent table
		    	map.put("PORC_INTERES",0);//percent per day	
			}else{ //hay multa
				logger.info("There are 'MORA'");
				logger.info("Compute difference month");
				Integer diffMonth = Utils.MonthDiff(expiringDate, paymentDate);
				logger.info("Difference month: " + diffMonth);
				FiscalPercentOverdue fpo = getPercentOverdue(850,diffMonth);
			    FiscalContravertionFee fcf = getFiscalContravertionFee(850,diffMonth);
		    	map.put("CONTRAVENSION_SMOV", new Double (50000.0)); //without movimient		    	
			    map.put("CONTRAVENSION_CMOV", fcf.getContravertion());  //with movimient 	    	
			    map.put("PORC_MORA",fpo.getPercent());
				double vinteres = ((1.0/30)* diffDate)*0.015;
				NumberFormat nf = NumberFormat.getIntegerInstance(Locale.US);
				nf.setMinimumFractionDigits(6);
				nf.setGroupingUsed(false);

				logger.debug("setting vinteres  -> " + vinteres + " with number format: " + nf);		
				
				map.put("PORC_INTERES",nf.format(vinteres));
		    	
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new FiscalInfoException("Error al convertir un dato del tipo fecha.");
		}		
		
		return map;
	}
	
	private Calendar getPermanentCalendar(String ruc, Integer presentationMonth, Integer presentationYear, Integer formType) 
		throws FiscalInfoException{

			logger.info(" Get Permanent Calendar ");
			try {
				logger.info("Going to retrieve Form Setting  with number " + formType.toString() );
				FormSetting fs = formSettingMgr.getFormSetting(formType.toString());
			
			int lastNumber = Integer.parseInt(ruc.substring(ruc.length()-1,ruc.length())); //ultimo número del ruc
			logger.info("Evaluate expiring date with ruc: " + ruc + ". Last number: " + lastNumber);
			int day = -1;
			switch (lastNumber) {
				case 0:	day = 7;  break;
				case 1:	day = 9;  break;
				case 2:	day = 11; break;
				case 3:	day = 13; break;
				case 4:	day = 15; break;
				case 5:	day = 17; break;
				case 6:	day = 19; break;
				case 7: day = 21; break;
				case 8:	day = 23; break;
				case 9: day = 25; break;
				default:
					throw new FiscalInfoException("Imposible recuperar valores del calendario perpetuo. RUC:" + ruc);
			}
	
			Calendar c = Calendar.getInstance();
			logger.info("Setting Calendar with: year: " + presentationYear + " month: " + presentationMonth + " day: " + day );
			c.set(presentationYear.intValue(), presentationMonth.intValue()-1, day);
			
			if(fs.isMonthy() || fs.isFourMonthy() || fs.isSixMonthy())
				//c.roll(Calendar.MONTH,1); //hay que poner el siguiente mes a la de presentación
				c.add(Calendar.MONTH,1);
			else if(fs.isAnnual())
				//c.roll(Calendar.YEAR,1); //hay que poner el siguiente a~no a la de presentación
				c.add(Calendar.YEAR,1); 
			else if(fs.isOccassionaly()){
				//c.roll(Calendar.MONTH,1); //hay que poner el siguiente mes a la de presentación
				c.add(Calendar.MONTH,1);
			}else
				throw new FiscalInfoException("Tipo de Periodicidad de Formulario no reconocido");
			
			logger.info("Permanent Calendar computed: " + c.getTime());
			return c;
		} catch (FormSettingRetrieveException e) {			
			e.printStackTrace();
			throw new FiscalInfoException(e.getMessage());
		}
		
	}
	
    public FiscalPeriod addFiscalPeriod(Integer month, Integer year) 
        throws InvalidFiscalPeriodException{
    		FiscalPeriod fp = null;	
    		try{
	    		fp = (FiscalPeriod) em.createQuery("select fp from FiscalPeriod fp where fp.month=:month and fp.year=:year")
	    			.setParameter("month", month)
	    			.setParameter("year",year)
	    			.getSingleResult();

	    		logger.info("Fiscal Period with month " + month + " and year " + year + " FOUND. ID = " + fp.getId());

	    		return fp;
    		}catch(NoResultException e){
    			logger.info("Fiscal Period with month " + month + " and year " + year + " is not found. Will be created!");
    			fp = new FiscalPeriod(month, year);
        		return fp;    			
    		}
    	
    }
    
    public ExpiringDate addExpiringDate(Integer id, Integer formType, FiscalPeriod fp, Date date, String charFrom, String charTo) 
       throws InvalidExpiringDateException{
    		ExpiringDate ed = null;
    		em.refresh(fp);
    		if(id!=null){
	    		try{
	    			ed = (ExpiringDate) em.createQuery("select ed from ExpiringDate ed where id = :id")
	    				.setParameter("id",id)
	    				.getSingleResult();
	    			
	    			ed.setFormType(formType);
	    			ed.setCharFrom(charFrom);
	    			ed.setCharTo(charTo);
	    			ed.setDate(date);
	    			ed.setFiscalPeriod(fp);
	    			
	    			return ed;
	    		}catch(NoResultException e){
	    			logger.error(e);
	    			e.printStackTrace();
	    			throw new InvalidExpiringDateException(e.getMessage());
	    		}
    		}else{
        		ed = new ExpiringDate(formType, fp, date, charFrom, charTo);
        		return ed;
    		}
    }
    
    public void save(List listObjectToSave) throws PersistException {
    	Iterator it = listObjectToSave.iterator();
    	try{
    		Object o;
	    	while(it.hasNext()){
	    		o = it.next();
	    		logger.info("About to save " + o);
	    		em.refresh(o);
	    		em.persist(o);
	    	}
    	}catch(Exception e){
    		logger.error(e);
    		e.printStackTrace();
    		throw new PersistException(e.getMessage());
    	}
    }
    
    public List getExpiringDatesFromFiscalPeriod(Integer month, Integer year) 
    	throws NoResultException{
    	
    	FiscalPeriod fp = (FiscalPeriod) em.createQuery("select fp from FiscalPeriod fp " +
    						"where fp.month=:month and fp.year=:year")
    						.setParameter("month",month)
    						.setParameter("year",year)
    						.getSingleResult();
    	
    	logger.debug("Retrive Expirieng Dates with Fiscal Period ID = " + fp.getId());
    	
    	List list = em.createQuery("select ed from ExpiringDate ed where ed.fiscalPeriod = :fp" +
    							   " order by ed.formType, ed.charFrom")
    		.setParameter("fp",fp)
    		.getResultList();

    	logger.debug("Retrive Expirieng Dates count: " + list.size());
    	
    	return  list;
    }

	public Salary getSalary(Date date) throws FiscalInfoException {
		try {
			Salary s = (Salary)
			tributos.createQuery("select s from Salary s " +
						   "where :date between s.periodBegin and s.periodEnd")
			  .setParameter("date",date)
			  .getSingleResult();

			return s;

		} catch (NoResultException e){
			logger.error("There Not Are Data" , e);
			throw new FiscalInfoException(e.getMessage());			
		}
	}

	public Map getFiscalInfoForm90(Map params) throws FiscalInfoException {
		//el formulario 90 es un formulario que se puede presentar en cualquier momento, por eso no se hace un control si es una fecha válida de presentación
		Map map = new HashMap();
		
		String section = (String) params.get(Globals.FORM90_SECTION);
		section = section.trim().toUpperCase();
		
		Date paymentDate = (Date) params.get(Globals.FORM90_PAYDMENT_DATE);
		Date initialDate = (Date) params.get(Globals.FORM90_INITIAL_DATE);
		
		String ruc = (String) params.get(Globals.FORM90_RUC);

		
		logger.debug("Compute getFiscalInfoForm90 with params:");
		logger.debug("Section : " + section);
		logger.debug("Initial Date : " + initialDate);
		logger.debug("Payment Date : " + paymentDate);
		logger.debug("RUC : " + ruc);
		
		int diffDate = 0;
		if(section.equals("A")){
			//Dias_atraso= [fecha_pago - convertirFecha(c19)] – 60
			Calendar c = Calendar.getInstance();
			c.setTime(initialDate);
			c.setLenient(true);
			c.set(Calendar.DATE, c.get(Calendar.DATE) + 60);
			initialDate = c.getTime();
			diffDate = Utils.DateDiff(initialDate, paymentDate);
//			if(diffDate <= 60){
//				diffDate = 0;
//			}else{
//				diffDate = diffDate - 60;
//			}
		}else if(section.equals("C")){
			//Dias_atraso= fecha_pago – recuperarVto[Ruc, convertirFecha(c29)]

			Calendar c = Calendar.getInstance();
			c.setTime(initialDate);
			c = getPermanentCalendar(ruc,c.get(Calendar.MONTH)+1, c.get(Calendar.YEAR),90);
			initialDate = c.getTime();
			diffDate = Utils.DateDiff(initialDate, paymentDate);
			
		}else if(section.equals("D")){
			//Dias_atraso= periodo_declarado – fec_ref
//			Calendar c = Calendar.getInstance();
//			c.setTime(initialDate);
//			c = getPermanentCalendar(ruc,c.get(Calendar.MONTH), c.get(Calendar.YEAR),90);
//			paymentDate = c.getTime();
//			
//			c.set(Calendar.DATE,1);
//			c.set(Calendar.MONTH, Calendar.JANUARY);
//			c.set(Calendar.YEAR, 2007);
//			
//			initialDate = c.getTime();
			
			paymentDate = initialDate;
			Calendar c = Calendar.getInstance();
			c.set(Calendar.DATE,1);
			c.set(Calendar.MONTH, Calendar.JANUARY);
			c.set(Calendar.YEAR, 2007);
			initialDate = c.getTime();

			diffDate = Utils.DateDiff(initialDate, paymentDate);
			
		}
		

		//en este punto tengo la fecha real de vencimiento

		logger.info("Compute data with Expiring Date " + initialDate);
		

		logger.info("Difference between dates is " + diffDate + " days");
		if(diffDate <= 0){ //no hay multa
			logger.info("There isn't 'MORA'");
			map.put("CONTRAVENSION_SMOV", 0); //without movimient
	    	map.put("CONTRAVENSION_CMOV", 0);  //with movimient 
	    	map.put("PORC_MORA",0);//percent table
	    	map.put("PORC_INTERES",0);//percent per day	
		}else{ //hay multa
			logger.info("There are 'MORA'");
			logger.info("Compute difference month");
			Integer diffMonth = Utils.MonthDiff(initialDate, paymentDate);
			logger.info("Difference month: " + diffMonth);
			FiscalPercentOverdue fpo = getPercentOverdue(850,diffMonth);
		    FiscalContravertionFee fcf = getFiscalContravertionFee(850,diffMonth);
	    	map.put("CONTRAVENSION_SMOV", new Double (50000.0)); //without movimient		    	
		    map.put("CONTRAVENSION_CMOV", new Double (0.0));  //with movimient 	    	
		    map.put("PORC_MORA",fpo.getPercent());
			
		    double vinteres = ((1.0/30)* diffDate)*0.015;
			NumberFormat nf = NumberFormat.getIntegerInstance(Locale.US);
			nf.setMinimumFractionDigits(6);
			nf.setGroupingUsed(false);

			logger.debug("setting vinteres  -> " + vinteres + " with number format: " + nf);		
			
			map.put("PORC_INTERES",nf.format(vinteres));
	    	
		}
		
        Iterator it = map.keySet().iterator();
        logger.debug(">>>>>>  getFiscalInfoForm90 return values:");
        while (it.hasNext()) {
            String key = (String) it.next();
            logger.info(key + "->" + params.get(key));

        }
        logger.debug(">>>>>>  End of getFiscalInfoForm90 return values:");
		return map;
	}
    
//	public static void main(String[] args) {
//		FiscalRulesManagerEJB frm = new FiscalRulesManagerEJB();
//		try {
//			frm.getPermanentCalendar("1799204", new Integer(12), new Integer(2007), new Integer(850));
//		} catch (FiscalInfoException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
    
}
