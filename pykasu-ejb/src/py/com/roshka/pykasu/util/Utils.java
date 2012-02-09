package py.com.roshka.pykasu.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Properties;

public class Utils {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Utils.class);
	
	static final long ONE_HOUR = 60 * 60 * 1000L;

	public static boolean isRaffleTime(java.util.Date date){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return isRaffleTime(cal);
	}
	
	public static boolean isRaffleTime(Calendar cal){
		logger.info("isRaffleTime -- INIT --" );
		String raffleBegin = "01/01/1970"; 
		String raffleEnd = "01/01/1970"; 
		
		logger.info("isRaffleTime to: " + cal.getTime());
		
		ClassLoader cl = Utils.class.getClassLoader();
		logger.info("isRaffleTime -- INIT -- ClassLoader: is null? " + (cl == null));
		Properties properties = new Properties();
		try {
			logger.info("isRaffleTime -- INIT -- Properties is null? "+ (properties == null) );
			//properties.load(cl.getResourceAsStream(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES));
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());;

			logger.info("isRaffleTime -- INIT --" );
			raffleBegin = properties.getProperty(py.com.roshka.pykasu.util.Globals.RAFFLE_BEGIN,"01/01/1970");
			logger.info("isRaffleTime - begin: " + raffleBegin);
			raffleEnd = properties.getProperty(py.com.roshka.pykasu.util.Globals.RAFFLE_END,"01/01/1970");
			logger.info("isRaffleTime - end: " + raffleEnd);
		} catch (IOException e) {
			logger.warn("Error al recuperar el archivo de propiedades para obtener el valor de " + py.com.roshka.pykasu.util.Globals.RAFFLE_BEGIN + " o " + py.com.roshka.pykasu.util.Globals.RAFFLE_END);		
		};
		
		Calendar begin = Calendar.getInstance();
		Calendar end   = Calendar.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

		try {
			begin.setTime(sdf.parse(raffleBegin));
			end.setTime(sdf.parse(raffleEnd));

		} catch (ParseException e) {		
			e.printStackTrace();
			logger.error("Error al interpretar las fechas del sorteo: ", e);
			return false;
		}

		
		return cal.after(begin) && cal.before(end);
	}
	
	
	
	public static boolean afterCloseHour(){
		return afterCloseHour(new Date(System.currentTimeMillis()));
	}
	
	public static boolean afterCloseHour(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return afterCloseHour(c);
	}
	
	public static boolean afterCloseHour(Calendar cal){
		logger.info("afterCloseHour -- INIT --" );
		String closeHour = "18:00"; //horario por omisión
		logger.info("afterCloseHour -- INIT --" );
		ClassLoader cl = Utils.class.getClassLoader();
		logger.info("afterCloseHour -- INIT -- ClassLoader: is null? " + (cl == null));
		Properties properties = new Properties();
		try {
			logger.info("afterCloseHour -- INIT -- Properties is null? "+ (properties == null) );
			//properties.load(cl.getResourceAsStream(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES));
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			properties.load(url.openStream());;
			
			logger.info("afterCloseHour -- INIT --" );
			closeHour = properties.getProperty(py.com.roshka.pykasu.util.Globals.CLOSE_HOUR,"18:00");
			logger.info("afterCloseHour " + closeHour);
		} catch (IOException e) {
			logger.warn("Error al recuperar el archivo de propiedades para obtener el valor de " + py.com.roshka.pykasu.util.Globals.CLOSE_HOUR + ". se utilizara el valor por omision: " + closeHour);		
		};
		
		String[] hm = closeHour.trim().split(":");

		Calendar c = Calendar.getInstance();
		c.setTime(new Date(System.currentTimeMillis()));

		if(hm[0]!=null){
			logger.info("afterCloseHour " + closeHour + " HOURS= " + hm[0]);
			c.set(Calendar.HOUR, Integer.parseInt(hm[0].trim()));			
		}

		if(hm[1]!=null){
			logger.info("afterCloseHour " + closeHour + " MIN= " + hm[1]);
			c.set(Calendar.MINUTE, Integer.parseInt(hm[1].trim()));			
		}
		
		return cal.after(c);
	}
	
	public static Integer DateDiff(Date dateFrom, Date dateTo){
		
//		Calendar cFrom = Calendar.getInstance();
//		cFrom.setTime(dateFrom);
//		cFrom.set(Calendar.HOUR,0);
//		cFrom.set(Calendar.MINUTE,0);
//		cFrom.set(Calendar.SECOND,0);
//
//		
//		Calendar cTo = Calendar.getInstance();
//		cTo.setTime(dateTo);
//		cTo.set(Calendar.HOUR,0);
//		cTo.set(Calendar.MINUTE,0);
//		cTo.set(Calendar.SECOND,0);
//		long diff = cTo.getTime().getTime() - cFrom.getTime().getTime();
		
		
		dateTo.setTime(dateTo.getTime()+ 12 *ONE_HOUR);
		long diff = dateTo.getTime() - dateFrom.getTime();

		
//		dateTo.setTime(dateTo.getTime()/(24*ONE_HOUR));
//		dateFrom.setTime(dateFrom.getTime()/(24*ONE_HOUR));
//		long diff = dateTo.getTime() - dateFrom.getTime();
		
		logger.info("Difference days between " + dateFrom + " and " + dateTo);

		Double d = new Double(((diff + ONE_HOUR) / (24 * ONE_HOUR)));
		//d = Math.ceil(d);
		//return new Integer(d.intValue()+1); // el mas 1 le puso el ninho rey
		logger.info("Amount difference days: " + d.intValue());
		return new Integer(d.intValue()); 
	}	
	
	public static Integer MonthDiff(Date dateFrom, Date dateTo){
		//TODO: cambiar esta funcion. Si tiene valores decimales, es porque tiene que tener un mes de más Ej.: 3,0333 -> debería ser 4 meses
		logger.info("Difference month between " + dateFrom + " and " + dateTo);

		GregorianCalendar gcFrom = new GregorianCalendar();
		gcFrom.setTime(dateFrom);
		
		GregorianCalendar gcTo = new GregorianCalendar();
		gcTo.setTime(dateTo);
		
		
		int i = 0;
		while(gcFrom.compareTo(gcTo) < 0 && i < 100){
			gcFrom.add(Calendar.MONTH, 1);
			i ++;
		}
		return new Integer(i);
	}
	public static Integer FiscalMonthDiff(Date dateFrom, Date dateTo){
		logger.info("Difference month between " + dateFrom + " and " + dateTo);

		Integer amountDays = DateDiff(dateFrom, dateTo);
		Double d = new Double((double)amountDays/30);
		//System.out.println(amountDays + " - div: " + amountDays/30 + " - d= " + d);
		logger.info("Goign to comparate " + d.doubleValue() + " with " + d.intValue());
		if(d.doubleValue() > d.intValue()){
			logger.info("Returning " + (d.intValue() + 1));
			return new Integer(d.intValue() + 1);
		}else{
			logger.info("Returning " + d.intValue());
			return new Integer(d.intValue());
		}
	}	
	
	public static void main(String[] args) {

//		Calendar c = Calendar.getInstance();
//		c.set(Calendar.YEAR,2007);
//		c.set(Calendar.MONTH,Calendar.OCTOBER);
//		c.set(Calendar.DATE,11);
//		c.set(Calendar.HOUR,12);
//		c.set(Calendar.MINUTE,0);
//		c.set(Calendar.SECOND,0);

//		Date date = new Date(c.getTimeInMillis()) ;

//		Calendar c2 = Calendar.getInstance();
//		c2.set(Calendar.YEAR,2007);
//		c2.set(Calendar.MONTH,Calendar.NOVEMBER);
//		c2.set(Calendar.DATE,16);
//		c2.set(Calendar.HOUR,12);
//		c2.set(Calendar.MINUTE,0);
//		c2.set(Calendar.SECOND,0);
//		
//		Date date2 = new Date(c2.getTimeInMillis());

		Date date = new Date();
		date.setDate(2);
		date.setMonth(1-1);
		date.setYear(2008);
		System.out.println(date);

		Date date2 = new Date();
		date2.setDate(01);
		date2.setMonth(12-1);
		date2.setYear(2007);
		System.out.println(date2);

		System.out.println("Diferencia de meses: " + MonthDiff(date, date2));
		System.out.println("Diferencia de meses fiscales: " + FiscalMonthDiff(date, date2));

		System.out.println("Diferencia de dias: " + DateDiff(date, date2));

		
		Calendar c = GregorianCalendar.getInstance();
		c.set(2007,12-1,15);
		c.roll(Calendar.MONTH,1);
		System.out.println(c.getTime());
		c.set(2007,12-1,15);
		c.add(Calendar.MONTH,1);
		System.out.println(c.getTime());

	}
	
    private static String convertToHex(byte[] data) {
        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < data.length; i++) {
        	int halfbyte = (data[i] >>> 4) & 0x0F;
        	int two_halfs = 0;
        	do {
	            if ((0 <= halfbyte) && (halfbyte <= 9))
	                buf.append((char) ('0' + halfbyte));
	            else
	            	buf.append((char) ('a' + (halfbyte - 10)));
	            halfbyte = data[i] & 0x0F;
        	} while(two_halfs++ < 1);
        }
        return buf.toString();
    }

	
    public static String SHA1(String text) 
	    throws NoSuchAlgorithmException, UnsupportedEncodingException  {
		MessageDigest md;
		md = MessageDigest.getInstance("SHA-1");
		byte[] sha1hash = new byte[40];
		md.update(text.getBytes("iso-8859-1"), 0, text.length());
		sha1hash = md.digest();
		return convertToHex(sha1hash);
    }

}
