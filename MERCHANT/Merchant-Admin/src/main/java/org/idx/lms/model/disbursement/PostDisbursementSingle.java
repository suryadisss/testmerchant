package org.idx.lms.model.disbursement;

public class PostDisbursementSingle {
	String acc_no, disburse_date, notes;

	public String getAcc_no() {
		return acc_no;
	}

	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}

	public String getDisburse_date() {
		return disburse_date;
	}

	public void setDisburse_date(String disburse_date) {
		this.disburse_date = disburse_date;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public int getDisburse_amount() {
		return disburse_amount;
	}

	public void setDisburse_amount(int disburse_amount) {
		this.disburse_amount = disburse_amount;
	}

	int disburse_amount;
}
