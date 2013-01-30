package py.com.roshka.pykasu.ui.menu;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Action implements Serializable, Comparable{

	protected String name;
	protected String description;
	protected  String url;
	protected  String urlHelp;
	protected Integer order;
	protected boolean isActive = false;

	
	private Set subactions = null; 
	
	public Action(){
		
	}
	
	@SuppressWarnings("unchecked")
	public Action(String name, String description, String url){
		this.name = name;
		this.description = description;
		this.url = url;
		urlHelp  = url + "/help";
		isActive = true;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getOrder() {
		return order;
	}
	public void setOrder(Integer order) {
		this.order = order;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUrlHelp() {
		return urlHelp;
	}
	public void setUrlHelp(String urlHelp) {
		this.urlHelp = urlHelp;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	
	public String toString(){
		String str = "Accion: " + this.name + " URL: " + this.url + "\n";
		if(subactions != null){
			Iterator it = subactions.iterator();
			while(it.hasNext()){
				str.concat("/t"+ ((Action)it.next()).toString() + "\n");
			}
		}
		return str;
	}

	public Set getSubactions() {
		return subactions;
	}

	public void setSubactions(Set subactions) {
		this.subactions = subactions;
	}
	
	@SuppressWarnings("unchecked")
	public void addSubAction(String name, String description, String url){
		if(subactions == null){
			subactions =  new HashSet();
		}
		subactions.add(new Action(name,description,url));
	}

	public int compareTo(Object o) {
		return order.compareTo(((Action)o).order);
	}

	
}
