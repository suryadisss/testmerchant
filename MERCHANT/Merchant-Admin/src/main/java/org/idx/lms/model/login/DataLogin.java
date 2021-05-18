package org.idx.lms.model.login;

public class DataLogin {
	private String txtUserID;
    private String txtPassword;
    private String txtCaptcha;
    
    public String getTxtCaptcha() {
		return txtCaptcha;
	}

	public void setTxtCaptcha(String txtCaptcha) {
		this.txtCaptcha = txtCaptcha;
	}

	public String getTxtUserID() {
        return this.txtUserID;
    }
    
    public void setTxtUserID(String _txtUserID) {
        this.txtUserID = _txtUserID;
    }
    
    public String getTxtPassword() {
        return this.txtPassword;
    }
    
    public void setTxtPassword(String _txtPassword) {
        this.txtPassword = _txtPassword;
    }
}
