package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("levelDynamic")
public class LevelDynamicController {
	private ConfigApps con = new ConfigApps();
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	TokenRegen token = new TokenRegen();
	
	
	
	
	@RequestMapping(value = "/getMnLvl/{id}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getMnLvl(@PathVariable("id") String id, HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/login/getMenuList/" + id,
				session.getAttribute("accesskey").toString());
	}
}
