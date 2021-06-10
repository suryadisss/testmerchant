package org.idx.lms.model.user;

public class PostUser {
	String p_usrid,p_name,p_nip,p_email,p_branchcode,p_spv,p_position,p_acclevel,p_efectivedate,p_status,p_usr, p_defaultpwd,p_tnt_alias, p_group_alias, p_partner_alias,p_is_merchant;
	int p_log_id;
	
	public void setP_group_alias(String p_group_alias) {
		this.p_group_alias = p_group_alias;
	}
	public void setP_parter_alias(String p_partner_alias) {
		this.p_partner_alias = p_partner_alias;
	}
	
	public String getP_tnt_alias() {
		return p_tnt_alias;
	}

	public void setP_tnt_alias(String p_tnt_alias) {
		this.p_tnt_alias = p_tnt_alias;
	}

	public String getP_defaultpwd() {
		return p_defaultpwd;
	}

	public void setP_defaultpwd(String p_defaultpwd) {
		this.p_defaultpwd = p_defaultpwd;
	}

	public String getP_usrid() {
		return p_usrid;
	}

	public void setP_usrid(String p_usrid) {
		this.p_usrid = p_usrid;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_nip() {
		return p_nip;
	}

	public void setP_nip(String p_nip) {
		this.p_nip = p_nip;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getP_branchcode() {
		return p_branchcode;
	}

	public void setP_branchcode(String p_branchcode) {
		this.p_branchcode = p_branchcode;
	}

	public String getP_spv() {
		return p_spv;
	}

	public void setP_spv(String p_spv) {
		this.p_spv = p_spv;
	}

	public String getP_position() {
		return p_position;
	}

	public void setP_position(String p_position) {
		this.p_position = p_position;
	}

	public String getP_acclevel() {
		return p_acclevel;
	}

	public void setP_acclevel(String p_acclevel) {
		this.p_acclevel = p_acclevel;
	}

	public String getP_efectivedate() {
		return p_efectivedate;
	}

	public void setP_efectivedate(String p_efectivedate) {
		this.p_efectivedate = p_efectivedate;
	}



	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	
	public String is_merchant() {
		return p_is_merchant;
	}

	public void setP_is_merchant(String p_is_merchant) {
		this.p_is_merchant = p_is_merchant;
	}

	public String getP_usr() {
		return p_usr;
	}

	public void setP_usr(String p_usr) {
		this.p_usr = p_usr;
	}
	
	public int getP_log_id() {
		return p_log_id;
	}
	
	public void setP_log_id(int p_log_id) {
		this.p_log_id = p_log_id;
	}
	
}
