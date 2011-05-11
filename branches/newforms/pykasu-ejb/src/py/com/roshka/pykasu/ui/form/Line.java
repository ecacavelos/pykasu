/*
 * Created on 26/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.ui.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Line implements Serializable, Comparable{
    private String id;
    private String name;
    private String description;
    private int order;
    private Map cells;
    private Section sectionConteiner;
    
    public Line(Section conteiner){
    	cells = new HashMap();
    	sectionConteiner = conteiner;
    }
    
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getOrder() {
        return order;
    }
    public void setOrder(int order) {
        this.order = order;
    }

    
    public Map getCells() {
		return cells;
	}

	public void setCells(Map cells) {
		this.cells = cells;
	}

	@SuppressWarnings("unchecked")
	public String toString(){
		String str = null;
		ArrayList al = new ArrayList(this.getCells().values());
		Collections.sort(al);
		str = "Line: " + this.getId() + " - Description: " + this.getDescription(); 
		Iterator it = al.iterator();
		while(it.hasNext()){
			str = str + "\n\t\t" +  it.next().toString();
		}
//		Iterator it = this.getCells().values().iterator();
//		while(it.hasNext()){
//			str = str + "\n\t\t" +it.next().toString();
//		}
		
		return str;
	}

	public int compareTo(Object o) {
		Line l = (Line) o; 
		return order - l.order;
	}

	@SuppressWarnings("unchecked")
	public void addCell(Cell cell){
		getCells().put(cell.getId(),cell);
		getSectionConteiner().getFormConteiner().addCell(cell);
	}

	public Section getSectionConteiner() {
		return sectionConteiner;
	}

	public void setSectionConteiner(Section sectionConteiner) {
		this.sectionConteiner = sectionConteiner;
	}
	
}
