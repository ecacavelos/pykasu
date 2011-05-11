package py.com.roshka.pykasu.persistence.forms;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import py.com.roshka.pykasu.persistence.users.User;

@Entity (name = "Form90")
@Table (name = "form_90")
public class Form90 extends TaxForm {

	private Double c15;
	private Double c16;
	private Double c17;
	private Double c18;
	private Date   c19;
	private Double c20;
	private Date   c21;
	private Double c22;
	private Double c23;
	private Double c24;
	private Double c25;
	private Double c26;
	private Double c27;
	private Double c28;
	private Date   c29;
	private Double c30;
	private Double c31;
	private Double c32;
	private Date   c33;
	private Double c34;
	private Double c35;
	private Double c36;
	private Double c37;
	private Double c38;
	private Double c39;
	private Double c40;
	private Double c41;
	private Double c42;
	private Double c43;
	private Integer fiscalPeriodDay;
	private String liqMotive;
	
	protected Form90(){}

	public Form90(User userCreator){
		super(userCreator);
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


	public Double getC20() {
		return c20;
	}

	public void setC20(Double c20) {
		this.c20 = c20;
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

	public Double getC25() {
		return c25;
	}

	public void setC25(Double c25) {
		this.c25 = c25;
	}

	public Double getC26() {
		return c26;
	}

	public void setC26(Double c26) {
		this.c26 = c26;
	}

	public Double getC27() {
		return c27;
	}

	public void setC27(Double c27) {
		this.c27 = c27;
	}

	public Double getC28() {
		return c28;
	}

	public void setC28(Double c28) {
		this.c28 = c28;
	}


	public Double getC30() {
		return c30;
	}

	public void setC30(Double c30) {
		this.c30 = c30;
	}

	public Double getC31() {
		return c31;
	}

	public void setC31(Double c31) {
		this.c31 = c31;
	}

	public Double getC32() {
		return c32;
	}

	public void setC32(Double c32) {
		this.c32 = c32;
	}


	public Double getC34() {
		return c34;
	}

	public void setC34(Double c34) {
		this.c34 = c34;
	}

	public Double getC35() {
		return c35;
	}

	public void setC35(Double c35) {
		this.c35 = c35;
	}

	public Double getC36() {
		return c36;
	}

	public void setC36(Double c36) {
		this.c36 = c36;
	}

	public Double getC37() {
		return c37;
	}

	public void setC37(Double c37) {
		this.c37 = c37;
	}

	public Double getC38() {
		return c38;
	}

	public void setC38(Double c38) {
		this.c38 = c38;
	}

	public Double getC39() {
		return c39;
	}

	public void setC39(Double c39) {
		this.c39 = c39;
	}

	public Double getC40() {
		return c40;
	}

	public void setC40(Double c40) {
		this.c40 = c40;
	}

	public Double getC41() {
		return c41;
	}

	public void setC41(Double c41) {
		this.c41 = c41;
	}

	public Double getC42() {
		return c42;
	}

	public void setC42(Double c42) {
		this.c42 = c42;
	}

	public Double getC43() {
		return c43;
	}

	public void setC43(Double c43) {
		this.c43 = c43;
	}

	public Integer getFiscalPeriodDay() {
		return fiscalPeriodDay;
	}

	public void setFiscalPeriodDay(Integer fiscalPeriodDay) {
		this.fiscalPeriodDay = fiscalPeriodDay;
	}

	@Column (name="motive")
	public String getLiqMotive() {
		return liqMotive;
	}

	public void setLiqMotive(String liqMotive) {
		this.liqMotive = liqMotive;
	}

	public Date getC19() {
		return c19;
	}

	public void setC19(Date c19) {
		this.c19 = c19;
	}

	public Date getC21() {
		return c21;
	}

	public void setC21(Date c21) {
		this.c21 = c21;
	}

	public Date getC29() {
		return c29;
	}

	public void setC29(Date c29) {
		this.c29 = c29;
	}

	public Date getC33() {
		return c33;
	}

	public void setC33(Date c33) {
		this.c33 = c33;
	}

}