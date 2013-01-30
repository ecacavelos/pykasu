/*
 * Created on Aug 10, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.gui;

public interface FormField{
    final static public String TYPE_STRING = "String";
    final static public String TYPE_DOUBLE = "Double";
    final static public String TYPE_INTEGER = "Integer";
    final static public String TYPE_BIGDECIMAL = "BigDecimal";
    final static public String TYPE_DATE = "Date";
    final static public String TYPE_BOOLEAN = "String";
    
    
    public void setProperty(String property);
    public String getProperty();
    public void setType(String t);
    public String getType();
    public void setDatePettern(String dp);
    public String getDatePattern();
    public void setValue(String value);
    public String getValue();
}
