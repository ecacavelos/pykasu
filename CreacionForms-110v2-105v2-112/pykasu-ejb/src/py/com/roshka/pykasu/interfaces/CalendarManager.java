package py.com.roshka.pykasu.interfaces;

import java.util.Date;

import py.com.roshka.pykasu.exceptions.CalendarException;

public interface CalendarManager {
	public Boolean isHoliday(Date date);
	public Date getNextAvailable(Date date) throws CalendarException;
	public Date getSuggestedPaymentDate(Date date) throws CalendarException;
	public Date getSuggestedForPaySlip(Date date) throws CalendarException;	
	
}
