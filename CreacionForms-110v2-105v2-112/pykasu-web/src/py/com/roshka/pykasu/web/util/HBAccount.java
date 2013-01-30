package py.com.roshka.pykasu.web.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
@Deprecated
public class HBAccount {
	private Long accountNr;
	private Double amount;
	
	public HBAccount(long accountNr, double amount){
		this.accountNr = accountNr;
		this.amount = amount;
	}
	
	public Long getAccountNr() {
		return accountNr;
	}

	public String getGeneralDescription(){
	  	DecimalFormatSymbols dfs = new DecimalFormatSymbols();
		dfs.setGroupingSeparator('.');
		dfs.setDecimalSeparator(',');
		DecimalFormat df = new DecimalFormat("###,###.##",dfs);
		String r = null;
		try{
			r = "Cuenta: " + accountNr.toString() + " - Saldo: " +  df.format(amount); 
		}catch (IllegalArgumentException e){
			r = "Cuenta: " + accountNr.toString() + " - Saldo: -- Error al conseguir el saldo --" ;
		}
		return r;
	}



	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
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