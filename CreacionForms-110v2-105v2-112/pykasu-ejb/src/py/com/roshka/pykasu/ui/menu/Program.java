package py.com.roshka.pykasu.ui.menu;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Program implements Serializable, Comparable {

	private String name;
	private String description;
	private Set<Action> actions;
	private Integer order;
	private boolean isActive = false;
	
	
	public Program(){
		actions = new HashSet();
	}
	
	
	public Program(String name, String descripcion, Integer order){
		this();
		this.name = name;
		this.description = descripcion;
		this.order = order;
		this.isActive = true;
	}
	
	public Set<Action> getActions() {
		return actions;
	}
	public void setActions(Set<Action> actions) {
		this.actions = actions;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
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
	
	public String toString(){
		String str = "====================\n" + 
				"Program: " + this.name + "\n";
		if(actions == null){
			str = str + "\nWithout actions.";
		}else{
			Iterator it =  actions.iterator();
			while(it.hasNext()){
				str = str + ((Action)it.next()).toString();				 
			}
		}
		return str + "\n====================";		
	}


	public int compareTo(Object o) {
		return order.compareTo(((Program)o).order);
	}	
	
	
}
