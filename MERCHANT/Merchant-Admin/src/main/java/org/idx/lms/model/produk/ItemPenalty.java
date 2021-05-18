package org.idx.lms.model.produk;

public class ItemPenalty {
	String type, field, method, id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	int value;

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
}
