package py.com.roshka.pykasu.persistence.forms;

import javax.persistence.Entity;
import javax.persistence.Table;
import py.com.roshka.pykasu.persistence.users.User;

@Entity (name = "Form122")
@Table (name = "form_122")
public class Form122 extends TaxForm {

	private Double c10;
	private Double c11;
	private Double c12;
	private Double c13;
	private Double c14;
	private Double c15;
	private Double c16;
	private Double c17;
	private Double c18;
	private Double c19;
	private Double c20;
	private Double c21;
	private Double c22;
	private Double c23;
	private Double c24;

	protected Form122(){}

	public Form122(User userCreator){
		super(userCreator);
	}

	public Double getC10() {
		return c10;
	}

	public void setC10(Double c10) {
		this.c10 = c10;
	}

	public Double getC11() {
		return c11;
	}

	public void setC11(Double c11) {
		this.c11 = c11;
	}

	public Double getC12() {
		return c12;
	}

	public void setC12(Double c12) {
		this.c12 = c12;
	}

	public Double getC13() {
		return c13;
	}

	public void setC13(Double c13) {
		this.c13 = c13;
	}

	public Double getC14() {
		return c14;
	}

	public void setC14(Double c14) {
		this.c14 = c14;
	}

	public Double getC15() {
		return c15;
	}

	public void setC15(Double c15) {
		this.c15 = c15;
	}

	public Double getC16() {
		return c16;
	}

	public void setC16(Double c16) {
		this.c16 = c16;
	}

	public Double getC17() {
		return c17;
	}

	public void setC17(Double c17) {
		this.c17 = c17;
	}

	public Double getC18() {
		return c18;
	}

	public void setC18(Double c18) {
		this.c18 = c18;
	}

	public Double getC19() {
		return c19;
	}

	public void setC19(Double c19) {
		this.c19 = c19;
	}

	public Double getC20() {
		return c20;
	}

	public void setC20(Double c20) {
		this.c20 = c20;
	}

	public Double getC21() {
		return c21;
	}

	public void setC21(Double c21) {
		this.c21 = c21;
	}

	public Double getC22() {
		return c22;
	}

	public void setC22(Double c22) {
		this.c22 = c22;
	}

	public Double getC23() {
		return c23;
	}

	public void setC23(Double c23) {
		this.c23 = c23;
	}

	public Double getC24() {
		return c24;
	}

	public void setC24(Double c24) {
		this.c24 = c24;
	}

	
}
