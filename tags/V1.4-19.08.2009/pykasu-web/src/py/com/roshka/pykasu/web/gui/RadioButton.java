/*
 * Created on Aug 10, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.gui;

public class RadioButton extends FormComponent{
    String value;
    boolean selected;
    
    RadioButtonGroup group;
    
    public RadioButtonGroup getGroup() {
        return group;
    }
    public void setGroup(RadioButtonGroup group) {
        this.group = group;
    }
    public boolean isSelected() {
        return selected;
    }
    public void setSelected(boolean selected) {
        this.selected = selected;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    
}
