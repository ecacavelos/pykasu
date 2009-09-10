package py.com.roshka.pykasu.interfaces;

import java.util.List;

import py.com.roshka.pykasu.exceptions.AddFormException;
import py.com.roshka.pykasu.exceptions.UpdateFormException;
import py.com.roshka.pykasu.persistence.payment.PaymentForm;
import py.com.roshka.pykasu.persistence.users.User;

public interface PaymentFormInterface  {
	
	
	final public static String PAYMENT_FORM_BEGIN =  "begin";
	final public static String PAYMENT_FORM_CONSULTING =  "consulting";	
	final public static String PAYMENT_FORM_WITHOUT_MONEY =  "wo_money";
	final public static String PAYMENT_FORM_FINNISH =  "finnish";	

	
	public void savePayment(PaymentForm pf, User user)
	   throws AddFormException;
	
	public void changeStatus(Integer paymentId, String status) throws UpdateFormException ;
	
	public List getAll(User user);
	
	public PaymentForm getPaymentForm(Integer id, User user);
}
