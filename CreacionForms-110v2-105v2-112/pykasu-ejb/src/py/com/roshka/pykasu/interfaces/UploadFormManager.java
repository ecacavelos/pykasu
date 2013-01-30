package py.com.roshka.pykasu.interfaces;

import java.util.Calendar;
import java.util.List;

import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;

public interface UploadFormManager {
	
	public List<UploadForm> getAll(User user);
	
	public List<UploadForm> getUploads(User user, Calendar init, Calendar end);
	
}
