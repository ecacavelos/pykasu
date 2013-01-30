/*
 * Created on Jul 6, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.ui.util;

import java.io.Serializable;
import java.util.List;

public class ResultItem implements Serializable{

	private String description;
    private Object id;
	private String status;
	private List resultItemActions;
	
    private boolean editable;
    private boolean showDetails;
    private boolean deleteable;
    private boolean stateless;
    
    
    
    public boolean isDeleteable() {
        return deleteable;
    }
    public void setDeleteable(boolean deleteable) {
        this.deleteable = deleteable;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public boolean isEditable() {
        return editable;
    }
    public void setEditable(boolean editable) {
        this.editable = editable;
    }
    public Object getId() {
        return id;
    }
    public void setId(Object id) {
        this.id = id;
    }
    public boolean isShowDetails() {
        return showDetails;
    }
    public void setShowDetails(boolean showDetails) {
        this.showDetails = showDetails;
    }
    
    public String toString(){
    	return "\nID:" + id + " - Description: " + description;
    }
    
    
}
