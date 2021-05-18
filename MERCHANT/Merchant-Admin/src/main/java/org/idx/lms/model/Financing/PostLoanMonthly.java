package org.idx.lms.model.Financing;

public class PostLoanMonthly {
	String acc_no;
	String product_code;
	String payment_date;
	String interest_type;
	String interest_calc;
	Double interest;
	Double loan_amount;
	Integer loan_period;
	
	public String getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}
	
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	
	public String getInterest_type() {
		return interest_type;
	}
	public void setInterest_type(String interest_type) {
		this.interest_type = interest_type;
	}
	
	public String getInterest_calc() {
		return interest_calc;
	}
	public void setInterest_calc(String interest_calc) {
		this.interest_calc = interest_calc;
	}
	
	public Double getInterest() {
		return interest;
	}
	public void setInterest(Double interest) {
		this.interest = interest;
	}
	
	public Double getLoan_amount() {
		return loan_amount;
	}
	public void setLoan_amount(Double loan_amount) {
		this.loan_amount = loan_amount;
	}
	
	public Integer getLoan_period() {
		return loan_period;
	}
	public void setLoan_period(Integer loan_period) {
		this.loan_period = loan_period;
	}
}
