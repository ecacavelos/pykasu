/*
 * Created on Aug 9, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.gui;

import java.util.HashMap;

public abstract class Component {

    protected int XAxis;
    protected String id;
    protected int YAxis;

    protected int widht;

    protected int height;
    protected String backgroundColor;
    protected String align;
    protected String verticalAlign;
    protected String events;
    protected boolean isActive;
    protected boolean readOnly;
    protected boolean opaque;
    protected String styleClass;
    
    

    public String getAlign() {
        return align;
    }

    public void setAlign(String align) {
        this.align = align;
    }

    public String getBackgroundColor() {
        return backgroundColor;
    }

    public void setBackgroundColor(String backgroundColor) {
        this.backgroundColor = backgroundColor;
    }

    public String getEvents() {
        return events;
    }

    public void setEvents(String events) {
        this.events = events;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int heigth) {
        this.height = heigth;
    }

    public String getVerticalAlign() {
        return verticalAlign;
    }

    public void setVerticalAlign(String verticalAlign) {
        this.verticalAlign = verticalAlign;
    }

    public int getWidth() {
        return widht;
    }

    public void setWidth(int width) {
        this.widht = width;
    }

    public int getXAxis() {
        return XAxis;
    }

    public void setXAxis(int axis) {
        XAxis = axis;
    }

    public int getYAxis() {
        return YAxis;
    }

    public void setYAxis(int axis) {
        YAxis = axis;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

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

    public String getStyleClass() {
        return styleClass;
    }

    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    abstract public String renderer();
        
    abstract public HashMap getComponents();
    
}
