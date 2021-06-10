package org.idx.lms.model.accesslevel;

import java.util.ArrayList;

public class AccessLevelItem {
	ArrayList<String> inputcheckbox;
	String new_edit_status, id,lulevelcode,lulevelname,luleveldescription,lulimitfrom,lulimitto;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	boolean lustatus,ismerchant;
	

	public String getNew_edit_status() {
		return new_edit_status;
	}

	public void setNew_edit_status(String new_edit_status) {
		this.new_edit_status = new_edit_status;
	}

	public String getLulevelcode() {
		return lulevelcode;
	}

	public void setLulevelcode(String lulevelcode) {
		this.lulevelcode = lulevelcode;
	}

	public String getLulevelname() {
		return lulevelname;
	}

	public void setLulevelname(String lulevelname) {
		this.lulevelname = lulevelname;
	}

	public String getLuleveldescription() {
		return luleveldescription;
	}

	public void setLuleveldescription(String luleveldescription) {
		this.luleveldescription = luleveldescription;
	}

	public String getLulimitfrom() {
		return lulimitfrom;
	}

	public void setLulimitfrom(String lulimitfrom) {
		this.lulimitfrom = lulimitfrom;
	}

	public String getLulimitto() {
		return lulimitto;
	}

	public void setLulimitto(String lulimitto) {
		this.lulimitto = lulimitto;
	}

	public boolean isLustatus() {
		return lustatus;
	}

	public void setLustatus(boolean lustatus) {
		this.lustatus = lustatus;
	}
	
	public boolean ismerchant() {
		return ismerchant;
	}

	public void setMerchant(boolean ismerchant) {
		this.ismerchant = ismerchant;
	}

	public ArrayList<String> getInputcheckbox() {
		return inputcheckbox;
	}

	public void setInputcheckbox(ArrayList<String> inputcheckbox) {
		this.inputcheckbox = inputcheckbox;
	}
}
