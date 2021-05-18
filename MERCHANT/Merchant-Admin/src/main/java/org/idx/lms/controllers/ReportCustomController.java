package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.inquiry.InquiryItem;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("report_cst")
public class ReportCustomController {
	private ConfigApps con = new ConfigApps();
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");

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
	public ModelAndView main(ModelMap model, HttpSession session, @ModelAttribute("InquiryItem") InquiryItem inq,
			HttpServletRequest req) {
		//if (checkSession(session, "lvl_act_inbox")) {
			token.regenToken(session);
			model.addAttribute("id", session.getAttribute("session_id").toString());
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("ReportCustomMainView", model);

		/*} else {
			return new ModelAndView("redirect:/");
		}*/

	}
	
	
	@RequestMapping(value="/views",method = RequestMethod.GET)
	public ModelAndView views(ModelMap model, HttpSession session, @ModelAttribute("InquiryItem") InquiryItem inq,
			HttpServletRequest req) {
		//if (checkSession(session, "lvl_act_inbox")) {
			token.regenToken(session);
	/*		model.addAttribute("id", session.getAttribute("session_id").toString());
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());*/
			return new ModelAndView("ReportCustomViewer", model);

		/*} else {
			return new ModelAndView("redirect:/");
		}*/

	}
}
