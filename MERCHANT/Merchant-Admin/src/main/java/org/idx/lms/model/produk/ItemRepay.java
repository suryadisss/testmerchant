package org.idx.lms.model.produk;

public class ItemRepay {
	String id;
	int tenor_from, tenor_to, adm_cost;

	public int getTenor_from() {
		return tenor_from;
	}

	public void setTenor_from(int tenor_from) {
		this.tenor_from = tenor_from;
	}

	public int getTenor_to() {
		return tenor_to;
	}

	public void setTenor_to(int tenor_to) {
		this.tenor_to = tenor_to;
	}

	public int getAdm_cost() {
		return adm_cost;
	}

	public void setAdm_cost(int adm_cost) {
		this.adm_cost = adm_cost;
	}

	public double getOut_principal() {
		return out_principal;
	}

	public void setOut_principal(double out_principal) {
		this.out_principal = out_principal;
	}

	double out_principal;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
