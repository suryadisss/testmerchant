package org.idx.lms.model.billing;

public class PostBillingSingleItem {
	String acc_no, pay_date, channel, notes, pay_period;

	public String getPay_period() {
		return pay_period;
	}

	public void setPay_period(String pay_period) {
		this.pay_period = pay_period;
	}

	public int getPay_month() {
		return pay_month;
	}

	public void setPay_month(int pay_month) {
		this.pay_month = pay_month;
	}

	int pay_month;

	public String getAcc_no() {
		return acc_no;
	}

	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
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

	double pay_amount;

	public double getPay_amount() {
		return pay_amount;
	}

	public void setPay_amount(double pay_amount) {
		this.pay_amount = pay_amount;
	}
}
