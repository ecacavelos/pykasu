package py.com.roshka.pykasu.persistence.forms;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ItemSearch {
	
	public enum FieldName {FORM_TYPE, FORM_IID, STATUS, RUC, PREPRINTED_NUMBER, FISCAL_PERIOD_YEAR, FISCAL_PERIOD_MOUNTH, FIRST_LAST_NAME, CREATED_DATE, ORDER_NUMBER, ACTIVE, DV, DECLARATION_TYPE, FIRSTNAME, MIDDLE_NAME, PAYMENT_DATE, PAYMENT_MODE, RECIP_NUMBER, RECTIFICATIVE_PPN, SECOND_LAST_NAME, TOTAL_AMOUNT, CLAUSURE_TYPE, PRESENTATION_DATE, BCOMPANY_IID, USER_IID}
	
	private Object[] data;
	
	public ItemSearch(Object[] objs){
		this.data = objs;
	}
	
	public Object getValue(FieldName fieldName){
		
		if(fieldName == null)
			return null;
		
//		if(FieldName.PRESENTATION_DATE.compareTo(fieldName)==0){
//			if(data[fieldName.ordinal()] != null){				
//	        	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//				return sdf.format((Date)data[fieldName.ordinal()]);
//			}
//		}
		return data[fieldName.ordinal()];
	}
		
}
