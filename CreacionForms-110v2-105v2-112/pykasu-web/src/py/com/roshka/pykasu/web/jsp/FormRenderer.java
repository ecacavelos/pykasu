/*
 * Created on Aug 10, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.jsp;

import java.io.IOException;
import java.security.acl.Group;
import java.text.NumberFormat;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import py.com.roshka.pykasu.ui.form.Cell;
import py.com.roshka.pykasu.web.Globals;
import py.com.roshka.pykasu.web.gui.Component;
import py.com.roshka.pykasu.web.gui.Form;
import py.com.roshka.pykasu.web.gui.Label;
import py.com.roshka.pykasu.web.gui.Option;
import py.com.roshka.pykasu.web.gui.Panel;
import py.com.roshka.pykasu.web.gui.RadioButton;
import py.com.roshka.pykasu.web.gui.RadioButtonGroup;
import py.com.roshka.pykasu.web.gui.Select;
import py.com.roshka.pykasu.web.gui.Submit;
import py.com.roshka.pykasu.web.gui.TextField;

/**
 * @jsp.tag name = "form"
 */
public class FormRenderer extends TagSupport {
    private Component component;

    private String styleName;

    static org.apache.log4j.Logger logger = org.apache.log4j.Logger
            .getLogger(CellTag.class);

    /**
     * @jsp.attribute rtexprvalue = "true" type = "java.lang.String"
     */
    public String getStyleName() {
        return styleName;
    }

    public void setStyleName(String styleName) {
        this.styleName = styleName;
    }

    /**
     * @jsp.attribute rtexprvalue = "true" type =
     *                "py.com.roshka.pykasu.web.gui.Component"
     */
    public Component getComponent() {
        return component;
    }

    public void setComponent(Component component) {
        this.component = component;
    }

    @Override
    public int doAfterBody() throws JspException {

        return EVAL_PAGE;
    }

    @Override
    public int doEndTag() throws JspException {

        return EVAL_PAGE;
    }

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = super.pageContext.getOut();
        try {
            renderComponent(component);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return EVAL_PAGE;
    }

    public void renderComponent(Component component) throws IOException {
        System.out.println("renderer component");
        if (component.getComponents() != null) {

            Iterator components = component.getComponents().values().iterator();
            System.out.println("renderer" + component.getId());
            while (components.hasNext()) {
                Component component1 = (Component) components.next();
                if (component1 instanceof TextField)
                    renderComponent((TextField) component1);
                else if (component1 instanceof Label)
                    renderComponent((Label) component1);
                else if (component1 instanceof Select)
                    renderComponent((Select) component1);
                else if (component1 instanceof Submit)
                    renderComponent((Submit) component1);
                else if (component1 instanceof RadioButton)
                    renderComponent((RadioButton) component1);
                else if (component1 instanceof RadioButtonGroup)
                    renderComponent((RadioButtonGroup) component1);
            }
        }
    }

    public void renderComponent(Panel component) throws IOException {
        System.out.println("renderer panel");
        if (component.getComponents() != null) {
            Iterator components = component.getComponents().values().iterator();
            JspWriter out = super.pageContext.getOut();
            out.print("<div " + getStyle(component) + ">");
            while (components.hasNext()) {
                Component component1 = (Component) components.next();
                renderComponent((Component) component1);
            }
            out.print("/>");
        }
    }

    public void renderComponent(Label component) throws IOException {
        System.out.println("renderer label");
        JspWriter out = super.pageContext.getOut();
        Label label = component;
        out.print("<label " + getStyle(component) + ">");
        out.print(label.getText());
        out.print("</label>");
    }

    public void renderComponent(TextField component) throws IOException {
        System.out.println("renderer textfield");
        JspWriter out = super.pageContext.getOut();
        TextField field = component;

        String value = field.getValue();
        if (value == null)
            value = "";

        out.print("<input type=\"text\" " + getStyle(component));
        out.print(" name=\"field(" + field.getProperty() + ")\"");
        out.print(" id=\"" + field.getId() + "\"");
        out.print(" value=\"" + value + "\"");
        out.print("/>");

    }

    public void renderComponent(RadioButtonGroup component) throws IOException {
        if (component.getRadioButtons() != null) {

            Iterator components = component.getRadioButtons().values().iterator();
            
            while (components.hasNext()) {
                RadioButton radio = ((RadioButton)components.next());
                radio.setGroup(component);
                renderComponent(radio);
            }
        }
    }
/*
 *
 **/
    
    public void renderComponent(RadioButton component) throws IOException {
        
        JspWriter out = super.pageContext.getOut();
        
        out.print("<input type=\"radio\" " + getStyle(component));
        out.print(" name=\"field(" + component.getGroup().getProperty() + ")\"");
        out.print(" id=\"" + component.getId() + "\"");
        out.print(" value=\"" + component.getValue() + "\"");
        if (component.isSelected())
            out.print(" selected");
        out.print(" />");
    }

    public void renderComponent(Submit component) throws IOException {
        JspWriter out = super.pageContext.getOut();
        Submit field = component;
        System.out.println("submit textfield");
        out.print("<input type=\"submit\" " + getStyle(component));
        out.print(" name=\"submitAction\"");
        out.print(" id=\"" + field.getId() + "\"");
        out.print(" value=\"" + component.getText() + "\"");
        out.print("/>");
    }

    public void renderComponent(Select component) throws IOException {
        JspWriter out = super.pageContext.getOut();

        System.out.println("submit textfield");
        out.print("<select " + getStyle(component));
        out.print(" name=\"field(" + component.getProperty() + ")\"");
        out.print(" id=\"" + component.getId() + "\"");
        out.print(">");
        Iterator options = component.getOptions().iterator();
        while (options.hasNext()) {
            Option option = (Option) options.next();
            out.print("<option value=\"" + option.getValue() + "\">");
            out.print(option.getText());
            out.print("</option>");
        }
        out.print("</select>");

    }

    public String getStyle(Component component) {
        StringBuffer out = new StringBuffer();
        String width = "auto";
        String height = "auto";

        if (component.getHeight() > 0)
            height = component.getHeight() + "px";

        if (component.getWidth() > 0)
            width = component.getWidth() + "px";

        out.append("style=\"");
        out.append("position:absolute");
        out.append(";left:" + component.getXAxis() + "px");
        out.append(";top:" + component.getYAxis() + "px");
        out.append(";width:" + width);
        out.append(";height:" + height);
        out.append(";background-color:" + component.getBackgroundColor());
        out.append("\"");

        return out.toString();

    }
}
