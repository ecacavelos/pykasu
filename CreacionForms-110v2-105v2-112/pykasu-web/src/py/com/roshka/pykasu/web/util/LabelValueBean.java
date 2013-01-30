package py.com.roshka.pykasu.web.util;

public class LabelValueBean {
	private Integer label;
	private Integer value;
	
	public LabelValueBean(Integer label, Integer value){
		this.label = label;
		this.value = value;
	}

	public Integer getLabel() {
		return label;
	}

	public void setLabel(Integer label) {
		this.label = label;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}
	
	
	
}
