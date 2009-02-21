package py.com.roshka.pykasu.interfaces;

import java.util.List;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Stateless;

import org.jboss.annotation.ejb.LocalBinding;
import org.jboss.annotation.ejb.RemoteBinding;

import py.com.roshka.pykasu.exceptions.GetTaxException;
import py.com.roshka.pykasu.persistence.fiscal.Fee;
import py.com.roshka.pykasu.persistence.fiscal.Taxes;


public interface TaxManager {
	public Taxes getTax(Integer taxId)
		throws GetTaxException;
	
	public List<Taxes> getAllTaxes()
		throws GetTaxException;
	
	public Fee getFee(Integer form, Integer field, Integer month, Integer year)
		throws GetTaxException;
	
}
