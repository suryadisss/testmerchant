package org.idx.lms.model.ruleset;

public class RuleDefinitionItem {
	private String name, desc, pickRule, rule, scorecard, path, user, new_edit_status;
	private int rus_id;
	public int getRus_id() {
		return rus_id;
	}

	public void setRus_id(int rus_id) {
		this.rus_id = rus_id;
	}

	public String getNew_edit_status() {
		return new_edit_status;
	}

	public void setNew_edit_status(String new_edit_status) {
		this.new_edit_status = new_edit_status;
	}

	private String[] txtPrmArr, prmArr;
	private String rus_name, rus_desc, rus_code;
	private boolean rus_is_active;
	
	public boolean isRus_is_active() {
		return rus_is_active;
	}

	public void setRus_is_active(boolean rus_is_active) {
		this.rus_is_active = rus_is_active;
	}

	public String getRus_code() {
		return rus_code;
	}

	public void setRus_code(String rus_code) {
		this.rus_code = rus_code;
	}

	public String getRus_name() {
		return rus_name;
	}

	public void setRus_name(String rus_name) {
		this.rus_name = rus_name;
	}

	public String getRus_desc() {
		return rus_desc;
	}

	public void setRus_desc(String rus_desc) {
		this.rus_desc = rus_desc;
	}

	public String[] getTxtPrmArr() {
		return txtPrmArr;
	}

	public void setTxtPrmArr(String[] txtPrmArr) {
		this.txtPrmArr = txtPrmArr;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	private String txtPrm1, txtPrm2, txtPrm3, txtPrm4, txtPrm5, txtPrm6, txtPrm7, txtPrm8, txtPrm9, txtPrm10;

	public String getTxtPrm6() {
		return txtPrm6;
	}

	public void setTxtPrm6(String txtPrm6) {
		this.txtPrm6 = txtPrm6;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getScorecard() {
		return scorecard;
	}

	public void setScorecard(String scorecard) {
		this.scorecard = scorecard;
	}

	public String getTxtPrm1() {
		return txtPrm1;
	}

	public void setTxtPrm1(String txtPrm1) {
		this.txtPrm1 = txtPrm1;
	}

	public String getTxtPrm2() {
		return txtPrm2;
	}

	public void setTxtPrm2(String txtPrm2) {
		this.txtPrm2 = txtPrm2;
	}

	public String getTxtPrm3() {
		return txtPrm3;
	}

	public void setTxtPrm3(String txtPrm3) {
		this.txtPrm3 = txtPrm3;
	}

	public String getTxtPrm4() {
		return txtPrm4;
	}

	public void setTxtPrm4(String txtPrm4) {
		this.txtPrm4 = txtPrm4;
	}

	public String getTxtPrm5() {
		return txtPrm5;
	}

	public void setTxtPrm5(String txtPrm5) {
		this.txtPrm5 = txtPrm5;
	}

	public String getTxtPrm7() {
		return txtPrm7;
	}

	public void setTxtPrm7(String txtPrm7) {
		this.txtPrm7 = txtPrm7;
	}

	public String getTxtPrm8() {
		return txtPrm8;
	}

	public void setTxtPrm8(String txtPrm8) {
		this.txtPrm8 = txtPrm8;
	}

	public String getTxtPrm9() {
		return txtPrm9;
	}

	public void setTxtPrm9(String txtPrm9) {
		this.txtPrm9 = txtPrm9;
	}

	public String getTxtPrm10() {
		return txtPrm10;
	}

	public void setTxtPrm10(String txtPrm10) {
		this.txtPrm10 = txtPrm10;
	}

	public String getPrm1() {
		return prm1;
	}

	public void setPrm1(String prm1) {
		this.prm1 = prm1;
	}

	public String getPrm2() {
		return prm2;
	}

	public void setPrm2(String prm2) {
		this.prm2 = prm2;
	}

	public String getPrm3() {
		return prm3;
	}

	public void setPrm3(String prm3) {
		this.prm3 = prm3;
	}

	public String getPrm4() {
		return prm4;
	}

	public void setPrm4(String prm4) {
		this.prm4 = prm4;
	}

	public String getPrm5() {
		return prm5;
	}

	public void setPrm5(String prm5) {
		this.prm5 = prm5;
	}

	public String getPrm6() {
		return prm6;
	}

	public void setPrm6(String prm6) {
		this.prm6 = prm6;
	}

	public String getPrm7() {
		return prm7;
	}

	public void setPrm7(String prm7) {
		this.prm7 = prm7;
	}

	public String getPrm8() {
		return prm8;
	}

	public void setPrm8(String prm8) {
		this.prm8 = prm8;
	}

	public String getPrm9() {
		return prm9;
	}

	public void setPrm9(String prm9) {
		this.prm9 = prm9;
	}

	public String getPrm10() {
		return prm10;
	}

	public void setPrm10(String prm10) {
		this.prm10 = prm10;
	}

	private String prm1, prm2, prm3, prm4, prm5, prm6, prm7, prm8, prm9, prm10;

	private boolean status;

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getPickRule() {
		return pickRule;
	}

	public void setPickRule(String pickRule) {
		this.pickRule = pickRule;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	private String txtMessage1,txtMessage2,txtRuleId1,txtRuleId2,txtCount1,txtCount2;

	
	
	public String getTxtRuleId1() {
		return txtRuleId1;
	}

	public void setTxtRuleId1(String txtRuleId1) {
		this.txtRuleId1 = txtRuleId1;
	}

	public String getTxtRuleId2() {
		return txtRuleId2;
	}

	public void setTxtRuleId2(String txtRuleId2) {
		this.txtRuleId2 = txtRuleId2;
	}

	public String getTxtCount1() {
		return txtCount1;
	}

	public void setTxtCount1(String txtCount1) {
		this.txtCount1 = txtCount1;
	}

	public String getTxtCount2() {
		return txtCount2;
	}

	public void setTxtCount2(String txtCount2) {
		this.txtCount2 = txtCount2;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String[] getPrmArr() {
		return prmArr;
	}

	public void setPrmArr(String[] prmArr) {
		this.prmArr = prmArr;
	}

	

	public String getTxtMessage1() {
		return txtMessage1;
	}

	public void setTxtMessage1(String txtMessage1) {
		this.txtMessage1 = txtMessage1;
	}

	public String getTxtMessage2() {
		return txtMessage2;
	}

	public void setTxtMessage2(String txtMessage2) {
		this.txtMessage2 = txtMessage2;
	}

	
}
