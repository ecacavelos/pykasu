/*
 * Created on 26/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.ui.form;

import java.io.Serializable;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import py.com.roshka.pykasu.exceptions.CellSetDataException;

public class Cell implements Serializable, Comparable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2814922263045688697L;

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Cell.class);
	
    static final public String NUMBER = "NUMBER";
    static final public String DATE = "DATE";
    static final public String STRING = "STRING";
    static final public String CHECK = "CHECK";
    static final public String MULTIPLE = "MULTIPLE";
    static final public String LABEL = "LABEL";
    
    
    static final public String LEFT = "LEFT";
    static final public String TOP = "TOP";
    static final public String BOTTON = "BOTTON";
    static final public String RIGHT = "RIGHT";
    static final public String FILLED = "FILLED";
    
    static final public String DATE_PATTERN_STD = "dd/MM/yyyy";
    
    
    private String 	id;
    private Object 	data;
    private String 	additionalDescription;
    private int 	col;
    private int 	colSpan;
    private String 	type = NUMBER;
    private boolean opaque;
    private boolean readOnly;
    private boolean calculable=true;
    private String 	formula;
    private boolean afterUpdate;
    private String 	datePattern = DATE_PATTERN_STD;
    private String  alignAditionalDescription;
    private Line 	lineConteiner;
    private String 	choices;
    private String 	events;
    private String 	xmlTagName;
    private boolean staticValue = false;

    
    public Cell(Line container){
    	lineConteiner = container;
    }
    public Cell (){
    }
    
    public boolean isAfterUpdate() {
        return afterUpdate;
    }
    public void setAfterUpdate(boolean afterUpdate) {
        this.afterUpdate = afterUpdate;
    }
    public boolean isCalculable() {
        return calculable;
    }
    
    public void setCalculable(boolean calculable) {
        this.calculable = calculable;
    }
    public int getCol() {
        return col;
    }
    public void setCol(int col) {
        this.col = col;
    }
    public int getColSpan() {
        return colSpan;
    }
    public void setColSpan(int colSpan) {
        this.colSpan = colSpan;
    }
//    public String getDATE() {
//        return DATE;
//    }
   
    public String getFormula() {
        return formula;
    }
    public void setFormula(String formula) {
        this.formula = formula;
    }
//    public String getNUMBER() {
//       return NUMBER;
//   }
   
    public boolean isOpaque() {
        return opaque;
    }
    public void setOpaque(boolean opaque) {
        this.opaque = opaque;
    }
    public boolean isReadOnly() {
        return readOnly;
    }
    public void setReadOnly(boolean readOnly) {
        this.readOnly = readOnly;
    }
//    public String getSTRING() {
//        return STRING;
//    }
    
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
    	if(id != null)
    		id = id.trim();
        this.id = id;
    }
    
    public String toString(){
    	return "Cell ID:" + this.getId() + " - Col: " + this.getCol() + " - Data: " + getData();
    }
	
    public String getAlignAditionalDescription() {
		return alignAditionalDescription;
	}

	public void setAlignAditionalDescription(String alignAditionalDescription) {
		this.alignAditionalDescription = alignAditionalDescription;
	}

	public Object getData() { 
    	if (data == null){
    		if (type.equals(STRING) || type.equals(LABEL) || type.equals(MULTIPLE))
    			return "";
    		if (type.equals(NUMBER))
    			return new Double(0);
    		if (type.equals(DATE)){
    			return new Date();
    		}
            if (type.equals(CHECK))
                return Boolean.FALSE;
    	}
		return data;
	}

	public boolean isNullData(){
		return (data == null);
	}
	
    public void setData(String data) throws CellSetDataException {
    	
    	
    	if(data != null){
			if(type.equals(STRING) || type.equals(MULTIPLE) || type.equals(LABEL) ){
				this.data = data;
			}else if(type.equals(DATE)){
				try {
					logger.info("parse date: "+data+" to date in pattern" + this.datePattern);
					SimpleDateFormat sdf = new SimpleDateFormat(this.datePattern);
					this.data = sdf.parse(data) ;
					logger.info("date value = " +sdf.format(this.data));
				} catch (ParseException e) {
					logger.error(e);
					throw new CellSetDataException();
				}			
			}else if(type.equals(NUMBER)){
	    		NumberFormat nf = NumberFormat.getInstance(new Locale("es","py"));
	    		nf.setGroupingUsed(true);
	    		nf.setMinimumFractionDigits(0);
	    		nf.setMaximumFractionDigits(0);
	    		try {
	    			data = data.trim();
                    if (data.trim().equals(""))
                        this.data = 0;
                    else
                        this.data = nf.parse(data).doubleValue();
                    
                        
				} catch (ParseException e) {
					logger.error(e);
					throw new CellSetDataException("Imposible to convert data: " + data);
				}
				//this.data = Double.parseDouble(data);
	        }else if (type.equals(CHECK)){
	        	this.data = Boolean.parseBoolean(data);
			}else{
	    		NumberFormat nf = NumberFormat.getInstance(new Locale("es","py"));
	    		nf.setGroupingUsed(true);
	    		nf.setMinimumFractionDigits(0);
	    		nf.setMaximumFractionDigits(0);
	    		try {
					this.data = nf.parse(data).doubleValue();
				} catch (ParseException e) {
					logger.error(e);
					throw new CellSetDataException("Imposible to convert data: " + data);
				}
				//this.data = Double.parseDouble(data);				
			}
    	}
	}
    
	public String getAdditionalDescription() {
		return additionalDescription;
	}
	public void setAdditionalDescription(String additionalDescription) {
		this.additionalDescription = additionalDescription;
	}
    
	public int compareTo(Object o) {
		Cell c = (Cell) o; 
		return col - c.col;
	}
	public String getDatePattern() {
		return datePattern;
	}
	public void setDatePattern(String datePattern) {
		this.datePattern = datePattern;
	}
	public void setData(Object data) {
		this.data = data;
	}

	public Line getLineConteiner() {
		return lineConteiner;
	}
	public void setLineConteiner(Line lineConteiner) {
		this.lineConteiner = lineConteiner;
	}

	public String getChoices() {
		return choices;
	}

	public void setChoices(String choices) {
		this.choices = choices;
	}
	public static void main(String[] args) throws CellSetDataException {
		Cell c = new Cell(null);
		c.setType(Cell.CHECK);
		c.setData("false");
		System.out.println("------------");
		System.out.println(c.getData());
		
	}

	public String getEvents() {
		return events;
	}

	public void setEvents(String events) {
		this.events = events;
	}
	
	public String getXmlTagName() {
		return xmlTagName;
	}
	public void setXmlTagName(String xmlTagName) {
		this.xmlTagName = xmlTagName;
	}

	public boolean isStaticValue() {
		return staticValue;
	}
	public void setStaticValue(boolean staticValue) {
		this.staticValue = staticValue;
	}



	
}