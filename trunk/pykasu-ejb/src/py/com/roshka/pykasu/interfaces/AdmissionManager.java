package py.com.roshka.pykasu.interfaces;

import java.util.List;

import py.com.roshka.pykasu.exceptions.PykasuGenericException;
import py.com.roshka.pykasu.persistence.admission.Admission;

public interface AdmissionManager {
	
	public Integer addAdmission(Admission admission) throws PykasuGenericException;
	
	public void activateAdmission(Integer admissionId) throws PykasuGenericException;
	
	public List<Admission> getAll() throws PykasuGenericException;
	
	public List<Admission> getAdmissionsByStatus(String status) throws PykasuGenericException;
	
	public Admission getAdmission(Integer admissionId) throws PykasuGenericException;
}
