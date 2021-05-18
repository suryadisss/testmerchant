package org.idx.lms.model.produk;

import java.util.ArrayList;

public class ItemInterest {

	String id,tenor_type,type,interest_code;

	public String getInterest_code() {
		return interest_code;
	}

	public void setInterest_code(String interest_code) {
		this.interest_code = interest_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	double  value;
	


	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public String getTenor_type() {
		return tenor_type;
	}

	public void setTenor_type(String tenor_type) {
		this.tenor_type = tenor_type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}



	


}
