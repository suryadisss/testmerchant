package org.idx.lms.model.billing;

public class BillingSingleItem {

	String lst_acc_no, lst_period, lst_month, lst_total_amount, lbi_req_date, channel, notes;

	public String getLst_acc_no() {
		return lst_acc_no;
	}

	public void setLst_acc_no(String lst_acc_no) {
		this.lst_acc_no = lst_acc_no;
	}

	public String getLst_period() {
		return lst_period;
	}

	public void setLst_period(String lst_period) {
		this.lst_period = lst_period;
	}

	public String getLst_month() {
		return lst_month;
	}

	public void setLst_month(String lst_month) {
		this.lst_month = lst_month;
	}

	public String getLst_total_amount() {
		return lst_total_amount;
	}

	public void setLst_total_amount(String lst_total_amount) {
		this.lst_total_amount = lst_total_amount;
	}

	public String getLbi_req_date() {
		return lbi_req_date;
	}

	public void setLbi_req_date(String lbi_req_date) {
		this.lbi_req_date = lbi_req_date;
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
