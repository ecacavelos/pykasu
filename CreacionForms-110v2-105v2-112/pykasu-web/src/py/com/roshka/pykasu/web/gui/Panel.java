/*
 * Created on Aug 9, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.gui;

import java.util.HashMap;

public class Panel extends Component {
    
    HashMap components;

    

    public void setComponents(HashMap components) {
        this.components = components;
    }

    @Override
    public String renderer() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public HashMap getComponents() {
        return components;
    }
    
    
   
    
}
