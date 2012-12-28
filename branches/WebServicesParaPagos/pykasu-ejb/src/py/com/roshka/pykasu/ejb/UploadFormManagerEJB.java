package py.com.roshka.pykasu.ejb;

import java.util.Calendar;
import java.util.List;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.interfaces.UploadFormManager;
import py.com.roshka.pykasu.persistence.uploadForm.UploadForm;
import py.com.roshka.pykasu.persistence.users.User;

@Stateless
@Local ({UploadFormManager.class})
@LocalBinding (jndiBinding="pykasu/UploadFormManager/local")
@Remote ({UploadFormManager.class})
@RemoteBinding (jndiBinding="pykasu/UploadFormManager/remote")
public class UploadFormManagerEJB implements py.com.roshka.pykasu.interfaces.UploadFormManager{
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(UploadFormManagerEJB.class);
	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	

	@SuppressWarnings("unchecked")
	public List<UploadForm> getAll(User user) {

		List<UploadForm> uploadForms = 
			em.createQuery("select uf from UploadForm uf where bcompanyId = :bcompanyId order by uploadAt desc")
			.setParameter("bcompanyId", user.getBusinessCompany().getId())
			.getResultList();

		return uploadForms;
	}

	@SuppressWarnings("unchecked")
	public List<UploadForm> getUploads(User user, Calendar init, Calendar end) {
		logger.info("Recuperando Uploads desde: " + init.getTime() + " ~ hasta: " + end.getTime());
		List<UploadForm> uploadForms = 
			em.createQuery("select uf from UploadForm uf where bcompanyId = :bcompanyId and uploadAt between :init and :end order by uploadAt desc")
			.setParameter("bcompanyId", user.getBusinessCompany().getId())
			.setParameter("init", init.getTime())
			.setParameter("end", end.getTime())
			.getResultList();

		return uploadForms;
	}
	
	
	
}
