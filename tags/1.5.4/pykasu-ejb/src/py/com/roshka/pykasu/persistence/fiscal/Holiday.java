package py.com.roshka.pykasu.persistence.fiscal;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.PersistenceUnit;
import javax.persistence.Table;


@Entity
@Table (name="feriados")
public class Holiday implements Serializable{

	private Date holiday;
	private String description;

	
	protected Holiday(){		
	}
	
	@Column(name="descrip")
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Id @Column(name="fecha")	
	public Date getHoliday() {
		return holiday;
	}
	
	public void setHoliday(Date holiday) {
		this.holiday = holiday;
	}
	
}
