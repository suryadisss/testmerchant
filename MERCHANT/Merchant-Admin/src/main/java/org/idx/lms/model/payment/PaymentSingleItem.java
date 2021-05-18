package org.idx.lms.model.payment;

public class PaymentSingleItem {

	String pay_no, pay_acc_no, pay_amount, pdi_req_date, channel, notes;

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getPay_acc_no() {
		return pay_acc_no;
	}

	public void setPay_acc_no(String pay_acc_no) {
		this.pay_acc_no = pay_acc_no;
	}

	public String getPay_amount() {
		return pay_amount;
	}

	public void setPay_amount(String pay_amount) {
		this.pay_amount = pay_amount;
	}

	public String getPdi_req_date() {
		return pdi_req_date;
	}

	public void setPdi_req_date(String pdi_req_date) {
		this.pdi_req_date = pdi_req_date;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
}
