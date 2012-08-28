package py.com.roshka.pykasu.interfaces;

//import java.util.Date;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import py.com.roshka.pykasu.exceptions.FiscalInfoException;
import py.com.roshka.pykasu.exceptions.InvalidExpiringDateException;
import py.com.roshka.pykasu.exceptions.InvalidFiscalPeriodException;
import py.com.roshka.pykasu.exceptions.PersistException;
import py.com.roshka.pykasu.persistence.fiscal.ExpiringDate;
import py.com.roshka.pykasu.persistence.fiscal.FiscalPeriod;
import py.com.roshka.pykasu.persistence.fiscal.Salary;


public interface FiscalRulesManager {
//	public Map getFiscalInfo(String ruc, Date paydmentDate, Integer fiscalPeriodMonth, Integer fiscalPeriodYear)
//    throws FiscalInfoException;
	public Map getFiscalInfo(Map params) throws FiscalInfoException;
	
	public Map getFiscalInfoForm90(Map params) throws FiscalInfoException;	
	
   public FiscalPeriod addFiscalPeriod(Integer month, Integer year) 
       throws InvalidFiscalPeriodException;
   
   public ExpiringDate addExpiringDate(Integer id, Integer formType, FiscalPeriod fp, Date date, String charFrom, String charTo) 
       throws InvalidExpiringDateException;
   
   public void save(List listObjectToSave) throws PersistException;
   
   public List getExpiringDatesFromFiscalPeriod(Integer month, Integer year) 
	throws NoResultException;
   
   public Salary getSalary(Date date) throws FiscalInfoException;
   
   
}
