package py.com.roshka.pykasu.ui.form;

import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Locale;

public class SimpleForm extends Form {

	private Calendar date;
	private String ruc;
	private String dv;
	private String version;
	
	private String xmlFile;
	
	public SimpleForm(){
	}

	public void addCell(Cell cell){
		super.addCell(cell);
	}
	
	public Calendar getDate() {
		return date;
	}
	public void setDate(Calendar date) {
		this.date = date;
	}
	public String getDv() {
		return dv;
	}
	public void setDv(String dv) {
		this.dv = dv;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
	
	
	
	public String getXmlFile() {
		return xmlFile;
	}

	public void setXmlFile(String xmlFile) {
		this.xmlFile = xmlFile;
	}

	public String toString(){
		StringBuffer sb = new StringBuffer();
		sb.append("FORMULARIO: " + getId() + "\n");
		sb.append("RUC: " + getRuc() + "\n");
		sb.append("DV: " + getDv() + "\n");
		if(getDate()!=null){
			sb.append("Fecha: " + 
					getDate().get(Calendar.DAY_OF_MONTH) + "/" + 
					(getDate().get(Calendar.MONTH) + 1) + "/" +					
					getDate().get(Calendar.YEAR) + "\n");
		}
		sb.append("Version: " + getVersion() + "\n");
		sb.append("-----------------------------\n");
		NumberFormat nf =  NumberFormat.getInstance(new Locale("es","py"));
		for(Cell cell : getCells()){
			if(cell.getType() == Cell.NUMBER)
				sb.append("Celda: " + cell.getId() + " : " + nf.format(cell.getData())  +"\n");
			else
				sb.append("Celda: " + cell.getId() + " : " + cell.getData() +"\n");
				
		}
		
		return sb.toString();
	}
	
}
