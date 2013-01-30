package py.com.roshka.pykasu.persistence.forms;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import py.com.roshka.pykasu.exceptions.FormStatusTransitionException;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;


@Entity (name = "Form800")
@Table (name = "form_800")
public class Form800 extends TaxForm {
	
	private double R1_IA_C1;
	private double R1_IB_C2;
	private double R1_IC_C2;
	private double R1_ID_C2;
	
	private double R2_IA_C2;
	private double R2_IB_C1;
	private double R2_IC_C1;
	private double R2_ID_C1;

	private double R3_IA_C2;
	private double R3_IB_C1;
	private double R3_IC_C1;
	private double R3_ID_C1;
	private double R3_IE_C1;
	private double R3_IF_C1;
	private double R3_IG_C2;
	private double R3_IH_C1;
	private double R3_IH_C2;	
	private double R3_II_C1;
	private double R3_IJ_C2;
	private double R3_IK_C2;
	private double R3_IL_C2;
	private double R3_IM_C2;
	
	private double R4_IA_C2;
	private double R4_IB_C1;
	private double R4_IC_C1;
	private double R4_ID_C1;
	private double R4_IE_C1;
	private double R4_IF_C2;
	private double R4_IG_C1;	
	private double R4_IG_C2;
	private double R4_IH_C1;
	private double R4_II_C2;
	private double R4_IJ_C2;
	private double R4_IK_C2;
	private double R4_IL_C2;

	public Form800(User userCreator){
		super(userCreator);
	}	
	
	protected Form800(){
	}

	public double getR1_IA_C1() {
		return R1_IA_C1;
	}
	public double getR1_IB_C2() {
		return R1_IB_C2;
	}
	public double getR1_IC_C2() {
		return R1_IC_C2;
	}
	public double getR1_ID_C2() {
		return R1_ID_C2;
	}
	public double getR2_IA_C2() {
		return R2_IA_C2;
	}
	public double getR2_IB_C1() {
		return R2_IB_C1;
	}
	public double getR2_IC_C1() {
		return R2_IC_C1;
	}
	public double getR2_ID_C1() {
		return R2_ID_C1;
	}
	public double getR3_IA_C2() {
		return R3_IA_C2;
	}
	public double getR3_IB_C1() {
		return R3_IB_C1;
	}
	public double getR3_IC_C1() {
		return R3_IC_C1;
	}
	public double getR3_ID_C1() {
		return R3_ID_C1;
	}
	public double getR3_IE_C1() {
		return R3_IE_C1;
	}
	public double getR3_IF_C1() {
		return R3_IF_C1;
	}
	public double getR3_IG_C2() {
		return R3_IG_C2;
	}
	public double getR3_IH_C1() {
		return R3_IH_C1;
	}
	public double getR3_IH_C2() {
		return R3_IH_C2;
	}
	public double getR3_II_C1() {
		return R3_II_C1;
	}
	public double getR3_IJ_C2() {
		return R3_IJ_C2;
	}
	public double getR3_IK_C2() {
		return R3_IK_C2;
	}
	public double getR3_IL_C2() {
		return R3_IL_C2;
	}
	public double getR3_IM_C2() {
		return R3_IM_C2;
	}
	public double getR4_IA_C2() {
		return R4_IA_C2;
	}
	public double getR4_IB_C1() {
		return R4_IB_C1;
	}
	public double getR4_IC_C1() {
		return R4_IC_C1;
	}
	public double getR4_ID_C1() {
		return R4_ID_C1;
	}
	public double getR4_IE_C1() {
		return R4_IE_C1;
	}
	public double getR4_IF_C2() {
		return R4_IF_C2;
	}
	public double getR4_IG_C1() {
		return R4_IG_C1;
	}
	public double getR4_IG_C2() {
		return R4_IG_C2;
	}
	public double getR4_IH_C1() {
		return R4_IH_C1;
	}
	public double getR4_II_C2() {
		return R4_II_C2;
	}
	public double getR4_IJ_C2() {
		return R4_IJ_C2;
	}
	public double getR4_IK_C2() {
		return R4_IK_C2;
	}
	public double getR4_IL_C2() {
		return R4_IL_C2;
	}
	public void setR1_IA_C1(double r1_ia_c1) {
		R1_IA_C1 = r1_ia_c1;
	}
	public void setR1_IB_C2(double r1_ib_c2) {
		R1_IB_C2 = r1_ib_c2;
	}
	public void setR1_IC_C2(double r1_ic_c2) {
		R1_IC_C2 = r1_ic_c2;
	}
	public void setR1_ID_C2(double r1_id_c2) {
		R1_ID_C2 = r1_id_c2;
	}
	public void setR2_IA_C2(double r2_ia_c2) {
		R2_IA_C2 = r2_ia_c2;
	}
	public void setR2_IB_C1(double r2_ib_c1) {
		R2_IB_C1 = r2_ib_c1;
	}
	public void setR2_IC_C1(double r2_ic_c1) {
		R2_IC_C1 = r2_ic_c1;
	}
	public void setR2_ID_C1(double r2_id_c1) {
		R2_ID_C1 = r2_id_c1;
	}
	public void setR3_IA_C2(double r3_ia_c2) {
		R3_IA_C2 = r3_ia_c2;
	}
	public void setR3_IB_C1(double r3_ib_c1) {
		R3_IB_C1 = r3_ib_c1;
	}
	public void setR3_IC_C1(double r3_ic_c1) {
		R3_IC_C1 = r3_ic_c1;
	}
	public void setR3_ID_C1(double r3_id_c1) {
		R3_ID_C1 = r3_id_c1;
	}
	public void setR3_IE_C1(double r3_ie_c1) {
		R3_IE_C1 = r3_ie_c1;
	}
	public void setR3_IF_C1(double r3_if_c1) {
		R3_IF_C1 = r3_if_c1;
	}
	public void setR3_IG_C2(double r3_ig_c2) {
		R3_IG_C2 = r3_ig_c2;
	}
	public void setR3_IH_C1(double r3_ih_c1) {
		R3_IH_C1 = r3_ih_c1;
	}
	public void setR3_IH_C2(double r3_ih_c2) {
		R3_IH_C2 = r3_ih_c2;
	}
	public void setR3_II_C1(double r3_ii_c1) {
		R3_II_C1 = r3_ii_c1;
	}
	public void setR3_IJ_C2(double r3_ij_c2) {
		R3_IJ_C2 = r3_ij_c2;
	}
	public void setR3_IK_C2(double r3_ik_c2) {
		R3_IK_C2 = r3_ik_c2;
	}
	public void setR3_IL_C2(double r3_il_c2) {
		R3_IL_C2 = r3_il_c2;
	}
	public void setR3_IM_C2(double r3_im_c2) {
		R3_IM_C2 = r3_im_c2;
	}
	public void setR4_IA_C2(double r4_ia_c2) {
		R4_IA_C2 = r4_ia_c2;
	}
	public void setR4_IB_C1(double r4_ib_c1) {
		R4_IB_C1 = r4_ib_c1;
	}
	public void setR4_IC_C1(double r4_ic_c1) {
		R4_IC_C1 = r4_ic_c1;
	}
	public void setR4_ID_C1(double r4_id_c1) {
		R4_ID_C1 = r4_id_c1;
	}
	public void setR4_IE_C1(double r4_ie_c1) {
		R4_IE_C1 = r4_ie_c1;
	}
	public void setR4_IF_C2(double r4_if_c2) {
		R4_IF_C2 = r4_if_c2;
	}
	public void setR4_IG_C1(double r4_ig_c1) {
		R4_IG_C1 = r4_ig_c1;
	}
	public void setR4_IG_C2(double r4_ig_c2) {
		R4_IG_C2 = r4_ig_c2;
	}
	public void setR4_IH_C1(double r4_ih_c1) {
		R4_IH_C1 = r4_ih_c1;
	}
	public void setR4_II_C2(double r4_ii_c2) {
		R4_II_C2 = r4_ii_c2;
	}
	public void setR4_IJ_C2(double r4_ij_c2) {
		R4_IJ_C2 = r4_ij_c2;
	}
	public void setR4_IK_C2(double r4_ik_c2) {
		R4_IK_C2 = r4_ik_c2;
	}
	public void setR4_IL_C2(double r4_il_c2) {
		R4_IL_C2 = r4_il_c2;
	}

	
	
}
