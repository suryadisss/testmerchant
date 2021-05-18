package org.idx.lms.model.disbursement;

public class DisbursementSingleItem {
	String loan_acc_no, loan_disb_amount_needs, ldi_req_date, notes;

	public String getLoan_acc_no() {
		return loan_acc_no;
	}

	public void setLoan_acc_no(String loan_acc_no) {
		this.loan_acc_no = loan_acc_no;
	}

	public String getLoan_disb_amount_needs() {
		return loan_disb_amount_needs;
	}

	public void setLoan_disb_amount_needs(String loan_disb_amount_needs) {
		this.loan_disb_amount_needs = loan_disb_amount_needs;
	}

	public String getLdi_req_date() {
		return ldi_req_date;
	}

	public void setLdi_req_date(String ldi_req_date) {
		this.ldi_req_date = ldi_req_date;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
}
