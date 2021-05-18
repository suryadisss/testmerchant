package org.idx.lms.model.scorecard;

import java.util.ArrayList;

public class PostSCCharateristic {
 String scc_code,type,user;
 public String getScc_code() {
	return scc_code;
}

public void setScc_code(String scc_code) {
	this.scc_code = scc_code;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public String getUser() {
	return user;
}

public void setUser(String user) {
	this.user = user;
}

public int getField_id() {
	return field_id;
}

public void setField_id(int field_id) {
	this.field_id = field_id;
}

public int getDefault_score() {
	return default_score;
}

public void setDefault_score(int default_score) {
	this.default_score = default_score;
}

public double getCoefficient_score() {
	return coefficient_score;
}

public void setCoefficient_score(double coefficient_score) {
	this.coefficient_score = coefficient_score;
}

public ArrayList<DetailItem> getDetail() {
	return detail;
}

public void setDetail(ArrayList<DetailItem> detail) {
	this.detail = detail;
}

int field_id, default_score, sch_id;
 public int getSch_id() {
	return sch_id;
}

public void setSch_id(int sch_id) {
	this.sch_id = sch_id;
}

double coefficient_score;
 
 ArrayList<DetailItem> detail;
 
}
