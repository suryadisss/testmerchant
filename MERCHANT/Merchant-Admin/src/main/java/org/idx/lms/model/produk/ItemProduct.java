package org.idx.lms.model.produk;

public class ItemProduct {
	String new_edit_status, lpi_type,lpp_value,prd_charge, lpp_field, prd_code, prd_name, prd_min_value, prd_max_value, prd_intr_typ, prd_intr_calc, prd_int_period,prd_start_date, prd_end_date,lpp_method,prd_interest_method;
	public String getPrd_interest_method() {
		return prd_interest_method;
	}
	public void setPrd_interest_method(String prd_interest_method) {
		this.prd_interest_method = prd_interest_method;
	}
	int prd_repayment_tolerance;
	public int getPrd_repayment_tolerance() {
		return prd_repayment_tolerance;
	}
	public void setPrd_repayment_tolerance(int prd_repayment_tolerance) {
		this.prd_repayment_tolerance = prd_repayment_tolerance;
	}
	public String getLpp_field() {
		return lpp_field;
	}
	public String getLpp_method() {
		return lpp_method;
	}
	public void setLpp_method(String lpp_method) {
		this.lpp_method = lpp_method;
	}
	public void setLpp_field(String lpp_field) {
		this.lpp_field = lpp_field;
	}
	public String getLpi_type() {
		return lpi_type;
	}
	public void setLpi_type(String lpi_type) {
		this.lpi_type = lpi_type;
	}
	public String getLpp_value() {
		return lpp_value;
	}
	public void setLpp_value(String lpp_value) {
		this.lpp_value = lpp_value;
	}
	public String getPrd_charge() {
		return prd_charge;
	}
	public void setPrd_charge(String prd_charge) {
		this.prd_charge = prd_charge;
	}
	int prd_rus_id,prd_penalty_tolerance;

	public int getPrd_penalty_tolerance() {
		return prd_penalty_tolerance;
	}
	public void setPrd_penalty_tolerance(int prd_penalty_tolerance) {
		this.prd_penalty_tolerance = prd_penalty_tolerance;
	}
	public String getNew_edit_status() {
		return new_edit_status;
	}
	public void setNew_edit_status(String new_edit_status) {
		this.new_edit_status = new_edit_status;
	}
	public String getPrd_code() {
		return prd_code;
	}
	public void setPrd_code(String prd_code) {
		this.prd_code = prd_code;
	}
	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	public String getPrd_min_value() {
		return prd_min_value;
	}
	public void setPrd_min_value(String prd_min_value) {
		this.prd_min_value = prd_min_value;
	}
	public String getPrd_max_value() {
		return prd_max_value;
	}
	public void setPrd_max_value(String prd_max_value) {
		this.prd_max_value = prd_max_value;
	}
	public String getPrd_intr_typ() {
		return prd_intr_typ;
	}
	public void setPrd_intr_typ(String prd_intr_typ) {
		this.prd_intr_typ = prd_intr_typ;
	}
	public String getPrd_intr_calc() {
		return prd_intr_calc;
	}
	public void setPrd_intr_calc(String prd_intr_calc) {
		this.prd_intr_calc = prd_intr_calc;
	}
	public String getPrd_int_period() {
		return prd_int_period;
	}
	public void setPrd_int_period(String prd_int_period) {
		this.prd_int_period = prd_int_period;
	}
	public String getPrd_start_date() {
		return prd_start_date;
	}
	public void setPrd_start_date(String prd_start_date) {
		this.prd_start_date = prd_start_date;
	}
	public String getPrd_end_date() {
		return prd_end_date;
	}
	public void setPrd_end_date(String prd_end_date) {
		this.prd_end_date = prd_end_date;
	}
	public int getPrd_rus_id() {
		return prd_rus_id;
	}
	public void setPrd_rus_id(int prd_rus_id) {
		this.prd_rus_id = prd_rus_id;
	}
	public boolean isPrd_is_active() {
		return prd_is_active;
	}
	public void setPrd_is_active(boolean prd_is_active) {
		this.prd_is_active = prd_is_active;
	}
	boolean prd_is_active;
	
}
