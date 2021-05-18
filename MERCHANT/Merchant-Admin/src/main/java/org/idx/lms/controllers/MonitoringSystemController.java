package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.TokenRegen;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("system_monitoring")
public class MonitoringSystemController {
	
	private ConfigApps con = new ConfigApps();
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String MIS_LOC = con.getConfigValue("URL_ACCESS_IMG");
	TokenRegen token = new TokenRegen();
	
	private boolean checkSession(HttpSession session, String level) {
		boolean bol = false;
		if (session.getAttribute("accesskey") != null) {
			JSONArray jMenu = new JSONArray(session.getAttribute("session_menu").toString());
			for (int i = 0; i < jMenu.length(); i++) {
				if (jMenu.getJSONObject(i).getString("ldlmdescription").equals(level)) {
					bol = true;
				}
			}
		}
		return bol;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView ParameterKiniDanaku(ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_adm_sys")) {
			token.regenToken(session);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("SystemMonitoringMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}
	}
}
