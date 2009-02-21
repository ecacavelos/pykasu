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

public class Form implements Serializable {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form.class);
	
	private String name;
	private String id;
	private String type;
	private String description;
	
    private Map sections;
    private Map triggers;

    private Map headers;
    private Map footers;
    
    protected  Map<String,Cell>cells;
        
    public Form(){
    	sections = new HashMap();
    	triggers = new HashMap();
    	headers = new HashMap();
    	footers = new HashMap();   
    	cells  = new HashMap<String,Cell>(); 
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
	
	@SuppressWarnings("unchecked")
	public String toString(){
		String str = null;
		
		str = "==============================\nForm: " +  this.getName();
		ArrayList al = new ArrayList(this.getHeaders().values());
		Collections.sort(al);
		Iterator it = al.iterator();
		str = str + "\nCabeceras:";
		while(it.hasNext()){
			str = str + "\n" +it.next();
		}
		str = str + "\n--------------------------------";
		
		str = str + "\nCuerpo:";		
		al = new ArrayList(this.getSections().values());
		Collections.sort(al);
		it = al.iterator();
		while(it.hasNext()){
			str = str + "\n" +it.next();
		}

		str = str + "\n--------------------------------";

		str = str + "\nPie de Página:";
		al = new ArrayList(this.getFooters().values());
		Collections.sort(al);
		it = al.iterator();
		while(it.hasNext()){
			str = str + "\n" +it.next();
		}		
		str = str + "\n--------------------------------";

		str = str + "\nReglas:";
		al = new ArrayList(this.getTriggers().values());
		Collections.sort(al);
		it = al.iterator();
		while(it.hasNext()){
			str = str + "\n" +it.next();
		}
		str = str + "\n==============================";
		return str;
	}

	public Map getFooters() {
		return footers;
	}

	public void setFooters(Map footers) {
		this.footers = footers;
	}

	public Map getHeaders() {
		return headers;
	}

	public void setHeaders(Map headers) {
		this.headers = headers;
	}

	public Map getSections() {
		return sections;
	}

	public void setSections(Map sections) {
		this.sections = sections;
	}

	public Map getTriggers() {
		return triggers;
	}

	public void setTriggers(Map triggers) {
		this.triggers = triggers;
	}
	
	//return de first cell that your id matching whit de pattern id
	public Cell getCell(String id){
		Cell cell = null;	
		
		//logger.info("Finding Cell by ID : " + id);
		if(id != null){
			id = id.toUpperCase();
		}
		cell = (Cell) cells.get(id);
		
		if(cell==null){
			logger.warn("---------> Cell id not found! Pattern:" + id);
		}
		return cell;
	}
	
	@SuppressWarnings("unchecked")
	public void addSection(Section section){
		getSections().put(section.getId(),section);
//		section.setFormConteiner(this);
	}
	
	@SuppressWarnings("unchecked")
	public void addTrigger(Trigger trigger){
		getTriggers().put(trigger.getName(),trigger);
//		trigger.setFormConteiner(this);
	}
	
	void addCell(Cell cell){
		if(cell.getId()!=null){
			cells.put(cell.getId().toUpperCase(),cell);
		}
		cells.put(cell.getId(),cell);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Cell>getCells() {
		ArrayList<Cell>al = new ArrayList<Cell>(cells.values());
		Collections.sort(al);
		return  al;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
