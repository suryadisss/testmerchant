package org.idx.lms.model.ruleset;

import java.util.ArrayList;

public class PostDefinitionRuleItem {
	String name, description, user, path ,is_active, p_logid;
	public String getP_logid() {
		return p_logid;
	}

	public void setP_logid(String p_logid) {
		this.p_logid = p_logid;
	}

	public String getIs_active() {
		return is_active;
	}

	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	int rus_id;

	public int getRus_id() {
		return rus_id;
	}

	public void setRus_id(int rus_id) {
		this.rus_id = rus_id;
	}

	ArrayList<PostComponentItem> Component;
	ArrayList<PostOutputItem> Output;
	ArrayList<PostValidationItem> Validation;

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}



	public ArrayList<PostComponentItem> getComponent() {
		return Component;
	}

	public void setComponent(ArrayList<PostComponentItem> component) {
		Component = component;
	}

	public ArrayList<PostOutputItem> getOutput() {
		return Output;
	}

	public void setOutput(ArrayList<PostOutputItem> output) {
		Output = output;
	}
	
	public ArrayList<PostValidationItem> getValidation() {
		return Validation;
	}

	public void setValidation(ArrayList<PostValidationItem> validation) {
		Validation = validation;
	}

}
