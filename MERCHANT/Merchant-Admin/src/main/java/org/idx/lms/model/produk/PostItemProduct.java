package org.idx.lms.model.produk;

import java.math.BigInteger;
import java.util.ArrayList;

public class PostItemProduct {
	public String getIntr_period() {
		return intr_period;
	}

	public void setIntr_period(String intr_period) {
		this.intr_period = intr_period;
	}
	int ruleset_id, repayment_tolerance;
	public int getRepayment_tolerance() {
		return repayment_tolerance;
	}

	public void setRepayment_tolerance(int repayment_tolerance) {
		this.repayment_tolerance = repayment_tolerance;
	}

	public int getRuleset_id() {
		return ruleset_id;
	}

	public void setRuleset_id(int ruleset_id) {
		this.ruleset_id = ruleset_id;
	}
	String code, name, intr_typ, intr_calc, start_date, end_date, user, intr_period;
	ArrayList<ItemInterest> interest;
	ArrayList<ItemOtherCost> other_cost;
	ArrayList<ItemRepay> acc_repay;
	ArrayList<ItemPenalty> penalty;
	public ArrayList<ItemPenalty> getPenalty() {
		return penalty;
	}

	public void setPenalty(ArrayList<ItemPenalty> penalty) {
		this.penalty = penalty;
	}

	boolean is_active;
	
	int min_value, max_value, charge;
	double penalty_tolerance;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntr_typ() {
		return intr_typ;
	}

	public void setIntr_typ(String intr_typ) {
		this.intr_typ = intr_typ;
	}

	public String getIntr_calc() {
		return intr_calc;
	}

	public void setIntr_calc(String intr_calc) {
		this.intr_calc = intr_calc;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public ArrayList<ItemInterest> getInterest() {
		return interest;
	}

	public void setInterest(ArrayList<ItemInterest> interest) {
		this.interest = interest;
	}

	public ArrayList<ItemOtherCost> getOther_cost() {
		return other_cost;
	}

	public void setOther_cost(ArrayList<ItemOtherCost> other_cost) {
		this.other_cost = other_cost;
	}

	public ArrayList<ItemRepay> getAcc_repay() {
		return acc_repay;
	}

	public void setAcc_repay(ArrayList<ItemRepay> acc_repay) {
		this.acc_repay = acc_repay;
	}

	public boolean isIs_active() {
		return is_active;
	}

	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}

	public int getMin_value() {
		return min_value;
	}

	public void setMin_value(int min_value) {
		this.min_value = min_value;
	}

	public int getMax_value() {
		return max_value;
	}

	public void setMax_value(int max_value) {
		this.max_value = max_value;
	}

	public int getCharge() {
		return charge;
	}

	public void setCharge(int charge) {
		this.charge = charge;
	}

	public double getPenalty_tolerance() {
		return penalty_tolerance;
	}

	public void setPenalty_tolerance(double penalty_tolerance) {
		this.penalty_tolerance = penalty_tolerance;
	}
}
