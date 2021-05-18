package org.idx.lms.model;

public class Payment {
	//================================================================================
    // Properties
    //================================================================================
	String trx_no;
	String loan_no;
	String trx_date;
	Double trx_amount;
	String trx_channel;
	String trx_notes;
	
	public String getTrx_no(){
		return trx_no;
	}
	public void setTrx_no(String trx_no){
		this.trx_no = trx_no;
	}
	
	public String getLoan_no(){
		return loan_no;
	}
	public void setLoan_no(String loan_no){
		this.loan_no = loan_no;
	}
	
	public String getTrx_date(){
		return trx_date;
	}
	public void setTrx_date(String trx_date){
		this.trx_date = trx_date;
	}
	
	public Double getTrx_amount(){
		return trx_amount;
	}
	public void setTrx_amount(Double trx_amount){
		this.trx_amount = trx_amount;
	}
	
	public String getTrx_channel(){
		return trx_channel;
	}
	public void setTrx_channel(String trx_channel){
		this.trx_channel = trx_channel;
	}
	
	public String getTrx_notes(){
		return trx_notes;
	}
	public void setTrx_notes(String trx_notes){
		this.trx_notes = trx_notes;
	}
}
