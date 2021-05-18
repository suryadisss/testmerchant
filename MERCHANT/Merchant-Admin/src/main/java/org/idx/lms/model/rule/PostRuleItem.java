package org.idx.lms.model.rule;

public class PostRuleItem {
	String name, desc, cond, output, user, output_type, p_logid;

	public String getP_logid() {
		return p_logid;
	}

	public void setP_logid(String p_logid) {
		this.p_logid = p_logid;
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

	public String getCond() {
		return cond;
	}

	public void setCond(String cond) {
		this.cond = cond;
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

	public String getOutput_type() {
		return output_type;
	}

	public void setOutput_type(String output_type) {
		this.output_type = output_type;
	}

	public int getRul_id() {
		return rul_id;
	}

	public void setRul_id(int rul_id) {
		this.rul_id = rul_id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	int rul_id, type;
	boolean active;
}
