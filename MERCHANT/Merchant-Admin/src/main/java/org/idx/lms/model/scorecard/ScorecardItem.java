package org.idx.lms.model.scorecard;

public class ScorecardItem {
	String new_edit_status, scc_code, scc_name, scc_desc, scc_active_req, scc_active_by, scc_output, scc_created_by, scc_modified_by;
	public String getNew_edit_status() {
		return new_edit_status;
	}

	public void setNew_edit_status(String new_edit_status) {
		this.new_edit_status = new_edit_status;
	}

	boolean scc_is_active;
	public boolean isScc_is_active() {
		return scc_is_active;
	}

	public void setScc_is_active(boolean scc_is_active) {
		this.scc_is_active = scc_is_active;
	}

	public String getScc_code() {
		return scc_code;
	}

	public void setScc_code(String scc_code) {
		this.scc_code = scc_code;
	}

	public String getScc_name() {
		return scc_name;
	}

	public void setScc_name(String scc_name) {
		this.scc_name = scc_name;
	}

	public String getScc_desc() {
		return scc_desc;
	}

	public void setScc_desc(String scc_desc) {
		this.scc_desc = scc_desc;
	}

	public String getScc_active_req() {
		return scc_active_req;
	}

	public void setScc_active_req(String scc_active_req) {
		this.scc_active_req = scc_active_req;
	}

	public String getScc_active_by() {
		return scc_active_by;
	}

	public void setScc_active_by(String scc_active_by) {
		this.scc_active_by = scc_active_by;
	}

	public String getScc_output() {
		return scc_output;
	}

	public void setScc_output(String scc_output) {
		this.scc_output = scc_output;
	}

	public String getScc_created_by() {
		return scc_created_by;
	}

	public void setScc_created_by(String scc_created_by) {
		this.scc_created_by = scc_created_by;
	}

	public String getScc_modified_by() {
		return scc_modified_by;
	}

	public void setScc_modified_by(String scc_modified_by) {
		this.scc_modified_by = scc_modified_by;
	}

	public int getScc_rul_id() {
		return scc_rul_id;
	}

	public void setScc_rul_id(int scc_rul_id) {
		this.scc_rul_id = scc_rul_id;
	}

	public int getScc_additive_point() {
		return scc_additive_point;
	}

	public void setScc_additive_point(int scc_additive_point) {
		this.scc_additive_point = scc_additive_point;
	}

	public int getScc_good_rul_id() {
		return scc_good_rul_id;
	}

	public void setScc_good_rul_id(int scc_good_rul_id) {
		this.scc_good_rul_id = scc_good_rul_id;
	}

	public int getScc_bad_rul_id() {
		return scc_bad_rul_id;
	}

	public void setScc_bad_rul_id(int scc_bad_rul_id) {
		this.scc_bad_rul_id = scc_bad_rul_id;
	}

	int scc_rul_id, scc_additive_point, scc_good_rul_id, scc_bad_rul_id;
}
