package org.idx.lms.model.masterdata;

public class MasterDataItem {
	String new_edit_status , map_field_name, map_field_desc,map_type, map_formula, map_level ;
	public String getMap_level() {
		return map_level;
	}
	public void setMap_level(String map_level) {
		this.map_level = map_level;
	}
	boolean map_is_active, map_status;
	public boolean isMap_status() {
		return map_status;
	}
	public void setMap_status(boolean map_status) {
		this.map_status = map_status;
	}
	public boolean isMap_is_active() {
		return map_is_active;
	}
	public void setMap_is_active(boolean map_is_active) {
		this.map_is_active = map_is_active;
	}

	public String getMap_type() {
		return map_type;
	}
	public void setMap_type(String map_type) {
		this.map_type = map_type;
	}
	public String getMap_formula() {
		return map_formula;
	}
	public void setMap_formula(String map_formula) {
		this.map_formula = map_formula;
	}
	int map_id;
	
	public int getMap_id() {
		return map_id;
	}
	public void setMap_id(int map_id) {
		this.map_id = map_id;
	}
	public String getNew_edit_status() {
		return new_edit_status;
	}
	public void setNew_edit_status(String new_edit_status) {
		this.new_edit_status = new_edit_status;
	}
	public String getMap_field_name() {
		return map_field_name;
	}
	public void setMap_field_name(String map_field_name) {
		this.map_field_name = map_field_name;
	}
	public String getMap_field_desc() {
		return map_field_desc;
	}
	public void setMap_field_desc(String map_field_desc) {
		this.map_field_desc = map_field_desc;
	}



	

}
