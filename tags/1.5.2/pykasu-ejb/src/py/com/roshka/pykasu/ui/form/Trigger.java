/*
 * Created on 26/06/2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.ui.form;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Trigger implements Serializable,Comparable{
    
    private int order;
    private String name;
    private String formula;
    private String cell;
    private Form formConteiner;   
    private String condition;
    
    
    public String getCell() {
        return cell;
    }
    public void setCell(String cell) {
        this.cell = cell;
    }
    public String getFormula() {
        return formula;
    }
    public void setFormula(String formula) {
        this.formula = formula;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getJSFormula(){
        
        Pattern p = Pattern.compile("[a-zA-Z_][a-zA-Z_0-9]*");
        Matcher m = p.matcher(formula);
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            System.out.println(m.group());
            m.appendReplacement(sb,m.group()+".value");
        }
        
        m.appendTail(sb);
        return sb.toString();
        //System.out.println(v);
    }
    public static void main(String[] args) {
        String v = "(hola12 + yuas43) * 17 + 26 ";
        /*Pattern p = new Pattern();
        
        String[] s = v.split("[a-zA-Z_][a-zA-Z_0-9]*");
        for (int i=0; i<s.length; i++){
            System.out.println(s[i]);
            //v.replaceAll(s[i],s[i]+".value");
        }
        */
        Pattern p = Pattern.compile("[a-zA-Z_][a-zA-Z_0-9]*");
        Matcher m = p.matcher(v);
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            System.out.println(m.group());
            m.appendReplacement(sb,"("+m.group()+".value)");
        }
        m.appendTail(sb);
        System.out.println(sb.toString());
        //System.out.println(v);
        
    }
    
    public int getOrder() {
        return order;
    }
    public void setOrder(int order) {
        this.order = order;
    }
    public int compareTo(Object o) {
        Trigger tr = (Trigger) o;
        return order-tr.getOrder();
    }
    
    public String toString(){
    	return "\nName: " + getName() + " - Cell: " + getCell() + " - Formula: " + getFormula() + " - Orden: " + getOrder();
    }
	public Form getFormConteiner() {
		return formConteiner;
	}
	public void setFormConteiner(Form formConteiner) {
		this.formConteiner = formConteiner;
	}
    
	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public boolean hasCondition(){
		return (condition != null);
	}    
}
