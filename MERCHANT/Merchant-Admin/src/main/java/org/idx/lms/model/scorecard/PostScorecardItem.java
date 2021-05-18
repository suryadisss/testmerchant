package org.idx.lms.model.scorecard;

public class PostScorecardItem {
	String code, name, desc, output,user;
	int rul_id, additive_point, good_rul_id, bad_rul_id;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getOutput() {
		return output;
	}
	public void setOutput(String output) {
		this.output = output;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getRul_id() {
		return rul_id;
	}
	public void setRul_id(int rul_id) {
		this.rul_id = rul_id;
	}
	public int getAdditive_point() {
		return additive_point;
	}
	public void setAdditive_point(int additive_point) {
		this.additive_point = additive_point;
	}
	public int getGood_rul_id() {
		return good_rul_id;
	}
	public void setGood_rul_id(int good_rul_id) {
		this.good_rul_id = good_rul_id;
	}
	public int getBad_rul_id() {
		return bad_rul_id;
	}
	public void setBad_rul_id(int bad_rul_id) {
		this.bad_rul_id = bad_rul_id;
	}
}
