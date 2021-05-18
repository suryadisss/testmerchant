package org.idx.lms.model;

public class product {
	
	//================================================================================
    // Properties
    //================================================================================
	String prd_code;
	String prd_name;
	Double prd_min_value;
	Double prd_max_value;
	Integer prd_penalty_tolerance;
	Double prd_charge;
	String prd_intr_typ;
	String prd_intr_calc;
	String prd_start_date;
	String prd_end_date;
	Boolean prd_is_active;
	String prd_type;
	Integer prd_workflow_id;
	
	//================================================================================
    // Accessors
    //================================================================================
	public String getPrd_code(){
		return prd_code;
	}
	public void setPrd_code(String prd_code){
		this.prd_code = prd_code;
	}
	
	public String getPrd_name(){
		return prd_name;
	}
	public void setPrd_name(String prd_name){
		this.prd_name = prd_name;
	}
	
	public Double getPrd_min_value(){
		return prd_min_value;
	}
	public void setPrd_min_value(Double prd_min_value){
		this.prd_min_value = prd_min_value;
	}
	
	public Double getPrd_max_value(){
		return prd_max_value;
	}
	public void setPrd_max_value(Double prd_max_value){
		this.prd_max_value = prd_max_value;
	}
	
	public Integer getPrd_penalty_tolerance(){
		return prd_penalty_tolerance;
	}
	public void setPrd_penalty_tolerance(Integer prd_penalty_tolerance){
		this.prd_penalty_tolerance = prd_penalty_tolerance;
	}
	
	public Double getPrd_charge(){
		return prd_charge;
	}
	public void setPrd_charge(Double prd_charge){
		this.prd_charge = prd_charge;
	}
	
//	String prd_intr_typ;
	public String getPrd_intr_typ(){
		return prd_intr_typ;
	}
	public void setPrd_intr_typ(String prd_intr_typ){
		this.prd_intr_typ = prd_intr_typ;
	}
	
//	String prd_intr_calc;
	public String getPrd_intr_calc(){
		return prd_intr_calc;
	}
	public void setPrd_intr_calc(String prd_intr_calc){
		this.prd_intr_calc = prd_intr_calc;
	}
	
//	String prd_start_date;
	public String getPrd_start_date(){
		return prd_start_date;
	}
	public void setPrd_start_date(String prd_start_date){
		this.prd_start_date = prd_start_date;
	}
	
//	String prd_end_date;
	public String getPrd_end_date(){
		return prd_end_date;
	}
	public void setPrd_end_date(String prd_end_date){
		this.prd_end_date = prd_end_date;
	}
	
//	Boolean prd_is_active;
	public Boolean getPrd_is_active(){
		return prd_is_active;
	}
	public void setPrd_is_active(Boolean prd_is_active){
		this.prd_is_active = prd_is_active;
	}
//	String prd_type;
	public String getPrd_type(){
		return prd_type;
	}
	public void setPrd_type(String prd_type){
		this.prd_type = prd_type;
	}
	
//	Integer prd_workflow_id;
	public Integer getPrd_workflow_id(){
		return prd_workflow_id;
	}
	public void setPrd_workflow_id(Integer prd_workflow_id){
		this.prd_workflow_id = prd_workflow_id;
	}
}
