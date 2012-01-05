package py.com.roshka.pykasu.ejb;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.EJB;
import javax.annotation.Resource;
import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.interfaces.SearchFormsInterface;
import py.com.roshka.pykasu.interfaces.UserManager;
import py.com.roshka.pykasu.persistence.forms.ItemSearch;
import py.com.roshka.pykasu.persistence.forms.ItemSearch.FieldName;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.util.Utils;

@Stateless
@Local ({SearchFormsInterface.class})
@LocalBinding (jndiBinding="pykasu/SearchFormManager/local")
@Remote ({SearchFormsInterface.class})
@RemoteBinding (jndiBinding="pykasu/SearchFormManager/remote")

public class SearchFormsEJB implements SearchFormsInterface{
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(SearchFormsEJB.class);


	public enum CriteriaType { FORM , PERIOD_MONTH, PERIOD_YEAR, PRESENTATION_DATE_INIT, PRESENTATION_DATE_END, RUC, NAME}
	
	@Resource protected SessionContext sc;
	@EJB protected UserManager userManager;
	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;


	public List<ItemSearch> getAll(User user, Integer from) {
		
		String inSql = "SELECT vf.*, ROW_NUMBER() OVER () AS RN FROM V_FORMULARIOS vf where BCOMPANY_IID = :bcompanyId";
		//aqui se debería de filtrar conrelación a lo cargado por el usuario
		String sql = "select * from ("+inSql+") where RN between "+from+" and " + (from.intValue()+9);
		List<ItemSearch> items = new ArrayList<ItemSearch>();
		 
		javax.persistence.Query q = em.createNativeQuery(sql);
		q.setParameter("bcompanyId", user.getBusinessCompany().getId());
		
		
		List <Object[]>list =  q.getResultList();
		 
		for(Object[] line : list){			 			 
			 items.add(new ItemSearch(line));
		}
		 
        return items;

	}

	public List<ItemSearch> getForms(User user, Map<CriteriaType, Object> criteria) {
		
		if(user == null || criteria == null){
			throw new IllegalArgumentException("Los parametros USER, CRITERIA no pueden ser ninguno de ellos nulos");
		}
		
		String sql = "SELECT vf.*, ROW_NUMBER() OVER () AS RN FROM V_FORMULARIOS vf where BCOMPANY_IID = :bcompanyId ";
		
		//a armar el sql a partir de los criterios
		if(criteria.get(CriteriaType.FORM)!=null){
			String[] forms = (String[])criteria.get(CriteriaType.FORM);
			String formStr = " and FORM_TYPE in (";
			int i = 1;
			for(String form : forms){
				formStr += form;
				if(form!=null && i<forms.length){
					formStr +=  ", ";
				}
				i++;				
			}
			formStr = formStr + ") ";			
			sql = sql + formStr;
		}
		if(criteria.get(CriteriaType.PERIOD_MONTH)!=null){
			Integer fpm = (Integer)criteria.get(CriteriaType.PERIOD_MONTH);
			sql = sql + " and FISCALPERIODMOUNTH = " + fpm;
		}
		if(criteria.get(CriteriaType.PERIOD_YEAR)!=null){
			Integer fpy = (Integer)criteria.get(CriteriaType.PERIOD_YEAR);
			sql = sql + " and FISCALPERIODYEAR = " + fpy;
		}
		
		if(criteria.get(CriteriaType.PRESENTATION_DATE_INIT)!= null && criteria.get(CriteriaType.PRESENTATION_DATE_END)!= null){ //between
			sql = sql + " and (PRESENTATIONDATE >= :presentationDateInit and PRESENTATIONDATE <= :presentationDateEnd) ";			
		}else if(criteria.get(CriteriaType.PRESENTATION_DATE_INIT)!= null){ //mayor que
			sql = sql + " and PRESENTATIONDATE >= :presentationDateInit ";
		}else if(criteria.get(CriteriaType.PRESENTATION_DATE_END)!= null){ //menor_que
			sql = sql + " and PRESENTATIONDATE <= :presentationDateEnd ";			
		}		
		
		if(criteria.get(CriteriaType.RUC) != null || criteria.get(CriteriaType.NAME) != null){
			sql = sql + " and ( 1=1 ";
			
			if(criteria.get(CriteriaType.RUC) != null)
				sql = sql + " or RUC like '%"+(String)criteria.get(CriteriaType.RUC)+"%'";
			
			if(criteria.get(CriteriaType.RUC) != null)
				sql = sql + " or (FIRSTLASTNAME) like ('%"+(String)criteria.get(CriteriaType.NAME)+"%')";
			
			sql = sql + ")";
		}
		System.out.println(sql);
		List<ItemSearch> items = new ArrayList<ItemSearch>();
		 
		javax.persistence.Query q = em.createNativeQuery(sql);
		
		q.setParameter("bcompanyId", user.getBusinessCompany().getId());
		
		if(sql.contains("presentationDateInit")){
			q.setParameter("presentationDateInit", (java.util.Date)criteria.get(CriteriaType.PRESENTATION_DATE_INIT));
		}
		if(sql.contains("presentationDateEnd")){
			q.setParameter("presentationDateEnd", (java.util.Date)criteria.get(CriteriaType.PRESENTATION_DATE_END));
		}		
				
		List <Object[]>list =  q.getResultList();
		
		ItemSearch itemSearch = null;
		for(Object[] line : list){	
			itemSearch = new ItemSearch(line);
			
			javax.persistence.Query d = em.createNativeQuery("select STATUS, AT from FORMS_WF where FORM_TYPE = :formType  and FORM_IID = :formId");
			d.setParameter("formType", itemSearch.getValue(FieldName.FORM_TYPE));
			d.setParameter("formId", itemSearch.getValue(FieldName.FORM_IID));
			List <Object[]>details =  d.getResultList();
			itemSearch.setDetails(details);
			
			items.add(itemSearch);

		}
		 
        return items;

	}
	
	
	public Integer getCount(User user) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
