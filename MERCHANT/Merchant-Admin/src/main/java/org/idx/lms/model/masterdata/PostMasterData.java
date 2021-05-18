package org.idx.lms.model.masterdata;

public class PostMasterData {
 String name,desc, type, formula, level, user, p_logid;
 public String getP_logid() {
	return p_logid;
}
public void setP_logid(String p_logid) {
	this.p_logid = p_logid;
}
int map_id;
 public int getMap_id() {
	return map_id;
}
public void setMap_id(int map_id) {
	this.map_id = map_id;
}

public String getLevel() {
	return level;
}
public void setLevel(String level) {
	this.level = level;
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
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getFormula() {
	return formula;
}
public void setFormula(String formula) {
	this.formula = formula;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public boolean isStatus() {
	return status;
}
public void setStatus(boolean status) {
	this.status = status;
}
public boolean isActive() {
	return active;
}
public void setActive(boolean active) {
	this.active = active;
}
boolean status, active;
}
