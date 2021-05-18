package org.idx.lms.libs;

import org.json.JSONObject;

public class ConfigApps {

	
	FileReader oFR = new FileReader("classpath:config/BaseConfig.json");

	public String getConfigValue(String value){
		
		JSONObject json = new JSONObject(oFR.getFileValue());
		
		return json.getString(value);
	}
}
