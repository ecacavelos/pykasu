package py.com.roshka.pykasu.persistence.fiscal;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="tasas_tributos")
public class Fee {
	private Integer feeId;
	private Integer	field;
	private Integer body;
	private Integer percent;
	private String  incise;
	private Integer form;
	private Date init;
	private Date end;
	
	protected Fee(){
	}

	@Column(name ="cuerpo")
	public Integer getBody() {
		return body;
	}

	public void setBody(Integer body) {
		this.body = body;
	}

	@Column(name ="hasta")
	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	@Id
	@Column(name ="tasas_id")
	public Integer getFeeId() {
		return feeId;
	}

	public void setFeeId(Integer feeId) {
		this.feeId = feeId;
	}

	@Column(name ="campo")
	public Integer getField() {
		return field;
	}

	public void setField(Integer field) {
		this.field = field;
	}

	@Column(name ="formulario")
	public Integer getForm() {
		return form;
	}

	public void setForm(Integer form) {
		this.form = form;
	}

	@Column(name ="inciso")
	public String getIncise() {
		return incise;
	}

	public void setIncise(String incise) {
		this.incise = incise;
	}

	@Column(name ="desde")
	public Date getInit() {
		return init;
	}

	public void setInit(Date init) {
		this.init = init;
	}

	@Column(name ="porcentaje")
	public Integer getPercent() {
		return percent;
	}

	public void setPercent(Integer percent) {
		this.percent = percent;
	}
	
}
