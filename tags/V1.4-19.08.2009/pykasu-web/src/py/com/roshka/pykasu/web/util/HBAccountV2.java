package py.com.roshka.pykasu.web.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

import py.com.roshka.pykasu.exceptions.HBGenericException;



public class HBAccountV2 {
	
	public static enum HBAccountV2Type {SAVING_ACCOUNT, CHECKING_ACCOUNT}
	
	private String number;
	private HBAccountV2Type type;  
	private Double availableAmount = 0.0;
	private Double toConfirmAmount = 0.0;
	private Double overAmount = 0.0;
	private short moneyCode;
	

	public HBAccountV2(String number, HBAccountV2Type type, Double availableAmount, Double toConfirmAmount, Double overAmount, short moneyCode) {
		super();
		this.number = number;
		this.type = type;
		this.availableAmount = availableAmount;
		this.toConfirmAmount = toConfirmAmount;
		this.overAmount = overAmount;
		this.moneyCode = moneyCode;
	}

	public HBAccountV2(String number, String type, Double availableAmount, Double toConfirmAmount, Double overAmount, short moneyCode)
	throws HBGenericException{
		
		HBAccountV2Type hbaType = null;
		
		if(type == null ){
			throw new HBGenericException("type is null");
		}
		if(type.trim().equalsIgnoreCase("Cuenta Corriente")){
			hbaType = HBAccountV2Type.CHECKING_ACCOUNT;
		}else if(type.trim().equalsIgnoreCase("Ahorro a la Vista")){
			hbaType = HBAccountV2Type.SAVING_ACCOUNT;
		}
		
		if(hbaType == null){
			throw new HBGenericException("type :" + type + " no es reconocido");
		}
		
		this.number = number;
		this.type = hbaType;
		this.availableAmount = availableAmount;
		this.toConfirmAmount = toConfirmAmount;
		this.overAmount = overAmount;
		this.moneyCode = moneyCode;
	}

	public String getAccountType(){
		if(type == HBAccountV2Type.CHECKING_ACCOUNT){
			return "Cuenta Corriente";
		}else if(type == HBAccountV2Type.SAVING_ACCOUNT){
			return "Ahorro a la Vista";
		}else return "";
	}
	
	public Double getAvailableAmount() {
		if(availableAmount == null)
			return 0.0;
		return availableAmount;
	}


	public void setAvailableAmount(Double availableAmount) {
		this.availableAmount = availableAmount;
	}


	public String getNumber() {
		return number;
	}




	public void setNumber(String number) {
		this.number = number;
	}




	public Double getOverAmount() {
		if(overAmount == null)
			return 0.0;
		
		return overAmount;
	}




	public void setOverAmount(Double overAmount) {
		this.overAmount = overAmount;
	}




	public Double getToConfirmAmount() {
		return toConfirmAmount;
	}




	public void setToConfirmAmount(Double toConfirmAmount) {
		this.toConfirmAmount = toConfirmAmount;
	}




	public HBAccountV2Type getType() {
		return type;
	}




	public void setType(HBAccountV2Type type) {
		this.type = type;
	}


	public short getMoneyCode() {
		return moneyCode;
	}

	public void setMoneyCode(short moneyCode) {
		this.moneyCode = moneyCode;
	}

	public String getGeneralDescription(){
	  	DecimalFormatSymbols dfs = new DecimalFormatSymbols();
		dfs.setGroupingSeparator('.');
		dfs.setDecimalSeparator(',');
		DecimalFormat df = new DecimalFormat("###,###.##",dfs);
		String r = null;
		try{
			r = "Cuenta: " + number + " - Saldo: " +  df.format(availableAmount); 
		}catch (IllegalArgumentException e){
			r = "Cuenta: " + number + " - Saldo: -- Error al conseguir el saldo --" ;
		}
		return r;
	}

	public Double getTotalAvailableAmount(){
		return (getAvailableAmount().doubleValue() + getOverAmount().doubleValue());
	}


	public static void main(String[] args) {
	  	DecimalFormatSymbols dfs = new DecimalFormatSymbols();
		dfs.setGroupingSeparator('.');
		dfs.setDecimalSeparator(',');
		DecimalFormat df = new DecimalFormat("###,###.##",dfs);
		System.out.println(df.format(123456789.0));
	
		dfs.setDecimalSeparator(',');
		DecimalFormat df2 = new DecimalFormat("000000000000000");
		System.out.println(df2.format(1799204));
	
	
	
	}
}