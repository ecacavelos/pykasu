package py.com.roshka.pykasu.persistence.forms;


import javax.persistence.Entity;
import javax.persistence.Table;
import py.com.roshka.pykasu.persistence.users.User;

@Entity (name = "Form801")
@Table (name = "form_801")
public class Form801 extends TaxForm {

	private double R1_IA_C1;
	private double R1_IA_C2;
	private double R1_IB_C1;
	private double R1_IB_C2;
	private double R1_IC_C1;
	private double R1_IC_C2;
	private double R1_ID_C1;
	private double R1_ID_C2;
	private double R1_IE_C1;
	private double R1_IE_C2;

	private double R2_IA_C1;
	private double R2_IA_C2;
	private double R2_IB_C1;
	private double R2_IB_C2;
	private double R2_IC_C1;
	private double R2_IC_C2;
	private double R2_ID_C1;
	private double R2_ID_C2;
	private double R2_IE_C1;
	private double R2_IF_C1;
	private double R2_IG_C1;
	private double R2_IG_C2;
	
	private double R3_IA_C1;
	private double R3_IB_C1;
	private double R3_IC_C1;
	
	private double R4_IA_C1;
	private double R4_IB_C1;
	private double R4_IC_C1;
	private double R4_ID_C1;
	private double R4_IE_C1;
	private double R4_IF_C1;
	private double R4_IG_C1;
	private double R4_IH_C1;
	private double R4_II_C1;
	private double R4_IJ_C1;

	private double R5_IA_C2;
	private double R5_IB_C1;
	private double R5_IC_C1;
	private double R5_ID_C1;
	private double R5_IE_C1;
	private double R5_IF_C1;
	private double R5_IG_C2;
	private double R5_IH_C1;
	private double R5_IH_C2;	
	private double R5_II_C1;
	private double R5_IJ_C2;
	private double R5_IK_C1;
	private double R5_IL_C2;
	private double R5_IM_C2;
	private double R5_IN_C2;
	private double R5_IO_C2;
	
	private double R6_I1_C1;
	
	private double R6_IA_C2;
	private double R6_IB_C1;
	private double R6_IC_C1;
	private double R6_ID_C1;
	private double R6_IE_C1;
	private double R6_IF_C2;
	private double R6_IG_C1;
	private double R6_IG_C2;
	private double R6_IH_C1;	
	private double R6_II_C2;
	private double R6_IJ_C2;
	private double R6_IK_C2;
	private double R6_IL_C2;
	
	public Form801(User userCreator){
		super(userCreator);
	}	
	
	protected Form801(){
	}
	
	public double getR1_IA_C1() {
		return R1_IA_C1;
	}
	public double getR1_IA_C2() {
		return R1_IA_C2;
	}
	public double getR1_IB_C1() {
		return R1_IB_C1;
	}
	public double getR1_IB_C2() {
		return R1_IB_C2;
	}
	public double getR1_IC_C1() {
		return R1_IC_C1;
	}
	public double getR1_IC_C2() {
		return R1_IC_C2;
	}
	public double getR1_ID_C1() {
		return R1_ID_C1;
	}
	public double getR1_ID_C2() {
		return R1_ID_C2;
	}
	public double getR1_IE_C1() {
		return R1_IE_C1;
	}
	public double getR1_IE_C2() {
		return R1_IE_C2;
	}
	public double getR2_IA_C1() {
		return R2_IA_C1;
	}
	public double getR2_IA_C2() {
		return R2_IA_C2;
	}
	public double getR2_IB_C1() {
		return R2_IB_C1;
	}
	public double getR2_IB_C2() {
		return R2_IB_C2;
	}
	public double getR2_IC_C1() {
		return R2_IC_C1;
	}
	public double getR2_IC_C2() {
		return R2_IC_C2;
	}
	public double getR2_ID_C1() {
		return R2_ID_C1;
	}
	public double getR2_ID_C2() {
		return R2_ID_C2;
	}
	public double getR2_IE_C1() {
		return R2_IE_C1;
	}
	public double getR2_IF_C1() {
		return R2_IF_C1;
	}
	public double getR2_IG_C1() {
		return R2_IG_C1;
	}
	public double getR2_IG_C2() {
		return R2_IG_C2;
	}
	public double getR3_IA_C1() {
		return R3_IA_C1;
	}
	public double getR3_IB_C1() {
		return R3_IB_C1;
	}
	public double getR3_IC_C1() {
		return R3_IC_C1;
	}
	public double getR4_IA_C1() {
		return R4_IA_C1;
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
	public double getR4_IF_C1() {
		return R4_IF_C1;
	}
	public double getR4_IG_C1() {
		return R4_IG_C1;
	}
	public double getR4_IH_C1() {
		return R4_IH_C1;
	}
	public double getR4_II_C1() {
		return R4_II_C1;
	}
	public double getR4_IJ_C1() {
		return R4_IJ_C1;
	}
	public double getR5_IA_C2() {
		return R5_IA_C2;
	}
	public double getR5_IB_C1() {
		return R5_IB_C1;
	}
	public double getR5_IC_C1() {
		return R5_IC_C1;
	}
	public double getR5_ID_C1() {
		return R5_ID_C1;
	}
	public double getR5_IE_C1() {
		return R5_IE_C1;
	}
	public double getR5_IF_C1() {
		return R5_IF_C1;
	}
	public double getR5_IG_C2() {
		return R5_IG_C2;
	}
	public double getR5_IH_C1() {
		return R5_IH_C1;
	}
	public double getR5_IH_C2() {
		return R5_IH_C2;
	}
	public double getR5_II_C1() {
		return R5_II_C1;
	}
	public double getR5_IJ_C2() {
		return R5_IJ_C2;
	}
	public double getR5_IK_C1() {
		return R5_IK_C1;
	}
	public double getR5_IL_C2() {
		return R5_IL_C2;
	}
	public double getR5_IM_C2() {
		return R5_IM_C2;
	}
	public double getR5_IN_C2() {
		return R5_IN_C2;
	}
	public double getR5_IO_C2() {
		return R5_IO_C2;
	}
	public double getR6_I1_C1() {
		return R6_I1_C1;
	}
	public double getR6_IA_C2() {
		return R6_IA_C2;
	}
	public double getR6_IB_C1() {
		return R6_IB_C1;
	}
	public double getR6_IC_C1() {
		return R6_IC_C1;
	}
	public double getR6_ID_C1() {
		return R6_ID_C1;
	}
	public double getR6_IE_C1() {
		return R6_IE_C1;
	}
	public double getR6_IF_C2() {
		return R6_IF_C2;
	}
	public double getR6_IG_C1() {
		return R6_IG_C1;
	}
	public double getR6_IG_C2() {
		return R6_IG_C2;
	}
	public double getR6_IH_C1() {
		return R6_IH_C1;
	}
	public double getR6_II_C2() {
		return R6_II_C2;
	}
	public double getR6_IJ_C2() {
		return R6_IJ_C2;
	}
	public double getR6_IK_C2() {
		return R6_IK_C2;
	}
	public double getR6_IL_C2() {
		return R6_IL_C2;
	}
	public void setR1_IA_C1(double r1_ia_c1) {
		R1_IA_C1 = r1_ia_c1;
	}
	public void setR1_IA_C2(double r1_ia_c2) {
		R1_IA_C2 = r1_ia_c2;
	}
	public void setR1_IB_C1(double r1_ib_c1) {
		R1_IB_C1 = r1_ib_c1;
	}
	public void setR1_IB_C2(double r1_ib_c2) {
		R1_IB_C2 = r1_ib_c2;
	}
	public void setR1_IC_C1(double r1_ic_c1) {
		R1_IC_C1 = r1_ic_c1;
	}
	public void setR1_IC_C2(double r1_ic_c2) {
		R1_IC_C2 = r1_ic_c2;
	}
	public void setR1_ID_C1(double r1_id_c1) {
		R1_ID_C1 = r1_id_c1;
	}
	public void setR1_ID_C2(double r1_id_c2) {
		R1_ID_C2 = r1_id_c2;
	}
	public void setR1_IE_C1(double r1_ie_c1) {
		R1_IE_C1 = r1_ie_c1;
	}
	public void setR1_IE_C2(double r1_ie_c2) {
		R1_IE_C2 = r1_ie_c2;
	}
	public void setR2_IA_C1(double r2_ia_c1) {
		R2_IA_C1 = r2_ia_c1;
	}
	public void setR2_IA_C2(double r2_ia_c2) {
		R2_IA_C2 = r2_ia_c2;
	}
	public void setR2_IB_C1(double r2_ib_c1) {
		R2_IB_C1 = r2_ib_c1;
	}
	public void setR2_IB_C2(double r2_ib_c2) {
		R2_IB_C2 = r2_ib_c2;
	}
	public void setR2_IC_C1(double r2_ic_c1) {
		R2_IC_C1 = r2_ic_c1;
	}
	public void setR2_IC_C2(double r2_ic_c2) {
		R2_IC_C2 = r2_ic_c2;
	}
	public void setR2_ID_C1(double r2_id_c1) {
		R2_ID_C1 = r2_id_c1;
	}
	public void setR2_ID_C2(double r2_id_c2) {
		R2_ID_C2 = r2_id_c2;
	}
	public void setR2_IE_C1(double r2_ie_c1) {
		R2_IE_C1 = r2_ie_c1;
	}
	public void setR2_IF_C1(double r2_if_c1) {
		R2_IF_C1 = r2_if_c1;
	}
	public void setR2_IG_C1(double r2_ig_c1) {
		R2_IG_C1 = r2_ig_c1;
	}
	public void setR2_IG_C2(double r2_ig_c2) {
		R2_IG_C2 = r2_ig_c2;
	}
	public void setR3_IA_C1(double r3_ia_c1) {
		R3_IA_C1 = r3_ia_c1;
	}
	public void setR3_IB_C1(double r3_ib_c1) {
		R3_IB_C1 = r3_ib_c1;
	}
	public void setR3_IC_C1(double r3_ic_c1) {
		R3_IC_C1 = r3_ic_c1;
	}
	public void setR4_IA_C1(double r4_ia_c1) {
		R4_IA_C1 = r4_ia_c1;
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
	public void setR4_IF_C1(double r4_if_c1) {
		R4_IF_C1 = r4_if_c1;
	}
	public void setR4_IG_C1(double r4_ig_c1) {
		R4_IG_C1 = r4_ig_c1;
	}
	public void setR4_IH_C1(double r4_ih_c1) {
		R4_IH_C1 = r4_ih_c1;
	}
	public void setR4_II_C1(double r4_ii_c1) {
		R4_II_C1 = r4_ii_c1;
	}
	public void setR4_IJ_C1(double r4_ij_c1) {
		R4_IJ_C1 = r4_ij_c1;
	}
	public void setR5_IA_C2(double r5_ia_c2) {
		R5_IA_C2 = r5_ia_c2;
	}
	public void setR5_IB_C1(double r5_ib_c1) {
		R5_IB_C1 = r5_ib_c1;
	}
	public void setR5_IC_C1(double r5_ic_c1) {
		R5_IC_C1 = r5_ic_c1;
	}
	public void setR5_ID_C1(double r5_id_c1) {
		R5_ID_C1 = r5_id_c1;
	}
	public void setR5_IE_C1(double r5_ie_c1) {
		R5_IE_C1 = r5_ie_c1;
	}
	public void setR5_IF_C1(double r5_if_c1) {
		R5_IF_C1 = r5_if_c1;
	}
	public void setR5_IG_C2(double r5_ig_c2) {
		R5_IG_C2 = r5_ig_c2;
	}
	public void setR5_IH_C1(double r5_ih_c1) {
		R5_IH_C1 = r5_ih_c1;
	}
	public void setR5_IH_C2(double r5_ih_c2) {
		R5_IH_C2 = r5_ih_c2;
	}
	public void setR5_II_C1(double r5_ii_c1) {
		R5_II_C1 = r5_ii_c1;
	}
	public void setR5_IJ_C2(double r5_ij_c2) {
		R5_IJ_C2 = r5_ij_c2;
	}
	public void setR5_IK_C1(double r5_ik_c1) {
		R5_IK_C1 = r5_ik_c1;
	}
	public void setR5_IL_C2(double r5_il_c2) {
		R5_IL_C2 = r5_il_c2;
	}
	public void setR5_IM_C2(double r5_im_c2) {
		R5_IM_C2 = r5_im_c2;
	}
	public void setR5_IN_C2(double r5_in_c2) {
		R5_IN_C2 = r5_in_c2;
	}
	public void setR5_IO_C2(double r5_io_c2) {
		R5_IO_C2 = r5_io_c2;
	}
	public void setR6_I1_C1(double r6_i1_c1) {
		R6_I1_C1 = r6_i1_c1;
	}
	public void setR6_IA_C2(double r6_ia_c2) {
		R6_IA_C2 = r6_ia_c2;
	}
	public void setR6_IB_C1(double r6_ib_c1) {
		R6_IB_C1 = r6_ib_c1;
	}
	public void setR6_IC_C1(double r6_ic_c1) {
		R6_IC_C1 = r6_ic_c1;
	}
	public void setR6_ID_C1(double r6_id_c1) {
		R6_ID_C1 = r6_id_c1;
	}
	public void setR6_IE_C1(double r6_ie_c1) {
		R6_IE_C1 = r6_ie_c1;
	}
	public void setR6_IF_C2(double r6_if_c2) {
		R6_IF_C2 = r6_if_c2;
	}
	public void setR6_IG_C1(double r6_ig_c1) {
		R6_IG_C1 = r6_ig_c1;
	}
	public void setR6_IG_C2(double r6_ig_c2) {
		R6_IG_C2 = r6_ig_c2;
	}
	public void setR6_IH_C1(double r6_ih_c1) {
		R6_IH_C1 = r6_ih_c1;
	}
	public void setR6_II_C2(double r6_ii_c2) {
		R6_II_C2 = r6_ii_c2;
	}
	public void setR6_IJ_C2(double r6_ij_c2) {
		R6_IJ_C2 = r6_ij_c2;
	}
	public void setR6_IK_C2(double r6_ik_c2) {
		R6_IK_C2 = r6_ik_c2;
	}
	public void setR6_IL_C2(double r6_il_c2) {
		R6_IL_C2 = r6_il_c2;
	}

	
	
}
