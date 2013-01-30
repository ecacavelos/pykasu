package py.com.roshka.pykasu.web.util;



public class ExpiringDate {
	
	private Integer id;
	private String date; 
	private String charFrom;  
	private String charTo;
	private Integer formType;
	
	public ExpiringDate(){
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getCharFrom() {
		return charFrom;
	}
	public void setCharFrom(String charFrom) {
		this.charFrom = charFrom;
	}
	public String getCharTo() {
		return charTo;
	}
	public void setCharTo(String charTo) {
		this.charTo = charTo;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getFormType() {
		return formType;
	}
	public void setFormType(Integer formType) {
		this.formType = formType;
	}
	
	public String toString(){
		return "ID:"+ id +" Formulario: " + formType + " - Letras [inicial]: " + charFrom + " [final]:" + charTo + " - Venc.:" + date;
	}
	
}
