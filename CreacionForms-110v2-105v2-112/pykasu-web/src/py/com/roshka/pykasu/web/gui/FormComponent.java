/*
 * Created on Aug 10, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.gui;

import java.util.HashMap;

import org.apache.struts.taglib.tiles.ComponentConstants;

public class FormComponent extends Component implements FormField {
    private String property;
    private String type;
    private String datePattern;
    private String value;

    public void setProperty(String property) {
        this.property = property;
    }

    public String getProperty() {
        return property;
    }

    public void setType(String t) {
        this.type = t;
    }

    public String getType() {
        return this.type;
    }

    public void setDatePettern(String dp) {
        this.datePattern = dp;
    }

    public String getDatePattern() {
        return datePattern;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }

    @Override
    public String renderer() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public HashMap getComponents() {
        // TODO Auto-generated method stub
        return null;
    }

}
