package py.com.roshka.pykasu.interfaces;

import java.util.List;
import java.util.Map;

import py.com.roshka.pykasu.ejb.SearchFormsEJB.CriteriaType;
import py.com.roshka.pykasu.persistence.forms.ItemSearch;
import py.com.roshka.pykasu.persistence.users.User;

public interface SearchFormsInterface {
	
	public Integer getCount(User user);
	
	public List<ItemSearch> getAll(User user, Integer from);
	
	public List<ItemSearch> getForms(User user, Map<CriteriaType, Object> criteria);
	
	
}
