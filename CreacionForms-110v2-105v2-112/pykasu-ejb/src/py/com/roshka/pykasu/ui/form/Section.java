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

public class Section implements Serializable, Comparable {

    private String id;
    private String name;
    private String description;
    private Map lines;
    private int order;
    private Form formConteiner;
    
    public Section(Form conteiner){
    	lines = new HashMap();
    	formConteiner = conteiner;
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

	public Map getLines() {
		return lines;
	}

	public void setLines(Map lines) {
		this.lines = lines;
	}

	@SuppressWarnings("unchecked")
	public String toString(){
		String str = null;
		
		str = "Section: " + this.getId() + " - Description: " + this.getDescription();
		ArrayList al = new ArrayList(this.getLines().values());
		Collections.sort(al);
		Iterator it = al.iterator();
		while(it.hasNext()){
			str = str + "\n\t" +it.next().toString();
		}
		return str;
	}

	public int compareTo(Object o) {
		Section s = (Section) o; 
		return order - s.order;
	}

	public Form getFormConteiner() {
		return formConteiner;
	}

	public void setFormConteiner(Form formConteiner) {
		this.formConteiner = formConteiner;
	}

	@SuppressWarnings("unchecked")
	public void addLine(Line line){
		getLines().put(line.getId(),line);
		line.setSectionConteiner(this);		
	}
}
