package py.com.roshka.pykasu.persistence.forms;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PersistenceUnit;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import py.com.roshka.pykasu.exceptions.FormStatusTransitionException;
import py.com.roshka.pykasu.persistence.users.BusinessCompany;
import py.com.roshka.pykasu.persistence.users.User;


@Entity (name = "Form850")
@Table (name = "form_850")
//@SequenceGenerator(name = "seq_form850", sequenceName = "seq_form850")
public class Form850 extends TaxForm{

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Form850.class);

	
	//RUBRO 1
	private Double r1_IA_C1; 
	private Double R1_IA_C2;
	
	private Double R1_IB_C1; 
	private Double R1_IB_C3;

	private Double R1_IC_C1; 
	private Double R1_IC_C2;

	private Double R1_ID_C1; 
	private Double R1_ID_C2;

	private Double R1_IE_C1; 
	private Double R1_IE_C2;
	private Double R1_IE_C3; 
	
	private Double R1_IF_C1; 
	private Double R1_IF_C2;
	private Double R1_IF_C3;

	private Double R1_IG_C1; 

	private Double R1_IH_C1;

	private Double R1_II_C1; 
	private Double R1_II_C2;
	private Double R1_II_C3;	

	//RUBRO 2
	private Double R2_IA_C1;
	private Double R2_IB_C1;	
	private Double R2_IC_C1;
	private Double R2_ID_C1;
	private Double R2_IE_C1;	
	private Double R2_IF_C1;
	private Double R2_IG_C1;

	//RUBRO 3
	private Double R3_IA_C1;
	private Double R3_IA_C2;

	private Double R3_IB_C1;	
	private Double R3_IB_C2;	
	
	private Double R3_IC_C1;
	private Double R3_IC_C2;
	
	private Double R3_ID_C1;
	private Double R3_ID_C2;
	
	private Double R3_IE_C1;
	private Double R3_IE_C2;	
	
	private Double R3_IF_C1;
	private Double R3_IF_C2;
	
	//Rubro 4
	private Double R4_IA_C1;
	private Double R4_IA_C2;

	private Double R4_IB_C1;
	private Double R4_IB_C2;
	
	private Double R4_IC_C2;
	
	private Double R4_ID_C2;
	
	private Double R4_IE_C2;

	private Double R4_IF_C2;
	
	private Double R4_IG_C2;
	
	private Double R4_IH_C2;
	
	private Double R4_II_C2;

	private Double R4_IJ_C2;	

	//RUBRO 5
	private Double R5_IA_C1;
	private Double R5_IA_C2;

	private Double R5_IB_C1;
	private Double R5_IB_C2;

	private Double R5_IC_C1;
	private Double R5_IC_C3;

	private Double R5_ID_C1;
	private Double R5_ID_C3;

	private Double R5_IE_C2;

	private Double R5_IF_C2;

	private Double R5_IG_C3;

	private Double R5_IH_C3;

	private Double R5_II_C1;
	private Double R5_II_C2;

	private Double R5_IJ_C1;
	private Double R5_IJ_C2;

	private Double R5_IK_C1;
	private Double R5_IK_C2;

	private Double R5_IL_C1;
	private Double R5_IL_C2;

	private Double R5_IM_C1;
	private Double R5_IM_C3;

	private Double R5_IN_C2;
	private Double R5_IN_C3;	
	
	//RUBRO 6
	private Double R6_IA_C1;
	private Double R6_IA_C2;

	private Double R6_IB_C1;	
	private Double R6_IB_C2;	
	
	private Double R6_IC_C1;
	private Double R6_IC_C2;
	
	private Double R6_ID_C1;
	private Double R6_ID_C2;
	
	private Double R6_IE_C1;
	private Double R6_IE_C2;	
	
	private Double R6_IF_C1;
	private Double R6_IF_C2;
	
	
	//RUBRO 7
	private Double R7_IA_C2;

	private Double R7_IB_C1;

	private Double R7_IC_C1;

	private Double R7_ID_C1;

	private Double R7_IE_C2;

	private Double R7_IF_C1;
	private Double R7_IF_C2;

	private Double R7_IG_C1;

	private Double R7_IH_C2;

	private Double R7_II_C2;

	private Double R7_IJ_C2;

	private Double R7_IK_C1;

	private Double R7_IL_C1;
	
	private Double R7_IM_C2;	
	
	protected Form850(){}

	public Form850(User userCreator){
		super(userCreator);
	}	

	public Double getR1_IA_C1() {
		return r1_IA_C1;
	}

	public void setR1_IA_C1(Double r1_ia_c1) {
		r1_IA_C1 = r1_ia_c1;
	}
    @Column
	public Double getR1_IA_C2() {
		return R1_IA_C2;
	}

	public void setR1_IA_C2(Double r1_ia_c2) {
		R1_IA_C2 = r1_ia_c2;
	}

	public Double getR1_IB_C1() {
		return R1_IB_C1;
	}

	public void setR1_IB_C1(Double r1_ib_c1) {
		R1_IB_C1 = r1_ib_c1;
	}

	public Double getR1_IB_C3() {
		return R1_IB_C3;
	}

	public void setR1_IB_C3(Double r1_ib_c3) {
		R1_IB_C3 = r1_ib_c3;
	}

	public Double getR1_IC_C1() {
		return R1_IC_C1;
	}

	public void setR1_IC_C1(Double r1_ic_c1) {
		R1_IC_C1 = r1_ic_c1;
	}

	public Double getR1_IC_C2() {
		return R1_IC_C2;
	}

	public void setR1_IC_C2(Double r1_ic_c2) {
		R1_IC_C2 = r1_ic_c2;
	}

	public Double getR1_ID_C1() {
		return R1_ID_C1;
	}

	public void setR1_ID_C1(Double r1_id_c1) {
		R1_ID_C1 = r1_id_c1;
	}

	public Double getR1_ID_C2() {
		return R1_ID_C2;
	}

	public void setR1_ID_C2(Double r1_id_c2) {
		R1_ID_C2 = r1_id_c2;
	}

	public Double getR1_IE_C1() {
		return R1_IE_C1;
	}

	public void setR1_IE_C1(Double r1_ie_c1) {
		R1_IE_C1 = r1_ie_c1;
	}

	public Double getR1_IE_C2() {
		return R1_IE_C2;
	}

	public void setR1_IE_C2(Double r1_ie_c2) {
		R1_IE_C2 = r1_ie_c2;
	}

	public Double getR1_IE_C3() {
		return R1_IE_C3;
	}

	public void setR1_IE_C3(Double r1_ie_c3) {
		R1_IE_C3 = r1_ie_c3;
	}

	public Double getR1_IF_C1() {
		return R1_IF_C1;
	}

	public void setR1_IF_C1(Double r1_if_c1) {
		R1_IF_C1 = r1_if_c1;
	}

	public Double getR1_IF_C2() {
		return R1_IF_C2;
	}

	public void setR1_IF_C2(Double r1_if_c2) {
		R1_IF_C2 = r1_if_c2;
	}

	public Double getR1_IF_C3() {
		return R1_IF_C3;
	}

	public void setR1_IF_C3(Double r1_if_c3) {
		R1_IF_C3 = r1_if_c3;
	}

	public Double getR1_IG_C1() {
		return R1_IG_C1;
	}

	public void setR1_IG_C1(Double r1_ig_c1) {
		R1_IG_C1 = r1_ig_c1;
	}

	public Double getR1_IH_C1() {
		return R1_IH_C1;
	}

	public void setR1_IH_C1(Double r1_ih_c1) {
		R1_IH_C1 = r1_ih_c1;
	}

	public Double getR1_II_C1() {
		return R1_II_C1;
	}

	public void setR1_II_C1(Double r1_ii_c1) {
		R1_II_C1 = r1_ii_c1;
	}

	public Double getR1_II_C2() {
		return R1_II_C2;
	}

	public void setR1_II_C2(Double r1_ii_c2) {
		R1_II_C2 = r1_ii_c2;
	}

	public Double getR1_II_C3() {
		return R1_II_C3;
	}

	public void setR1_II_C3(Double r1_ii_c3) {
		R1_II_C3 = r1_ii_c3;
	}
	
	public Double getR2_IA_C1() {
		return R2_IA_C1;
	}

	public void setR2_IA_C1(Double r2_ia_c1) {
		R2_IA_C1 = r2_ia_c1;
	}

	public Double getR2_IB_C1() {
		return R2_IB_C1;
	}

	public void setR2_IB_C1(Double r2_ib_c1) {
		R2_IB_C1 = r2_ib_c1;
	}

	public Double getR2_IC_C1() {
		return R2_IC_C1;
	}

	public void setR2_IC_C1(Double r2_ic_c1) {
		R2_IC_C1 = r2_ic_c1;
	}

	public Double getR2_ID_C1() {
		return R2_ID_C1;
	}

	public void setR2_ID_C1(Double r2_id_c1) {
		R2_ID_C1 = r2_id_c1;
	}

	public Double getR2_IE_C1() {
		return R2_IE_C1;
	}

	public void setR2_IE_C1(Double r2_ie_c1) {
		R2_IE_C1 = r2_ie_c1;
	}

	public Double getR2_IF_C1() {
		return R2_IF_C1;
	}

	public void setR2_IF_C1(Double r2_if_c1) {
		R2_IF_C1 = r2_if_c1;
	}

	public Double getR2_IG_C1() {
		return R2_IG_C1;
	}

	public void setR2_IG_C1(Double r2_ig_c1) {
		R2_IG_C1 = r2_ig_c1;
	}


	public Double getR3_IA_C1() {
		return R3_IA_C1;
	}

	public void setR3_IA_C1(Double r3_ia_c1) {
		R3_IA_C1 = r3_ia_c1;
	}

	public Double getR3_IA_C2() {
		return R3_IA_C2;
	}

	public void setR3_IA_C2(Double r3_ia_c2) {
		R3_IA_C2 = r3_ia_c2;
	}

	public Double getR3_IB_C1() {
		return R3_IB_C1;
	}

	public void setR3_IB_C1(Double r3_ib_c1) {
		R3_IB_C1 = r3_ib_c1;
	}

	public Double getR3_IB_C2() {
		return R3_IB_C2;
	}

	public void setR3_IB_C2(Double r3_ib_c2) {
		R3_IB_C2 = r3_ib_c2;
	}

	public Double getR3_IC_C1() {
		return R3_IC_C1;
	}

	public void setR3_IC_C1(Double r3_ic_c1) {
		R3_IC_C1 = r3_ic_c1;
	}

	public Double getR3_IC_C2() {
		return R3_IC_C2;
	}

	public void setR3_IC_C2(Double r3_ic_c2) {
		R3_IC_C2 = r3_ic_c2;
	}

	public Double getR3_ID_C1() {
		return R3_ID_C1;
	}

	public void setR3_ID_C1(Double r3_id_c1) {
		R3_ID_C1 = r3_id_c1;
	}

	public Double getR3_ID_C2() {
		return R3_ID_C2;
	}

	public void setR3_ID_C2(Double r3_id_c2) {
		R3_ID_C2 = r3_id_c2;
	}

	public Double getR3_IE_C1() {
		return R3_IE_C1;
	}

	public void setR3_IE_C1(Double r3_ie_c1) {
		R3_IE_C1 = r3_ie_c1;
	}

	public Double getR3_IE_C2() {
		return R3_IE_C2;
	}

	public void setR3_IE_C2(Double r3_ie_c2) {
		R3_IE_C2 = r3_ie_c2;
	}

	public Double getR3_IF_C1() {
		return R3_IF_C1;
	}

	public void setR3_IF_C1(Double r3_if_c1) {
		R3_IF_C1 = r3_if_c1;
	}

	public Double getR3_IF_C2() {
		return R3_IF_C2;
	}

	public void setR3_IF_C2(Double r3_if_c2) {
		R3_IF_C2 = r3_if_c2;
	}

	public Double getR4_IA_C1() {
		return R4_IA_C1;
	}

	public void setR4_IA_C1(Double r4_ia_c1) {
		R4_IA_C1 = r4_ia_c1;
	}

	public Double getR4_IA_C2() {
		return R4_IA_C2;
	}

	public void setR4_IA_C2(Double r4_ia_c2) {
		R4_IA_C2 = r4_ia_c2;
	}

	public Double getR4_IB_C1() {
		return R4_IB_C1;
	}

	public void setR4_IB_C1(Double r4_ib_c1) {
		R4_IB_C1 = r4_ib_c1;
	}

	public Double getR4_IB_C2() {
		return R4_IB_C2;
	}

	public void setR4_IB_C2(Double r4_ib_c2) {
		R4_IB_C2 = r4_ib_c2;
	}

	public Double getR4_IC_C2() {
		return R4_IC_C2;
	}

	public void setR4_IC_C2(Double r4_ic_c2) {
		R4_IC_C2 = r4_ic_c2;
	}

	public Double getR4_ID_C2() {
		return R4_ID_C2;
	}

	public void setR4_ID_C2(Double r4_id_c2) {
		R4_ID_C2 = r4_id_c2;
	}

	public Double getR4_IE_C2() {
		return R4_IE_C2;
	}

	public void setR4_IE_C2(Double r4_ie_c2) {
		R4_IE_C2 = r4_ie_c2;
	}

	public Double getR4_IF_C2() {
		return R4_IF_C2;
	}

	public void setR4_IF_C2(Double r4_if_c2) {
		R4_IF_C2 = r4_if_c2;
	}

	public Double getR4_IG_C2() {
		return R4_IG_C2;
	}

	public void setR4_IG_C2(Double r4_ig_c2) {
		R4_IG_C2 = r4_ig_c2;
	}

	public Double getR4_IH_C2() {
		return R4_IH_C2;
	}

	public void setR4_IH_C2(Double r4_ih_c2) {
		R4_IH_C2 = r4_ih_c2;
	}

	public Double getR4_II_C2() {
		return R4_II_C2;
	}

	public void setR4_II_C2(Double r4_ii_c2) {
		R4_II_C2 = r4_ii_c2;
	}

	public Double getR5_IA_C1() {
		return R5_IA_C1;
	}

	public void setR5_IA_C1(Double r5_ia_c1) {
		R5_IA_C1 = r5_ia_c1;
	}

	public Double getR5_IA_C2() {
		return R5_IA_C2;
	}

	public void setR5_IA_C2(Double r5_ia_c2) {
		R5_IA_C2 = r5_ia_c2;
	}

	public Double getR5_IB_C1() {
		return R5_IB_C1;
	}

	public void setR5_IB_C1(Double r5_ib_c1) {
		R5_IB_C1 = r5_ib_c1;
	}

	public Double getR5_IB_C2() {
		return R5_IB_C2;
	}

	public void setR5_IB_C2(Double r5_ib_c2) {
		R5_IB_C2 = r5_ib_c2;
	}

	public Double getR5_IC_C1() {
		return R5_IC_C1;
	}

	public void setR5_IC_C1(Double r5_ic_c1) {
		R5_IC_C1 = r5_ic_c1;
	}

	public Double getR5_IC_C3() {
		return R5_IC_C3;
	}

	public void setR5_IC_C3(Double r5_ic_c3) {
		R5_IC_C3 = r5_ic_c3;
	}

	public Double getR5_ID_C1() {
		return R5_ID_C1;
	}

	public void setR5_ID_C1(Double r5_id_c1) {
		R5_ID_C1 = r5_id_c1;
	}

	public Double getR5_ID_C3() {
		return R5_ID_C3;
	}

	public void setR5_ID_C3(Double r5_id_c3) {
		R5_ID_C3 = r5_id_c3;
	}

	public Double getR5_IE_C2() {
		return R5_IE_C2;
	}

	public void setR5_IE_C2(Double r5_ie_c2) {
		R5_IE_C2 = r5_ie_c2;
	}

	public Double getR5_IF_C2() {
		return R5_IF_C2;
	}

	public void setR5_IF_C2(Double r5_if_c2) {
		R5_IF_C2 = r5_if_c2;
	}

	public Double getR5_IG_C3() {
		return R5_IG_C3;
	}

	public void setR5_IG_C3(Double r5_ig_c3) {
		R5_IG_C3 = r5_ig_c3;
	}

	public Double getR5_IH_C3() {
		return R5_IH_C3;
	}

	public void setR5_IH_C3(Double r5_ih_c3) {
		R5_IH_C3 = r5_ih_c3;
	}

	public Double getR5_II_C1() {
		return R5_II_C1;
	}

	public void setR5_II_C1(Double r5_ii_c1) {
		R5_II_C1 = r5_ii_c1;
	}

	public Double getR5_II_C2() {
		return R5_II_C2;
	}

	public void setR5_II_C2(Double r5_ii_c2) {
		R5_II_C2 = r5_ii_c2;
	}

	public Double getR5_IJ_C1() {
		return R5_IJ_C1;
	}

	public void setR5_IJ_C1(Double r5_ij_c1) {
		R5_IJ_C1 = r5_ij_c1;
	}

	public Double getR5_IJ_C2() {
		return R5_IJ_C2;
	}

	public void setR5_IJ_C2(Double r5_ij_c2) {
		R5_IJ_C2 = r5_ij_c2;
	}

	public Double getR5_IK_C1() {
		return R5_IK_C1;
	}

	public void setR5_IK_C1(Double r5_ik_c1) {
		R5_IK_C1 = r5_ik_c1;
	}

	public Double getR5_IK_C2() {
		return R5_IK_C2;
	}

	public void setR5_IK_C2(Double r5_ik_c2) {
		R5_IK_C2 = r5_ik_c2;
	}

	public Double getR5_IL_C1() {
		return R5_IL_C1;
	}

	public void setR5_IL_C1(Double r5_il_c1) {
		R5_IL_C1 = r5_il_c1;
	}

	public Double getR5_IL_C2() {
		return R5_IL_C2;
	}

	public void setR5_IL_C2(Double r5_il_c2) {
		R5_IL_C2 = r5_il_c2;
	}

	public Double getR5_IM_C1() {
		return R5_IM_C1;
	}

	public void setR5_IM_C1(Double r5_im_c1) {
		R5_IM_C1 = r5_im_c1;
	}

	public Double getR5_IM_C3() {
		return R5_IM_C3;
	}

	public void setR5_IM_C3(Double r5_im_c3) {
		R5_IM_C3 = r5_im_c3;
	}

	public Double getR5_IN_C2() {
		return R5_IN_C2;
	}

	public void setR5_IN_C2(Double r5_in_c2) {
		R5_IN_C2 = r5_in_c2;
	}

	public Double getR5_IN_C3() {
		return R5_IN_C3;
	}

	public void setR5_IN_C3(Double r5_in_c3) {
		R5_IN_C3 = r5_in_c3;
	}

	public Double getR6_IA_C1() {
		return R6_IA_C1;
	}

	public void setR6_IA_C1(Double r6_ia_c1) {
		R6_IA_C1 = r6_ia_c1;
	}

	public Double getR6_IA_C2() {
		return R6_IA_C2;
	}

	public void setR6_IA_C2(Double r6_ia_c2) {
		R6_IA_C2 = r6_ia_c2;
	}

	public Double getR6_IB_C1() {
		return R6_IB_C1;
	}

	public void setR6_IB_C1(Double r6_ib_c1) {
		R6_IB_C1 = r6_ib_c1;
	}

	public Double getR6_IB_C2() {
		return R6_IB_C2;
	}

	public void setR6_IB_C2(Double r6_ib_c2) {
		R6_IB_C2 = r6_ib_c2;
	}

	public Double getR6_IC_C1() {
		return R6_IC_C1;
	}

	public void setR6_IC_C1(Double r6_ic_c1) {
		R6_IC_C1 = r6_ic_c1;
	}

	public Double getR6_IC_C2() {
		return R6_IC_C2;
	}

	public void setR6_IC_C2(Double r6_ic_c2) {
		R6_IC_C2 = r6_ic_c2;
	}

	public Double getR6_ID_C1() {
		return R6_ID_C1;
	}

	public void setR6_ID_C1(Double r6_id_c1) {
		R6_ID_C1 = r6_id_c1;
	}

	public Double getR6_ID_C2() {
		return R6_ID_C2;
	}

	public void setR6_ID_C2(Double r6_id_c2) {
		R6_ID_C2 = r6_id_c2;
	}

	public Double getR6_IE_C1() {
		return R6_IE_C1;
	}

	public void setR6_IE_C1(Double r6_ie_c1) {
		R6_IE_C1 = r6_ie_c1;
	}

	public Double getR6_IE_C2() {
		return R6_IE_C2;
	}

	public void setR6_IE_C2(Double r6_ie_c2) {
		R6_IE_C2 = r6_ie_c2;
	}

	public Double getR6_IF_C1() {
		return R6_IF_C1;
	}

	public void setR6_IF_C1(Double r6_if_c1) {
		R6_IF_C1 = r6_if_c1;
	}

	public Double getR6_IF_C2() {
		return R6_IF_C2;
	}

	public void setR6_IF_C2(Double r6_if_c2) {
		R6_IF_C2 = r6_if_c2;
	}

	public Double getR7_IA_C2() {
		return R7_IA_C2;
	}

	public void setR7_IA_C2(Double r7_ia_c2) {
		R7_IA_C2 = r7_ia_c2;
	}

	public Double getR7_IB_C1() {
		return R7_IB_C1;
	}

	public void setR7_IB_C1(Double r7_ib_c1) {
		R7_IB_C1 = r7_ib_c1;
	}

	public Double getR7_IC_C1() {
		return R7_IC_C1;
	}

	public void setR7_IC_C1(Double r7_ic_c1) {
		R7_IC_C1 = r7_ic_c1;
	}

	public Double getR7_ID_C1() {
		return R7_ID_C1;
	}

	public void setR7_ID_C1(Double r7_id_c1) {
		R7_ID_C1 = r7_id_c1;
	}

	public Double getR7_IE_C2() {
		return R7_IE_C2;
	}

	public void setR7_IE_C2(Double r7_ie_c2) {
		R7_IE_C2 = r7_ie_c2;
	}

	public Double getR7_IF_C1() {
		return R7_IF_C1;
	}

	public void setR7_IF_C1(Double r7_if_c1) {
		R7_IF_C1 = r7_if_c1;
	}

	public Double getR7_IF_C2() {
		return R7_IF_C2;
	}

	public void setR7_IF_C2(Double r7_if_c2) {
		R7_IF_C2 = r7_if_c2;
	}

	public Double getR7_IG_C1() {
		return R7_IG_C1;
	}

	public void setR7_IG_C1(Double r7_ig_c1) {
		R7_IG_C1 = r7_ig_c1;
	}

	public Double getR7_IH_C2() {
		return R7_IH_C2;
	}

	public void setR7_IH_C2(Double r7_ih_c2) {
		R7_IH_C2 = r7_ih_c2;
	}

	public Double getR7_II_C2() {
		return R7_II_C2;
	}

	public void setR7_II_C2(Double r7_ii_c2) {
		R7_II_C2 = r7_ii_c2;
	}

	public Double getR7_IJ_C2() {
		return R7_IJ_C2;
	}

	public void setR7_IJ_C2(Double r7_ij_c2) {
		R7_IJ_C2 = r7_ij_c2;
	}

	public Double getR7_IK_C1() {
		return R7_IK_C1;
	}

	public void setR7_IK_C1(Double r7_ik_c1) {
		R7_IK_C1 = r7_ik_c1;
	}

	public Double getR7_IL_C1() {
		return R7_IL_C1;
	}

	public void setR7_IL_C1(Double r7_il_c1) {
		R7_IL_C1 = r7_il_c1;
	}

	public Double getR7_IM_C2() {
		return R7_IM_C2;
	}

	public void setR7_IM_C2(Double r7_im_c2) {
		R7_IM_C2 = r7_im_c2;
	}


	public Double getR4_IJ_C2() {
		return R4_IJ_C2;
	}

	public void setR4_IJ_C2(Double r4_ij_c2) {
		R4_IJ_C2 = r4_ij_c2;
	}


	
}
