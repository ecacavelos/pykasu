package py.com.roshka.pykasu.interfaces;

import py.com.roshka.pykasu.exceptions.GetContributorInfoException;
import py.com.roshka.pykasu.persistence.ruc.Ruc;

public interface Contributor {
	public Ruc getInfo(String ruc) 
	   throws GetContributorInfoException;
}
