package org.idx.lms.model.user;

public class userManagement {
	String cmb_notif,Password, new_edit_status, txtUserID , txtName, txtNIP,txtEmail, ddlBranch,ddlTenant,ddlSupervisor,ddlPosition,ddlAccessLevel,txtEffectiveDate,user ;
	public String getDdlTenant() {
		return ddlTenant;
	}
	public void setDdlTenant(String ddlTenant) {
		this.ddlTenant = ddlTenant;
	}
	public String getCmb_notif() {
		return cmb_notif;
	}
	public void setCmb_notif(String cmb_notif) {
		this.cmb_notif = cmb_notif;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	boolean chkStatus;
	int usr_id;
	
	
	public boolean isChkStatus() {
		return chkStatus;
	}
	public void setChkStatus(boolean chkStatus) {
		this.chkStatus = chkStatus;
	}
	public String getNew_edit_status() {
		return new_edit_status;
	}
	public void setNew_edit_status(String new_edit_status) {
		this.new_edit_status = new_edit_status;
	}
	public String getTxtUserID() {
		return txtUserID;
	}
	public void setTxtUserID(String txtUserID) {
		this.txtUserID = txtUserID;
	}
	public String getTxtName() {
		return txtName;
	}
	public void setTxtName(String txtName) {
		this.txtName = txtName;
	}
	public String getTxtNIP() {
		return txtNIP;
	}
	public void setTxtNIP(String txtNIP) {
		this.txtNIP = txtNIP;
	}
	public String getTxtEmail() {
		return txtEmail;
	}
	public void setTxtEmail(String txtEmail) {
		this.txtEmail = txtEmail;
	}
	public String getDdlBranch() {
		return ddlBranch;
	}
	public void setDdlBranch(String ddlBranch) {
		this.ddlBranch = ddlBranch;
	}
	public String getDdlSupervisor() {
		return ddlSupervisor;
	}
	public void setDdlSupervisor(String ddlSupervisor) {
		this.ddlSupervisor = ddlSupervisor;
	}
	public String getDdlPosition() {
		return ddlPosition;
	}
	public void setDdlPosition(String ddlPosition) {
		this.ddlPosition = ddlPosition;
	}
	public String getDdlAccessLevel() {
		return ddlAccessLevel;
	}
	public void setDdlAccessLevel(String ddlAccessLevel) {
		this.ddlAccessLevel = ddlAccessLevel;
	}
	public String getTxtEffectiveDate() {
		return txtEffectiveDate;
	}
	public void setTxtEffectiveDate(String txtEffectiveDate) {
		this.txtEffectiveDate = txtEffectiveDate;
	}
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getUsr_id() {
		return usr_id;
	}
	public void setUsr_id(int usr_id) {
		this.usr_id = usr_id;
	}
	
	
	
	
	
	
	
	
}
