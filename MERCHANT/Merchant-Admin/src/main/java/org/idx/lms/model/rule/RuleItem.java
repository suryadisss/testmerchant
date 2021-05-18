package org.idx.lms.model.rule;

public class RuleItem {
	String new_edit_status, rul_name, rul_desc, rul_condition, rul_output, rul_output_type;
	public String getNew_edit_status() {
		return new_edit_status;
	}

	public void setNew_edit_status(String new_edit_status) {
		this.new_edit_status = new_edit_status;
	}

	boolean rul_is_active;
	public boolean isRul_is_active() {
		return rul_is_active;
	}

	public void setRul_is_active(boolean rul_is_active) {
		this.rul_is_active = rul_is_active;
	}

	public String getRul_name() {
		return rul_name;
	}

	public void setRul_name(String rul_name) {
		this.rul_name = rul_name;
	}

	public String getRul_desc() {
		return rul_desc;
	}

	public void setRul_desc(String rul_desc) {
		this.rul_desc = rul_desc;
	}

	public String getRul_condition() {
		return rul_condition;
	}

	public void setRul_condition(String rul_condition) {
		this.rul_condition = rul_condition;
	}

	public String getRul_output() {
		return rul_output;
	}

	public void setRul_output(String rul_output) {
		this.rul_output = rul_output;
	}

	public String getRul_output_type() {
		return rul_output_type;
	}

	public void setRul_output_type(String rul_output_type) {
		this.rul_output_type = rul_output_type;
	}

	public int getRul_id() {
		return rul_id;
	}

	public void setRul_id(int rul_id) {
		this.rul_id = rul_id;
	}

	public int getRul_type() {
		return rul_type;
	}

	public void setRul_type(int rul_type) {
		this.rul_type = rul_type;
	}

	int rul_id, rul_type;
}
