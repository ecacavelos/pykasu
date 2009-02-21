package py.com.roshka.pykasu.ejb;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.EJB;
import javax.annotation.Resource;
import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.AddFormException;
import py.com.roshka.pykasu.exceptions.FillFormException;
import py.com.roshka.pykasu.exceptions.FiscalInfoException;
import py.com.roshka.pykasu.exceptions.FormDeleteException;
import py.com.roshka.pykasu.exceptions.FormNotFoundException;
import py.com.roshka.pykasu.exceptions.FormSaveException;
import py.com.roshka.pykasu.exceptions.InfoPrintException;
import py.com.roshka.pykasu.exceptions.UpdateFormException;
import py.com.roshka.pykasu.interfaces.ClientDataInterface;
import py.com.roshka.pykasu.interfaces.UserManager;

import py.com.roshka.pykasu.persistence.client.ClientData;

import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.SimpleForm;
import py.com.roshka.pykasu.ui.util.ResultItem;
import py.com.roshka.pykasu.xml.Parser;


@Stateless
@Local ({ClientDataInterface.class})
@LocalBinding (jndiBinding="pykasu/ClientDataEJB/local")
@Remote ({ClientDataInterface.class})
@RemoteBinding (jndiBinding="pykasu/ClientDataEJB/remote")

public class ClientDataEJB implements ClientDataInterface{

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(ClientDataEJB.class);

	
	public static final String CLIENT_DATA_XML = "client_data.xml"; 
	
	@PersistenceContext(unitName = "pykasu")
	protected EntityManager em;
	
	@EJB
	protected UserManager userManager;
	
	@Resource
	protected SessionContext sc;
	
	public String addForm(Form form) throws AddFormException {
    	User user = null;
    	try {
    		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
    	} catch (Exception e1) {
    		logger.error("Imposible to retrieve principal user.", e1);
			throw new AddFormException(e1.getClass() + " --> " + e1.getMessage());
    	}			

		ClientData cd = new ClientData(user); 
		try {
        	logger.debug("Finding principal user");
        	
			
			cd.fillForm(form);
			em.persist(cd);
			
			return cd.getId().toString();
			
		} catch (FillFormException e) {
			e.printStackTrace();
			logger.error("Error to add Client Data ",e);
			throw new AddFormException(e.getMessage());
		}
	}

	public void deteleForm(String ruc) throws FormDeleteException {
		try{
			ClientData cd = (ClientData) em.createQuery("select cd from ClientData cd where ruc like :ruc")
				.setParameter("ruc",ruc)
				.getSingleResult();
			em.remove(cd);
		}catch(NoResultException e){
			throw new FormDeleteException(e.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	public List<ResultItem> getAll() {
		
    	User user = null;
    	try {
    		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
    	
    		List list = em.createQuery("select cd from ClientData cd where cd.businessCompany = :bc")
					  .setParameter("bc",user.getBusinessCompany())
					  .getResultList();
    		
    		ClientData cd;
    		
    		List resultList = new ArrayList();
    		ResultItem ri = null;
    		
    		Iterator it = list.iterator();
    		while(it.hasNext()){
    			cd = (ClientData) it.next();
    			ri = new ResultItem();
    			ri.setId(cd.getRuc());
    			ri.setDescription(cd.getRuc() + " Empresa:" + cd.getBusinessName() +  " - Telefono:" + cd.getPhoneNumber1() + " - Correo:" + cd.getEmail());
    			ri.setDeleteable(true);
    			ri.setEditable(true);
    			ri.setShowDetails(true);
    			
    			resultList.add(ri);
    		}

    		return resultList;

    	} catch (Exception e1) {
    		logger.error("Imposible to retrieve principal user.", e1);
    		return null;    		
    	}	
		
	}

	public Form getEmptyForm() {
		return getEmptyFormFromXml();
	}

	public Map getFiscalInfo(Map params) throws FiscalInfoException {
		return null;
	}

	public Form getForm(String ruc) throws FormNotFoundException {
		try{
			ClientData cd = (ClientData) em.createQuery("select cd from ClientData cd where ruc like :ruc")
				.setParameter("ruc",ruc)
				.getSingleResult();
			
			Form form = null;
			form = cd.loadForm(this);
			return form;
			
		}catch(NoResultException e){
			throw new FormNotFoundException(e.getMessage());
		}catch(Exception e){
			throw new FormNotFoundException(e.getMessage());			
		}
	}

	@Deprecated
	public void saveForm(Form form) throws FormSaveException {

		
	}

	public void updateForm(Form form) throws UpdateFormException {	
		try {
	    	User user = null;
	    	try {
	    		user = userManager.findUserByName(sc.getCallerPrincipal().getName());
	    	} catch (Exception e1) {
	    		logger.error("Imposible to retrieve principal user.", e1);
				throw new UpdateFormException(e1.getClass() + " --> " + e1.getMessage());
	    	}			

			ClientData cd = new ClientData(user); 			

			cd.fillForm(form);
			em.persist(cd);
		} catch (FillFormException e) {
			e.printStackTrace();
			logger.error(e);
			throw new UpdateFormException(e.getMessage());
		}

	}

	protected Form getEmptyFormFromXml(){
    	Form form = null;
		ClassLoader cl = getClass().getClassLoader();
		logger.debug("-----> Parsing the xml to retrive a empty form 800");
		form = Parser.parseForm(cl.getResourceAsStream(CLIENT_DATA_XML));
		logger.debug("-----> Finnish to parsing");	
    	return form;    
	}

	
	public String uploadForm(SimpleForm form) throws AddFormException {
		return null;
		// ----------- >>>>>>  DO NOTHING  <<<<<< ---------------		
	}

	public String getPrintableInfo() throws InfoPrintException {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ResultItem> getForms(Calendar init, Calendar end) {
		// TODO Auto-generated method stub
		return null;
	}	


}
