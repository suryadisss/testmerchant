package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("dashboard")
public class DashboardController {
	private ConfigApps con = new ConfigApps();

	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");

	private boolean checkSession(HttpSession session) {
		boolean bol = false;
		if (session.getAttribute("session_id") != null) {
			bol = true;
		}
		return bol;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView dashboard(ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session)) {
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("DashboardView", model);

		} else {

			return new ModelAndView("redirect:/");
		}
	}
}
