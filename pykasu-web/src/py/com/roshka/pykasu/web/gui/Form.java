/*
 * Created on Aug 9, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.gui;

import java.util.HashMap;

public class Form extends Component{
    
    private HashMap components;
    private HashMap actions;
    private String name;
    
    public HashMap getComponents() {
        return components;
    }
    public void setComponents(HashMap components) {
        this.components = components;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    @Override
    public String renderer() {
        // TODO Auto-generated method stub
        return null;
    }
    public String getAction(String text){
        return (String) actions.get(text);
    }
    public HashMap getActions(){
        return actions;
    }
    public void setActions(HashMap actions){
        this.actions = actions;
    }
}
